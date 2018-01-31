package com.jk.pojo;

public class Joker {
	//笑话表
	//表名:xxw_joker
	private Integer id;//笑话id(主键)
	private String title;//笑话标题
	private String uptimes;//笑话发布时间
	private String content;//笑话内容
	private Integer typesid;//笑话类型
	private String  publisher;//发布人
	private Integer cai;//踩
	private Integer zan;//赞

	private Integer jokershzt;//审核状态
	//业务字段
	private String fbrname;//发布人名称

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUptimes() {
		return uptimes;
	}

	public void setUptimes(String uptimes) {
		this.uptimes = uptimes;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getTypesid() {
		return typesid;
	}

	public void setTypesid(Integer typesid) {
		this.typesid = typesid;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Integer getCai() {
		return cai;
	}

	public void setCai(Integer cai) {
		this.cai = cai;
	}

	public Integer getZan() {
		return zan;
	}

	public void setZan(Integer zan) {
		this.zan = zan;
	}

	public String getFbrname() {
		return fbrname;
	}

	public void setFbrname(String fbrname) {
		this.fbrname = fbrname;
	}

	public Integer getJokershzt() {
		return jokershzt;
	}

	public void setJokershzt(Integer jokershzt) {
		this.jokershzt = jokershzt;
	}



}
