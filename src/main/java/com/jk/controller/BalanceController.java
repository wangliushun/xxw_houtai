package com.jk.controller;

import com.jk.pojo.Banlances;
import com.jk.service.BalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
