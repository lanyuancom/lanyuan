package com.lanyuan.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 文章管理实体类
 * @author Dylan
 *
 */
@SuppressWarnings("serial")
public class Article implements java.io.Serializable {
	private int articleId;
	private int userId;
	private String userName;
	private String title;
	private String content;
	private Date publishTime;
	public Article(){}
	
	public Article(int articleId,int userId,String title,String content,Timestamp publishTime,String userName){
		this.articleId = articleId;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.publishTime = publishTime;
		this.userName = userName;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	

}
