package com.jk.pojo;

public class Complain {
    private Integer comid;

    private Integer complainuserid;

    private String complaininfo;

    private String complaintime;


    //业务字段
    private String comfullname;
    private String comrepname;

    private String comreplyneirong;
    private String comreplydata;

    private Integer crid;

    public Integer getCrid() {
        return crid;
    }

    public void setCrid(Integer crid) {
        this.crid = crid;
    }

    public String getComreplyneirong() {
        return comreplyneirong;
    }

    public void setComreplyneirong(String comreplyneirong) {
        this.comreplyneirong = comreplyneirong;
    }

    public String getComreplydata() {
        return comreplydata;
    }

    public void setComreplydata(String comreplydata) {
        this.comreplydata = comreplydata;
    }


    public Integer getComid() {
        return comid;
    }

    public void setComid(Integer comid) {
        this.comid = comid;
    }

    public Integer getComplainuserid() {
        return complainuserid;
    }

    public void setComplainuserid(Integer complainuserid) {
        this.complainuserid = complainuserid;
    }

    public String getComplaininfo() {
        return complaininfo;
    }

    public void setComplaininfo(String complaininfo) {
        this.complaininfo = complaininfo == null ? null : complaininfo.trim();
    }

    public String getComplaintime() {
        return complaintime;
    }

    public void setComplaintime(String complaintime) {
        this.complaintime = complaintime == null ? null : complaintime.trim();
    }

    public String getComfullname() {
        return comfullname;
    }

    public void setComfullname(String comfullname) {
        this.comfullname = comfullname;
    }

    public String getComrepname() {
        return comrepname;
    }

    public void setComrepname(String comrepname) {
        this.comrepname = comrepname;
    }
}