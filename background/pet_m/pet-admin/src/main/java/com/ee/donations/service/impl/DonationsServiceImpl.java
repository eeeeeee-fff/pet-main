package com.ee.donations.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ee.donations.mapper.DonationsMapper;
import com.ee.donations.domain.Donations;
import com.ee.donations.service.IDonationsService;
import com.ee.pets.domain.Pets;
import com.ee.pets.service.IPetsService;

/**
 * 宠物捐赠Service业务层处理
 * 
 * @author ee
 * @date 2025-03-26
 */
@Service
public class DonationsServiceImpl implements IDonationsService 
{
    @Autowired
    private DonationsMapper donationsMapper;

    @Autowired
    private IPetsService petsService;

    /**
     * 查询宠物捐赠
     * 
     * @param donationId 宠物捐赠主键
     * @return 宠物捐赠
     */
    @Override
    public Donations selectDonationsByDonationId(Long donationId)
    {
        return donationsMapper.selectDonationsByDonationId(donationId);
    }

    /**
     * 查询宠物捐赠列表
     * 
     * @param donations 宠物捐赠
     * @return 宠物捐赠
     */
    @Override
    public List<Donations> selectDonationsList(Donations donations)
    {
        return donationsMapper.selectDonationsList(donations);
    }

    /**
     * 新增宠物捐赠
     * 
     * @param donations 宠物捐赠
     * @return 结果
     */
    @Override
    public int insertDonations(Donations donations)
    {
        return donationsMapper.insertDonations(donations);
    }

    /**
     * 修改宠物捐赠
     * 
     * @param donations 宠物捐赠
     * @return 结果
     */
    @Override
    public int updateDonations(Donations donations)
    {
        return donationsMapper.updateDonations(donations);
    }

    /**
     * 批量删除宠物捐赠
     * 
     * @param donationIds 需要删除的宠物捐赠主键
     * @return 结果
     */
    @Override
    public int deleteDonationsByDonationIds(Long[] donationIds)
    {
        return donationsMapper.deleteDonationsByDonationIds(donationIds);
    }

    /**
     * 删除宠物捐赠信息
     * 
     * @param donationId 宠物捐赠主键
     * @return 结果
     */
    @Override
    public int deleteDonationsByDonationId(Long donationId)
    {
        return donationsMapper.deleteDonationsByDonationId(donationId);
    }

    @Override
    public void updatestatuss(Long donationId) {
        Donations donation = donationsMapper.selectDonationsByDonationId(donationId);
        // status != 0 说明已审核过，直接返回，防止重复插入 pets
        if (donation == null || donation.getStatus() != 1) return;
        donationsMapper.updatestatuss(donationId);
        Pets pets = new Pets();
        pets.setUserId(Long.valueOf(donation.getUserId()));
        pets.setName(donation.getName());
        pets.setGender(Long.valueOf(donation.getGender()));
        pets.setAge(Long.valueOf(donation.getAge()));
        pets.setPersonality(donation.getPersonality());
        pets.setBreed(donation.getBreed());
        pets.setCatOrDog(donation.getCatOrDog());
        pets.setVaccination(donation.getVaccination());
        pets.setImageUrl(donation.getImageUrl());
        pets.setAdoptionInfo(donation.getAdoptionInfo());
        pets.setStatus(1L);
        petsService.insertPets(pets);
    }

    @Override
    public void updatestatus22(Long donationId) {
        donationsMapper.updatestatuss2(donationId);
    }
}
