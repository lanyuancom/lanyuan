package com.lanyuan.entity;
@SuppressWarnings("serial")
public class QunMessages  implements java.io.Serializable{
	private String name;//名称
	private String qq;//qq号
	private String mark;//描述
	private String count;//发表次数
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
}
