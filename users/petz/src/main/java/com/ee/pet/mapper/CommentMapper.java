package com.ee.pet.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ee.pet.entity.Comment;
import com.ee.pet.entity.Donations;
import org.apache.ibatis.annotations.Select;

public interface CommentMapper extends BaseMapper<Comment> {
    @Select("select count(*) from comment where user_id=#{userid}")
    int getcommentnum(int userid);
}
