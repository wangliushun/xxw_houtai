package com.jk.dao;

import com.jk.pojo.Users;
import com.jk.pojo.ZmenuPoJo;

import java.util.List;

public interface ManagerMapper {

    List<Users> queryUserInfo();

    List<ZmenuPoJo> queryZhutiInfo();
}
