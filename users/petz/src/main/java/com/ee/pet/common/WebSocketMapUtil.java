package com.ee.pet.common;//package com.shy.pet.common;
//
//import com.shy.pet.component.MyWebSocketController;
//
//import java.util.Collection;
//import java.util.concurrent.ConcurrentHashMap;
//import java.util.concurrent.ConcurrentMap;
//
//
//
//
///**
// * 工具类  用来存放删除获取用户
// * @author 史**
// *
// * 2018年9月17日
// */
//public class WebSocketMapUtil {
//    public static ConcurrentMap<String, MyWebSocketController> webSocketMap = new ConcurrentHashMap<String, MyWebSocketController>();
//    public static void put(String key, MyWebSocketController myWebSocket){
//        webSocketMap.put(key, myWebSocket);
//    }
//
//    public static MyWebSocketController get(String key){
//        return webSocketMap.get(key);
//    }
//
//    public static void remove(String key){
//        webSocketMap.remove(key);
//    }
//
//    public static Collection<MyWebSocketController> getValues(){
//        return webSocketMap.values();
//    }
//
//}
