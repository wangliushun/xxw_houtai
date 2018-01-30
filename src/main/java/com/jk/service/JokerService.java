package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Joker;
import com.jk.pojo.JokerComment;
import com.jk.pojo.ZmenuPoJo;

import java.util.List;

public interface JokerService {
    List<ZmenuPoJo> queryjokerzmenu();

    JSONObject queryJokerByMenuId(int page, int rows, Joker j);

    int updatecaizan(Joker j, Integer flag);

    int deletejoker(Integer id);

    int saveJoker(Joker j);

    Joker queryjokerByJokerId(Integer id);

    int updateJoker(Joker j);

    int savepl(JokerComment jc);

    JSONObject queryPlByJokerId(int page, int rows, JokerComment jc);

    int deleteplbyId(Integer id);
}
