package com.ee.applications.service.impl;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import com.ee.pets.mapper.PetsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ee.applications.mapper.AdoptionApplicationsMapper;
import com.ee.applications.domain.AdoptionApplications;
import com.ee.applications.service.IAdoptionApplicationsService;

/**
 * 宠物领养Service业务层处理
 * 
 * @author ee
 * @date 2025-03-25
 */
@Service
public class AdoptionApplicationsServiceImpl implements IAdoptionApplicationsService 
{
    @Autowired
    private PetsMapper petsMapper;
    @Autowired
    private AdoptionApplicationsMapper adoptionApplicationsMapper;

    /**
     * 查询宠物领养
     * 
     * @param applicationId 宠物领养主键
     * @return 宠物领养
     */
    @Override
    public AdoptionApplications selectAdoptionApplicationsByApplicationId(Long applicationId)
    {
        AdoptionApplications adoptionApplications = adoptionApplicationsMapper.selectAdoptionApplicationsByApplicationId(applicationId);
        Long petId = adoptionApplications.getPetId();
        petsMapper.updatestatus(petId);
        return adoptionApplications;
    }

    /**
     * 查询宠物领养列表
     * 
     * @param adoptionApplications 宠物领养
     * @return 宠物领养
     */
    @Override
    public List<AdoptionApplications> selectAdoptionApplicationsList(AdoptionApplications adoptionApplications)
    {
        return adoptionApplicationsMapper.selectAdoptionApplicationsList(adoptionApplications);
    }

    /**
     * 新增宠物领养
     * 
     * @param adoptionApplications 宠物领养
     * @return 结果
     */
    @Override
    public int insertAdoptionApplications(AdoptionApplications adoptionApplications)
    {
        return adoptionApplicationsMapper.insertAdoptionApplications(adoptionApplications);
    }

    /**
     * 修改宠物领养
     * 
     * @param adoptionApplications 宠物领养
     * @return 结果
     */
    @Override
    public int updateAdoptionApplications(AdoptionApplications adoptionApplications)
    {
        return adoptionApplicationsMapper.updateAdoptionApplications(adoptionApplications);
    }

    /**
     * 批量删除宠物领养
     * 
     * @param applicationIds 需要删除的宠物领养主键
     * @return 结果
     */
    @Override
    public int deleteAdoptionApplicationsByApplicationIds(Long[] applicationIds)
    {
        return adoptionApplicationsMapper.deleteAdoptionApplicationsByApplicationIds(applicationIds);
    }

    /**
     * 删除宠物领养信息
     * 
     * @param applicationId 宠物领养主键
     * @return 结果
     */
    @Override
    public int deleteAdoptionApplicationsByApplicationId(Long applicationId)
    {
        return adoptionApplicationsMapper.deleteAdoptionApplicationsByApplicationId(applicationId);
    }

    @Override
    public void updatestatus(Long applicationId) {
//        Date date = new Date();
        adoptionApplicationsMapper.updatestatus(applicationId);
    }

    @Override
    public void updatestatus2(Long applicationId) {
        adoptionApplicationsMapper.updatestatus2(applicationId);
    }
}
