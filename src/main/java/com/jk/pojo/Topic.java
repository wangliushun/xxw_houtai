package com.jk.pojo;

public class Topic {
    private Integer id;//主键
    private String topicnr;//话题内容
    private Integer topiczancount;//话题点赞数
    private String picurl;//图片
    private Integer topictypeid;//菜单id(关联菜单表zmenu中id)
    private String uptime;//上传时间
    private Integer userid;//上传人id(关联管理员)
    private Integer topicshzt;//审核状态

    //业务字段
    private String upusername;//上传人(关联管理员)


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getTopicnr() {
        return topicnr;
    }

    public void setTopicnr(String topicnr) {
        this.topicnr = topicnr;
    }

    public Integer getTopiczancount() {
        return topiczancount;
    }

    public void setTopiczancount(Integer topiczancount) {
        this.topiczancount = topiczancount;
    }

    public String getPicurl() {
        return picurl;
    }

    public void setPicurl(String picurl) {
        this.picurl = picurl;
    }

    public Integer getTopictypeid() {
        return topictypeid;
    }

    public void setTopictypeid(Integer topictypeid) {
        this.topictypeid = topictypeid;
    }

    public String getUptime() {
        return uptime;
    }

    public void setUptime(String uptime) {
        this.uptime = uptime;
    }

    public String getUpusername() {
        return upusername;
    }

    public void setUpusername(String upusername) {
        this.upusername = upusername;
    }

    public Integer getTopicshzt() {
        return topicshzt;
    }

    public void setTopicshzt(Integer topicshzt) {
        this.topicshzt = topicshzt;
    }
}
