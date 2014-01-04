package com.lanyuan.entity;

import java.util.Date;

public class OrderManager {

	private String orderId;

	private int userId;

	private String userName;
	
	private float orderSunPrice;

	private Date orderTime;

	private String orderState;

	private String timeState;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public float getOrderSunPrice() {
		return orderSunPrice;
	}

	public void setOrderSunPrice(float orderSunPrice) {
		this.orderSunPrice = orderSunPrice;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public String getTimeState() {
		return timeState;
	}

	public void setTimeState(String timeState) {
		this.timeState = timeState;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}