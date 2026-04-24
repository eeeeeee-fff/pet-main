package com.ee.applications.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ee.pets.service.IPetsService;
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
import com.ee.applications.domain.AdoptionApplications;
import com.ee.applications.service.IAdoptionApplicationsService;
import com.ee.common.utils.poi.ExcelUtil;
import com.ee.common.core.page.TableDataInfo;

/**
 * 宠物领养Controller
 * 
 * @author ee
 * @date 2025-03-25
 */
@RestController
@RequestMapping("/applications/applications")
public class AdoptionApplicationsController extends BaseController
{
    @Autowired
    private IPetsService petsService;
    @Autowired
    private IAdoptionApplicationsService adoptionApplicationsService;

    /**
     * 查询宠物领养列表
     */
    @PreAuthorize("@ss.hasPermi('applications:applications:list')")
    @GetMapping("/list")
    public TableDataInfo list(AdoptionApplications adoptionApplications)
    {
        startPage();
        List<AdoptionApplications> list = adoptionApplicationsService.selectAdoptionApplicationsList(adoptionApplications);
        return getDataTable(list);
    }

    /**
     * 导出宠物领养列表
     */
    @PreAuthorize("@ss.hasPermi('applications:applications:export')")
    @Log(title = "宠物领养", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AdoptionApplications adoptionApplications)
    {
        List<AdoptionApplications> list = adoptionApplicationsService.selectAdoptionApplicationsList(adoptionApplications);
        ExcelUtil<AdoptionApplications> util = new ExcelUtil<AdoptionApplications>(AdoptionApplications.class);
        util.exportExcel(response, list, "宠物领养数据");
    }

    /**
     * 获取宠物领养详细信息
     */
    @PreAuthorize("@ss.hasPermi('applications:applications:query')")
    @GetMapping(value = "/{applicationId}")
    public AjaxResult getInfo(@PathVariable("applicationId") Long applicationId)
    {
        adoptionApplicationsService.updatestatus(applicationId);
        return success(adoptionApplicationsService.selectAdoptionApplicationsByApplicationId(applicationId));
    }

    /**
     * 新增宠物领养
     */
    @PreAuthorize("@ss.hasPermi('applications:applications:add')")
    @Log(title = "宠物领养", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AdoptionApplications adoptionApplications)
    {
        return toAjax(adoptionApplicationsService.insertAdoptionApplications(adoptionApplications));
    }

    /**
     * 修改宠物领养
     */
    @PreAuthorize("@ss.hasPermi('applications:applications:edit')")
    @Log(title = "宠物领养", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AdoptionApplications adoptionApplications)
    {
        return toAjax(adoptionApplicationsService.updateAdoptionApplications(adoptionApplications));
    }

    /**
     * 删除宠物领养
     */
    @PreAuthorize("@ss.hasPermi('applications:applications:remove')")
    @Log(title = "宠物领养", businessType = BusinessType.DELETE)
	@DeleteMapping("/{applicationIds}")
    public void remove(@PathVariable Long[] applicationIds)
    {
        for (Long applicationId : applicationIds) {
            System.out.println(applicationId);
            adoptionApplicationsService.updatestatus2(applicationId);
        }
        System.out.println("6666666666666666666666666666666666666");
//        return toAjax(adoptionApplicationsService.deleteAdoptionApplicationsByApplicationIds(applicationIds));
    }
}
