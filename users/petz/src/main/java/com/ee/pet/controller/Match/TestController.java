package com.ee.pet.controller.Match;

import cn.hutool.core.util.StrUtil;
import com.ee.pet.common.BaseContext;
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

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

@RestController
@RequestMapping("/test")
@Slf4j
public class TestController {

    @Resource
    private XfXhStreamClient xfXhStreamClient;

    @Resource
    private XfXhConfig xfXhConfig;

    private static final Set<Long> introducedUsers = ConcurrentHashMap.newKeySet();

    @GetMapping("/sendQuestion")
    public R<String> sendQuestion(@RequestParam("question") String question) {
        if (StrUtil.isBlank(question)) {
            return R.error("无效问题，请重新输入");
        }
        if (!xfXhStreamClient.operateToken(XfXhStreamClient.GET_TOKEN_STATUS)) {
            return R.error("当前大模型连接数过多，请稍后再试");
        }

        long userId = BaseContext.getCurrentId();
        List<MsgDTO> msgList = new ArrayList<>();
        if (!introducedUsers.contains(userId)) {
            msgList.add(MsgDTO.createUserMsg("你是谁？"));
            msgList.add(MsgDTO.createAssistantMsg("你好，我是掌灯星屿宠物领养平台的AI智能助手星崽，专注于宠物领养、喂养、健康、行为等方面的问题，有什么我可以帮助你的吗？"));
            introducedUsers.add(userId);
        }
        msgList.add(MsgDTO.createUserMsg(question));

        XfXhWebSocketListener listener = new XfXhWebSocketListener();
        WebSocket webSocket = xfXhStreamClient.sendMsg(UUID.randomUUID().toString().substring(0, 10), msgList, listener);
        if (webSocket == null) {
            xfXhStreamClient.operateToken(XfXhStreamClient.BACK_TOKEN_STATUS);
            return R.error("系统内部错误，请联系管理员");
        }

        try {
            int count = 0;
            int maxCount = xfXhConfig.getMaxResponseTime() * 5;
            while (count <= maxCount) {
                Thread.sleep(200);
                if (listener.isWsCloseFlag()) {
                    break;
                }
                count++;
            }
            if (count > maxCount) {
                log.error("XfXh websocket timeout after {} seconds for userId={}, question={}",
                        xfXhConfig.getMaxResponseTime(), userId, question);
                return R.error("大模型响应超时，请联系管理员");
            }
            if (StrUtil.isNotBlank(listener.getFailureMessage())) {
                log.error("XfXh websocket returned failure for userId={}: {}", userId, listener.getFailureMessage());
            }
            return R.success(listener.getAnswer().toString());
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            log.error("XfXh websocket interrupted", e);
            return R.error("系统内部错误，请联系管理员");
        } finally {
            webSocket.close(1000, "");
            xfXhStreamClient.operateToken(XfXhStreamClient.BACK_TOKEN_STATUS);
        }
    }
}
