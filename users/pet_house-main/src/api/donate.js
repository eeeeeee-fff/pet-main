// 捐赠页面相关api
import request from '@/utils/request'

/**
 * 函数功能：
 *     @description 发送捐赠请求
 * 参数说明：
 *     @param name string - 宠物姓名
 *     @param gender int - 性别
 *     @param age string - 年龄
 *     @param personality string -
 *     @param breed string - 品种
 *     @param catOrDog string - 捐赠猫或狗
 *     @param vaccination int - 是否接种疫苗
 *     @param donorName string - 捐赠人姓名
 *     @param donorContact string - 捐赠人联系方式
 *     @param imageUrl string - 图片链接，先调用上传图片的接口，得到的一个图片链接
 *     @param adoptionInfo string - 可选参数：捐赠须知
 * 返回值：
 *     @return {Promise} - 后端返回的数据为res
 */
export const submitDonation = (name, gender, age, personality, breed, catOrDog, imageUrl, vaccination, adoptionInfo, donorName, donorContact, status) => {
  return request.post('/head/donate', {
    name,
    gender,
    age,
    personality,
    breed,
    catOrDog,
    imageUrl,
    vaccination,
    adoptionInfo,
    donorName,
    donorContact,
    status
  })
}
