package com.lanyuan.entity;
import java.sql.Date;

@SuppressWarnings("serial")
public class Pay implements java.io.Serializable{


	/**
	 * 
	 * 主键
	 * 
	 **/

	private int id;
	
	private String userName;

	private String bankName;

	private String openBankName;

	private String bankAccount;
	
	private String payMoney;//申请结算的费用－手续费
	
	private String settlementCosts;//手续费
	
	private String costsMoney;//申请结算的费用

	private String payState;//0 表示未结算 1 表示已经结算

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

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getOpenBankName() {
		return openBankName;
	}

	public void setOpenBankName(String openBankName) {
		this.openBankName = openBankName;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	public String getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(String payMoney) {
		this.payMoney = payMoney;
	}

	public String getPayState() {
		return payState;
	}

	public void setPayState(String payState) {
		this.payState = payState;
	}

	public String getSettlementCosts() {
		return settlementCosts;
	}

	public void setSettlementCosts(String settlementCosts) {
		this.settlementCosts = settlementCosts;
	}

	public String getCostsMoney() {
		return costsMoney;
	}

	public void setCostsMoney(String costsMoney) {
		this.costsMoney = costsMoney;
	}

}