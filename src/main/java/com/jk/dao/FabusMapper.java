package com.jk.dao;

import com.jk.pojo.Fabus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FabusMapper {


    int addRenWu(Fabus fb);

    long queryFabuTotal(Fabus fb);
    //查询
    List<Fabus> queryFabuByPage(@Param("star") int start, @Param("rows") int rows, @Param("fb") Fabus fb);
}