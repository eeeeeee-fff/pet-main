package com.ee.pet.controller.Match;


import cn.hutool.core.util.StrUtil;

import com.ee.pet.common.R;
import com.ee.pet.config.XfXhConfig;
import com.ee.pet.entity.Dto.MsgDTO;
import com.ee.pet.listener.XfXhWebSocketListener;
import com.ee.pet.utils.XfXhStreamClient;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import okhttp3.WebSocket;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ee.pet.common.BaseContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author fsq
 * @create 2023年10月27日12:07:59
 */
@RestController
@RequestMapping("/test")
@Slf4j
public class TestController {

    @Resource
    private XfXhStreamClient xfXhStreamClient;

    @Resource
    private XfXhConfig xfXhConfig;

    // 记录已经完成首次介绍的用户，服务重启后清空
    private static final Set<Long> introducedUsers = ConcurrentHashMap.newKeySet();


    /**
     * 发送问题
     *
     * @param question 问题
     * @return 星火大模型的回答
     */
    @GetMapping("/sendQuestion")
    public R<String> sendQuestion(@RequestParam("question") String question) {
        // 如果是无效字符串，则不对大模型进行请求
        if (StrUtil.isBlank(question)) {
            return R.error("无效问题，请重新输入");
        }
        // 获取连接令牌
        if (!xfXhStreamClient.operateToken(XfXhStreamClient.GET_TOKEN_STATUS)) {
            return R.error("当前大模型连接数过多，请稍后再试");
        }

        long userId = BaseContext.getCurrentId();
        List<MsgDTO> msgList = new ArrayList<>();
        // 首次提问才注入角色设定，之后不再自我介绍
        if (!introducedUsers.contains(userId)) {
            msgList.add(MsgDTO.createUserMsg("你是谁？"));
            msgList.add(MsgDTO.createAssistantMsg("你好，我是掌灯星屿宠物领养平台的AI智能助手星屿，专注于宠物领养、饲养、健康、行为等方面的问题，有什么我可以帮助你的吗？"));
            introducedUsers.add(userId);
        }
        msgList.add(MsgDTO.createUserMsg(question));
        // 创建监听器
        XfXhWebSocketListener listener = new XfXhWebSocketListener();
        // 发送问题给大模型，生成 websocket 连接
        WebSocket webSocket = xfXhStreamClient.sendMsg(UUID.randomUUID().toString().substring(0, 10), msgList, listener);
        if (webSocket == null) {
            // 归还令牌
            xfXhStreamClient.operateToken(XfXhStreamClient.BACK_TOKEN_STATUS);
            return R.error("系统内部错误，请联系管理员");
        }
        try {
            int count = 0;
            // 为了避免死循环，设置循环次数来定义超时时长
            int maxCount = xfXhConfig.getMaxResponseTime() * 5;
            while (count <= maxCount) {
                Thread.sleep(200);
                if (listener.isWsCloseFlag()) {
                    break;
                }
                count++;
            }
            if (count > maxCount) {
                return R.error("大模型响应超时，请联系管理员");
            }
            // 响应大模型的答案
            return R.success(listener.getAnswer().toString());
        } catch (InterruptedException e) {
            log.error("错误：" + e.getMessage());
            return R.error("系统内部错误，请联系管理员");
        } finally {
            // 关闭 websocket 连接
            webSocket.close(1000, "");
            // 归还令牌
            xfXhStreamClient.operateToken(XfXhStreamClient.BACK_TOKEN_STATUS);
        }
    }
}

