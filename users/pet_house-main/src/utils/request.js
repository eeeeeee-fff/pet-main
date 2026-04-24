import axios from 'axios'
import { Message } from 'element-ui'
const request = axios.create({
  baseURL: 'http://localhost:8081',
  timeout: 5000
  // headers: {
  //   'Content-Type': 'application/json',
  //   'X-Requested-With': 'XMLHttpRequest'
  // }
})

// 添加请求拦截器
request.interceptors.request.use(function (config) {
  // 在发送请求之前做些什么
  // 只要有token，就添加token
  const token = localStorage.getItem('petHouseToken')
  if (token) {
    // config.headers.Authorization = `Bearer ${token}`
    config.headers.pet = `${token}`
  }
  console.log('config', config)
  return config
}, function (error) {
  // 对请求错误做些什么
  return Promise.reject(error)
})

// 添加响应拦截器
request.interceptors.response.use(function (response) {
  // 对响应数据做点什么

  // res为后端返回的数据
  const res = response.data
  // 统一处理，页面提示信息
  if (res.code !== 200) {
    // code不是200，
    Message.error(`错误，${res.msg}`)
  }
  console.log('response', res)
  return response.data
}, function (error) {
  // 对响应错误做点什么
  const status = error?.response?.status
  // 统一错误处理
  if (status) {
    // 到达服务器
    switch (status) {
      case 400:
        Message.error(`${status}：无效请求`)
        break
      case 401:
        Message.error(`${status}：登录已过期，请重新登录`)
        break
      case 403:
        Message.error(`${status}：无权限访问`)
        break
      case 404:
        Message.error(`${status}：资源不存在`)
        break
      case 500:
        Message.error(`${status}：服务器错误`)
        break
      default:
        Message.error('请求失败')
    }
  } else {
    // 断网或超时
    if (error.message.includes('timeout')) {
      Message.error('请求超时')
    } else {
      Message.error('网络异常')
    }
  }

  // reject，用catch捕获错误信息
  return Promise.reject(error)
})

export default request
