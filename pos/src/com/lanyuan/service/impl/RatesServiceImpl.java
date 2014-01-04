package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.RatesDao;
import com.lanyuan.entity.Rates;
import com.lanyuan.service.RatesService;
import com.lanyuan.util.PageView;

@Transactional
@Service("ratesService")
public class RatesServiceImpl implements RatesService{
	@Autowired
	private RatesDao ratesDao;

	public void add(Rates rates) {
		ratesDao.add(rates);
	}

	public void delete(String id) {
		ratesDao.delete(id);
	}

	public Rates getById(String id) {
		return ratesDao.getById(id);
	}

	public void modify(Rates rates) {
		ratesDao.modify(rates);
	}

	public PageView query(PageView pageView, Rates rates) {
		return ratesDao.query(pageView, rates);
	}

	public List<Rates> queryAll(Rates rates) {
		return ratesDao.queryAll(rates);
	}

}
