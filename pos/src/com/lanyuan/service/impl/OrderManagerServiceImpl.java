package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.OrderManagerDao;
import com.lanyuan.entity.OrderManager;
import com.lanyuan.service.OrderManagerService;
import com.lanyuan.util.PageView;

@Transactional
@Service("orderManagerService")
public class OrderManagerServiceImpl implements OrderManagerService{
	@Autowired
	private OrderManagerDao orderManagerDao;

	public void add(OrderManager orderManager) {
		orderManagerDao.add(orderManager);
	}

	public void delete(String id) {
		orderManagerDao.delete(id);
	}

	public OrderManager getById(String id) {
		return orderManagerDao.getById(id);
	}

	public void modify(OrderManager orderManager) {
		orderManagerDao.modify(orderManager);
	}

	public PageView query(PageView pageView, OrderManager orderManager) {
		return orderManagerDao.query(pageView, orderManager);
	}

	public List<OrderManager> queryAll(OrderManager orderManager) {
		return orderManagerDao.queryAll(orderManager);
	}

}
