package com.ee.pet.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ee.pet.common.BaseContext;
import com.ee.pet.common.R;
import com.ee.pet.entity.Dto.UsersDto;
import com.ee.pet.entity.Users;
import com.ee.pet.mapper.CommentMapper;
import com.ee.pet.mapper.ForumMapper;
import com.ee.pet.mapper.UsersMapper;
import com.ee.pet.service.UsersService;
import com.ee.pet.utils.JWTproperties;
import com.ee.pet.utils.JWTutil;
import com.ee.pet.utils.Mail_send;
import com.ee.pet.utils.RegexUtils;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;

import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@Slf4j
@Service
public class UsersServiceImpl extends ServiceImpl<UsersMapper, Users> implements UsersService {
    @Autowired
    UsersMapper usersMapper;
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private ForumMapper forumMapper;
    @Autowired
    private Mail_send mail_send;
    @Override
    public R<String> sendcode(Users users, HttpSession session) throws MessagingException, GeneralSecurityException {
        String email = users.getEmail();
        int selectuser = usersMapper.selectuser(email);
        if (RegexUtils.isEmailInvalid(email)){
            log.info("不符合:{}",email);
            return R.error("邮箱格式错误");
        }
        if(selectuser==0){
            return R.error("账号不存在，请先注册");
        }
        System.out.println(email);

        //生成模拟发送        验证码
        String icode = RandomUtil.randomNumbers(6);
//        int selectcode = usersMapper.selectcode(email);
//        if (selectcode==0){
////            usersMapper.insert(code,email);
//        }else {
            usersMapper.update(icode,email);
//        }

//        session.setAttribute("code",code);
        log.info("发送验证码成功:{}", icode);
        mail_send.sendcode_email(email,icode);
        return R.success("发送验证码成功");
    }

    //邮箱登录
        @Override
    public R<UsersDto> elogin(UsersDto usersDto, HttpSession session){
        String email = usersDto.getEmail();
            int selectuser = usersMapper.selectuser(email);
            if(selectuser==0){
                return R.error("账号不存在，请先注册");
            }
            String ycode = usersDto.getCode();
        String rcode = usersMapper.geticode(email);
        //检验邮箱格式
        if (RegexUtils.isEmailInvalid(email)){
            log.info("不符合:{}",email);
            return R.error("邮箱格式错误");
        }
        if(!Objects.equals(ycode, rcode)){
            log.info("用户写的,{}",ycode);
            log.info("redis的,{}",rcode);
            log.info("验证码错误");
            return R.error("请输入正确的验证码");
        }

        Users users = getOne(new QueryWrapper<Users>().eq("email", email));
        if (users == null){
            return R.error("用户不存在,请先注册");
        }
        int userid = users.getUserId();
        log.info("用户id,{}",userid);
        //创建jwt令牌
            Map<String, Object> claims = new HashMap<>();
            claims.put(JWTproperties.USER_ID, userid);
            String token = JWTutil.createJWT(
                    JWTproperties.userSecretKey,
                    JWTproperties.userttl,
                    claims);
        UsersDto usersDto1 = BeanUtil.copyProperties(users, UsersDto.class);
        usersDto1.setToken(token);
        log.info("成功登录token,{}",token);
        return R.success(usersDto1);

    }

    //查询个人中心数据
    @Override
    public R<Users> getperson(HttpSession session) {
        int currentId = BaseContext.getCurrentId();
        Users users = getOne(new QueryWrapper<Users>().eq("user_id", currentId));
        return R.success(users);
    }

    @Override
    public R<String> update(Users users, HttpSession session) {
        int currentId = BaseContext.getCurrentId();
        users.setUserId(currentId);
        updateById(users);
        return R.success("修改成功");
    }

    @Override
    public UsersDto getUserinfo() {
        int userid = BaseContext.getCurrentId();
        UsersDto usersDto = new UsersDto();
        Users users = getOne(new QueryWrapper<Users>().eq("user_id", userid));
        BeanUtils.copyProperties(users,usersDto);
        int getforumnum = forumMapper.getforumnum(userid);
        usersDto.setForumnum(String.valueOf(getforumnum));
        int getcommentnum = commentMapper.getcommentnum(userid);
        usersDto.setCommentnum(String.valueOf(getcommentnum));
//        System.out.println(usersDto);
        return usersDto;
    }

    @Override
    public void save1(Users users) {
        save(users);
    }


}