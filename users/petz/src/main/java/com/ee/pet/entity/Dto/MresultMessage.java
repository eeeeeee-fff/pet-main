package com.ee.pet.entity.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MresultMessage {
    private boolean isSystem;
    private String fromName;
    private Object message;
}
