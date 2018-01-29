package com.jk.service;

import java.util.Map;

public interface UserInfoService {
    Map<String,Object> queryUsers(int page, int rows);
}
