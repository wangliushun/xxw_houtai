package com.jk.pojo;

public class PicGroup {
    private Integer id;//主键
    private String typename;//类型名称
    private String fmimgurl;//封面路径
    private Integer  picgroupmenuid;//图片组表菜单id

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getFmimgurl() {
        return fmimgurl;
    }

    public void setFmimgurl(String fmimgurl) {
        this.fmimgurl = fmimgurl;
    }

    public Integer getPicgroupmenuid() {
        return picgroupmenuid;
    }

    public void setPicgroupmenuid(Integer picgroupmenuid) {
        this.picgroupmenuid = picgroupmenuid;
    }
}
