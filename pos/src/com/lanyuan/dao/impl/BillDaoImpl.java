package com.lanyuan.dao.impl;

import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.BillDao;
import com.lanyuan.entity.Bill;

@Repository("billDao")
public class BillDaoImpl extends BaseDaoImpl<Bill> implements BillDao{

}
