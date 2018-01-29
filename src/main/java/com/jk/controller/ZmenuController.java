package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.ZmenuPoJo;
import com.jk.service.ZmenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@EnableAutoConfiguration
@RequestMapping("/zmenucontroller")
public class ZmenuController {
    @Autowired
    private ZmenuService zmenuService;



    /**
     * 查询菜单表
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/queryZmenu")
    @ResponseBody
    public Object queryZmenu(int page,int rows){
        JSONObject json= new JSONObject();
        try {
            json = zmenuService.queryZmenu(page,rows);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;

    }

    /**
     * 新增菜单
     * @return
     */
    @RequestMapping("/addZmenu")
    @ResponseBody
    public Object addZmenu(ZmenuPoJo zmenuPoJo){
        int n=zmenuService.addZmenu(zmenuPoJo);
        return n;
    }

    /**
     * 回显
     * @return
     */
   @RequestMapping("/toupZmenu")
    public String toupZmenu(int id, HttpServletRequest request) {
       ZmenuPoJo zmenuPoJo=zmenuService.toupZmenu(id);
       request.setAttribute("zmenuPoJo",zmenuPoJo);
        return "../zmenu/updateZmenu";
    }

    /**
     * 修改
     * @param zmenuPoJo
     * @return
     */
    @RequestMapping("/updateZmenu")
    @ResponseBody
    public Object updateZmenu(ZmenuPoJo zmenuPoJo){
       int n=zmenuService.updateZmenu(zmenuPoJo);
        return n;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/deleteZmenu")
    @ResponseBody
    public Object deleteZmenu(Integer id){
        int n=zmenuService.deleteZmenu(id);
        return n;
    }
}
