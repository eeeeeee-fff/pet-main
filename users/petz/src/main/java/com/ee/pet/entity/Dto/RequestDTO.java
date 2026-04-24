package com.ee.pet.entity.Dto;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 请求参数
 * 对应生成的 JSON 结构参考 resources/demo-json/request.json
 *
 * @author fsq
 * @create 2023年10月27日12:06:38
 */
@NoArgsConstructor
@Data
public class RequestDTO {

    @JsonProperty("header")
    private HeaderDTO header;
    @JsonProperty("parameter")
    private ParameterDTO parameter;
    @JsonProperty("payload")
    private PayloadDTO payload;

    @NoArgsConstructor
    @Data
    @AllArgsConstructor
    public static class HeaderDTO {
        /**
         * 应用appid，从开放平台控制台创建的应用中获取
         */
        @JSONField(name = "app_id")
        private String appId;
        /**
         * 每个用户的id，用于区分不同用户，最大长度32
         */
        @JSONField(name = "uid")
        private String uid;
    }

    @NoArgsConstructor
    @Data
    @AllArgsConstructor
    public static class ParameterDTO {
        private ChatDTO chat;

        @NoArgsConstructor
        @Data
        @AllArgsConstructor
        public static class ChatDTO {
            @JsonProperty("domain")
            private String domain;
            @JsonProperty("temperature")
            private Float temperature;
            @JSONField(name = "max_tokens")
            private Integer maxTokens;
        }
    }

    @NoArgsConstructor
    @Data
    @AllArgsConstructor
    public static class PayloadDTO {
        @JsonProperty("message")
        private MessageDTO message;

        @NoArgsConstructor
        @Data
        @AllArgsConstructor
        public static class MessageDTO {
            @JsonProperty("text")
            private List<MsgDTO> text;
        }
    }
}
