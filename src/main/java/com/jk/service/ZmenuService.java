package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.ZmenuPoJo;

public interface ZmenuService {
    JSONObject queryZmenu(int page, int rows) throws Exception;

    int addZmenu(ZmenuPoJo zmenuPoJo);

    ZmenuPoJo toupZmenu(int id);

    int updateZmenu(ZmenuPoJo zmenuPoJo);

    int deleteZmenu(int id);
}
