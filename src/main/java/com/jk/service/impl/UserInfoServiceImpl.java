package com.jk.service.impl;

import com.jk.dao.UserInfoMapper;
import com.jk.pojo.UserInfo;
import com.jk.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    private UserInfoMapper userInfoMapper;

    @Override
    public Map<String, Object> queryUsers(int page, int rows) {
        long total=userInfoMapper.queryuserCount();
        int start = (page-1)*rows;
        int end = start+rows;
        List<UserInfo> usinfo = userInfoMapper.queryuserPage(start,end);
        Map<String , Object> map = new HashMap<String , Object>();
        map.put("total", total);
        map.put("rows", usinfo);
        return map;
    }
}
