package com.ee.pet.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ee.pet.common.R;
import com.ee.pet.entity.Donations;
import com.ee.pet.entity.Dto.UsersDto;
import com.ee.pet.entity.Forum;

import java.util.List;

public interface ForumService extends IService<Forum> {
    R<Forum> gettop();

    List<Forum> selectforum(String title);


}
