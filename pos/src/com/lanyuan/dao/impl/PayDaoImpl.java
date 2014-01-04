package com.lanyuan.dao.impl;

import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.PayDao;
import com.lanyuan.entity.Pay;

@Repository("payDao")
public class PayDaoImpl extends BaseDaoImpl<Pay> implements PayDao{

}
