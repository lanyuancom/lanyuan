package com.lanyuan.service;

import com.lanyuan.entity.UserLoginList;
import com.lanyuan.util.PageView;

public interface UserLoginListService {
	public PageView query(PageView pageView,UserLoginList userLoginList);
	
	public void add(UserLoginList userLoginList);

}
