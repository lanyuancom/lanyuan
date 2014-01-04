package com.lanyuan.dao.impl;

import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.RatesDao;
import com.lanyuan.entity.Rates;

@Repository("ratesDao")
public class RatesDaoImpl extends BaseDaoImpl<Rates> implements RatesDao{

}
