package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Fabus;

public interface FabuService {
    int addRenWu(Fabus fb);
    //查询
    JSONObject queryFabuByPage(int page, int rows, Fabus fb);
    //修改指派人的状态
    int updateFabuzt(Integer id);
}
