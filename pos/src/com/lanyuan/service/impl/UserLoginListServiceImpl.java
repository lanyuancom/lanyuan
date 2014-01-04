package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.UserLoginListDao;
import com.lanyuan.entity.UserLoginList;
import com.lanyuan.service.UserLoginListService;
import com.lanyuan.util.PageView;

@Transactional
@Service("userLoginListService")
public class UserLoginListServiceImpl implements UserLoginListService{
	@Autowired
	private UserLoginListDao userLoginListDao;
	
	public PageView query(PageView pageView, UserLoginList userLoginList) {
		return userLoginListDao.query(pageView, userLoginList);
	}

	public void add(UserLoginList userLoginList) {
		userLoginListDao.add(userLoginList);
	}

	public List<UserLoginList> queryAll(UserLoginList t) {
		// TODO Auto-generated method stub
		return null;
	}

	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}

	public void modify(UserLoginList t) {
		// TODO Auto-generated method stub
		
	}

	public UserLoginList getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
