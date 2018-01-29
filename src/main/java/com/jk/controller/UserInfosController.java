package com.jk.controller;

import com.jk.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("users")
@EnableAutoConfiguration
public class UserInfosController {
    @Autowired
    private UserInfoService userInfoService;
    @RequestMapping("toqueryUser")
    public String toqueryUser(){
        return "../Users/showusers";
    }

    @ResponseBody
    @RequestMapping("queryUsers")
    public Map<String, Object> queryUsers(int page, int rows){
        Map<String, Object> map = userInfoService.queryUsers(page,rows);
        return map;
    }
}
