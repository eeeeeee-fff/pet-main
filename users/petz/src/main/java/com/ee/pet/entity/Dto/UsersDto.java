package com.ee.pet.entity.Dto;

import com.ee.pet.entity.Users;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UsersDto{
    private int userId;

    private String email;

    private String code;

    private String icon;

    private String username;

    private String token;

    private String forumnum;

    private String commentnum;
}
