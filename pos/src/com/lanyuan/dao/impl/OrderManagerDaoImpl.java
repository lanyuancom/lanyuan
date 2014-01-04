package com.lanyuan.dao.impl;

import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.OrderManagerDao;
import com.lanyuan.entity.OrderManager;

@Repository("orderManagerDao")
public class OrderManagerDaoImpl extends BaseDaoImpl<OrderManager> implements OrderManagerDao{

}
