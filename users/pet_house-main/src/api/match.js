// 智能匹配相关api
import request from '@/utils/request'

/**
 * 函数功能：
 *     @description 智能匹配
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const matchPetForUser = () => {
  return request.get('/matching/findAll', {
    timeout: 0 // 匹配需要时间，故不设置超时时间
  })
}

/**
 * 函数功能：
 *     @description 智能匹配用户信息增加
 * 参数说明：
 *      @param {string} petgender - 偏爱公母: 1为公, 2为母
 *      @param {string} timewithpet - 一周陪伴的时间: 1 2 3 4
 *      @param {string} environment - 有无后院: 有 无
 *      @param {string} bodytypewithpet - 偏爱体型: 小 中 大 超大
 *      @param {string} cleanwithpet - 一个月清洁: 较少 偶尔 经常
 *      @param {string} personality - 用户的性格：内向 活泼 沉稳 外向
 *
 *
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const addUserInfo = (petgender, timewithpet, environment, bodytypewithpet, cleanwithpet, personality) => {
  return request.post('/matching/useradd', {
    petgender,
    timewithpet,
    environment,
    bodytypewithpet,
    cleanwithpet,
    personality
  }, {
    timeout: 0
  })
}
