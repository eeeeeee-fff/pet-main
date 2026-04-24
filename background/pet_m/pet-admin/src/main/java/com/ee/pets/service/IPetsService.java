package com.ee.pets.service;

import java.util.List;
import com.ee.pets.domain.Pets;

/**
 * 宠物管理Service接口
 * 
 * @author ee
 * @date 2025-03-12
 */
public interface IPetsService 
{
    /**
     * 查询宠物管理
     * 
     * @param petId 宠物管理主键
     * @return 宠物管理
     */
    public Pets selectPetsByPetId(Long petId);

    /**
     * 查询宠物管理列表
     * 
     * @param pets 宠物管理
     * @return 宠物管理集合
     */
    public List<Pets> selectPetsList(Pets pets);

    /**
     * 新增宠物管理
     * 
     * @param pets 宠物管理
     * @return 结果
     */
    public int insertPets(Pets pets);

    /**
     * 修改宠物管理
     * 
     * @param pets 宠物管理
     * @return 结果
     */
    public int updatePets(Pets pets);

    /**
     * 批量删除宠物管理
     * 
     * @param petIds 需要删除的宠物管理主键集合
     * @return 结果
     */
    public int deletePetsByPetIds(Long[] petIds);

    /**
     * 删除宠物管理信息
     * 
     * @param petId 宠物管理主键
     * @return 结果
     */
    public int deletePetsByPetId(Long petId);
}
