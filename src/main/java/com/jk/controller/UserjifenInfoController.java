package com.jk.controller;

import com.jk.service.UserJifenInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@EnableAutoConfiguration
@RequestMapping("UserJifenInfo")
public class UserjifenInfoController {
    @Autowired
    private UserJifenInfoService userJifenInfoService;

    @RequestMapping("toqueryUserJifenInfo")
    public String toqueryUserJifenInfo(){
        return "../Credits/showcredits";
    }
    @ResponseBody
    @RequestMapping("queryJifenInfo")
    public Map<String, Object> querybanlance(int page, int rows){
        Map<String, Object> map = userJifenInfoService.queryJifenInfo(page,rows);
        return map;
    }
}
