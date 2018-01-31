package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.JokerDao;
import com.jk.pojo.Joker;
import com.jk.pojo.JokerComment;
import com.jk.pojo.ZmenuPoJo;
import com.jk.service.JokerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JokerServiceImpl implements JokerService {
    @Autowired
    private JokerDao jokerDao;

    @Override
    public List<ZmenuPoJo> queryjokerzmenu() {
        return jokerDao.queryjokerzmenu();
    }

    @Override
    public JSONObject queryJokerByMenuId(int page, int rows, Joker j) {
        //总条数
        long totalCount = jokerDao.queryTotaljoker(j);
        //当前页数据————————oracle分页   关键字 rownum    两个参数：起始位置、结束位置
        //起始位置 =（当前页-1）*每页条数
        int start = (page-1)*rows;
        //查询当前页数据
        List<Joker> jo = jokerDao.queryjokerpage(start,rows,j);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows",jo );
        return json;
    }

    @Override
    public int updatecaizan(Joker j, Integer flag) {
        return jokerDao.updatecaizan(j,flag);
    }

    @Override
    public int deletejoker(Integer id) {
        return jokerDao.deletejoker(id);
    }

    @Override
    public int saveJoker(Joker j) {
        return jokerDao.saveJoker(j);
    }

    @Override
    public Joker queryjokerByJokerId(Integer id) {
        return jokerDao.queryjokerByJokerId(id);
    }

    @Override
    public int updateJoker(Joker j) {
        return jokerDao.updateJoker(j);
    }

    @Override
    public int savepl(JokerComment jc) {
        return jokerDao.savepl(jc);
    }

    @Override
    public JSONObject queryPlByJokerId(int page, int rows, JokerComment jc) {
        //总条数
        long totalCount = jokerDao.queryTotalPl(jc);
        //当前页数据————————oracle分页   关键字 rownum    两个参数：起始位置、结束位置
        //起始位置 =（当前页-1）*每页条数
        int start = (page-1)*rows;
        //查询当前页数据
        List<JokerComment> jo = jokerDao.queryPlpage(start,rows,jc);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows",jo );
        return json;
    }

    @Override
    public int deleteplbyId(Integer id) {
        return jokerDao.deleteplbyId(id);
    }
}
