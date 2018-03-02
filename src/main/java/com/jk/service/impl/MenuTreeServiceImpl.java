package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.MenuTreeMapper;
import com.jk.pojo.MenuTree;
import com.jk.pojo.PicGroup;
import com.jk.pojo.Topic;
import com.jk.pojo.ZmenuPoJo;
import com.jk.service.MenuTreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MenuTreeServiceImpl implements MenuTreeService {
    @Autowired
    private MenuTreeMapper menuTreeMapper;
    @Override
    public List<MenuTree> queryMenuTree(int pid) {
        List<MenuTree> menus = menuTreeMapper.queryMenusByPid(pid);
        if(menus != null && menus.size()>0){
            for (int i = 0; i < menus.size(); i++) {
                List<MenuTree> menu2 = queryMenuTree(menus.get(i).getId());
                menus.get(i).setNodes(menu2);
            }
        }
        return menus;
    }

    @Override
    public List<PicGroup> syqtsj() {
        List<PicGroup> t=menuTreeMapper.syqtsj();
        return t;
    }

    @Override
    public List<ZmenuPoJo> syqtsjbt() {
        List<ZmenuPoJo> z=menuTreeMapper.syqtsjbt();
        return z;
    }

    @Override
    public List<Topic> qtqbtp() {
        List<Topic> to=menuTreeMapper.qtqbtp();
        return to;
    }


}
