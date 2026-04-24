package com.ee.applications.service;

import java.util.List;
import com.ee.applications.domain.AdoptionApplications;

/**
 * 宠物领养Service接口
 * 
 * @author ee
 * @date 2025-03-25
 */
public interface IAdoptionApplicationsService 
{
    /**
     * 查询宠物领养
     * 
     * @param applicationId 宠物领养主键
     * @return 宠物领养
     */
    public AdoptionApplications selectAdoptionApplicationsByApplicationId(Long applicationId);

    /**
     * 查询宠物领养列表
     * 
     * @param adoptionApplications 宠物领养
     * @return 宠物领养集合
     */
    public List<AdoptionApplications> selectAdoptionApplicationsList(AdoptionApplications adoptionApplications);

    /**
     * 新增宠物领养
     * 
     * @param adoptionApplications 宠物领养
     * @return 结果
     */
    public int insertAdoptionApplications(AdoptionApplications adoptionApplications);

    /**
     * 修改宠物领养
     * 
     * @param adoptionApplications 宠物领养
     * @return 结果
     */
    public int updateAdoptionApplications(AdoptionApplications adoptionApplications);

    /**
     * 批量删除宠物领养
     * 
     * @param applicationIds 需要删除的宠物领养主键集合
     * @return 结果
     */
    public int deleteAdoptionApplicationsByApplicationIds(Long[] applicationIds);

    /**
     * 删除宠物领养信息
     * 
     * @param applicationId 宠物领养主键
     * @return 结果
     */
    public int deleteAdoptionApplicationsByApplicationId(Long applicationId);

    void updatestatus(Long applicationId);

    void updatestatus2(Long applicationId);
}
