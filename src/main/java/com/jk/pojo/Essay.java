package com.jk.pojo;

public class Essay {

    //11文章表
    //表名:xxw_essay
    private Integer essayid;//文章id(主键)
    private Integer essaytitleid;//征文标题ID
    private String essaytitlename;//征文标题名称
    private String userfullname;//用户昵称
    private Integer userid;//提交人id
    private String essayname;//文章标题
    private String essaycontent;//文章内容
    private String essaystarttime;//提交时间
    private String essayimg;//文章封面
    private Integer votes;//投票数
    private Integer essayzt;//审核状态
    private Integer generalize;//是否推广 0,不推广,1推广


    public Integer getEssayid() {
        return essayid;
    }

    public void setEssayid(Integer essayid) {
        this.essayid = essayid;
    }

    public Integer getEssaytitleid() {
        return essaytitleid;
    }

    public void setEssaytitleid(Integer essaytitleid) {
        this.essaytitleid = essaytitleid;
    }

    public String getEssaytitlename() {
        return essaytitlename;
    }

    public void setEssaytitlename(String essaytitlename) {
        this.essaytitlename = essaytitlename;
    }

    public String getUserfullname() {
        return userfullname;
    }

    public void setUserfullname(String userfullname) {
        this.userfullname = userfullname;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getEssayname() {
        return essayname;
    }

    public void setEssayname(String essayname) {
        this.essayname = essayname;
    }

    public String getEssaycontent() {
        return essaycontent;
    }

    public void setEssaycontent(String essaycontent) {
        this.essaycontent = essaycontent;
    }

    public String getEssaystarttime() {
        return essaystarttime;
    }

    public void setEssaystarttime(String essaystarttime) {
        this.essaystarttime = essaystarttime;
    }

    public String getEssayimg() {
        return essayimg;
    }

    public void setEssayimg(String essayimg) {
        this.essayimg = essayimg;
    }

    public Integer getVotes() {
        return votes;
    }

    public void setVotes(Integer votes) {
        this.votes = votes;
    }

    public Integer getEssayzt() {
        return essayzt;
    }

    public void setEssayzt(Integer essayzt) {
        this.essayzt = essayzt;
    }

    public Integer getGeneralize() {
        return generalize;
    }

    public void setGeneralize(Integer generalize) {
        this.generalize = generalize;
    }
}
