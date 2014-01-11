package com.lanyuan.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.UserRatesDao;
import com.lanyuan.entity.UserRates;
import com.lanyuan.util.PageView;

@Repository("userRatesDao")
public class UserRatesImpl extends BaseDaoImpl<UserRates> implements UserRatesDao{
	public List<UserRates> queryUserNull(UserRates userRates) {
		return getSqlSession().selectList("userrates.queryUserNull",userRates);
	}

	public PageView queryChildUserNotNull(PageView pageView, UserRates userRates) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("paging", pageView);
		map.put("t", userRates);
		List<UserRates> lists = getSqlSession().selectList("userrates.queryChildUserNotNull",map);
		pageView.setRecords(lists);
		return pageView;
	}
}
