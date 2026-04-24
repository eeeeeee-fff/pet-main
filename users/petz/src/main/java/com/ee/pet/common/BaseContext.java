package com.ee.pet.common;
/*
* 基于ThreadLocal封装类工具，用户保存和获取当前登录用户id
* */
public class BaseContext {
    private static ThreadLocal<Long> threadLocal=new ThreadLocal<>();

    public static void setCurrentId(Long id){
        threadLocal.set(id);
    }

    public static int getCurrentId(){
        return Math.toIntExact(threadLocal.get());
    }
    public static void removeCurrentId() {
        threadLocal.remove();
    }
}
