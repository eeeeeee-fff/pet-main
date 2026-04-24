import request from '@/utils/request'

// 查询宠物捐赠列表
export function listDonations(query) {
  return request({
    url: '/donations/donations/list',
    method: 'get',
    params: query
  })
}

// 查询宠物捐赠详细
export function getDonations(donationId) {
  return request({
    url: '/donations/donations/' + donationId,
    method: 'get'
  })
}

// 新增宠物捐赠
export function addDonations(data) {
  return request({
    url: '/donations/donations',
    method: 'post',
    data: data
  })
}

// 修改宠物捐赠
export function updateDonations(data) {
  return request({
    url: '/donations/donations',
    method: 'put',
    data: data
  })
}

// 删除宠物捐赠
export function delDonations(donationId) {
  return request({
    url: '/donations/donations/' + donationId,
    method: 'delete'
  })
}
