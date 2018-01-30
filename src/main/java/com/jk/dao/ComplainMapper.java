package com.jk.dao;

import com.jk.pojo.Complain;
import com.jk.pojo.Reply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComplainMapper {
    long queryStutol();

    List<Complain> querySer(@Param("start") int start, @Param("rows") int rows);

    int addcomplain(Complain complain);

    int deleteCom(Integer comid);

    long queryRay();

    List<Complain> queryRaysty(@Param("start") int start, @Param("rows") int rows, @Param("com") Complain complain);

    List<Complain> queryRa(Complain complain);

    int deletevor(Integer comid);

    int addResi(@Param("reply") Reply reply, @Param("redit") int redit);
}
