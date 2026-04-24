package com.ee.pet.controller.Display;

import com.ee.pet.common.R;
import com.ee.pet.entity.Dto.Petdto;
import com.ee.pet.entity.Pets;
import com.ee.pet.service.PetsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/display")
public class Petdisplaycontroller {
    @Autowired
    private PetsService petsService;
    //todo 宠物展示
    //宠物分页查询展示
    @PostMapping("/pet")
    public R<List<Pets>> pet(@RequestBody Petdto petdto){
      return petsService.selectAll(petdto);
    }
    @GetMapping("/pet/{id}")
    public R<Pets> pet(@PathVariable("id") int id){
        return petsService.selectById2(id);
    }
//    插入专用
//    @PostMapping("/pet2")
//    public R<String> pet(@RequestBody List<Pets> pets){
//        return petsService.insert(pets);
//    }
}
