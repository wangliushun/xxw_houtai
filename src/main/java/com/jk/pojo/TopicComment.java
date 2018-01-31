package com.jk.pojo;

public class TopicComment {
    //话题评论表
    //表名:xxw_topiccomment
    private Integer id;//话题评论id(主键)
    private Integer topicid;//话题id
    private String topcontent;//话题评论内容
    private String topusername;//话题评论人名称
    private String toppltime;//话题评论时间
    private Integer topplstate;//话题评论状态(1匿名,2正常)

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTopicid() {
        return topicid;
    }

    public void setTopicid(Integer topicid) {
        this.topicid = topicid;
    }

    public String getTopcontent() {
        return topcontent;
    }

    public void setTopcontent(String topcontent) {
        this.topcontent = topcontent;
    }

    public String getTopusername() {
        return topusername;
    }

    public void setTopusername(String topusername) {
        this.topusername = topusername;
    }

    public String getToppltime() {
        return toppltime;
    }

    public void setToppltime(String toppltime) {
        this.toppltime = toppltime;
    }

    public Integer getTopplstate() {
        return topplstate;
    }

    public void setTopplstate(Integer topplstate) {
        this.topplstate = topplstate;
    }
}
