package com.ee.pet.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ee.pet.common.R;
import com.ee.pet.entity.AdoptionApplications;
import com.ee.pet.entity.Dto.Examinedto;
import jakarta.servlet.http.HttpSession;


import java.util.ArrayList;

public interface ApplicationService extends IService<AdoptionApplications> {
    R<ArrayList<Examinedto>> aexamine(HttpSession session);

    R<String> applyfor(AdoptionApplications adoptionApplications);

}
