package com.jk.service.impl;

import com.jk.dao.JokerDao;
import com.jk.dao.ManagerMapper;
import com.jk.pojo.Users;
import com.jk.pojo.ZmenuPoJo;
import com.jk.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerMapper managerMapper;


    @Override
    public List<Users> queryUserInfo() {
        return managerMapper.queryUserInfo();
    }

    @Override
    public List<ZmenuPoJo> queryZhutiInfo() {
        return managerMapper.queryZhutiInfo();
    }
}
