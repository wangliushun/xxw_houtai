package com.jk.service;

import com.jk.pojo.Users;

import javax.servlet.http.HttpSession;

public interface UsersService {
    String tologin(Users users, HttpSession session) throws Exception;
}
