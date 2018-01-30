package com.jk.dao;

import com.jk.pojo.Essay;
import com.jk.pojo.EssayComment;
import com.jk.pojo.EssayTitle;
import com.jk.pojo.Essayimg;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EssayMapper {

    long queryTotals(EssayTitle essaytitle);

    List<EssayTitle> queryspage(@Param("start") int start, @Param("end") int end, @Param("essaytitle") EssayTitle essaytitle);


    int addessay(Essay essay);

    List<Essayimg> queryeassyimg();

    long queryEssayTotals(Essay essay);

    List<EssayTitle> queryEssaypage(@Param("start") int start, @Param("end") int end, @Param("essay") Essay essay);

    int updatevotes(Essay essay);

    int addeassytitle(EssayTitle essayTitle);

    long queryEssayCommentTotals(@Param("essayComment") EssayComment essayComment, @Param("essayides") Integer essayides);

    List<EssayTitle> queryEssayCommentpage(@Param("start") int start, @Param("end") int end, @Param("essayComment") EssayComment essayComment, @Param("essayides") Integer essayides);

    int addEssayComment(EssayComment essayComment);

    int addessayimg(Essay essay);
}
