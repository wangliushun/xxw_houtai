package com.jk.controller;

import com.jk.pojo.Users;
import com.jk.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@EnableAutoConfiguration
@RequestMapping("/userscontroller")
public class UsersController {
    @Autowired
    private UsersService usersService;

    /**
     * 登录
     * @return
     */
    @RequestMapping("tologin")
    @ResponseBody
    public Object tologin(Users users, HttpSession session){
        String loginFlag= null;
        try {
            loginFlag = usersService.tologin(users,session);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return loginFlag;
    }

    /**
     * 退出登录，清空登录用户的session,返回登录方法
     * @param session
     * @return
     */
    @RequestMapping("/loginout")
    public String loginout(HttpSession session){
        if(session!=null){
            session.removeAttribute("loginUser");
        }
        return "login";
    }
}
