package com.ee.pets.mapper;

import java.util.List;
import com.ee.pets.domain.Pets;
import org.apache.ibatis.annotations.Update;

/**
 * 宠物管理Mapper接口
 * 
 * @author ee
 * @date 2025-03-12
 */
public interface PetsMapper 
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
     * 删除宠物管理
     * 
     * @param petId 宠物管理主键
     * @return 结果
     */
    public int deletePetsByPetId(Long petId);

    /**
     * 批量删除宠物管理
     * 
     * @param petIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePetsByPetIds(Long[] petIds);
    @Update("update pets set status = 2 where pet_id = #{petId}")
    void updatestatus(Long petId);
}
