package com.ee.donations.mapper;

import java.util.List;
import com.ee.donations.domain.Donations;
import org.apache.ibatis.annotations.Update;

/**
 * 宠物捐赠Mapper接口
 * 
 * @author ee
 * @date 2025-03-26
 */
public interface DonationsMapper 
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
     * 删除宠物捐赠
     * 
     * @param donationId 宠物捐赠主键
     * @return 结果
     */
    public int deleteDonationsByDonationId(Long donationId);

    /**
     * 批量删除宠物捐赠
     * 
     * @param donationIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDonationsByDonationIds(Long[] donationIds);
    @Update("update donations set status=2, pass_date=NOW() where donation_id=#{donationId}")
    void updatestatuss(Long donationId);
    @Update("update donations set status=3 where donation_id=#{donationId}")
    void updatestatuss2(Long donationId);

}
