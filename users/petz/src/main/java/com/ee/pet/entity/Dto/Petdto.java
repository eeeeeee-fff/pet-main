package com.ee.pet.entity.Dto;

import lombok.Data;

@Data
public class Petdto {

    private int petId;

//    private String name;

//    private String breed;

    private int gender;

    private int age1;//年龄开始

    private int age2;//年龄结束

    private String bodytype;

    private String catOrDog;

    private String max; //三混一
//    private String adoptionInfo;

    private int status;
    //不存数据库中
    private int startpage;
    //不存数据库中
    private int pagesize;
}
