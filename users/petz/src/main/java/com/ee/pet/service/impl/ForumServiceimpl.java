package com.ee.pet.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ee.pet.common.BaseContext;
import com.ee.pet.common.R;
import com.ee.pet.entity.Dto.UsersDto;
import com.ee.pet.entity.Forum;
import com.ee.pet.entity.Pets;
import com.ee.pet.mapper.ForumMapper;
import com.ee.pet.mapper.PetsMapper;
import com.ee.pet.service.ForumService;
import com.ee.pet.service.PetsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ForumServiceimpl extends ServiceImpl<ForumMapper, Forum> implements ForumService {
    @Autowired
    private ForumMapper forumMapper;
    @Override
    public R<Forum> gettop() {
        Forum top = getOne(new QueryWrapper<Forum>().eq("top", 1));
        if (top == null) {
            return R.error("没有置顶帖子");
        }
        return R.success(top);
    }

    @Override
    public List<Forum> selectforum(String title) {
        List<Forum> listbytitle = forumMapper.Listbytitle(title);
        return listbytitle;
    }


}
