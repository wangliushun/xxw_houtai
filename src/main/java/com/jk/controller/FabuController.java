package com.jk.controller;

import com.jk.pojo.Anchor;
import com.jk.pojo.Fabus;
import com.jk.pojo.ZmenuPoJo;
import com.jk.service.FabuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@EnableAutoConfiguration
@RequestMapping("fabu")
public class FabuController {
    @Autowired
    private FabuService fabuService;

    //新增addRenWu

  @RequestMapping("addRenWu")
  @ResponseBody
  public Object addRenWu(Fabus fb){
      int a=fabuService.addRenWu(fb);
      return a;
  }

}
