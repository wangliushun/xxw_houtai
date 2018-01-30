package com.jk.pojo;

public class Audio {
    private Integer audioid;//

    private String audiotitle;//标题

    private Integer audioanchor;//主播

    private String audiourl;//来源url

    private String audiotime;//发布时间

    private String audioimg;//封面

    private Integer audiozt;//状态

    public Integer getAudioid() {
        return audioid;
    }

    public void setAudioid(Integer audioid) {
        this.audioid = audioid;
    }

    public String getAudiotitle() {
        return audiotitle;
    }

    public void setAudiotitle(String audiotitle) {
        this.audiotitle = audiotitle == null ? null : audiotitle.trim();
    }

    public Integer getAudioanchor() {
        return audioanchor;
    }

    public void setAudioanchor(Integer audioanchor) {
        this.audioanchor = audioanchor;
    }

    public String getAudiourl() {
        return audiourl;
    }

    public void setAudiourl(String audiourl) {
        this.audiourl = audiourl == null ? null : audiourl.trim();
    }

    public String getAudiotime() {
        return audiotime;
    }

    public void setAudiotime(String audiotime) {
        this.audiotime = audiotime == null ? null : audiotime.trim();
    }

    public String getAudioimg() {
        return audioimg;
    }

    public void setAudioimg(String audioimg) {
        this.audioimg = audioimg == null ? null : audioimg.trim();
    }

    public Integer getAudiozt() {
        return audiozt;
    }

    public void setAudiozt(Integer audiozt) {
        this.audiozt = audiozt;
    }
}