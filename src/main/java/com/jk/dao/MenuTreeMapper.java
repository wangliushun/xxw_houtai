package com.jk.dao;

import com.jk.pojo.MenuTree;
import com.jk.pojo.PicGroup;
import com.jk.pojo.Topic;
import com.jk.pojo.ZmenuPoJo;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface MenuTreeMapper {

    List<MenuTree> queryMenusByPid(int pid);

    List<PicGroup> syqtsj();

    List<ZmenuPoJo> syqtsjbt();

    List<Topic> qtqbtp();
}