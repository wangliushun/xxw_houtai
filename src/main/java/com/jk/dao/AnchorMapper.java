package com.jk.dao;

import com.jk.pojo.Anchor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnchorMapper {

//查询总条数


    long queryAnchorTotal(Anchor anc);
//查询主播信息
    List<Anchor> queryAnchorByPage(@Param("star") int start, @Param("rows") int rows, @Param("ancs") Anchor anc);
//删除
    int deleteAnchor(Anchor anc);
//查询要修改的对象用于回显
    Anchor queryAnchorById(Integer anc);
//修改主播信息
    int updateAnchor(Anchor anc);
//查询选中的主播信息
    Anchor plQueryAnchor(Integer m);
    //批量修改密码
    int updatePlAnchor(@Param("m") Integer m,@Param("p") String p);
    //新增主播
    int addAnchor(Anchor anc);
}