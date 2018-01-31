package com.jk.pojo;

public class Fabus {
    private Integer publishid;

    private String acceptid;

    private String rwtype;

    private Integer acceptzt;

    private Integer finishzt;

    private Integer shzts;

    private String text;
    private String username;

    public Integer getPublishid() {
        return publishid;
    }

    public void setPublishid(Integer publishid) {
        this.publishid = publishid;
    }

    public String getAcceptid() {
        return acceptid;
    }

    public void setAcceptid(String acceptid) {
        this.acceptid = acceptid;
    }

    public String getRwtype() {
        return rwtype;
    }

    public void setRwtype(String rwtype) {
        this.rwtype = rwtype == null ? null : rwtype.trim();
    }

    public Integer getAcceptzt() {
        return acceptzt;
    }

    public void setAcceptzt(Integer acceptzt) {
        this.acceptzt = acceptzt;
    }

    public Integer getFinishzt() {
        return finishzt;
    }

    public void setFinishzt(Integer finishzt) {
        this.finishzt = finishzt;
    }

    public Integer getShzts() {
        return shzts;
    }

    public void setShzts(Integer shzts) {
        this.shzts = shzts;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}