package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Essay;
import com.jk.pojo.EssayComment;
import com.jk.pojo.EssayTitle;
import com.jk.pojo.Essayimg;
import com.jk.service.EssayService;
import com.jk.util.Up;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@EnableAutoConfiguration
@RequestMapping("/essay")
public class EssayController {
    @Autowired
    private EssayService essayService;
    /**
     * 跳转到展示征文标题页面
     * @return
     */
    @RequestMapping("/toessaytitle")
    String toessaytitle(){
        return "../essay/essaytitlelist";
    }

    /**
     * 展示征文标题
     * @return
     */
    @RequestMapping("/queryessaytitle")
    @ResponseBody
    public Object queryessaytitle(int page,int rows,EssayTitle essaytitle){
        JSONObject json=essayService.queryessaytitle(page,rows,essaytitle);
        return json;
    }
    /**
     * 跳转到新增征文标题页面
     * @return
     */
    @RequestMapping("/toaddeassytitle")
    String toaddeassytitle(){
        return "../essay/addeassytitle";
    }
    /**
     * 新增投稿
     * @return
     */
    @RequestMapping("/addeassytitle")
    @ResponseBody
    public Object addeassytitle(EssayTitle essayTitle){
        int a = essayService.addeassytitle(essayTitle);
        return a;
    }
    /**
     * 跳转到投稿页面
     * @return
     */
    @RequestMapping("/toupword")
    String toupword(HttpServletRequest req){
        List<Essayimg> eassyimglist=essayService.queryeassyimg();
        req.setAttribute("eassyimg",eassyimglist);
        return "../essay/addessay";
    }
    /**
     * 上传文章封面
     * @return
     */
    @RequestMapping("/upImag1")
    @ResponseBody
    public String upImag1(MultipartFile artImg, HttpServletRequest req) throws IOException {
        String imagname = Up.upImag1(artImg, req);
        return imagname;
    }
    /**
     * 上传文章
     * @return
     */
    @RequestMapping("/upfile")
    @ResponseBody
    public String upfile(MultipartFile artImges, HttpServletRequest req)throws IOException {
        String filename = Up.upfile(artImges, req);
        return filename;
    }
    /**
     * 新增投稿
     * @return
     */
    @RequestMapping("/addessay")
    @ResponseBody
    public Object addessay(Essay essay,EssayTitle essayTitle, HttpSession session){
       int a = essayService.addessay(essay,essayTitle,session);
        return a;
    }
    /**
     * 跳转到展示文章页面
     * @return
     */
    @RequestMapping("/toessay")
    String toessay(){
        return "../essay/essaylist";
    }
    /**
     * 展示文章
     * @return
     */
    @RequestMapping("/queryessay")
    @ResponseBody
    public Object queryessay(int page,int rows,Essay essay){
        JSONObject json=essayService.queryessay(page,rows,essay);
        return json;
    }
    /**
     * 修改点赞数
     * @return
     */
    @RequestMapping("/updatevotes")
    @ResponseBody
    public Object updatevotes(Essay essay){
        int a=essayService.updatevotes(essay);
        return a;
    }
    /**
     * 跳转到评论文章页面
     * @return
     */
    @RequestMapping("/toaddEssayComment")
    String toaddEssayComment(Integer essayid,HttpServletRequest request){
        request.setAttribute("essayid",essayid);
        return "../essay/addEssayComment";
    }

    /**
     * 查询文章评论
     * @param page
     * @param rows
     * @param essayComment
     * @return
     */
    @RequestMapping("/queryEssayComment")
    @ResponseBody
    public Object queryEssayComment(int page,int rows,EssayComment essayComment,Integer essayides){
        JSONObject json=essayService.queryEssayComment(page,rows,essayComment,essayides);
        return json;
    }

    /**
     * 新增评论
     * @param essayComment
     * @return
     */
    @RequestMapping("/addEssayComment")
    @ResponseBody
    public Object addEssayComment(EssayComment essayComment,Essay essay){
        int a=essayService.addEssayComment(essayComment,essay);
        return a;
    }
}
