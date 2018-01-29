package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Essay;

public interface GeneralizeService {
    JSONObject queryessaygeneralize(int page, int rows, Essay essay);

    int updategeneralize(String essayides, Integer identifying);
}
