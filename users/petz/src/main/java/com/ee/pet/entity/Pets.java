package com.ee.pet.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("pets")
public class Pets implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId
    private int petId;
    //这里加用户id是为了表明这只宠物的主人，以及方便查询，如果给平台了，这里的id也不会变，但是status状态会变1
    private int userId;

    private String name;

    private String breed;
    //1男 女2
    private int gender;

    private int age;
    //体型，分 小 中 大 超大)
    private String bodytype;

    private String personality;

    private String catOrDog;

    private int vaccination;

    private String imageUrl;

    private String adoptionInfo;
    //1上架可领养中，2不可领养
    private int status;
    private int monthMoney;
    private String cleanwithpet;
    private String environment;
    private int energy;
    private int hair;
    private int score;
    @TableField(exist = false)
    private int totlepage;
}
