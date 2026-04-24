package com.ee.pet.controller.Match;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ee.pet.common.BaseContext;
import com.ee.pet.common.R;
import com.ee.pet.entity.Dto.MatchingDTO;
import com.ee.pet.entity.Pets;
import com.ee.pet.entity.Users;
import com.ee.pet.service.MatchingService;
import com.ee.pet.service.UsersService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Slf4j
@RestController
@RequestMapping("/matching")
public class MatchingController {
    @Autowired
    UsersService usersService;
    @Autowired
    private MatchingService matchingService;
    //根据问答获取用户信息进行存取
    @PostMapping("/useradd")
    public R<Users> Useradd(HttpServletRequest request, @RequestBody MatchingDTO matchingDTO){

        //获取当前用户id的整个User实体类
        int currentId = BaseContext.getCurrentId();
        Users users = usersService.getOne(new QueryWrapper<Users>().eq("user_id", currentId));
        //将matchingDto每个字段封装到users实体类中
        users.setPersonality(matchingDTO.getPersonality());
        users.setPetgender(matchingDTO.getPetgender());
        users.setTimewithpet(matchingDTO.getTimewithpet());
        users.setEnvironment(matchingDTO.getEnvironment());
        users.setBodytypewithpet(matchingDTO.getBodytypewithpet());
        users.setCleanwithpet(matchingDTO.getCleanwithpet());
        //将封装好的users实体类更新存入数据库
        usersService.updateById(users);
        return R.success(users) ;

    }
    //根据当前用户id完成匹配
    @GetMapping("/findAll")
    public R<List<Pets>> findAll(HttpServletRequest request){
        int userId = matchingService.getCurrentUserId(request);
        List<Pets> petsList = matchingService.getAllPets();
        List<Pets> alist =matchingService.matching(userId,petsList);
        List<Pets> blist = matchingService.getTopThreePets(alist);
        return R.success(blist);
    }












}
