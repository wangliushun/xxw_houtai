package com.jk.dao;

import com.jk.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    List<MenuTree> queryMenuById(int pid);

    List<ZmenuPoJo> queryzmenu();

    long queryTotaltop(Topic topic);

    List<Topic> querytoppage(@Param("st") int start, @Param("row") int rows, @Param("top") Topic topic);

    int deletetopic(Integer id);

    int saveTopic(Topic topic);

    Topic queryTopicById(Integer id);

    int updateTopic(Topic topic);

    List<PicGroup> querytgById(Integer picgroupmenuid);

    long queryTotalPicGroup(PicGroup pg);

    List<PicGroup> queryPicGrouppage(@Param("st") int start, @Param("row") int rows, @Param("pg") PicGroup pg);

    List<Topic> queryTop(Integer topictypeid);

    int updatePicGroupfm(PicGroup pg);

    int updatezanById(Integer id);

    PicGroup querytgByTopId(Integer picgroupmenuid);

    int updatePicZufm(PicGroup pg);

    int savetoppl(TopicComment tc);

    long queryTotaltopPl(TopicComment tc);

    List<TopicComment> querytopPlpage(@Param("st") int start, @Param("row") int rows, @Param("t") TopicComment tc);

    int deletetopplbyId(Integer id);
}
