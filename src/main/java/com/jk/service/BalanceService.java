package com.jk.service;

import com.jk.pojo.Banlances;

import java.util.Map;

public interface BalanceService {
    Map<String,Object> querybanlance(int page, int rows);

    int updateStas(Banlances bl);
}
