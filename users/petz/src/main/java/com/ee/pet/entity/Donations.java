package com.ee.pet.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName("donations")
public class Donations implements Serializable {
//    private static final long serialVersionUID = 1L;

    private Long donationId;

//    private int petId;

    private int userId;

    private String name;

    private int gender; //公1 母2

    private int age;

    private String personality;

    private String breed;

    private String catOrDog;

    private String imageUrl;

    //tinyint
    private int vaccination;

    //
    private String adoptionInfo;

    private String donorName;

    private String donorContact;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime donationDate;

//    @TableField(fill = FieldFill.INSERT_UPDATE)
@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime passDate;

    private int status;
}
