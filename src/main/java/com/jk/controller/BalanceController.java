package com.jk.controller;

import com.jk.pojo.Banlances;
import com.jk.pojo.Users;
import com.jk.service.BalanceService;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@EnableAutoConfiguration
@RequestMapping("banlances")
public class BalanceController {
    @Autowired
    private BalanceService balanceService;

    @RequestMapping("/toquery")
    String home() {
        return "../banlances/banlances";
    }
    @ResponseBody
    @RequestMapping("querybanlance")
    public Map<String, Object> querybanlance(int page,int rows){
        Map<String, Object> map = balanceService.querybanlance(page,rows);
        return map;
    }

    @RequestMapping("updateStas")
    @ResponseBody
    public Object updateStas(Banlances bl){
        int n =balanceService.updateStas(bl);
        return n;
    }
    @RequestMapping("toupdatebanlances")
    public String toupdatebanlances(Users users, HttpServletRequest request){
        request.setAttribute("uid",users.getId());
        request.setAttribute("name",users.getUsername());
        request.setAttribute("balan",users.getBalances());
        List<Users> list= balanceService.toupdatebanlances();
        request.setAttribute("userlist",list);
        return "../banlances/upbanlances";
    }

    @RequestMapping("/updatebanlances")
    @ResponseBody
    public Object updatebanlances(Banlances bl,Integer userids){
        int a=balanceService.updatebanlances(bl,userids);

        return a;
    }
}
