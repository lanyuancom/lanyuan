package com.lanyuan.entity;
import java.sql.Date;

@SuppressWarnings("serial")
public class PayMent implements java.io.Serializable{


	/**
	 * 
	 * 主键
	 * 
	 **/

	private int id;
	
	private String orderId;//订单号 
	private String userName;//客户名称 
	private String tradingMoney;//交易金额 
	private String realMoney;//实得金额
	private String channelname;//通道名称
	private String payState;//0 未成功 1 成功 支付状态 
	private Date payTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getTradingMoney() {
		return tradingMoney;
	}

	public void setTradingMoney(String tradingMoney) {
		this.tradingMoney = tradingMoney;
	}

	public String getRealMoney() {
		return realMoney;
	}

	public void setRealMoney(String realMoney) {
		this.realMoney = realMoney;
	}

	public String getChannelname() {
		return channelname;
	}

	public void setChannelname(String channelname) {
		this.channelname = channelname;
	}

	public String getPayState() {
		return payState;
	}

	public void setPayState(String payState) {
		this.payState = payState;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}


}