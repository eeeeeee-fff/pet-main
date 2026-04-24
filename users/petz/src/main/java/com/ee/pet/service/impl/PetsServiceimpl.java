package com.ee.pet.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ee.pet.common.BaseContext;
import com.ee.pet.common.R;
import com.ee.pet.entity.Dto.Petdto;
import com.ee.pet.entity.Pets;
import com.ee.pet.mapper.PetsMapper;
import com.ee.pet.service.PetsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PetsServiceimpl extends ServiceImpl<PetsMapper, Pets> implements PetsService {
    @Autowired
    PetsMapper petsMapper;
    //宠物展示页面的分页动态查询
    @Override
    public R<List<Pets>> selectAll( Petdto petdto) {
        //todo mapper有修改
        ArrayList<Pets> pagequrry = petsMapper.pagequrry(petdto);
        int i = petsMapper.pagequrry2(petdto);
        for (Pets pets : pagequrry) {
            pets.setTotlepage(i);
        }
        return R.success(pagequrry);
    }

    @Override
    public R<List<Pets>> selectpetbyuser() {
        int currentId = BaseContext.getCurrentId();
        List<Pets> pets = petsMapper.selectpetbyuser(currentId);
        return R.success(pets);
    }
    //查询单个宠物
    @Override
    public R<Pets> selectById2(int id) {
        //todo 有修改
        Pets pets = getOne(new QueryWrapper<Pets>().eq("pet_id", id));
        return R.success(pets);
    }

    @Override
    public R<String> insert(List<Pets> pets) {
        for (Pets pet : pets) {
            save(pet);
        }
        return R.success("插入成功");
    }
}
