package com.ee.pet.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ee.pet.common.BaseContext;
import com.ee.pet.common.R;
import com.ee.pet.entity.AdoptionApplications;
import com.ee.pet.entity.Dto.Examinedto;
import com.ee.pet.entity.Pets;
import com.ee.pet.mapper.ApplicationMapper;
import com.ee.pet.mapper.PetsMapper;
import com.ee.pet.service.ApplicationService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class ApplicationServiceimpl extends ServiceImpl<ApplicationMapper, AdoptionApplications> implements ApplicationService {
    @Autowired
    PetsMapper petsMapper;
    @Override
    public R<ArrayList<Examinedto>> aexamine(HttpSession session) {
        int currentId = BaseContext.getCurrentId();
//        Object userId = session.getAttribute("users");
        if (currentId ==0) {
            return R.error("请先登录");
        }
        List<AdoptionApplications> adoptionApplications = list(new QueryWrapper<AdoptionApplications>().eq("user_id", currentId));
        ArrayList<Examinedto> examinedtos = new ArrayList<>();
        for (AdoptionApplications adoptionApplication : adoptionApplications) {
            //对应petid
            int petId = adoptionApplication.getPetId();
            Pets pet = petsMapper.selectpetbyid(petId);
            Examinedto examinedto = BeanUtil.copyProperties(pet, Examinedto.class);
            //申请时间
            if (adoptionApplication.getApplicationDate() != null) {
            examinedto.setApplicationDate(adoptionApplication.getApplicationDate());
            }
            //通过时间
            if (adoptionApplication.getPassDate() != null) {
            examinedto.setPassDate(adoptionApplication.getPassDate());
            }
            examinedtos.add(examinedto);
        }
        return R.success(examinedtos);
}

    @Override
    public R<String> applyfor(AdoptionApplications adoptionApplications) {
        int currentId = BaseContext.getCurrentId();
        if (currentId == 0) {
            return R.error("请先登录");
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
        Long donationid = Long.valueOf((sdf.format(System.currentTimeMillis())).concat(RandomUtil.randomNumbers(2)));
        adoptionApplications.setUserId(currentId);
        adoptionApplications.setApplicationId(donationid);
        save(adoptionApplications);
        return R.success("申请成功");
    }
}
