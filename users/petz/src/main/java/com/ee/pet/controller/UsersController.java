package com.ee.pet.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ee.pet.common.BaseContext;
import com.ee.pet.common.R;
import com.ee.pet.entity.Dto.UsersDto;
import com.ee.pet.entity.Users;
import com.ee.pet.mapper.UsersMapper;
import com.ee.pet.service.UsersService;

import com.ee.pet.utils.JWTproperties;
import com.ee.pet.utils.JWTutil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;

import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
@RestController
@RequestMapping("/users")
@CrossOrigin
public class UsersController {
    @Autowired
    private UsersMapper usersMapper;
    @Autowired
    private UsersService usersService;
    //用户登录
    @PostMapping("/plogin")
    public R<UsersDto> plogin(@RequestBody Users users) {
        //将页面提交的密码进行md5加密处理
        String password = users.getPassword();
        //解析MD5
        password = DigestUtils.md5DigestAsHex(password.getBytes());
        //根据页面提交的用户名查询数据库
        LambdaQueryWrapper<Users> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Users::getUsername, users.getUsername());
        Users user = usersService.getOne(queryWrapper);

        //如果没有查询到返回失败
        if (user == null) {
            return R.error("没有查询到该用户");
        }
        //如果查询到则判断密码是否正确
        if (!user.getPassword().equals(password)) {
            return R.error("密码错误");
        }
        //创建jwt

        Map<String, Object> claims = new HashMap<>();
        claims.put(JWTproperties.USER_ID, user.getUserId());
        String token = JWTutil.createJWT(
                JWTproperties.userSecretKey,
                JWTproperties.userttl,
                claims);
        log.info("成功登录token,{}",token);
        //返回成功信息
        UsersDto usersDto = BeanUtil.copyProperties(user, UsersDto.class);
        usersDto.setToken(token);
        return R.success(usersDto);
    }
    //发送验证码
    @PostMapping("/sendcode")
    public R<String> sendcode(HttpSession session, @RequestBody Users users) throws GeneralSecurityException, MessagingException {
        return usersService.sendcode(users,session);
    }
    //用户邮箱验证码登录
    @PostMapping("/elogin")
    public R<UsersDto> elogin(HttpSession session, @RequestBody UsersDto usersDto){
        return usersService.elogin(usersDto,session);
    }


    //退出
    @PostMapping("/logout")
    public R<String> logout() {
        BaseContext.removeCurrentId();
        return R.success("退出成功");
    }

    //注册
    //todo 用户id有问题
    @PostMapping("/register")
    public R<UsersDto> register(HttpServletRequest request, @RequestBody Users users) {
        // 检查用户名是否为空
        if (users.getUsername() == null || users.getUsername().isEmpty()) {
            return R.error("用户名不能为空");
        }
        // 查询有没有重复用户名在数据库里
        String username = users.getUsername();
        String email = users.getEmail();
        int i = usersMapper.selectexist1(username);
        int i1 = usersMapper.selectexist2(email);

        if (i>=1) {
            return R.error("用户名重复,请更换");
        }
        if (i1>=1) {
            return R.error("邮箱重复，请更换");
        }
        // 注册
        users.setPassword(DigestUtils.md5DigestAsHex(users.getPassword().getBytes()));
        users.setIcon("[/blogs/0428c0f7-904f-4dd1-b383-26fff01db837.jpg]");

        usersService.save1(users);
        Map<String, Object> claims = new HashMap<>();
        claims.put(JWTproperties.USER_ID,users.getUserId());
        String token = JWTutil.createJWT(
                JWTproperties.userSecretKey,
                JWTproperties.userttl,
                claims);

        UsersDto usersDto = BeanUtil.copyProperties(users, UsersDto.class);
        usersDto.setToken(token);
        return R.success(usersDto);
    }
    //todo 插入专用
    @PostMapping("/register2")
    public R<String> register2(@RequestBody List<Users> users) {
        for (Users user : users) {
            user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
            usersService.save(user);
        }
        return R.success("注册成功");
    }


}

