import request from '@/utils/request'

// 查询宠物管理列表
export function listPets(query) {
  return request({
    url: '/pets/pets/list',
    method: 'get',
    params: query
  })
}

// 查询宠物管理详细
export function getPets(petId) {
  return request({
    url: '/pets/pets/' + petId,
    method: 'get'
  })
}

// 新增宠物管理
export function addPets(data) {
  return request({
    url: '/pets/pets',
    method: 'post',
    data: data
  })
}

// 修改宠物管理
export function updatePets(data) {
  return request({
    url: '/pets/pets',
    method: 'put',
    data: data
  })
}

// 删除宠物管理
export function delPets(petId) {
  return request({
    url: '/pets/pets/' + petId,
    method: 'delete'
  })
}
