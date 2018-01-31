package com.jk.service;

import com.jk.pojo.Users;
import com.jk.pojo.ZmenuPoJo;

import java.util.List;

public interface ManagerService {

    List<Users> queryUserInfo();

    List<ZmenuPoJo> queryZhutiInfo();
}
