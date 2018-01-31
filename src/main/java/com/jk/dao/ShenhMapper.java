package com.jk.dao;

import com.jk.pojo.Audio;
import com.jk.pojo.Essay;
import com.jk.pojo.Joker;
import com.jk.pojo.Topic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShenhMapper {
    //查询文章总条数
    long queryEssayTotal(Essay ess);
    //查询文章每页信息
    List<Essay> queryShenEssayByPage(@Param("st") int start, @Param("ro") int rows, @Param("es") Essay ess);
    //跳转到审核页面，并回显
    Essay queryShenEssay(Integer essayid);
    //审核文章
    int updateShEssayzt(Essay ess);
    //查询图片审核总条数
    long queryTopicTotal(Topic topic);
    //查询图片审核每页信息
    List<Topic> queryShenTopicByPage(@Param("sta")int start, @Param("row")int rows, @Param("topic")Topic topic);
    //跳转审核话题页面并回显
    Topic queryShTopiczt(@Param("topicids") Integer topicids);
    //话题审核
    int updateShTopiczt(@Param("topicidss")Integer topicids, @Param("topic")Topic topic);

    //查询音频审核总条数
    long queryAudioTotal(Audio audio);
    //查询音频审核每页信息
    List<Audio> queryShenAudioByPage(@Param("start")int start, @Param("rows")int rows, @Param("audio")Audio audio);
    ////跳转审核页面回显音频信息
    Audio queryShAudioz(Integer audioid);
    //提交音频审核
    int updateShAudiozt(Audio audio);
    //查询娱乐话题审核总条数
    long queryJokerTotal(Joker joker);
    //娱乐话题审核每页信息
    List<Joker> queryShenJokerByPage(@Param("starts")int start, @Param("rowss")int rows, @Param("joker")Joker joker);
    ////跳转娱乐话题页面回显音频信息
    Joker queryJokerzt(Integer jokids);
    //审核娱乐话题
    int updateShJokerzt(@Param("jokidss") Integer jokids, @Param("joker") Joker joker);

    Essay showwzxq(Integer essayid);
    //修改文章积分
    int updatejf(Integer userid);
}
