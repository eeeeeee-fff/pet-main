package com.ee.pet.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("users")
public class Users implements Serializable {
    private static final long serialVersionUID = 1L;
   @TableId
    private int userId;

    private String username;

    private String password;

    private String icon;

    private String email;

    private String phone;
    //1男 2女
    private int gender;

    private int age;

    private String personality;

    private int children;

    private int petgender;

    private int wage;
    //1有 2无
    private int experience;
    //只有狗和猫
    private String catOrDog;
    private int timewithpet;
    private String cleanwithpet;
    private String bodytypewithpet;
    private String environment;
    private String questionFk;
    private String icode;

}
