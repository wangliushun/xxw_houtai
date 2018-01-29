package com.jk.service.impl;

import com.jk.dao.UserJifenInfoMapper;
import com.jk.pojo.UserInfo;
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
    public Map<String, Object> queryJifenInfo(int page, int rows) {
        long total=userJifenInfoMapper.queryjifenCount();
        int start = (page-1)*rows;
        int end = start+rows;
        List<UserInfo> usinfo = userJifenInfoMapper.queryjifenPage(start,end);
        Map<String , Object> map = new HashMap<String , Object>();
        map.put("total", total);
        map.put("rows", usinfo);
        return map;
    }
}
