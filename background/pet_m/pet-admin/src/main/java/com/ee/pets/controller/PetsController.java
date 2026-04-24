package com.ee.pets.controller;

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
import com.ee.pets.domain.Pets;
import com.ee.pets.service.IPetsService;
import com.ee.common.utils.poi.ExcelUtil;
import com.ee.common.core.page.TableDataInfo;

/**
 * 宠物管理Controller
 * 
 * @author ee
 * @date 2025-03-12
 */
@RestController
@RequestMapping("/pets/pets")
public class PetsController extends BaseController
{
    @Autowired
    private IPetsService petsService;

    /**
     * 查询宠物管理列表
     */
    @PreAuthorize("@ss.hasPermi('pets:pets:list')")
    @GetMapping("/list")
    public TableDataInfo list(Pets pets)
    {
        startPage();
        List<Pets> list = petsService.selectPetsList(pets);
        return getDataTable(list);
    }

    /**
     * 导出宠物管理列表
     */
    @PreAuthorize("@ss.hasPermi('pets:pets:export')")
    @Log(title = "宠物管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Pets pets)
    {
        List<Pets> list = petsService.selectPetsList(pets);
        ExcelUtil<Pets> util = new ExcelUtil<Pets>(Pets.class);
        util.exportExcel(response, list, "宠物管理数据");
    }

    /**
     * 获取宠物管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('pets:pets:query')")
    @GetMapping(value = "/{petId}")
    public AjaxResult getInfo(@PathVariable("petId") Long petId)
    {
        return success(petsService.selectPetsByPetId(petId));
    }

    /**
     * 新增宠物管理
     */
    @PreAuthorize("@ss.hasPermi('pets:pets:add')")
    @Log(title = "宠物管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Pets pets)
    {
        return toAjax(petsService.insertPets(pets));
    }

    /**
     * 修改宠物管理
     */
    @PreAuthorize("@ss.hasPermi('pets:pets:edit')")
    @Log(title = "宠物管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Pets pets)
    {
        return toAjax(petsService.updatePets(pets));
    }

    /**
     * 删除宠物管理
     */
    @PreAuthorize("@ss.hasPermi('pets:pets:remove')")
    @Log(title = "宠物管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{petIds}")
    public AjaxResult remove(@PathVariable Long[] petIds)
    {
        return toAjax(petsService.deletePetsByPetIds(petIds));
    }
}
