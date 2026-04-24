// 个人信息相关api
import request from '@/utils/request'

/**
 * 函数功能：
 *      @description 查询个人中心信息
 * 返回值：
 *      @return {Promise} - 后端返回的数据为res
 */
export const getUserInfo = () => {
  request.get('/head/person')
}

/**
 * 函数功能：
 *      @description 修改个人数据
 * 参数说明：
 *      @param {string} username - 用户名
 *      @param {string} password - 密码
 *      @param {string} email - 邮箱
 *      @param {int} experience - 养宠经验 1.有, 2. 无
 *      @param {string} catOrDog - 偏爱狗还是狗
 *      @param {string} icon - icon地址
 *      @param {string} phone - 手机号
 *      @param {int} gender - 性别
 *      @param {int} age - 年龄
 *      @param {int} wage - 工资
 * 返回值：
 *      @return {Promise} - 后端返回的数据为res
 */
export const updateUserInfo = (username, password, email, experience, catOrDog, icon, phone, gender, age, wage) => {
  request.get('/head/person/update', {
    username,
    password,
    email,
    experience,
    catOrDog,
    icon,
    phone,
    gender,
    age,
    wage
  })
}
