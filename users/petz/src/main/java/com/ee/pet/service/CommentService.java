package com.ee.pet.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ee.pet.common.R;
import com.ee.pet.entity.AdoptionApplications;
import com.ee.pet.entity.Comment;
import com.ee.pet.mapper.CommentMapper;

import java.util.List;

public interface CommentService extends IService<Comment> {
    R<List<Comment>> getcomment(int forumid);
}
