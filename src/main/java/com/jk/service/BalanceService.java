package com.jk.service;

import com.jk.pojo.Banlances;
import com.jk.pojo.Users;

import java.util.List;
import java.util.Map;

public interface BalanceService {
    Map<String,Object> querybanlance(int page, int rows);

    int updateStas(Banlances bl);

    int updatebanlances(Banlances bl,Integer userids);


    List<Users> toupdatebanlances();


}
