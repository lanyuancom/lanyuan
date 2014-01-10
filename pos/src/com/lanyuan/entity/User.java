package com.lanyuan.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * 用户实体表
 */
@SuppressWarnings("serial")
public class User implements java.io.Serializable {
	private int userId;

	private String userName;

	private String roleName;

	private String userPassword;

	private String userNickname;

	private String userRealname;

	private Integer userAge;

	private String userSex;

	private String userAddress;

	private String userPhone;

	private String userMail;

	private String userQQ;
	
	private String userIdCard;//身份证

	private Timestamp regTime;

	private Timestamp lastLogintime;

	private Integer level;
	
	private String province;

	private String city;

	private String bankName;

	private String branchBank;

	private String subbranchBank;

	private String openBankName;

	private String bankAccountName;

	private String bankAccount;

	private String accountType;

	private String pay;

	private String mark;

	private String status;

	private String parentNumber;
	
	private String ratesId;
	
	private String channelname;
	
   private String payMoney;//申请结算的费用－手续费
	
	
	private String workCosts;//上班时间结算费用
	
	private String afterWorkCosts;//其他时间结算费用
	
	private String tradingRates;//交易费率 
	
	private String settlementCaps;//结算上限
	
	private String amountMoney;//账号余额
	// 一个集合roles，初始容量为0
	private Set<Roles> roles = new HashSet<Roles>(0);

	public User() {
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public User(String userName, String userPassword) {
		this.userName = userName;
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserRealname() {
		return userRealname;
	}

	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}

	public Integer getUserAge() {
		return userAge;
	}

	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
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

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public String getUserQQ() {
		return userQQ;
	}

	public void setUserQQ(String userQQ) {
		this.userQQ = userQQ;
	}

	public Timestamp getRegTime() {
		return regTime;
	}

	public void setRegTime(Timestamp regTime) {
		this.regTime = regTime;
	}

	public Timestamp getLastLogintime() {
		return lastLogintime;
	}

	public void setLastLogintime(Timestamp lastLogintime) {
		this.lastLogintime = lastLogintime;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Set<Roles> getRoles() {
		return roles;
	}

	public void setRoles(Set<Roles> roles) {
		this.roles = roles;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBranchBank() {
		return branchBank;
	}

	public void setBranchBank(String branchBank) {
		this.branchBank = branchBank;
	}

	public String getSubbranchBank() {
		return subbranchBank;
	}

	public void setSubbranchBank(String subbranchBank) {
		this.subbranchBank = subbranchBank;
	}

	public String getOpenBankName() {
		return openBankName;
	}

	public void setOpenBankName(String openBankName) {
		this.openBankName = openBankName;
	}

	public String getBankAccountName() {
		return bankAccountName;
	}

	public void setBankAccountName(String bankAccountName) {
		this.bankAccountName = bankAccountName;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getParentNumber() {
		return parentNumber;
	}

	public void setParentNumber(String parentNumber) {
		this.parentNumber = parentNumber;
	}

	public String getUserIdCard() {
		return userIdCard;
	}

	public void setUserIdCard(String userIdCard) {
		this.userIdCard = userIdCard;
	}

	public String getRatesId() {
		return ratesId;
	}

	public void setRatesId(String ratesId) {
		this.ratesId = ratesId;
	}

	public String getChannelname() {
		return channelname;
	}

	public void setChannelname(String channelname) {
		this.channelname = channelname;
	}

	public String getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(String payMoney) {
		this.payMoney = payMoney;
	}

	public String getTradingRates() {
		return tradingRates;
	}

	public void setTradingRates(String tradingRates) {
		this.tradingRates = tradingRates;
	}

	public String getAmountMoney() {
		return amountMoney;
	}

	public void setAmountMoney(String amountMoney) {
		this.amountMoney = amountMoney;
	}

	public String getWorkCosts() {
		return workCosts;
	}

	public void setWorkCosts(String workCosts) {
		this.workCosts = workCosts;
	}

	public String getAfterWorkCosts() {
		return afterWorkCosts;
	}

	public void setAfterWorkCosts(String afterWorkCosts) {
		this.afterWorkCosts = afterWorkCosts;
	}

	public String getSettlementCaps() {
		return settlementCaps;
	}

	public void setSettlementCaps(String settlementCaps) {
		this.settlementCaps = settlementCaps;
	}
}
