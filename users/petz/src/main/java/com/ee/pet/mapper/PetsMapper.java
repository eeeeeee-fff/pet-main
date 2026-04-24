package com.ee.pet.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ee.pet.entity.Dto.Petdto;
import com.ee.pet.entity.Pets;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.List;


public interface PetsMapper extends BaseMapper<Pets> {
    @Select("select * from pets where pet_id=#{petId}")
    Pets selectpetbyid(int petId);



    ArrayList<Pets> pagequrry(Petdto petdto);


    @Select("select * from pets where user_id=#{currentId} and status=2")
    List<Pets> selectpetbyuser(int currentId);
    @Select("select * from pets where status=1")
    List<Pets> selectpet();
    int pagequrry2(Petdto petdto);
}
