package com.jk.pojo;

public class Reply {
    private Integer replyid;

    private Integer replyuserid;

    private String replyneirong;

    private String replydata;

    private Integer comrepid;

    public Integer getComrepid() {
        return comrepid;
    }

    public void setComrepid(Integer comrepid) {
        this.comrepid = comrepid;
    }

    public Integer getReplyid() {
        return replyid;
    }

    public void setReplyid(Integer replyid) {
        this.replyid = replyid;
    }

    public Integer getReplyuserid() {
        return replyuserid;
    }

    public void setReplyuserid(Integer replyuserid) {
        this.replyuserid = replyuserid;
    }

    public String getReplyneirong() {
        return replyneirong;
    }

    public void setReplyneirong(String replyneirong) {
        this.replyneirong = replyneirong == null ? null : replyneirong.trim();
    }

    public String getReplydata() {
        return replydata;
    }

    public void setReplydata(String replydata) {
        this.replydata = replydata == null ? null : replydata.trim();
    }
}