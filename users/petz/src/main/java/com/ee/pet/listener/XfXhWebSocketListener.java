package com.ee.pet.listener;

import com.alibaba.fastjson.JSONObject;
import com.ee.pet.entity.Dto.MsgDTO;
import com.ee.pet.entity.Dto.ResponseDTO;
import lombok.extern.slf4j.Slf4j;
import okhttp3.Response;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Slf4j
public class XfXhWebSocketListener extends WebSocketListener {
    private StringBuilder answer = new StringBuilder();
    private boolean wsCloseFlag = false;
    private String failureMessage;

    public StringBuilder getAnswer() {
        return answer;
    }

    public boolean isWsCloseFlag() {
        return wsCloseFlag;
    }

    public String getFailureMessage() {
        return failureMessage;
    }

    @Override
    public void onOpen(@NotNull WebSocket webSocket, @NotNull Response response) {
        super.onOpen(webSocket, response);
        log.info("XfXh websocket opened: code={}, message={}", response.code(), response.message());
    }

    @Override
    public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
        super.onMessage(webSocket, text);
        ResponseDTO responseData = JSONObject.parseObject(text, ResponseDTO.class);
        if (responseData.getHeader().getCode() != 0) {
            log.error("XfXh websocket business error: code={}, message={}",
                    responseData.getHeader().getCode(),
                    responseData.getHeader().getMessage());
            int code = responseData.getHeader().getCode();
            if (code == 10404 || code == 10003 || code == 10005) {
                this.answer = new StringBuilder("请去配置文件中填写正确的大模型api");
            } else {
                this.answer = new StringBuilder("大模型响应错误，请稍后再试");
            }
            this.failureMessage = this.answer.toString();
            this.wsCloseFlag = true;
            return;
        }

        for (MsgDTO msgDTO : responseData.getPayload().getChoices().getText()) {
            this.answer.append(msgDTO.getContent());
        }

        if (responseData.getHeader().getStatus() == 2) {
            this.wsCloseFlag = true;
        }
    }

    @Override
    public void onFailure(@NotNull WebSocket webSocket, @NotNull Throwable t, @Nullable Response response) {
        super.onFailure(webSocket, t, response);
        String responseInfo = response == null ? "no http response" : ("code=" + response.code() + ", message=" + response.message());
        this.failureMessage = "websocket failure: " + t.getMessage() + " (" + responseInfo + ")";
        this.answer = new StringBuilder("大模型连接失败，请稍后再试");
        this.wsCloseFlag = true;
        log.error("XfXh websocket failure: {}", responseInfo, t);
    }

    @Override
    public void onClosed(@NotNull WebSocket webSocket, int code, @NotNull String reason) {
        super.onClosed(webSocket, code, reason);
        log.info("XfXh websocket closed: code={}, reason={}", code, reason);
    }
}
