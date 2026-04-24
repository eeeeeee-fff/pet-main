// 审核中心相关api
import request from '@/utils/request'

/**
 * 函数功能：
 *     @description 请求捐赠列表
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const getDonateList = () => {
  return request.get('/head/examine/d')
}

/**
 * 函数功能：
 *     @description 请求审核列表
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const getExamineList = () => {
  return request.get('/head/examine/a')
}
