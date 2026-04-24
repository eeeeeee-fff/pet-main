package com.ee.pet.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ee.pet.entity.Pets;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface MatchingService extends IService<Pets> {
    //


    public int getCurrentUserId(HttpServletRequest request);
    //遍历Pets表中所有的数据，存入一个列表中
    List<Pets> getAllPets();

    //匹配逻辑
    List<Pets> matching(int userId, @RequestBody List<Pets> petsList);

    //返回匹配度最高的三只宠物
    List<Pets> getTopThreePets(List<Pets> petsList);


}
