package com.jk.dao;

import com.jk.pojo.Gifts;
import com.jk.pojo.UserInfo;
import com.jk.pojo.UserJifenInfo;
import com.jk.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserJifenInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserJifenInfo record);

    int insertSelective(UserJifenInfo record);

    UserJifenInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserJifenInfo record);

    int updateByPrimaryKey(UserJifenInfo record);


    List<Gifts> querygift();

    long querygiftCount();

    List<Gifts> querygiftPage(@Param("str")int start,@Param("end") int end);

    UserJifenInfo queryJifenInfo(Integer id);


    int updatejifen(@Param("jifen")Integer jifens, @Param("ids")Integer userids);
}