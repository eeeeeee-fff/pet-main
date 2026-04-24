// AI兽医
import request from '@/utils/request'

/**
 * 函数功能：
 *     @description AI兽医
 * 参数说明：
 *     @param {String} question - 问题
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const askAI = (question) => {
  return request.get('/test/sendQuestion', {
    timeout: 0, // AI给出答案需要时间，所以不设置超时时间。除非服务器响应或发生网络错误
    params: {
      question
    }
  })
}
