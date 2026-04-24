package com.ee.pet.controller.Display;

import com.ee.pet.common.R;
import com.ee.pet.entity.AdoptionApplications;
import com.ee.pet.service.ApplicationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/display")
public class Applyforcontroller {
    @Autowired
    ApplicationService applicationService;
    @PostMapping("/applyfor")
    public R<String> applyfor(@RequestBody AdoptionApplications adoptionApplications){
       return applicationService.applyfor(adoptionApplications);
    }

}
