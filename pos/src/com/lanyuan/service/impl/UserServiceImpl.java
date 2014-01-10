package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.UserDao;
import com.lanyuan.entity.Roles;
import com.lanyuan.entity.User;
import com.lanyuan.entity.UserRates;
import com.lanyuan.service.UserService;
import com.lanyuan.util.PageView;

@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	public PageView query(PageView pageView, User user) {
		return userDao.query(pageView, user);
	}

	public void add(User user) {
		userDao.add(user);
		
	}

	public void delete(String id) {
		userDao.delete(id);
		
	}

	public User getById(String id) {
		return userDao.getById(id);
	}

	public void modify(User user) {
		userDao.modify(user);
	}

	public int countUser(String userName, String userPassword) {
		return userDao.countUser(userName, userPassword);
	}

	public User querySingleUser(String userName) {
		return userDao.querySingleUser(userName);
	}

	public Roles findbyUserRole(String userId) {
		return userDao.findbyUserRole(userId);
	}

	public User login(User user) {
		return userDao.login(user);
	}

	public List<User> queryAll(User t) {
		return null;
	}

	public PageView queryChildRates(PageView pageView, User user) {
		return userDao.queryChildRates(pageView, user);
	}

	public void saveUserRates(UserRates userRates) {
		 userDao.saveUserRates(userRates);
	}
	public PageView queryUserRates(PageView pageView,UserRates userRates){
		return userDao.queryUserRates(pageView, userRates);
	}

	public UserRates queryUserRatesById(String userRatesId) {
		return userDao.queryUserRatesById(userRatesId);
	}

	public List<UserRates> queryAllUserRates(UserRates userRates) {
		return userDao.queryAllUserRates(userRates);
	}
}
