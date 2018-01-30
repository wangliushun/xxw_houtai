package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.AnchorMapper;
import com.jk.pojo.Anchor;
import com.jk.service.AnchorService;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AnchorServiceImpl implements AnchorService {
    @Autowired
    private AnchorMapper anchorMapper;

    @Override
    public JSONObject queryAnchorByPage(int page, int rows, Anchor anc) {
        long total = anchorMapper.queryAnchorTotal(anc);
        //起始位置
        int start = (page - 1) * rows;
        List<Anchor> list = anchorMapper.queryAnchorByPage(start, rows, anc);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", list);
        return json;
    }

    @Override
    public int deleteAnchor(Anchor anc) {
        return anchorMapper.deleteAnchor(anc);
    }

    //查询
    @Override
    public Anchor queryAnchorById(Integer id) {
        return anchorMapper.queryAnchorById(id);
    }

    //修改密码
    @Override
    public int updateAnchor(Anchor anc) {
        return anchorMapper.updateAnchor(anc);
    }
    //批量回显
    @Override
    public List<Anchor> plQueryAnchor(String plids) {
        List<Anchor> upcount= new ArrayList<Anchor>();
        if(plids!=""){
            String[] allids=plids.split(",");
            int idSize=allids.length;
            for(int i=0;i<idSize;i++){
                int m=(Integer.parseInt(allids[i]));

                Anchor  upa=anchorMapper.plQueryAnchor(m);
                upcount.add(upa);
            }
        }
        return upcount;
    }
//批量修改
    @Override
    public int updatePlAnchor(String plids, String password) {
        int idSize=0;

        if (plids!=null&&plids!=""){
            String[] allids=plids.split(",");
            String[] passwords=password.split(",");
            idSize=allids.length;
            for(int i=0;i<idSize;i++){
                int m=(Integer.parseInt(allids[i]));
                String p=(passwords[i]);
               int idSizes=anchorMapper.updatePlAnchor(m,p);
            }
        }
        return idSize;
    }

    @Override//新增主播
    public int addAnchor(Anchor anc) {
        return anchorMapper.addAnchor(anc);
    }


}