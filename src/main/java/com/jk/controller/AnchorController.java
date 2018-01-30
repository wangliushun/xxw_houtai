package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Anchor;
import com.jk.service.AnchorService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@EnableAutoConfiguration
@RequestMapping("/anchor")
public class AnchorController {
    private Logger logger = Logger.getLogger(MenuTreeController.class);
    @Autowired
    private AnchorService anchorService;
    //跳转到主播页面
    @RequestMapping("/toshow")
    public String toshow(){

        return "anchor/showAnchor";
    }

    //页面加载查询的方法


    @RequestMapping("/queryAnchorByPage")
    @ResponseBody
    public Object queryAnchorByPage(int page,int rows,Anchor anc){

        JSONObject json =anchorService.queryAnchorByPage(page,rows,anc);
        return json;
    }
    //删除
    @RequestMapping("/deleteAnchor")
    @ResponseBody
    public Object deleteAnchor(Anchor anc){
        int n = anchorService.deleteAnchor(anc);
        return n;
    }
    //回显密码
    @RequestMapping("/toUpShow")

    public String toUpShow(Anchor anc,HttpServletRequest request){

        anc=anchorService.queryAnchorById(anc.getId());
        request.setAttribute("anchorlist",anc);
        System.out.println("anc");
        return "anchor/upShow";
    }
//修改密码
@RequestMapping("updateAnchor")
@ResponseBody
public int updateAnchor(HttpServletRequest request,Anchor anc){
    int a =anchorService.updateAnchor(anc);
    return a;
}
//跳转到批量修改页面
   @RequestMapping("/plShowUp")
    public String plShowUp(HttpServletRequest request,String plids){
       List<Anchor> ancList=anchorService.plQueryAnchor(plids);
        request.setAttribute("anclist",ancList);
        return "anchor/plShowUp";
    }

//批量修改
@RequestMapping("/updatePlAnchor")
@ResponseBody
public int updatePlAnchor(HttpServletRequest reques,String plids,Anchor anc){
    int a=anchorService.updatePlAnchor(plids,anc.getPassword());
    return a;
}
//跳转新增主播
    @RequestMapping("toAddShow")
    public String toAddShow() {
        return "anchor/addShow";
    }
    //新增
    @RequestMapping("addAnchor")
    @ResponseBody
    public Object addAnchor(Anchor anc){
        int a=anchorService.addAnchor(anc);
        return a;
    }

}


