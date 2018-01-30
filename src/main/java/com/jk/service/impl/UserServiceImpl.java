package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.UserDao;
import com.jk.pojo.*;
import com.jk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;


    @Override
    public List<MenuTree> queryMenu(int pid) {
        List<MenuTree>menus=userDao.queryMenuById(pid);
        if(menus != null && menus.size()>0){
            for (int i = 0; i < menus.size(); i++) {
                List<MenuTree> menu2 = queryMenu(menus.get(i).getId());
                menus.get(i).setNodes(menu2);
            }
        }
        return menus;
    }

    @Override
    public List<ZmenuPoJo> queryzmenu() {
        return userDao.queryzmenu();
    }

    @Override
    public JSONObject queryTopicByMenuId(int page, int rows, Topic topic, HttpSession session) {
        //总条数
        long totalCount = userDao.queryTotaltop(topic);
        //当前页数据————————oracle分页   关键字 rownum    两个参数：起始位置、结束位置
        //起始位置 =（当前页-1）*每页条数
        int start = (page-1)*rows;
        //查询当前页数据
        List<Topic> pg = userDao.querytoppage(start,rows,topic);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows", pg);
        return json;
    }

    @Override
    public int deletetopic(Integer id) {
        return userDao.deletetopic(id);
    }

    @Override
    public int saveTopic(Topic topic) {
        return userDao.saveTopic(topic);
    }

    @Override
    public Topic queryTopicById(Integer id) {
        return userDao.queryTopicById(id);
    }

    @Override
    public int updateTopic(Topic topic) {
        return userDao.updateTopic(topic);
    }

    @Override
    public List<PicGroup> querytgById(Integer picgroupmenuid) {
        return userDao.querytgById(picgroupmenuid);
    }

    @Override
    public JSONObject queryPicGroup(int page, int rows, PicGroup pg) {
        //总条数
        long totalCount = userDao.queryTotalPicGroup(pg);
        //当前页数据————————oracle分页   关键字 rownum    两个参数：起始位置、结束位置
        //起始位置 =（当前页-1）*每页条数
        int start = (page-1)*rows;
        //查询当前页数据
        List<PicGroup> plist = userDao.queryPicGrouppage(start,rows,pg);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows", plist);
        return json;
    }

    @Override
    public List<Topic> queryTop(Integer topictypeid) {
        return userDao.queryTop(topictypeid);
    }

    @Override
    public int updatePicGroupfm(PicGroup pg) {
        return userDao.updatePicGroupfm(pg);
    }

    @Override
    public int updatezanById(Integer id) {
        return userDao.updatezanById(id);
    }

    @Override
    public PicGroup querytgByTopId(Integer picgroupmenuid) {
        return userDao.querytgByTopId(picgroupmenuid);
    }

    @Override
    public int updatePicZufm(PicGroup pg) {
        return userDao.updatePicZufm(pg);
    }

    @Override
    public int savetoppl(TopicComment tc) {
        return userDao.savetoppl(tc);
    }

    @Override
    public JSONObject queryTopPlByTopId(int page, int rows, TopicComment tc) {
        //总条数
        long totalCount = userDao.queryTotaltopPl(tc);
        //当前页数据————————oracle分页   关键字 rownum    两个参数：起始位置、结束位置
        //起始位置 =（当前页-1）*每页条数
        int start = (page-1)*rows;
        //查询当前页数据
        List<TopicComment> jo = userDao.querytopPlpage(start,rows,tc);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows",jo );
        return json;
    }

    @Override
    public int deletetopplbyId(Integer id) {
        return userDao.deletetopplbyId(id);
    }


}
