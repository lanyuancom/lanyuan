package com.lanyuan.dao.impl;

import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.OrderListDao;
import com.lanyuan.entity.OrderList;

@Repository("orderListDao")
public class OrderListDaoImpl extends BaseDaoImpl<OrderList> implements OrderListDao{

}
