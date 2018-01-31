package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.FabusMapper;
import com.jk.pojo.Anchor;
import com.jk.pojo.Fabus;
import com.jk.service.FabuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FabuServiceImpl implements FabuService {
    @Autowired
    private FabusMapper fabusMapper;

    @Override
    public int addRenWu(Fabus fb) {
        return fabusMapper.addRenWu(fb);
    }

    @Override//查询
    public JSONObject queryFabuByPage(int page, int rows, Fabus fb) {
        long total = fabusMapper.queryFabuTotal(fb);
        //起始位置
        int start = (page - 1) * rows;
        List<Fabus> list = fabusMapper.queryFabuByPage(start,rows,fb);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", list);
        return json;
    }
}
