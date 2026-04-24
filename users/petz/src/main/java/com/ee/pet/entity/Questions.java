package com.ee.pet.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("questions")
public class Questions implements Serializable {
    private int id;
    private String questionTitle;
    private int answerId;
}
