package com.jk.pojo;

public class UserInfo {
    private Integer id;

    private String userinfoUsername;

    private String userinfoPassword;

    private String userinfoUserimg;

    private String userinfoSignature;

    private Integer userinfoIntegral;/*积分表关联字段*/

    private Integer userinfoLocationid;/*位置表关联字段*/

    private Integer userinfoUsersex;

    private String userinfoBirthday;

    private Integer userinfoLovestatus;

    private String userinfoHometown;

    private Integer userinfoJobid;/*行业表关联字段*/

    private String userinfoEmail;
    private Integer userinfoUserid;/*user表关联字段*/
    /*积分业务字段*/
    private  Integer totalscores;

    private String fullnames;/*昵称*/
    private String names;/*地区名*/
    private String jobnames;/*行业名*/

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserinfoUsername() {
        return userinfoUsername;
    }

    public void setUserinfoUsername(String userinfoUsername) {
        this.userinfoUsername = userinfoUsername == null ? null : userinfoUsername.trim();
    }

    public String getUserinfoPassword() {
        return userinfoPassword;
    }

    public void setUserinfoPassword(String userinfoPassword) {
        this.userinfoPassword = userinfoPassword == null ? null : userinfoPassword.trim();
    }

    public String getUserinfoUserimg() {
        return userinfoUserimg;
    }

    public void setUserinfoUserimg(String userinfoUserimg) {
        this.userinfoUserimg = userinfoUserimg == null ? null : userinfoUserimg.trim();
    }

    public String getUserinfoSignature() {
        return userinfoSignature;
    }

    public void setUserinfoSignature(String userinfoSignature) {
        this.userinfoSignature = userinfoSignature == null ? null : userinfoSignature.trim();
    }

    public Integer getUserinfoIntegral() {
        return userinfoIntegral;
    }

    public void setUserinfoIntegral(Integer userinfoIntegral) {
        this.userinfoIntegral = userinfoIntegral;
    }

    public Integer getUserinfoLocationid() {
        return userinfoLocationid;
    }

    public void setUserinfoLocationid(Integer userinfoLocationid) {
        this.userinfoLocationid = userinfoLocationid;
    }

    public Integer getUserinfoUsersex() {
        return userinfoUsersex;
    }

    public void setUserinfoUsersex(Integer userinfoUsersex) {
        this.userinfoUsersex = userinfoUsersex;
    }

    public String getUserinfoBirthday() {
        return userinfoBirthday;
    }

    public void setUserinfoBirthday(String userinfoBirthday) {
        this.userinfoBirthday = userinfoBirthday == null ? null : userinfoBirthday.trim();
    }

    public Integer getUserinfoLovestatus() {
        return userinfoLovestatus;
    }

    public void setUserinfoLovestatus(Integer userinfoLovestatus) {
        this.userinfoLovestatus = userinfoLovestatus;
    }

    public String getUserinfoHometown() {
        return userinfoHometown;
    }

    public void setUserinfoHometown(String userinfoHometown) {
        this.userinfoHometown = userinfoHometown == null ? null : userinfoHometown.trim();
    }

    public Integer getUserinfoJobid() {
        return userinfoJobid;
    }

    public void setUserinfoJobid(Integer userinfoJobid) {
        this.userinfoJobid = userinfoJobid;
    }

    public String getUserinfoEmail() {
        return userinfoEmail;
    }

    public void setUserinfoEmail(String userinfoEmail) {
        this.userinfoEmail = userinfoEmail == null ? null : userinfoEmail.trim();
    }

    public Integer getTotalscores() {
        return totalscores;
    }

    public void setTotalscores(Integer totalscores) {
        this.totalscores = totalscores;
    }

    public Integer getUserinfoUserid() {
        return userinfoUserid;
    }

    public void setUserinfoUserid(Integer userinfoUserid) {
        this.userinfoUserid = userinfoUserid;
    }

    public String getFullnames() {
        return fullnames;
    }

    public String getNames() {
        return names;
    }

    public String getJobnames() {
        return jobnames;
    }

    public void setFullnames(String fullnames) {
        this.fullnames = fullnames;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public void setJobnames(String jobnames) {
        this.jobnames = jobnames;
    }
}