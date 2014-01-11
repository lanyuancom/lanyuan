package com.lanyuan.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.UserDao;
import com.lanyuan.entity.Rates;
import com.lanyuan.entity.Roles;
import com.lanyuan.entity.User;
import com.lanyuan.entity.UserRates;
import com.lanyuan.util.PageView;


@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao
{

	public int countUser(String userName, String userPassword) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("userName", userName);
		map.put("userPassword", userPassword);
		return (Integer)getSqlSession().selectOne("user.countUser",map);
	}

	public User querySingleUser(String userName) {
		return (User)getSqlSession().selectOne("user.queryUserName",userName);
	}

	public Roles findbyUserRole(String userId) {
		return (Roles)getSqlSession().selectOne("roles.findbyUserRole", userId);
	}

	public User login(User user) {
		 return (User)getSqlSession().selectOne("user.login", user);
	}
	
	public PageView queryChildRates(PageView pageView,User user) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("paging", pageView);
		map.put("t", user);
		List<Rates> lists = getSqlSession().selectList("user.queryChildRates",map);
		pageView.setRecords(lists);
		return pageView;
	}

	public void saveUserRates(UserRates userRates) {
		getSqlSession().insert("userrates.add",userRates);
	}

	public PageView queryUserRates(PageView pageView,UserRates userRates) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("paging", pageView);
		map.put("t", userRates);
		List<UserRates> lists = getSqlSession().selectList("userrates.queryUserRates",map);
		pageView.setRecords(lists);
		return pageView;
	}
	public UserRates queryUserRatesById(String userRatesId){
		return (UserRates)getSqlSession().selectOne("userrates.getById", userRatesId);
	}
	public List<UserRates> queryAllUserRates(UserRates userRates){
		return getSqlSession().selectList("userrates.queryAll", userRates);
	}

	public void updateUserRates(UserRates userRates) {
		getSqlSession().update("userrates.update",userRates);
	}

	public void deleteByPayName(String userName) {
		getSqlSession().delete("user.deleteByPayName", userName);
	}

	public void deleteByPayMentName(String userName) {
		getSqlSession().delete("user.deleteByPayMentName", userName);
	}

	public void deleteByUserRatesName(String userName) {
		getSqlSession().delete("user.deleteByUserRatesName", userName);
	}
	
}
