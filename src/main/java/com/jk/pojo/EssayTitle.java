package com.jk.pojo;

public class EssayTitle {
    //征文标题表
    //表名:xxw_essaytitle
    private Integer id;//征文标题表ID
    private String essaytitlename;//征文标题表名称
    private String endtime;//投稿结束日期

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEssaytitlename() {
        return essaytitlename;
    }

    public void setEssaytitlename(String essaytitlename) {
        this.essaytitlename = essaytitlename;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }
}
