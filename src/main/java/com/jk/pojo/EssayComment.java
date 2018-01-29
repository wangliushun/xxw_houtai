package com.jk.pojo;

public class EssayComment {
	//12征文表下的评论表
	//表名:xxw_essay_comment
	private Integer id;//征文表下的评论id(主键)
	private Integer userid;//评论人id
	private String commentcontent;//评论内容
	private String commenttime;//评论时间
	private Integer essayides;//征文id
	//业务字段
	private String commentname;//评论人姓名
	private String essayname;//文章名称
	
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
	public String getCommentcontent() {
		return commentcontent;
	}
	public void setCommentcontent(String commentcontent) {
		this.commentcontent = commentcontent;
	}
	public String getCommenttime() {
		return commenttime;
	}
	public void setCommenttime(String commenttime) {
		this.commenttime = commenttime;
	}

	public Integer getEssayides() {
		return essayides;
	}

	public void setEssayides(Integer essayides) {
		this.essayides = essayides;
	}

	public String getCommentname() {
		return commentname;
	}

	public void setCommentname(String commentname) {
		this.commentname = commentname;
	}

	public String getEssayname() {
		return essayname;
	}

	public void setEssayname(String essayname) {
		this.essayname = essayname;
	}
}
