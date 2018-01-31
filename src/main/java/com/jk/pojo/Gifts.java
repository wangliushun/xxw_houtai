package com.jk.pojo;

public class Gifts {
    private Integer id;

    private String giftname;

    private Integer giftjifen;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGiftname() {
        return giftname;
    }

    public void setGiftname(String giftname) {
        this.giftname = giftname == null ? null : giftname.trim();
    }

    public Integer getGiftjifen() {
        return giftjifen;
    }

    public void setGiftjifen(Integer giftjifen) {
        this.giftjifen = giftjifen;
    }
}