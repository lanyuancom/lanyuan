package com.lanyuan.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 费率实体
 * @author lanyuan
 * @date 2014-1-1
 * @Email: mmm333zzz520@163.com
 * @version 1.0v
 */
public class Rates implements Serializable{

	/**
	 * @author lanyuan
	 * @date 2014-1-1
	 * @Email: mmm333zzz520@163.com
	 * @version 1.0v
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String userName;
	private String tradingRates;//交易费率 
	private String channelname;
	private String settlementCosts;
	private String holidayCosts;//节假日结算
	private String settlementCaps;
	private String mark;
	private Date updateTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTradingRates() {
		return tradingRates;
	}
	public void setTradingRates(String tradingRates) {
		this.tradingRates = tradingRates;
	}
	public String getChannelname() {
		return channelname;
	}
	public void setChannelname(String channelname) {
		this.channelname = channelname;
	}
	public String getSettlementCosts() {
		return settlementCosts;
	}
	public void setSettlementCosts(String settlementCosts) {
		this.settlementCosts = settlementCosts;
	}
	public String getSettlementCaps() {
		return settlementCaps;
	}
	public void setSettlementCaps(String settlementCaps) {
		this.settlementCaps = settlementCaps;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getHolidayCosts() {
		return holidayCosts;
	}
	public void setHolidayCosts(String holidayCosts) {
		this.holidayCosts = holidayCosts;
	}

}
