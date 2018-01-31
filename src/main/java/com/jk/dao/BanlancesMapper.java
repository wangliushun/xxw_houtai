package com.jk.dao;

import com.jk.pojo.Banlances;
import com.jk.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BanlancesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Banlances record);

    int insertSelective(Banlances record);

    Banlances selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Banlances record);

    int updateByPrimaryKey(Banlances record);

    long queryusCount();

    List<Users> querybanlancePage(@Param("str") int start,@Param("en") int end);

    int updateStas(Banlances bl);

    int updatebanlances(Banlances bl);


    List<Users> toupdatebanlances();


    int plusbanlances(@Param("balance")Integer balance,@Param("userids") Integer userids);
}