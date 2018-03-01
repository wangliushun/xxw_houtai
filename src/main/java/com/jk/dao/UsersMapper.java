package com.jk.dao;

import com.jk.pojo.Users;

import java.util.List;

public interface UsersMapper {

    List<Users> tologin(Users users);

    List<Users> loginState(Users users);
}