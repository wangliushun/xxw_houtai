package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserService {
    List<MenuTree> queryMenu(int pid);

    List<ZmenuPoJo> queryzmenu();

    JSONObject queryTopicByMenuId(int page, int rows, Topic topic, HttpSession session);

    int deletetopic(Integer id);

    int saveTopic(Topic topic);

    Topic queryTopicById(Integer id);

    int updateTopic(Topic topic);

    List<PicGroup> querytgById(Integer picgroupmenuid);

    JSONObject queryPicGroup(int page, int rows, PicGroup pg);

    List<Topic> queryTop(Integer topictypeid);

    int updatePicGroupfm(PicGroup pg);

    int updatezanById(Integer id);

    PicGroup querytgByTopId(Integer picgroupmenuid);

    int updatePicZufm(PicGroup pg);

    int savetoppl(TopicComment tc);

    JSONObject queryTopPlByTopId(int page, int rows, TopicComment tc);

    int deletetopplbyId(Integer id);
}
