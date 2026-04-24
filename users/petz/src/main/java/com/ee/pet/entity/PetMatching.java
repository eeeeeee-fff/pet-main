package com.ee.pet.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
@Data
@TableName("pet_matching")
public class PetMatching implements Serializable {
    private static final long serialVersionUID = 1L;
    private int matchingId;
    private int petId;
    private int userId;
    private int matchScore;
    private String personality;
    private String breed;

}
