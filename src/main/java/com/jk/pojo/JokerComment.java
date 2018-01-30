package com.jk.pojo;

public class JokerComment {
    //笑话评论表
    //表名:xxw_jokercomment
    private Integer id;//笑话评论id(主键)
    private Integer jokerid;//笑话id
    private String content;//笑话评论内容
    private String username;//笑话评论人名称
    private String pltime;//笑话评论时间
    private Integer plstate;//笑话评论状态(1匿名,2正常)

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getJokerid() {
        return jokerid;
    }

    public void setJokerid(Integer jokerid) {
        this.jokerid = jokerid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPltime() {
        return pltime;
    }

    public void setPltime(String pltime) {
        this.pltime = pltime;
    }

    public Integer getPlstate() {
        return plstate;
    }

    public void setPlstate(Integer plstate) {
        this.plstate = plstate;
    }
}
