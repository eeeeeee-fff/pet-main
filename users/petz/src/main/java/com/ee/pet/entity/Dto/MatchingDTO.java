package com.ee.pet.entity.Dto;

import lombok.Data;

@Data
public class MatchingDTO {
    private String personality;
    private int petgender;

    private int timewithpet;

    private String environment;

    private String bodytypewithpet;

    private String cleanwithpet;
}
