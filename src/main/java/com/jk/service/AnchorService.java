package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Anchor;

import java.util.List;

public interface AnchorService {

    JSONObject queryAnchorByPage(int page, int rows, Anchor anc);
    //删除
    int deleteAnchor(Anchor anc);
    //查询出修改对象
    Anchor queryAnchorById(Integer id);
    //修改密码
    int updateAnchor(Anchor anc);
    //查询前台选中的对象
    List<Anchor> plQueryAnchor(String plids);
    //批量修改
    int updatePlAnchor(String plids, String password);
    //新增主播
    int addAnchor(Anchor anc);

    
}
