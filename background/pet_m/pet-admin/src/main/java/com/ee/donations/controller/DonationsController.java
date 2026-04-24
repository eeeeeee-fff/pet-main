package com.ee.donations.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ee.common.annotation.Log;
import com.ee.common.core.controller.BaseController;
import com.ee.common.core.domain.AjaxResult;
import com.ee.common.enums.BusinessType;
import com.ee.donations.domain.Donations;
import com.ee.donations.service.IDonationsService;
import com.ee.common.utils.poi.ExcelUtil;
import com.ee.common.core.page.TableDataInfo;

/**
 * 宠物捐赠Controller
 * 
 * @author ee
 * @date 2025-03-26
 */
@RestController
@RequestMapping("/donations/donations")
public class DonationsController extends BaseController
{
    @Autowired
    private IDonationsService donationsService;

    /**
     * 查询宠物捐赠列表
     */
    @PreAuthorize("@ss.hasPermi('donations:donations:list')")
    @GetMapping("/list")
    public TableDataInfo list(Donations donations)
    {
        startPage();
        List<Donations> list = donationsService.selectDonationsList(donations);
        return getDataTable(list);
    }

    /**
     * 导出宠物捐赠列表
     */
    @PreAuthorize("@ss.hasPermi('donations:donations:export')")
    @Log(title = "宠物捐赠", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Donations donations)
    {
        List<Donations> list = donationsService.selectDonationsList(donations);
        ExcelUtil<Donations> util = new ExcelUtil<Donations>(Donations.class);
        util.exportExcel(response, list, "宠物捐赠数据");
    }

    /**
     * 获取宠物捐赠详细信息
     */
    @PreAuthorize("@ss.hasPermi('donations:donations:query')")
    @GetMapping(value = "/{donationId}")
    public AjaxResult getInfo(@PathVariable("donationId") Long donationId)
    {
        donationsService.updatestatuss(donationId);
        return success(donationsService.selectDonationsByDonationId(donationId));
    }

    /**
     * 新增宠物捐赠
     */
    @PreAuthorize("@ss.hasPermi('donations:donations:add')")
    @Log(title = "宠物捐赠", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Donations donations)
    {
        return toAjax(donationsService.insertDonations(donations));
    }

    /**
     * 修改宠物捐赠
     */
    @PreAuthorize("@ss.hasPermi('donations:donations:edit')")
    @Log(title = "宠物捐赠", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Donations donations)
    {
        return toAjax(donationsService.updateDonations(donations));
    }

    /**
     * 删除宠物捐赠
     */
    @PreAuthorize("@ss.hasPermi('donations:donations:remove')")
    @Log(title = "宠物捐赠", businessType = BusinessType.DELETE)
	@DeleteMapping("/{donationIds}")
    public void remove(@PathVariable Long[] donationIds)
    {
        for (Long donationId : donationIds) {
            System.out.println(donationId);
            donationsService.updatestatus22(donationId);
        }
//        return toAjax(donationsService.deleteDonationsByDonationIds(donationIds));
    }
}
