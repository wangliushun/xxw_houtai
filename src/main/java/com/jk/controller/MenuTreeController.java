package com.jk.controller;

import com.jk.pojo.MenuTree;
import com.jk.pojo.TestMongo;
import com.jk.service.MenuTreeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@EnableAutoConfiguration
public class MenuTreeController {
    private Logger logger = Logger.getLogger(MenuTreeController.class);
    @Autowired
    private MenuTreeService menuTreeService;

    @Autowired
    private MongoTemplate mongoTemplate;

    /**
     * 登录页面
     * @return
     */
    @RequestMapping("/login")
    public String login(){
        return "../../index3";
    }

    /**
     * 跳转后台管理主页面
     * @return
     */
    @RequestMapping(value="/home")
    private String home(){
        return "home";
    }


    /**
     * 后台系统查询树
     * @return
     */
    @RequestMapping("/queryMenuTree")
    @ResponseBody
    public Object queryMenuTree(){
        List<MenuTree> menuTreeList=menuTreeService.queryMenuTree(0);
        return menuTreeList;
    }

    /**
     * 跳转菜单列表页面
     */
    @RequestMapping(value="/toshowZmenu")
    public String toshowZmenu(){
        return "../zmenu/showZmenu";
    }

    /**
     * 跳转菜单新增页面
     */
    @RequestMapping(value="/toAddZmenu")
    public String toAddZmenu(){
        return "../zmenu/addZmenu";
    }
    /**
     * 测试MongoDB
     * @return
     */
/*    @RequestMapping("/mongotest")
    public Object savemongo(){
        TestMongo tm=new TestMongo();
        tm.setId("1");
        tm.setName("22");
        mongoTemplate.insert(tm);
        return null;
    }*/
    /**
     * 跳转前台主页面
     * @return
     */
    @RequestMapping("/to")
    public String to(){
        return "qt/show";
    }

    /**
     * 跳转show页面
     * @return
     */
    @RequestMapping("show")
    public String show(){
        return "qt/show";
    }
    /**
     * 跳转征文比赛页面
     * @return
     */
    @RequestMapping("zhengwen")
    public String zhengwen(){
        return "qt/zhengwen";
    }
    /**
     * 跳转倾听世界页面
     * @return
     */
    @RequestMapping("qingting")
    public String qingting(){
        return "qt/qingting";
    }

    /**
     * 跳转叫醒耳朵页面
     * @return
     */
    @RequestMapping("jiaoxing")
    public String jiaoxing(){
        return "qt/jiaoxing";
    }
    /**
     * 跳转每日一笑页面
     * @return
     */
    @RequestMapping("meiri")
    public String meiri(){
        return "qt/meiri";
    }
    /**
     * 跳转报错页面
     * @return
     */
    @RequestMapping("404")
    public String baocuo(){
        return "qt/404";
    }
    /**
     * 跳转ear_detail页面
     * @return
     */
    @RequestMapping("ear_detail")
    public String ear_detail(){
        return "qt/ear_detail";
    }

    /**
     * 跳转news_add页面
     * @return
     */
    @RequestMapping("news_add")
    public String news_add(){
        return "qt/news_add";
    }
    /**
     * 跳转news_add_success页面
     * @return
     */
    @RequestMapping("news_add_success")
    public String news_add_success(){
        return "qt/news_add_success";
    }

    /**
     * 跳转news_detail页面
     * @return
     */
    @RequestMapping("news_detail")
    public String news_detail(){
        return "qt/news_detail";
    }

    /**
     * 跳转pic_detail页面
     * @return
     */
    @RequestMapping("pic_detail")
    public String pic_detail(){
        return "qt/pic_detail";
    }

    /**
     * 跳转reg页面
     * @return
     */
    @RequestMapping("reg")
    public String reg(){
        return "qt/reg";
    }

    /**
     * 跳转suggest页面
     * @return
     */
    @RequestMapping("suggest")
    public String suggest(){
        return "qt/suggest";
    }
}
