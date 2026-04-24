import request from '@/utils/request'

// 查询宠物领养列表
export function listApplications(query) {
  return request({
    url: '/applications/applications/list',
    method: 'get',
    params: query
  })
}

// 查询宠物领养详细
export function getApplications(applicationId) {
  return request({
    url: '/applications/applications/' + applicationId,
    method: 'get'
  })
}

// 新增宠物领养
export function addApplications(data) {
  return request({
    url: '/applications/applications',
    method: 'post',
    data: data
  })
}

// 修改宠物领养
export function updateApplications(data) {
  return request({
    url: '/applications/applications',
    method: 'put',
    data: data
  })
}

// 删除宠物领养
export function delApplications(applicationId) {
  return request({
    url: '/applications/applications/' + applicationId,
    method: 'delete'
  })
}
