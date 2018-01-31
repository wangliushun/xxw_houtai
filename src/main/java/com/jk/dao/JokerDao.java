package com.jk.dao;

import com.jk.pojo.Joker;
import com.jk.pojo.JokerComment;
import com.jk.pojo.ZmenuPoJo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JokerDao {
    List<ZmenuPoJo> queryjokerzmenu();

    long queryTotaljoker(Joker j);

    List<Joker> queryjokerpage(@Param("st") int start, @Param("row") int rows, @Param("jo") Joker j);

    int updatecaizan(@Param("j") Joker j, @Param("flag") Integer flag);

    int deletejoker(Integer id);

    int saveJoker(Joker j);

    Joker queryjokerByJokerId(Integer id);

    int updateJoker(Joker j);

    int savepl(JokerComment jc);

    long queryTotalPl(JokerComment jc);

    List<JokerComment> queryPlpage(@Param("st") int start, @Param("row") int rows, @Param("jc") JokerComment jc);

    int deleteplbyId(Integer id);
}
