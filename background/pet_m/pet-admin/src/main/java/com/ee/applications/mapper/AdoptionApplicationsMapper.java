package com.ee.applications.mapper;

import java.util.Date;
import java.util.List;
import com.ee.applications.domain.AdoptionApplications;
import org.apache.ibatis.annotations.Update;

/**
 * 宠物领养Mapper接口
 * 
 * @author ee
 * @date 2025-03-25
 */
public interface AdoptionApplicationsMapper 
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
     * 删除宠物领养
     * 
     * @param applicationId 宠物领养主键
     * @return 结果
     */
    public int deleteAdoptionApplicationsByApplicationId(Long applicationId);

    /**
     * 批量删除宠物领养
     * 
     * @param applicationIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAdoptionApplicationsByApplicationIds(Long[] applicationIds);
    @Update("update adoption_applications set status = 2  where application_id = #{applicationId}")
    void updatestatus(Long applicationId);
    @Update("update adoption_applications set status = 3  where application_id = #{applicationId}")
    void updatestatus2(Long applicationId);
}
