// 论坛相关api
import request from '@/utils/request'

/**
 * 函数功能：
 *     @description 发帖
 * 参数说明：
 *     @param {string} content - 帖子内容
 *     @param {string} title - 帖子标题
 *     @param {string} imageUrl - 图片链接，先调用上传图片的接口，得到的一个图片链接
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const publishPost = (content, title, imageUrl = null) => {
  return request.post('/forum/sendforum', {
    content,
    title,
    ...(imageUrl !== null ? { imageUrl } : {})
  })
}

/**
 * 函数功能：
 *     @description 获取论坛列表基本信息
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const getPostsList = () => {
  return request.get('/forum/getforumlist')
}

/**
 * 函数功能：
 *     @description 查看帖子详细信息
 * 参数说明：
 *     @param {string} forumid - 帖子id
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const getPostInfo = (forumid) => {
  return request.get(`/forum/getforumt/${forumid}`)
}

/**
 * 函数功能：
 *     @description 获取对应论坛的评论
 * 参数说明：
 *     @param {string} forumid - 帖子id
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const getPostComment = (forumid) => {
  return request.get(`/forum/getcomment/${forumid}`)
}

/**
 * 函数功能：
 *     @description 获取论坛个人相关信息
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const getPersonalInfo = () => {
  return request.get('/forum/getuserinfo')
}

/**
 * 函数功能：
 *     @description 搜索帖子
 * 参数说明：
 *     @param {string} title - 帖子标题
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const searchPost = (title) => {
  return request.get('/forum/selectforum?', {
    params: {
      title
    }
  })
}

/**
 * 函数功能：
 *     @description 发表评论
 * 参数说明：
 *     @param {string} forumId - 帖子ID
 *     @param {string} userId - 用户ID
 *     @param {string} text - 评论内容
 *
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const postComment = (forumId, userId, text) => {
  return request.post('/comment/sendcomment', {
    forumId,
    userId,
    text
  })
}
