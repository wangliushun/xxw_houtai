package com.jk.service.impl;

import com.jk.dao.UserJifenInfoMapper;
import com.jk.pojo.Gifts;
import com.jk.pojo.UserInfo;
import com.jk.pojo.UserJifenInfo;
import com.jk.pojo.Users;
import com.jk.service.UserJifenInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserJifenInfoServiceImpl implements UserJifenInfoService {
    @Autowired
    private UserJifenInfoMapper userJifenInfoMapper;

    @Override
    public UserJifenInfo  queryJifenInfo(Integer id) {
        UserJifenInfo user= userJifenInfoMapper.queryJifenInfo(id);
        return user;
    }

    @Override
    public Map<String, Object> querygift(int page, int rows) {
        long total=userJifenInfoMapper.querygiftCount();
        int start = (page-1)*rows;
        int end = start+rows;
        List<Gifts> gifts= userJifenInfoMapper.querygiftPage(start,end);
        Map<String , Object> map = new HashMap<String , Object>();
        map.put("total", total);
        map.put("rows", gifts);
        return map;
    }

    @Override
    public int updatejifen(Integer jifens, Integer userids) {
        return userJifenInfoMapper.updatejifen(jifens,userids);
    }


}
