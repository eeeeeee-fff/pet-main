package com.ee.pet.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ee.pet.common.R;
import com.ee.pet.entity.Comment;
import com.ee.pet.entity.Donations;
import com.ee.pet.entity.Users;
import com.ee.pet.mapper.CommentMapper;
import com.ee.pet.mapper.DonationsMapper;
import com.ee.pet.mapper.UsersMapper;
import com.ee.pet.service.CommentService;
import com.ee.pet.service.DonationsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceimpl extends ServiceImpl<CommentMapper,Comment> implements CommentService {
    @Autowired
    UsersMapper usersMapper;
    @Override
    public R<List<Comment>> getcomment(int forumid) {
        List<Comment> comments = list(new QueryWrapper<Comment>().eq("forum_id", forumid));
        int num=comments.size();
        for (Comment comment : comments) {
            int userId = comment.getUserId();
            Users user = usersMapper.selectuserbyid(userId);
            comment.setUserInfo(user.getIcon());
            comment.setUsername(user.getUsername());
        }
        return R.success(comments);
    }
}
