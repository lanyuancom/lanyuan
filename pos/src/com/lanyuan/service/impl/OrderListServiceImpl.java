package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.OrderListDao;
import com.lanyuan.entity.OrderList;
import com.lanyuan.service.OrderListService;
import com.lanyuan.util.PageView;

@Transactional
@Service("orderListService")
public class OrderListServiceImpl implements OrderListService{
	@Autowired
	private OrderListDao orderListDao;

	public void add(OrderList orderList) {
		orderListDao.add(orderList);
	}

	public void delete(String id) {
		orderListDao.delete(id);
	}

	public OrderList getById(String id) {
		return orderListDao.getById(id);
	}

	public void modify(OrderList orderList) {
		orderListDao.modify(orderList);
	}

	public PageView query(PageView pageView, OrderList orderList) {
		return orderListDao.query(pageView, orderList);
	}

	public List<OrderList> queryAll(OrderList orderList) {
		return orderListDao.queryAll(orderList);
	}

}
