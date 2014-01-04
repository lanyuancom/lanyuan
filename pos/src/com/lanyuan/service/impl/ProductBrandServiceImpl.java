package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.ProductBrandDao;
import com.lanyuan.entity.ProductBrand;
import com.lanyuan.service.ProductBrandService;
import com.lanyuan.util.PageView;

@Transactional
@Service("productBrandService")
public class ProductBrandServiceImpl implements ProductBrandService{
	@Autowired
	private ProductBrandDao productBrandDao;

	public void add(ProductBrand productBrand) {
		productBrandDao.add(productBrand);
	}

	public void delete(String id) {
		productBrandDao.delete(id);
	}

	public ProductBrand getById(String id) {
		return productBrandDao.getById(id);
	}

	public void modify(ProductBrand productBrand) {
		productBrandDao.modify(productBrand);
	}

	public PageView query(PageView pageView, ProductBrand productBrand) {
		return productBrandDao.query(pageView, productBrand);
	}

	public List<ProductBrand> queryAll(ProductBrand productBrand) {
		return productBrandDao.queryAll(productBrand);
	}

	public List<ProductBrand> findTopBrand() {
		return productBrandDao.findTopBrand();
	}

	public List<ProductBrand> findByParentId(String parentId) {
		return productBrandDao.findByParentId(parentId);
	}

}
