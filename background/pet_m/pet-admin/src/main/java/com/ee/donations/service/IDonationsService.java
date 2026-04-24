package com.ee.donations.service;

import java.util.List;
import com.ee.donations.domain.Donations;

/**
 * 宠物捐赠Service接口
 * 
 * @author ee
 * @date 2025-03-26
 */
public interface IDonationsService 
{
    /**
     * 查询宠物捐赠
     * 
     * @param donationId 宠物捐赠主键
     * @return 宠物捐赠
     */
    public Donations selectDonationsByDonationId(Long donationId);

    /**
     * 查询宠物捐赠列表
     * 
     * @param donations 宠物捐赠
     * @return 宠物捐赠集合
     */
    public List<Donations> selectDonationsList(Donations donations);

    /**
     * 新增宠物捐赠
     * 
     * @param donations 宠物捐赠
     * @return 结果
     */
    public int insertDonations(Donations donations);

    /**
     * 修改宠物捐赠
     * 
     * @param donations 宠物捐赠
     * @return 结果
     */
    public int updateDonations(Donations donations);

    /**
     * 批量删除宠物捐赠
     * 
     * @param donationIds 需要删除的宠物捐赠主键集合
     * @return 结果
     */
    public int deleteDonationsByDonationIds(Long[] donationIds);

    /**
     * 删除宠物捐赠信息
     * 
     * @param donationId 宠物捐赠主键
     * @return 结果
     */
    public int deleteDonationsByDonationId(Long donationId);

    void updatestatuss(Long donationId);

    void updatestatus22(Long donationId);
}
