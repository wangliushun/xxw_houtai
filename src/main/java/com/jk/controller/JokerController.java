package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Joker;
import com.jk.pojo.JokerComment;
import com.jk.pojo.Users;
import com.jk.pojo.ZmenuPoJo;
import com.jk.service.JokerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@EnableAutoConfiguration
@RequestMapping("joker")
public class JokerController {
    @Autowired
    private JokerService jokerService;
    //跳转娱乐话题列表页面并查询娱乐话题类型
    @RequestMapping("/tojoker1")
    String topic(HttpSession session) {
        List<ZmenuPoJo> jList=jokerService.queryjokerzmenu();
        session.setAttribute("jlist",jList);
        return "../joker/jokers";
    }

    //根据menuid查询娱乐话题表
    @RequestMapping("queryJokerByMenuId")
    @ResponseBody
    public Object queryJokerByMenuId(int page, int rows, Joker j){
        JSONObject json=jokerService.queryJokerByMenuId(page,rows,j);
        return json;
    }


    //踩与赞
    @RequestMapping(value="updatecaizan")
    @ResponseBody
    public Object updatecaizan(Integer jid,Integer flag,Joker j){
        j.setId(jid);
        int n = jokerService.updatecaizan(j,flag);
        return n;
    }

    //单个删除娱乐话题
    @RequestMapping("deletejoker")
    @ResponseBody
    public Object deletejoker(Joker j){
        int n = jokerService.deletejoker(j.getId());
        return n;
    }

    //跳转新增页面
    @RequestMapping("/toaddjoker")
    String toaddjoker() {
        return "../joker/toaddjoker";
    }

    //新增娱乐话题
    @RequestMapping("saveJoker")
    @ResponseBody
    public Object saveJoker(HttpSession session,Joker j){
        Users user= (Users) session.getAttribute("loginUser");
        j.setPublisher(user.getUsername());
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        j.setUptimes(sim.format(date));
        j.setCai(0);
        j.setZan(0);
        j.setJokershzt(0);
        int a =jokerService.saveJoker(j);
        return a;
    }


    //跳转修改页面
    @RequestMapping("/toupjoker")
    String uptopic(Joker j,HttpSession session) {
        j = jokerService.queryjokerByJokerId(j.getId());
        session.setAttribute("jok", j);
        return "../joker/toupjoker";
    }

    //修改娱乐话题
    @RequestMapping(value="updateJoker")
    @ResponseBody
    public Object updateJoker(HttpSession session,Joker j){
        Users user= (Users) session.getAttribute("loginUser");
        j.setPublisher(user.getUsername());
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        j.setUptimes(sim.format(date));
        int n = jokerService.updateJoker(j);
        return n;
    }


    //跳转详细页面
    @RequestMapping("/toxiangxi")
    String toxiangxi(Joker j,HttpSession session) {
        j = jokerService.queryjokerByJokerId(j.getId());
        session.setAttribute("joks", j);
        return "../joker/toxiangxi";
    }

    //新增娱乐话题评论
    @RequestMapping("savepl")
    @ResponseBody
    public Object savepl(HttpSession session,JokerComment jc){
        if(jc.getPlstate()==null){
            jc.setPlstate(2);
        }
        Users user= (Users) session.getAttribute("loginUser");
        jc.setUsername(user.getUsername());
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        jc.setPltime(sim.format(date));
        int a =jokerService.savepl(jc);
        return a;
    }



    //跳转评论列表页面
    @RequestMapping("/toquerypl")
    String toquerypl(Integer jkid,HttpSession session) {
        session.setAttribute("jokersid", jkid);
        return "../joker/toquerypl";
    }

    //分页查询评论
    @RequestMapping("queryPlByJokerId")
    @ResponseBody
    public Object queryPlByJokerId(int page, int rows, JokerComment jc){
        JSONObject json=jokerService.queryPlByJokerId(page,rows,jc);
        return json;
    }

    //单个删除评论
    @RequestMapping("deleteplbyId")
    @ResponseBody
    public Object deleteplbyId(JokerComment jc){
        int n = jokerService.deleteplbyId(jc.getId());
        return n;
    }
}
