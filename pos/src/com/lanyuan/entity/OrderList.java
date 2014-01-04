package com.lanyuan.entity;

import java.io.Serializable;

public class OrderList implements Serializable {

	private static final long serialVersionUID = 1L;

	private String orderId;

	private int userId;
	
	private String userName;

	private int productId;
	
	private String productName;
	
	private float price;

	private int productNum;

	private float productSumPrice;

	private String userAddress;

	private String userPhone;

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

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public float getProductSumPrice() {
		return productSumPrice;
	}

	public void setProductSumPrice(float productSumPrice) {
		this.productSumPrice = productSumPrice;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}