package com.ee.pet.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ee.pet.common.R;
import com.ee.pet.entity.Dto.UsersDto;
import com.ee.pet.entity.Users;
import jakarta.servlet.http.HttpSession;

import javax.mail.MessagingException;

import java.security.GeneralSecurityException;

public interface UsersService extends IService<Users> {
    R<String> sendcode(Users users, HttpSession session) throws MessagingException, GeneralSecurityException;
    R<UsersDto> elogin(UsersDto usersDto, HttpSession session);

    R<Users> getperson(HttpSession session);

    R<String> update(Users users, HttpSession session);

    UsersDto getUserinfo();

    void save1(Users users);
}
