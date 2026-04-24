package com.ee.pet.filter;

import com.ee.pet.common.BaseContext;
import com.ee.pet.utils.JWTproperties;
import com.ee.pet.utils.JWTutil;
import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
@Slf4j
public class LoginInterceptorImpl implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //判断当前拦截到的是Controller的方法还是其他资源
        if (!(handler instanceof HandlerMethod)) {
            //当前拦截到的不是动态方法，直接放行
            return true;
        }

            //1、从请求头中获取令牌
            String token = request.getHeader(JWTproperties.usertokenname);
        try {
            //2.校验
            log.info("jwttoken:{}", token);
            Claims claims = JWTutil.parseJWT(JWTproperties.userSecretKey, token);
            Long userid = Long.valueOf(claims.get(JWTproperties.USER_ID).toString());//解析之前我们存的userid
            log.info("当前用户id：{}", userid);
            BaseContext.setCurrentId(userid);
//            if (userid != null) {
//                config.getUserProperties().put("userId", userid);
//            }
            return true;
        } catch (Exception e) {
            log.info("拦截器未通过");
           return false;
        }
    }
}
