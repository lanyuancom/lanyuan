package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.BillDao;
import com.lanyuan.entity.Bill;
import com.lanyuan.service.BillService;
import com.lanyuan.util.PageView;

@Transactional
@Service("billService")
public class BillServiceImpl implements BillService{
	@Autowired
	private BillDao billDao;

	public void add(Bill bill) {
		billDao.add(bill);
	}

	public void delete(String id) {
		billDao.delete(id);
	}

	public Bill getById(String id) {
		return billDao.getById(id);
	}

	public void modify(Bill bill) {
		billDao.modify(bill);
	}

	public PageView query(PageView pageView, Bill bill) {
		return billDao.query(pageView, bill);
	}

	public List<Bill> queryAll(Bill bill) {
		return billDao.queryAll(bill);
	}

}
