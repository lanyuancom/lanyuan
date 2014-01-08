package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.PayMentDao;
import com.lanyuan.entity.PayMent;
import com.lanyuan.service.PayMentService;
import com.lanyuan.util.PageView;

@Transactional
@Service("payMentService")
public class PayMentServiceImpl implements PayMentService{
	@Autowired
	private PayMentDao payMentDao;

	public void add(PayMent payMent) {
		payMentDao.add(payMent);
	}

	public void delete(String id) {
		payMentDao.delete(id);
	}

	public PayMent getById(String id) {
		return payMentDao.getById(id);
	}

	public void modify(PayMent payMent) {
		payMentDao.modify(payMent);
	}

	public PageView query(PageView pageView, PayMent payMent) {
		return payMentDao.query(pageView, payMent);
	}

	public List<PayMent> queryAll(PayMent payMent) {
		return payMentDao.queryAll(payMent);
	}

}
