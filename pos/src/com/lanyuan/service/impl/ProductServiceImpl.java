package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.ProductDao;
import com.lanyuan.entity.Product;
import com.lanyuan.service.ProductService;
import com.lanyuan.util.PageView;

@Transactional
@Service("productService")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDao productDao;

	public void add(Product product) {
		productDao.add(product);
	}

	public void delete(String id) {
		productDao.delete(id);
	}

	public Product getById(String id) {
		return productDao.getById(id);
	}

	public void modify(Product product) {
		productDao.modify(product);
	}

	public PageView query(PageView pageView, Product product) {
		return productDao.query(pageView, product);
	}

	public List<Product> queryAll(Product product) {
		return productDao.queryAll(product);
	}

	public void updateImages(Product product) {
		productDao.updateImages(product);
	}

	public void updateLookNuns(Product product) {
		productDao.updateLookNuns(product);
	}

}
