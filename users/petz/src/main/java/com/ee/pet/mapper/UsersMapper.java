package com.ee.pet.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ee.pet.entity.Users;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


public interface UsersMapper extends BaseMapper<Users> {
    @Select("select * from users where user_id = #{userId}")
    Users selectuserbyid(int userId);
    @Select("select count(*) from users where email = #{email}")
    int selectuser(String email);
    @Select("select count(icode) from users where email = #{email}")
    int selectcode(String email);
//    @Insert("insert into users(icode) values #{code} where email = #{email}")
//    void insert(String code, String email);
    @Update("update users set icode = #{icode} where email = #{email}")
    void update(String icode, String email);
    @Select("select icode from users where email = #{email}")
    String geticode(String email);
    @Select("select count(*) from users where username = #{username}")
    int selectexist1(String username);
    @Select("select count(*) from users where email = #{email}")
    int selectexist2(String email);
}
