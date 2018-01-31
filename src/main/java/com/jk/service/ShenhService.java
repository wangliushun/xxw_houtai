package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Audio;
import com.jk.pojo.Essay;
import com.jk.pojo.Joker;
import com.jk.pojo.Topic;
import org.springframework.beans.factory.annotation.Autowired;

public interface ShenhService {
  
    //查询文章分页
    JSONObject queryShenEssayByPage(int page, int rows, Essay ess);
    //跳转到审核页面，并回显
    Essay queryShenEssay(Integer essayid);
    //审核文章
    int updateShEssayzt(Essay ess);
    //查询图片话题分页
    JSONObject queryShenTopicByPage(int page, int rows, Topic topic);
    //跳转审核话题页面并回显
    Topic queryShTopiczt(Integer topicids);
    //话题审核
    int updateShTopiczt(Integer topicids, Topic topic);
    //分页查询音频信息
    JSONObject queryShenAudioByPage(int page, int rows, Audio audio);
    //跳转审核页面回显音频信息
    Audio queryShAudioz(Integer audioid);
    //提交音频审核
    int updateShAudiozt(Audio audio);
    //分页娱乐话题信息
    JSONObject queryShenJokerByPage(int page, int rows, Joker joker);
    //跳转娱乐话题页面回显音频信息
    Joker queryJokerzt(Integer jokids);
    //审核娱乐话题
    int updateShJokerzt(Integer jokids, Joker joker);
    //根据ID回显
    Essay showwzxq(Integer essayid);
}
