package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.MenuTree;
import com.jk.pojo.PicGroup;
import com.jk.pojo.Topic;
import com.jk.pojo.ZmenuPoJo;

import java.util.List;

public interface MenuTreeService {
    List<MenuTree> queryMenuTree(int pid);

    List<PicGroup> syqtsj();

    List<ZmenuPoJo> syqtsjbt();

    List<Topic> qtqbtp();
}
