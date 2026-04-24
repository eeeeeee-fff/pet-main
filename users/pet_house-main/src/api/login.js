// 登录和注册的相关api
import request from '@/utils/request'

/**
 * 函数功能：
 *      @description 邮箱获取验证码
 * 参数说明：
 *     @param {string} email - 邮箱地址
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const sendMailCode = (email) => {
  return request.post('/users/sendcode', {
    email
  })
}

/**
 * 函数功能：
 *     @description 邮箱登录
 * 参数说明：
 *     @param {string} email - 邮箱
 *     @param {string} code - 验证码
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const mailLogin = (email, code) => {
  return request.post('/users/elogin', {
    email,
    code
  })
}

/**
 * 函数功能：
 *     @description 用户名登录
 * 参数说明：
 *     @param username @type {string} - 用户名
 *     @param password @type {string} - 密码
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const usernameLogin = (username, password) => {
  return request.post('/users/plogin', {
    username,
    password
  })
}

/**
 * 函数功能：
 *     @description 发送注册请求
 * 参数说明：
 *     @param {Object} info - key包含：
 *                        username 用户名 String
 *                        password 密码 String
 *                        email 邮箱 String
 *                        phone 手机号 String
 *                        gender 性别 String
 *                        age 年龄 int
 *                        wage 收入 int
 *                        experience 养宠经验 int 1: 0-3000, 2: 3000-7000, 3: 7000-10000, 4: 1万以上
 *                        catOrDog 偏爱猫还是狗 string '狗' '猫'
 *                        sex int 1：男, 2：女
 *
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const logup = (info) => {
  console.log({ ...info })
  return request.post('/users/register', { ...info })
}

/**
 * 函数功能：
 *     @description 退出登录
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const logout = () => {
  return request.post('/users/logout')
}
