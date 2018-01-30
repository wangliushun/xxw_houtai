package com.jk.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.jk.dao.ComplainMapper;
import com.jk.pojo.Complain;
import com.jk.pojo.Reply;
import com.jk.service.ComplainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class ComplainServiceImpl implements ComplainService {

    @Autowired
    private ComplainMapper  complainMapper;

    public JSONObject queryCom(int page, int rows) {
        long totalCount = complainMapper.queryStutol();
        int start = (page-1)*rows;
        List<Complain> students1 = complainMapper.querySer(start,rows);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows", students1);
        return json;
    }

    public int addcomplain(Complain complain) {
        return complainMapper.addcomplain(complain);
    }

    public int deleteCom(Integer comid) {

        //删除这个评论下的所有回复
        int ted=complainMapper.deletevor(comid);

        return complainMapper.deleteCom(comid);
    }

    public JSONObject queryRay(int page, int rows,Complain complain)  {
        long totalCount = complainMapper.queryRay();
        int start = (page-1)*rows;
        List<Complain> students1 = complainMapper.queryRaysty(start,rows,complain);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows", students1);

        System.out.println(students1);
//        for(int i = 0 ; i < students1.size() ; i++) {
//            System.out.println(students1.get(i).getComid());
//        }
        return json;
    }

    public int addResi(Reply reply, int redit) {
        return complainMapper.addResi(reply,redit);
    }
}
