package com.jk.service.impl;

import com.jk.pojo.RedisDemo;
import com.jk.service.RedisDemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RedisDemoServiceImpl implements RedisDemoService {
    @Autowired
    StringRedisTemplate stringRedisTemplate;

    @Resource(name = "stringRedisTemplate")
    ValueOperations<String, String> valOpsStr;

     @Autowired
     RedisTemplate<Object, Object> redisTemplate;

     @Resource(name = "redisTemplate")
     ValueOperations<Object, Object> valOpsObj;

    /**
     * 根据指定key获取String
     * @param key
     * @return
     */
    public String getStr(String key){
        return valOpsStr.get(key);
    }

    /**
     * 设置Str缓存
     * @param key
     * @param val
     */
    public void setStr(String key, String val){
        valOpsStr.set(key,val);
    }

    /**
     * 删除指定key
     * @param key
     */
    public void del(String key){
        stringRedisTemplate.delete(key);
    }

    /**
     * 根据指定key获取Object
     * @param key
     * @return
     */
    public Object getObj(String key){
        return valOpsObj.get(key);
    }

    /**
     * 设置obj缓存
     * @param key
     * @param redisDemo
     */
    public void setObj(String key, RedisDemo redisDemo){
        valOpsObj.set(key, redisDemo);
    }

    /**
     * 删除Obj缓存
     * @param key
     */
    public void delObj(String key){
        redisTemplate.delete(key);
    }
}
