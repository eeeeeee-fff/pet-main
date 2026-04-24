// 宠物展示 和 其子页面 相关api
import request from '@/utils/request'

/**
 * 函数功能：
 *     @description 获取宠物展示页面的信息
 * 参数说明：
 *     @param {int} age2  - 年纪结束
 *     @param {int} startpage  - 查询的页数，从0开始
 *     @param {int} catOrDog  - 可选参数：种类
 *     @param {int} age1  - 可选参数：1和2是年龄区间
 *     @param {int} bodytype  - 可选参数：体型

 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const getPetsInfo = (age2, startpage = 0, catOrDog = null, age1 = null, bodytype = null, max = null) => {
  return request.post('/display/pet', {
    ...(catOrDog ? { catOrDog } : {}),
    ...(age1 ? { age1 } : {}),
    ...(age2 ? { age2 } : {}),
    ...(bodytype ? { bodytype } : {}),
    ...(max ? { max } : {}),
    startpage: startpage * 6, // 第一页为 0*6、第二页为 1*6
    pagesize: 6, // 默认每页6个
    status: 1
  })
}

/**
 * 函数功能：
 *     @description 获取指定宠物的详细信息
 * 参数说明：
 *     @param {int} id - 宠物id
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const getPetInfo = (id) => {
  return request.get(`/display/pet/${id}`)
}

/**
 * 函数功能：
 *     @description 宠物领养申请
 * 参数说明：
 *     @param {string} applicantAddress - 领养人地址
 *     @param {int} applicantAge - 领养人年龄
 *     @param {string} applicantContact - 领养人联系方式
 *     @param {string} applicantName - 领养人姓名
 *     @param {int} petId - 宠物id
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const sendDdopt = (applicantAddress, applicantAge, applicantContact, applicantName, petId) => {
  return request.post('/display/applyfor', {
    applicantAddress,
    applicantAge,
    applicantContact,
    applicantName,
    petId,
    status: 1
  })
}
