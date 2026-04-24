package com.ee.pet.controller.Head;

import com.ee.pet.common.R;
import com.ee.pet.entity.Dto.Examinedto;
import com.ee.pet.service.ApplicationService;
import com.ee.pet.service.DonationsService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import java.util.ArrayList;

@Slf4j
@RestController
@RequestMapping("/head")
public class Examinecontroller {
    @Autowired
    DonationsService donationsService;
    @Autowired
    ApplicationService applicationService;
    //捐赠审核
    @GetMapping("/examine/d")
    public R<ArrayList<Examinedto>> dexamine(HttpSession session){
        return donationsService.dexamine(session);
    }
    //申请审核
    @GetMapping("/examine/a")
    public R<ArrayList<Examinedto>> aexamine(HttpSession session){
        return applicationService.aexamine(session);
    }
}
