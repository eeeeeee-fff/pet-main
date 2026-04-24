package com.ee.pet.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ee.pet.common.BaseContext;
import com.ee.pet.common.R;
import com.ee.pet.entity.Donations;
import com.ee.pet.entity.Dto.Examinedto;
import com.ee.pet.mapper.DonationsMapper;
import com.ee.pet.service.DonationsService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class DonationsServiceimpl extends ServiceImpl<DonationsMapper, Donations> implements DonationsService {
    @Autowired
    private DonationsMapper donationsMapper;
    @Override
    public R<String> donations(Donations donation) {
        //生成唯一id
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
        Long donationid = Long.valueOf((sdf.format(System.currentTimeMillis())).concat(RandomUtil.randomNumbers(2)));
        donation.setDonationId(donationid);
        donation.setUserId((int) BaseContext.getCurrentId());
        save(donation);
        return R.success("捐赠成功，待审核");
    }

    @Override
    public R<ArrayList<Examinedto>> dexamine(HttpSession session) {
        int currentId = BaseContext.getCurrentId();
//        Object userId = session.getAttribute("users");
        if (currentId==0) {
            return R.error("请先登录");
        }
        List<Donations> donations = list(new QueryWrapper<Donations>().eq("user_id", currentId));
        ArrayList<Examinedto> examinedtos = new ArrayList<>();
        for (Donations donation : donations) {
            Examinedto examinedto = BeanUtil.copyProperties(donation, Examinedto.class);
            examinedtos.add(examinedto);
        }
        return R.success(examinedtos);
    }

    @Override
    public R<String> donations2(List<Donations> donation) {
        //生成唯一id
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
        Long donationid = Long.valueOf((sdf.format(System.currentTimeMillis())).concat(RandomUtil.randomNumbers(2)));
        for (Donations donations : donation) {
            donationid++;
            donations.setDonationId(donationid);
            save(donations);
        }
        return R.success("捐赠成功，待审核");
    }
}
