package com.jk.pojo;

public class Users {
    private Integer id;

    private String fullname;

    private String username;

    private String password;
    /*业务字段*/
    private Integer balances;
    private Integer money_stas;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname == null ? null : fullname.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getBalances() {
        return balances;
    }

    public Integer getMoney_stas() {
        return money_stas;
    }

    public void setBalances(Integer balances) {
        this.balances = balances;
    }

    public void setMoney_stas(Integer money_stas) {
        this.money_stas = money_stas;
    }
}