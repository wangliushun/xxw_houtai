package com.jk.service;

import com.jk.pojo.Gifts;
import com.jk.pojo.UserJifenInfo;
import com.jk.pojo.Users;

import java.util.List;
import java.util.Map;

public interface UserJifenInfoService {
    UserJifenInfo queryJifenInfo(Integer id);


    Map<String,Object> querygift(int page, int rows);


    int updatejifen(Integer jifens, Integer userids);
}
