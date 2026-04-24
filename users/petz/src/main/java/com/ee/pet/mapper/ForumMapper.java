package com.ee.pet.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ee.pet.entity.Donations;
import com.ee.pet.entity.Forum;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ForumMapper extends BaseMapper<Forum> {

    @Select("select * from forum where title like concat('%',#{title},'%')")
    List<Forum> Listbytitle(String title);
    @Select("SELECT COUNT(*) FROM forum WHERE user_id=#{userid}")
    int getforumnum(int userid);
}
