package com.jk.controller;

import com.jk.pojo.Gifts;
import com.jk.pojo.UserInfo;
import com.jk.pojo.UserJifenInfo;
import com.jk.pojo.Users;
import com.jk.service.UserJifenInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@EnableAutoConfiguration
@RequestMapping("UserJifenInfo")
public class UserjifenInfoController {
    @Autowired
    private UserJifenInfoService userJifenInfoService;

    @RequestMapping("toqueryUserJifenInfo")
    public String toqueryUserJifenInfo(HttpSession session,HttpServletRequest request){
        Users loginUser = (Users) session.getAttribute("loginUser");
        UserJifenInfo  user= userJifenInfoService.queryJifenInfo(loginUser.getId());
        request.setAttribute("users",user);
        return "../Credits/showcredits";
    }

    @RequestMapping("toupdatejifen")
    public String toupdatejifen(){
         return "../Credits/upjifen";
    }
    @ResponseBody
    @RequestMapping("querygift")
    public Map<String, Object> querygift(int page, int rows){
        Map<String, Object> map = userJifenInfoService.querygift(page,rows);
        return map;
    }
    @RequestMapping("updatejifen")
    @ResponseBody
    public Object updatejifen(HttpSession session,Integer jifens,Integer userids){
        Users users= (Users) session.getAttribute("loginUser");
        userids=users.getId();
        int a=userJifenInfoService.updatejifen(jifens,userids);
        return a;
    }
}
