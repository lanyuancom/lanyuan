package com.lanyuan.service;


import java.util.List;

import com.lanyuan.base.BaseDao;
import com.lanyuan.entity.UserRates;
import com.lanyuan.util.PageView;

public interface UserRatesService extends BaseDao<UserRates>{

	public List<UserRates> queryUserNull(UserRates userRates);
	public PageView queryChildUserNotNull(PageView pageView, UserRates userRates);
}
