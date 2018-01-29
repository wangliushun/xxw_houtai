package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.GeneralizeMapper;
import com.jk.pojo.Essay;
import com.jk.service.GeneralizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GeneralizeServiceImpl implements GeneralizeService{
    @Autowired
    private GeneralizeMapper generalizeMapper;

    @Override
    public JSONObject queryessaygeneralize(int page, int rows, Essay essay) {
        long totalCount = generalizeMapper.queryTotals(essay);
        //当前页数据————————oracle分页   关键字 rownum    两个参数：起始位置、结束位置
        //起始位置 =（当前页-1）*每页条数
        int start = (page-1)*rows;
        //结束位置 = 起始位置+每页条数
        int end = start + rows;
        //查询当前页数据
        List<Essay> s = generalizeMapper.queryspage(start,end,essay);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows", s);
        return json;
    }

    @Override
    public int updategeneralize(String essayides, Integer identifying) {
        String[] split = essayides.split(",");
        int a = 0;
        for (int i = 0; i < split.length; i++) {
            a=generalizeMapper.updategeneralize(Integer.valueOf(split[i]),identifying);
        }

        return a;
    }
}
