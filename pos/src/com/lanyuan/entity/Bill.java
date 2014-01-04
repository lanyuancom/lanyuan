package com.lanyuan.entity;
import java.sql.Date;

@SuppressWarnings("serial")
public class Bill implements java.io.Serializable{


	/**
	 * 
	 * 主键
	 * 
	 **/

	private int id;

	private String channelname;

	private String tradeType;
	
	private String tradeMoney;

	private String transaction;

	private String conveyancing;

	private String accountBalance;
	
	private Date tradeTime;

	public void setId(int id) {
		this.id = id;
	}

	public String getChannelname() {
		return channelname;
	}

	public void setChannelname(String channelname) {
		this.channelname = channelname;
	}


	public String getTransaction() {
		return transaction;
	}

	public void setTransaction(String transaction) {
		this.transaction = transaction;
	}

	public String getConveyancing() {
		return conveyancing;
	}

	public void setConveyancing(String conveyancing) {
		this.conveyancing = conveyancing;
	}

	public String getTradeMoney() {
		return tradeMoney;
	}

	public void setTradeMoney(String tradeMoney) {
		this.tradeMoney = tradeMoney;
	}

	public String getAccountBalance() {
		return accountBalance;
	}

	public void setAccountBalance(String accountBalance) {
		this.accountBalance = accountBalance;
	}

	public int getId() {
		return id;
	}

	public String getTradeType() {
		return tradeType;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}

	public Date getTradeTime() {
		return tradeTime;
	}

	public void setTradeTime(Date tradeTime) {
		this.tradeTime = tradeTime;
	}

}