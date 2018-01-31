package com.jk.service.impl;

import com.jk.dao.BanlancesMapper;
import com.jk.pojo.Banlances;
import com.jk.pojo.Users;
import com.jk.service.BalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BanlanceServiceImpl implements BalanceService{
@Autowired
    private BanlancesMapper banlancesMapper;


    @Override
    public Map<String, Object> querybanlance(int page, int rows) {
        long total=banlancesMapper.queryusCount();
        int start = (page-1)*rows;
        int end = start+rows;
        List<Users> us = banlancesMapper.querybanlancePage(start,end);
        Map<String , Object> map = new HashMap<String , Object>();
        map.put("total", total);
        map.put("rows", us);
        return map;
    }

    @Override
    public int updateStas(Banlances bl) {
        if(bl.getMoney_status()==1){
            bl.setMoney_status(2);
        }else{
            bl.setMoney_status(1);
        }
        return banlancesMapper.updateStas(bl);
    }

    @Override
    public int updatebanlances(Banlances bl,Integer userids) {
        int a =banlancesMapper.updatebanlances(bl);
        if(a==1){
            a=banlancesMapper.plusbanlances(bl.getBalance(),userids);
        }
        return a;

    }

    @Override
    public List<Users> toupdatebanlances() {
        return banlancesMapper.toupdatebanlances();
    }




}
