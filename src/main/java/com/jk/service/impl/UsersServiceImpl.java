package com.jk.service.impl;

import com.jk.dao.UsersMapper;
import com.jk.pojo.Users;
import com.jk.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UsersServiceImpl implements UsersService{
    @Autowired
    private UsersMapper usersMapper;

    @Override//登录
    public String tologin(Users users, HttpSession session) throws Exception {
        List<Users> list=usersMapper.tologin(users);
        if (list.size()>0){
            session.setAttribute("loginUser",list.get(0));
            return "loginYes";
        }else{
           return "loginNo";
        }
    }
}
