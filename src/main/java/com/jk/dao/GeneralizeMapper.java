package com.jk.dao;

import com.jk.pojo.Essay;
import com.jk.pojo.EssayTitle;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GeneralizeMapper {
    long queryTotals(Essay essay);

    List<Essay> queryspage(@Param("start") int start, @Param("end") int end, @Param("essay") Essay essay);


    int updategeneralize(@Param("essayides") Integer essayides, @Param("identifying") Integer identifying);
}
