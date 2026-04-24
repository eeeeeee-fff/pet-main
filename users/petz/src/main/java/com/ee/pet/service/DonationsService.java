package com.ee.pet.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ee.pet.common.R;
import com.ee.pet.entity.Donations;
import com.ee.pet.entity.Dto.Examinedto;
import jakarta.servlet.http.HttpSession;


import java.util.ArrayList;
import java.util.List;

public interface DonationsService   {
    R<String> donations(Donations donation);

    R<ArrayList<Examinedto>> dexamine(HttpSession session);

    R<String> donations2(List<Donations> donation);
}
