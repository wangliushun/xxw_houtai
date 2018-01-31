package com.jk.controller;


import com.jk.pojo.Fabus;
import com.jk.pojo.Users;
import com.jk.pojo.ZmenuPoJo;
import com.jk.service.ManagerService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@EnableAutoConfiguration
@RequestMapping("/manager")
public class ManagerController {
    private Logger logger = Logger.getLogger(MenuTreeController.class);
    @Autowired
    private ManagerService managerService;
    //跳转到管理页面
    @RequestMapping("/tomanager")
    public String tomanager(HttpSession session, HttpServletRequest request, Users users, ZmenuPoJo zm){
        session.getAttribute("loginUser");
        List<Users> userslist=managerService.queryUserInfo();
        request.setAttribute("userslist",userslist);
        List<ZmenuPoJo> zhutilist=managerService.queryZhutiInfo();
        request.setAttribute("zhutilist",zhutilist);
        return "manager/managerPage";
    }


}
