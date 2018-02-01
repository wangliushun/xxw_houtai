package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.*;
import com.jk.service.UserService;
import com.jk.util.Up1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
//话题控制层
@Controller
@EnableAutoConfiguration
@RequestMapping("top")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/test")
    String myTest() {
        return "tree";
    }

    @RequestMapping("/test1")
    String myTest1() {
        return "tree1";
    }
    //跳转主页面
    @RequestMapping("/test2")
    String myTest2() {
        return "tree2";
    }

    @RequestMapping("/test3")
    String myTest3() {
        return "tree3";
    }
    //跳转新增页面
    @RequestMapping("/test4")
    String myTest4() {
        return "../topic/tree4";
    }
    //跳转设置封面页面
    @RequestMapping("/setfm")
    String setfm(String ur,Topic topic,HttpSession session) {
        session.setAttribute("ul",ur);
        List<Topic> pic = userService.queryTop(topic.getTopictypeid());
        session.setAttribute("p",pic);
        return "../topic/setfm";
    }
    //跳转修改页面
    @RequestMapping("/uptopic")
    String uptopic(Topic topic,Integer mid,PicGroup pg,HttpSession session) {
        pg.setPicgroupmenuid(mid);
        pg = userService.querytgByTopId(pg.getPicgroupmenuid());
        session.setAttribute("pg", pg);
        topic = userService.queryTopicById(topic.getId());
        session.setAttribute("t", topic);
        if(pg.getFmimgurl().equals(topic.getPicurl())){
            session.setAttribute("flag", "是封面");
        }else{
            session.setAttribute("flag", "不是封面");
        }
        return "../topic/uptopic";
    }
    //跳转话题列表页面并查询话题类型
    @RequestMapping("/topic")
    String topic(HttpSession session) {
        List<ZmenuPoJo> tList=userService.queryzmenu();
        session.setAttribute("tlist",tList);
        return "../topic/topic";
    }

    //跳转图片组列表页面
    @RequestMapping("/topicpg")
    String topicpg() {
        return "../topic/topicpg";
    }
    //查询左侧菜单树
    @RequestMapping("/queryMenu")
    @ResponseBody
    public Object queryMenu(){
        List<MenuTree> menus = userService.queryMenu(0);
        return menus;
    }

    //分页查询图片组
    @RequestMapping("queryPicGroup")
    @ResponseBody
    public Object queryPicGroup(int page,int rows,PicGroup pg){
        JSONObject json=userService.queryPicGroup(page,rows,pg);
        return json;
    }

    //根据menuid查询话题表
    @RequestMapping("queryTopicByMenuId")
    @ResponseBody
    public Object queryTopicByMenuId(int page,int rows,Topic topic,HttpSession session){
        JSONObject json=userService.queryTopicByMenuId(page,rows,topic,session);
        return json;
    }
    //单个删除话题
    @RequestMapping("deletetopic")
    @ResponseBody
    public Object deletetopic(Topic topic){
        int n = userService.deletetopic(topic.getId());
        return n;
    }

    //上传图片
    @RequestMapping(value="uploadPhotoFile")
    @ResponseBody
    public String  uploadPhotoFile(MultipartFile artImg,HttpServletRequest req) throws IOException{
        String upImag1 = Up1.upImag1(artImg, req);
        return upImag1;
    }

    //新增话题
    @RequestMapping("saveTopic")
    @ResponseBody
    public Object saveTopic(HttpSession session,Topic topic){
        Users  user= (Users) session.getAttribute("loginUser");
        topic.setUserid(user.getId());
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        topic.setUptime(sim.format(date));
        topic.setTopiczancount(0);
        topic.setTopicshzt(0);
        int a =userService.saveTopic(topic);
        return a;
    }

    //修改话题
    @RequestMapping(value="updateTopic")
    @ResponseBody
    public Object updateTopic(HttpSession session,Topic topic){
        Users  user= (Users) session.getAttribute("loginUser");
        topic.setUserid(user.getId());
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        topic.setUptime(sim.format(date));
        int n = userService.updateTopic(topic);
        return n;
    }

    @RequestMapping("/querytgById")
    @ResponseBody
    public List<PicGroup> querytgById(PicGroup pg){
        List<PicGroup> list = userService.querytgById(pg.getPicgroupmenuid());
        return list;
    }
    //修改封面
    @RequestMapping(value="updatePicGroupfm")
    @ResponseBody
    public Object updatePicGroupfm(PicGroup pg){
        int n = userService.updatePicGroupfm(pg);
        return n;
    }
    //点赞
    @RequestMapping(value="updatezanById")
    @ResponseBody
    public Object updatezanById(Topic topic){
        int n = userService.updatezanById(topic.getId());
        return n;
    }

    //重新设置封面
    @RequestMapping(value="updatePicZufm")
    @ResponseBody
    public Object updatePicZufm(PicGroup pg){
        int n = userService.updatePicZufm(pg);
        return n;
    }


    //跳转详细页面
    @RequestMapping("/totopxiangxi")
    String totopxiangxi(Topic topic,HttpSession session) {
        topic = userService.queryTopicById(topic.getId());
        session.setAttribute("tops", topic);
        return "../topic/totopxiangxi";
    }


    //新增话题评论
    @RequestMapping("savetoppl")
    @ResponseBody
    public Object savetoppl(HttpSession session,TopicComment tc){
        if(tc.getTopplstate()==null){
            tc.setTopplstate(2);
        }
        Users  user= (Users) session.getAttribute("loginUser");
        tc.setTopuserid(user.getId());
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        tc.setToppltime(sim.format(date));
        int a =userService.savetoppl(tc);
        return a;
    }


    //跳转评论列表页面
    @RequestMapping("/toquerytoppl")
    String toquerytoppl(Integer topid,HttpSession session) {
        session.setAttribute("topsid", topid);
        return "../topic/toquerytoppl";
    }


    //分页查询话题评论
    @RequestMapping("queryTopPlByTopId")
    @ResponseBody
    public Object queryTopPlByTopId(int page, int rows, TopicComment tc){
        JSONObject json=userService.queryTopPlByTopId(page,rows,tc);
        return json;
    }


    //单个删除话题评论
    @RequestMapping("deletetopplbyId")
    @ResponseBody
    public Object deletetopplbyId(TopicComment tc){
        int n = userService.deletetopplbyId(tc.getId());
        return n;
    }
    /*private UserService userService;
    @RequestMapping("/queryPicId")
    @ResponseBody
    public Object queryPicId(){
        List<PicTopic> menus = userService.queryPicId("0");
        System.out.println("123");
        System.out.println("123");
        return menus;
    }*/
}
