package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.EssayMapper;
import com.jk.pojo.*;
import com.jk.service.EssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class EssayServiceImpl implements EssayService {
    @Autowired
    private EssayMapper essayMapper;
    @Override
    public JSONObject queryessaytitle(int page, int rows, EssayTitle essaytitle) {
        long totalCount = essayMapper.queryTotals(essaytitle);
        //当前页数据————————oracle分页   关键字 rownum    两个参数：起始位置、结束位置
        //起始位置 =（当前页-1）*每页条数
        int start = (page-1)*rows;
        //结束位置 = 起始位置+每页条数
        int end = start + rows;
        //查询当前页数据
        List<EssayTitle> s = essayMapper.queryspage(start,end,essaytitle);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows", s);
        return json;
    }

    @Override
    public int addessay(Essay essay,EssayTitle essayTitle, HttpSession session) {
        Users loginUser = (Users) session.getAttribute("loginUser");
        essay.setUserfullname(loginUser.getFullname());
        essay.setUserid(loginUser.getId());
        SimpleDateFormat sim= new SimpleDateFormat("yyyy-MM-dd");
        essay.setEssaytitleid(essayTitle.getId());
        essay.setEssaystarttime(sim.format(new Date()));
        essay.setEssaytitlename(essayTitle.getEssaytitlename());
        return essayMapper.addessay(essay);
    }

    @Override
    public List<Essayimg> queryeassyimg() {

        return essayMapper.queryeassyimg();
    }

    @Override
    public JSONObject queryessay(int page, int rows, Essay essay) {
        long totalCount = essayMapper.queryEssayTotals(essay);
        //当前页数据————————oracle分页   关键字 rownum    两个参数：起始位置、结束位置
        //起始位置 =（当前页-1）*每页条数
        int start = (page-1)*rows;
        //结束位置 = 起始位置+每页条数
        int end = start + rows;
        //查询当前页数据
        List<EssayTitle> s = essayMapper.queryEssaypage(start,end,essay);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows", s);
        return json;
    }

    @Override
    public int updatevotes(Essay essay) {

        return essayMapper.updatevotes(essay);
    }

    @Override
    public int addeassytitle(EssayTitle essayTitle) {

        return essayMapper.addeassytitle(essayTitle);
    }

    @Override
    public JSONObject queryEssayComment(int page, int rows, EssayComment essayComment,Integer essayides) {
        long totalCount = essayMapper.queryEssayCommentTotals(essayComment,essayides);
        //当前页数据————————oracle分页   关键字 rownum    两个参数：起始位置、结束位置
        //起始位置 =（当前页-1）*每页条数
        int start = (page-1)*rows;
        //结束位置 = 起始位置+每页条数
        int end = start + rows;
        //查询当前页数据
        List<EssayTitle> s = essayMapper.queryEssayCommentpage(start,end,essayComment,essayides);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows", s);
        return json;
    }

    @Override
    public int addEssayComment(EssayComment essayComment, Essay essay) {
        SimpleDateFormat sim= new SimpleDateFormat("yyyy-MM-dd");
        essayComment.setCommenttime(sim.format(new Date()));
        int a=essayMapper.addEssayComment(essayComment);
        a =essayMapper.updatevotes(essay);

        return a;
    }
}
