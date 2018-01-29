package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.ZmenuPoJoMapper;
import com.jk.pojo.ZmenuPoJo;
import com.jk.service.ZmenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ZmenuServiceImpl implements ZmenuService {
    @Autowired
    private ZmenuPoJoMapper zmenuPoJoMapper;

    @Override//查询菜单树表
    public JSONObject queryZmenu(int page, int rows) throws Exception {
        long total=zmenuPoJoMapper.queryTotal();

        int start=(page-1)*rows;

        List<ZmenuPoJo> list=zmenuPoJoMapper.queryZmenu(start,rows);

        JSONObject json=new JSONObject();
        json.put("total",total);
        json.put("rows",list);
        return json;
    }

    @Override//新增菜单
    public int addZmenu(ZmenuPoJo zmenuPoJo) {
        return zmenuPoJoMapper.addZmenu(zmenuPoJo);
    }

    @Override//回显菜单
    public ZmenuPoJo toupZmenu(int id) {
        return zmenuPoJoMapper.toupZmenu(id);
    }

    @Override//修改
    public int updateZmenu(ZmenuPoJo zmenuPoJo) {
        return zmenuPoJoMapper.updateZmenu(zmenuPoJo);
    }

    @Override//删除
    public int deleteZmenu(int id) {
        return zmenuPoJoMapper.deleteZmenu(id);
    }

}
