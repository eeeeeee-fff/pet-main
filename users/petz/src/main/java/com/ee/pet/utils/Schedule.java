package com.ee.pet.utils;

import com.ee.pet.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class Schedule {
    @Autowired
    private ForumService forumService;
    // 在一个特定的时间执行这个方法~ Timer
    // Cron表达式
    //      秒 分 时 日 月 周几（这里是所有工作日，其中0和7都代表周日）
    /**     30 15 10 * * ？ 每天10点15分30 执行一次
     */
    @Scheduled(cron = "0 0 0 * * ?")
    public void gettop() {
        forumService.gettop();
        System.out.println("论坛置顶更换");
    }
}