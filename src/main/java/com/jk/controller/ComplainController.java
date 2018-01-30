package com.jk.controller;


import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Complain;
import com.jk.pojo.Reply;
import com.jk.service.ComplainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@EnableAutoConfiguration
@RequestMapping("complain")
public class ComplainController {

    @Autowired
    private ComplainService complainService;

    /**
     * 测试添加选项卡跳页面
     */
    @RequestMapping(value="/tocomp")
    public String tocomp(){

        return "com/complain";
    }

    //查询
    @RequestMapping("/queryCom")
    @ResponseBody
    public Object queryCom(int page,int rows){
        JSONObject slist =complainService.queryCom(page,rows);
        return slist;
    }

    //跳转新增页面
    @RequestMapping(value="/addcom")
    public String addcom(){

        return "com/addcom";
    }

    //新增
    @RequestMapping("addcomplain")
    @ResponseBody
    public Object addcomplain(Complain complain){
        int a=(int) (Math.random()*100000);
        complain.setComid(a);
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        complain.setComplaintime(sim.format(date));
        int n=complainService.addcomplain(complain);
        return n;
    }



    @RequestMapping("deleteCom")
    @ResponseBody
    public Object deleteCom(Integer comid){
        int a= complainService.deleteCom(comid);
        return a;
    }
    @RequestMapping(value="/tohui")
    public String tohui(){

        return "com/hui";
    }


    @RequestMapping("/queryRay")
    @ResponseBody
    public Object queryRay(int page, int rows, Complain complain){
        JSONObject rist =complainService.queryRay(page,rows,complain);
        return rist;
    }

    @RequestMapping(value="/addropl")
    public String addropl(){

        return "com/addropl";
    }


    @RequestMapping("addResi")
    @ResponseBody
    public Object addResi(Reply reply, int redit){
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        reply.setReplydata(sim.format(date));
        int n=complainService.addResi(reply,redit);
        return n;
    }

}
