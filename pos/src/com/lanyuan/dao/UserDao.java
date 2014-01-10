package com.lanyuan.dao;


import java.util.List;

import com.lanyuan.base.BaseDao;
import com.lanyuan.entity.Roles;
import com.lanyuan.entity.User;
import com.lanyuan.entity.UserRates;
import com.lanyuan.util.PageView;


public interface UserDao extends BaseDao<User>{
	public int countUser(String userName,String userPassword);
	
	public User querySingleUser(String userName);
	
	public Roles findbyUserRole(String userId);
	
	public User login(User user);
	
	/**
	 * 下级用户的费率列表
	 * @param pageView
	 * @param user
	 * @return
	 */
	public PageView queryChildRates(PageView pageView,User user) ;
	
	public void saveUserRates(UserRates userRates);
	
	public PageView queryUserRates(PageView pageView,UserRates userRates);
	public UserRates queryUserRatesById(String userRatesId);
	public List<UserRates> queryAllUserRates(UserRates userRates);
}
