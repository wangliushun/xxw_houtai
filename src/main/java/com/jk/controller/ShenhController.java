package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.*;
import com.jk.service.ShenhService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@EnableAutoConfiguration
@RequestMapping("/shenhe")
public class ShenhController {
    @Autowired
    private ShenhService shenhService;

    @RequestMapping("toshessay")
    public String toshessay(){
        return "shenhe/shessay";
    }
    //查询文章信息 queryShenEssayByPage
    @RequestMapping("queryShenEssayByPage")
    @ResponseBody
    public Object  queryShenEssayByPage(int page,int rows,Essay ess){
        JSONObject json=shenhService.queryShenEssayByPage(page,rows,ess);
        return json;
    }
    //跳转到审核页面


    @RequestMapping("toShEssayzt")
    public String toShEssayzt(HttpServletRequest request, Essay ess){
        ess=shenhService.queryShenEssay(ess.getEssayid());
        request.setAttribute("esslist",ess);
        return "shenhe/ShEssayztPage";
    }
    //审核提交内容
    @RequestMapping("updateShEssayzt")
    @ResponseBody
    public int updateShEssayzt(HttpServletRequest request,Essay ess){
        int a=shenhService.updateShEssayzt(ess);
        return a;
    }

    //跳转到图片审核页面
    @RequestMapping("toTopic")
    public String toTopic(){
        return "shenhe/ShTopicPage";
    }
    //分页查询图片审核信息
    @RequestMapping("queryShenTopicByPage")
    @ResponseBody
    public Object queryShenTopicByPage(int page,int rows,Topic topic){
        JSONObject json=shenhService.queryShenTopicByPage(page,rows,topic);
        return json;
    }
    //跳转到审核图片话题页面，并回显你选中信息
    @RequestMapping("toShTopiczt")
    public String toShTopiczt(HttpServletRequest request,Integer topicids,Topic topic){
        topic=shenhService.queryShTopiczt(topicids);
        request.setAttribute("topics",topic);
        return "shenhe/ShTopicztPage";
    }
    //话题审核
    @RequestMapping("updateShTopiczt")
    @ResponseBody
    public int updateShTopiczt(HttpServletRequest request,Topic topic,Integer topicids){
        int a=shenhService.updateShTopiczt(topicids,topic);
        return a;
    }
    //跳转到音频审核页面
    @RequestMapping("toAudio")
    public String toAudio(){
        return "shenhe/shAudio";
    }
    //分页查询音频信息
    @RequestMapping("queryShenAudioByPage")
    @ResponseBody
    public Object queryShenAudioByPage(int page,int rows,Audio audio){

        JSONObject json=shenhService.queryShenAudioByPage(page,rows,audio);
        return json;

    }
    //跳转到审核页面，并回显信息
    @RequestMapping("toShAudiozzt")

    public String toShAudiozzt(HttpServletRequest request,Audio audio){
        audio=shenhService.queryShAudioz(audio.getAudioid());
        request.setAttribute("audioInfo",audio);
        return "shenhe/shAudioztPage";
    }
    //提交音频审核
    @RequestMapping("updateShAudiozt")
    @ResponseBody
    public int updateShAudiozt(Audio audio){
        int a=shenhService.updateShAudiozt(audio);
        return a;

    }
    //跳转到娱乐审核页面
    @RequestMapping("toJoker")
    public String toJoker(){
        return "shenhe/shJoker";
    }
    //查询娱乐审核页面
    @RequestMapping("queryShenJokerByPage")
    @ResponseBody
    public Object queryShenJokerByPage(int page,int rows,Joker joker){
        JSONObject json=shenhService.queryShenJokerByPage(page,rows,joker);
        return json;
    }
    //跳转到审核页面并回显
    @RequestMapping("toShJokerzt")
    public String toShJokerzt(HttpServletRequest request,Integer jokids,Joker joker){
        joker=shenhService.queryJokerzt(jokids);
        request.setAttribute("jokerInfo",joker);
        return "shenhe/shJokerzt";
    }
    //审核娱乐话题
    @RequestMapping("updateShJokerzt")
    @ResponseBody
    public int updateShJokerzt(HttpServletRequest request,Integer jokids,Joker joker){
        int a=shenhService.updateShJokerzt(jokids,joker);
        return a;
    }
    //跳转到文章详情回显
    @RequestMapping("toshowssay")
    public String toshowssay(HttpServletRequest request,Essay ess){
        ess=shenhService.showwzxq(ess.getEssayid());
        request.setAttribute("esslist",ess);
        return "shenhe/wzxq";
    }



}
