package com.lanyuan.dao.impl;

import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.PayMentDao;
import com.lanyuan.entity.PayMent;

@Repository("payMentDao")
public class PayMentDaoImpl extends BaseDaoImpl<PayMent> implements PayMentDao{

}
