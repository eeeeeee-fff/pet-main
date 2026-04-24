package com.ee.pet.config;


import com.ee.pet.filter.LoginInterceptorImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class Webconfig extends WebMvcConfigurationSupport {
    @Autowired
    LoginInterceptorImpl loginInterceptor;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String imgPath = "file:" + System.getProperty("user.dir") + "/../pet_house-main/public/pet_imgs/";
        registry.addResourceHandler("/pet_imgs/**")
                .addResourceLocations(imgPath);
    }
    @Override
    protected void addInterceptors(InterceptorRegistry registry) {
        super.addInterceptors(registry);
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/users/elogin")
                .excludePathPatterns("/users/sendcode")
                .excludePathPatterns("/users/plogin")
                .excludePathPatterns("/users/register")
                .excludePathPatterns("/display/pet");
//                .excludePathPatterns("/imserver/**");
//
    }
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .allowCredentials(true);
    }
    }