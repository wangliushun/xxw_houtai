package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.ShenhMapper;
import com.jk.pojo.*;
import com.jk.service.ShenhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShenhServiceImpl implements ShenhService {
    @Autowired
    private ShenhMapper shenhMapper;

    @Override//查询文章信息

    public JSONObject queryShenEssayByPage(int page, int rows, Essay ess) {
        long total =shenhMapper.queryEssayTotal(ess);
        //起始位置
        int start = (page - 1) * rows;
        List<Essay> list = shenhMapper.queryShenEssayByPage(start,rows,ess);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", list);
        return json;
    }

    @Override //跳转到审核页面，并回显
    public Essay queryShenEssay(Integer essayid) {
        return shenhMapper.queryShenEssay(essayid);
    }

    @Override//审核文章
    public int updateShEssayzt(Essay ess) {
        return shenhMapper.updateShEssayzt(ess);
    }

    @Override //查询图片审核分页
    public JSONObject queryShenTopicByPage(int page, int rows, Topic topic) {
        long total =shenhMapper.queryTopicTotal(topic);
        //起始位置
        int start = (page - 1) * rows;
        List<Topic> list = shenhMapper.queryShenTopicByPage(start,rows,topic);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", list);
        return json;
    }

    @Override//跳转审核话题页面并回显
    public Topic queryShTopiczt(Integer topicids) {
        return shenhMapper.queryShTopiczt(topicids);
    }

    @Override//话题审核
    public int updateShTopiczt(Integer topicids, Topic topic) {
        return shenhMapper.updateShTopiczt(topicids,topic);
    }

    @Override //分页查询音频信息
    public JSONObject queryShenAudioByPage(int page, int rows, Audio audio) {
        long total =shenhMapper.queryAudioTotal(audio);
        //起始位置
        int start = (page - 1) * rows;
        List<Audio> list = shenhMapper.queryShenAudioByPage(start,rows,audio);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", list);
        return json;
    }

    @Override//跳转审核页面回显音频信息
    public Audio queryShAudioz(Integer audioid) {
        return shenhMapper.queryShAudioz(audioid);
    }

    @Override//提交音频审核
    public int updateShAudiozt(Audio audio) {
        return shenhMapper.updateShAudiozt(audio);
    }

    @Override//分页娱乐话题信息
    public JSONObject queryShenJokerByPage(int page, int rows, Joker joker) {
        long total =shenhMapper.queryJokerTotal(joker);
        //起始位置
        int start = (page - 1) * rows;
        List<Joker> list = shenhMapper.queryShenJokerByPage(start,rows,joker);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", list);
        return json;
    }

    @Override//跳转娱乐话题页面回显音频信息
    public Joker queryJokerzt(Integer jokids) {
        return shenhMapper.queryJokerzt(jokids);
    }

    @Override//审核娱乐话题
    public int updateShJokerzt(Integer jokids, Joker joker) {
        return shenhMapper.updateShJokerzt(jokids,joker);
    }


}
