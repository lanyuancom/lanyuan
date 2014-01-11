package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.UserRatesDao;
import com.lanyuan.entity.UserRates;
import com.lanyuan.service.UserRatesService;
import com.lanyuan.util.PageView;

@Transactional
@Service("userRatesService")
public class UserRatesServiceImpl implements UserRatesService{
	@Autowired
	private UserRatesDao userRatesDao;

	public void add(UserRates rates) {
		userRatesDao.add(rates);
	}

	public void delete(String id) {
		userRatesDao.delete(id);
	}

	public UserRates getById(String id) {
		return userRatesDao.getById(id);
	}

	public void modify(UserRates rates) {
		userRatesDao.modify(rates);
	}

	public PageView query(PageView pageView, UserRates rates) {
		return userRatesDao.query(pageView, rates);
	}

	public List<UserRates> queryAll(UserRates rates) {
		return userRatesDao.queryAll(rates);
	}

	public List<UserRates> queryUserNull(UserRates userRates) {
		return userRatesDao.queryUserNull(userRates);
	}

	public PageView queryChildUserNotNull(PageView pageView, UserRates userRates) {
		// TODO Auto-generated method stub
		return userRatesDao.queryChildUserNotNull(pageView, userRates);
	}

}
