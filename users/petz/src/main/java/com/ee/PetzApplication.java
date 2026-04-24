package com.ee;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Slf4j
@SpringBootApplication
@MapperScan("com.ee.pet.mapper")
@ServletComponentScan
@EnableTransactionManagement
@EnableCaching
@EnableScheduling
public class PetzApplication {

    public static void main(String[] args) {
        SpringApplication.run(PetzApplication.class, args);
        log.info("项目启动成功");
    }

}
