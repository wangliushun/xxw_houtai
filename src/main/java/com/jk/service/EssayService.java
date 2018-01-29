package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Essay;
import com.jk.pojo.EssayComment;
import com.jk.pojo.EssayTitle;
import com.jk.pojo.Essayimg;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface EssayService {
    JSONObject queryessaytitle(int page, int rows, EssayTitle essaytitle);

    int addessay(Essay essay, EssayTitle essayTitle, HttpSession session);

    List<Essayimg> queryeassyimg();

    JSONObject queryessay(int page, int rows, Essay essay);

    int updatevotes(Essay essay);

    int addeassytitle(EssayTitle essayTitle);

    JSONObject queryEssayComment(int page, int rows, EssayComment essayComment, Integer essayides);

    int addEssayComment(EssayComment essayComment, Essay essay);
}
