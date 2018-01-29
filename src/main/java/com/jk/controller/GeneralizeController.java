package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Essay;
import com.jk.service.GeneralizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@EnableAutoConfiguration
@RequestMapping("/generalize")
public class GeneralizeController {
    @Autowired
    private GeneralizeService generalizeService;

    /**
     * 跳转到推广页面
     * @return
     */
    @RequestMapping("/togeneralize")
    String togeneralize(){

        return "../generalize/generalizelist";
    }

    /**
     * 查询所有文章数据
     * @param page
     * @param rows
     * @param essay
     * @return
     */
    @RequestMapping("/queryessaygeneralize")
    @ResponseBody
    public Object queryessaygeneralize(int page, int rows,Essay essay){
        JSONObject json=generalizeService.queryessaygeneralize(page,rows,essay);
        return json;
    }

    /**
     * 推广或者回收文章
     * @return
     */
    @RequestMapping("/updategeneralize")
    @ResponseBody
    public int updategeneralize(String essayides,Integer identifying){
        int a =generalizeService.updategeneralize(essayides,identifying);
        return a;
    }

}
