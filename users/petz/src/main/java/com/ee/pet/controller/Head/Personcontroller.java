package com.ee.pet.controller.Head;

import com.ee.pet.common.R;
import com.ee.pet.entity.Pets;
import com.ee.pet.entity.Users;
import com.ee.pet.service.PetsService;
import com.ee.pet.service.UsersService;


import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Slf4j
@RestController
@RequestMapping("/head")
public class Personcontroller {
    @Autowired
    private UsersService usersService;
    @Autowired
    private PetsService petsService;
    //查询个人中心数据
    @GetMapping("/person")
    public R<Users> person(HttpSession session){
       return usersService.getperson(session);
    }
    @PostMapping("/person/update")
    public R<String> update(@RequestBody Users users, HttpSession session){
        return usersService.update(users,session);
    }
    @GetMapping("/person/petself")
    //这里是查询个人页面内我的宠物，自己领养的才会展示
    public R<List<Pets>> petself(){
        return petsService.selectpetbyuser();
    }
}
