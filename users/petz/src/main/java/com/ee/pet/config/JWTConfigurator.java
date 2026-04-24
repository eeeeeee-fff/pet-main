//package com.ee.pet.config;
//import com.ee.pet.utils.JWTproperties;
//import io.jsonwebtoken.Claims;
//import io.jsonwebtoken.Jwts;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.websocket.HandshakeResponse;
//import jakarta.websocket.server.HandshakeRequest;
//import jakarta.websocket.server.ServerEndpointConfig;
//import lombok.extern.slf4j.Slf4j;
//假的
//@Slf4j
//public class JWTConfigurator extends ServerEndpointConfig.Configurator {
//
//    @Override
//    public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
//        // 获取 HttpServletRequest
//        HttpServletRequest httpRequest = (HttpServletRequest) request.getHttpServletObjects().getHttpServletRequest();
//
//        // 从请求头中获取 JWT
//        String authHeader = httpRequest.getHeader(JWTproperties.usertokenname);
//        if (authHeader != null && authHeader.startsWith("Bearer ")) {
//            String jwtToken = authHeader.substring(7); // 去掉 "Bearer " 前缀
//
//            // 解析 JWT 获取 userId
//            Long userId = parseJWT(jwtToken);
//
//            // 将 userId 存入配置参数
//            if (userId != null) {
//                config.getUserProperties().put("userId", userId);
//            }
//        }
//    }
//
//    private Long parseJWT(String jwtToken) {
//        try {
//            // 使用你的密钥解析 JWT
//            String secretKey = "pet"; // 替换为你的密钥
//            Claims claims = Jwts.parserBuilder()
//                    .setSigningKey(secretKey)
//                    .build()
//                    .parseClaimsJws(jwtToken)
//                    .getBody();
//            return Long.valueOf(claims.get(JWTproperties.USER_ID).toString()); // 假设 userId 存储在 JWT 的 subject 字段中
//        } catch (Exception e) {
//            log.error("解析 JWT 失败", e);
//            return null;
//        }
//    }
//}