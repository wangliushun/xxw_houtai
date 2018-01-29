package com.jk.dao;

import com.jk.pojo.ZmenuPoJo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ZmenuPoJoMapper {
    long queryTotal();

    List<ZmenuPoJo> queryZmenu(@Param("st") int start, @Param("ro")int rows);

    int addZmenu(ZmenuPoJo zmenuPoJo);

    ZmenuPoJo toupZmenu(int id);

    int updateZmenu(ZmenuPoJo zmenuPoJo);

    int deleteZmenu(int id);
}