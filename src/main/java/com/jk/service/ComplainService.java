package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Complain;
import com.jk.pojo.Reply;

public interface ComplainService {
    JSONObject queryCom(int page, int rows);

    int addcomplain(Complain complain);

    int deleteCom(Integer comid);

    JSONObject queryRay(int page, int rows, Complain complain);

    int addResi(Reply reply, int redit);
}
