package com.jk.service;

import com.jk.pojo.RedisDemo;

public interface RedisDemoService {
    void setStr(String key, String val);

    String getStr(String key);

    void del(String key);

    void setObj(String key, RedisDemo redisDemo);

    Object getObj(String key);

    void delObj(String key);
}
