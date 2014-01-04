package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.PayDao;
import com.lanyuan.entity.Pay;
import com.lanyuan.service.PayService;
import com.lanyuan.util.PageView;

@Transactional
@Service("payService")
public class PayServiceImpl implements PayService{
	@Autowired
	private PayDao payDao;

	public void add(Pay pay) {
		payDao.add(pay);
	}

	public void delete(String id) {
		payDao.delete(id);
	}

	public Pay getById(String id) {
		return payDao.getById(id);
	}

	public void modify(Pay pay) {
		payDao.modify(pay);
	}

	public PageView query(PageView pageView, Pay pay) {
		return payDao.query(pageView, pay);
	}

	public List<Pay> queryAll(Pay pay) {
		return payDao.queryAll(pay);
	}

}
