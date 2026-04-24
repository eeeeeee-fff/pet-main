package com.ee.pet.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("answers")
public class Answers {
    private int questionId;
    private String answer1;
    private String answer2;
    private String answer3;
    private String answer4;

}
