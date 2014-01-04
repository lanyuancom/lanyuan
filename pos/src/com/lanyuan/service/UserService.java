package com.lanyuan.service;


import com.lanyuan.base.BaseDao;
import com.lanyuan.entity.Roles;
import com.lanyuan.entity.User;
import com.lanyuan.util.PageView;

public interface UserService extends BaseDao<User>{
	
	public int countUser(String userName,String userPassword);
	public User querySingleUser(String userName);
	public Roles findbyUserRole(String userId);
	public User login(User user) ;
	public PageView queryChildRates(PageView pageView,User user);
}
