package com.lanyuan.dao.impl;


import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.ProductDao;
import com.lanyuan.entity.Product;

@Repository("productDao")
public class ProductDaoImpl extends BaseDaoImpl<Product> implements ProductDao{

	public void updateImages(Product product) {
		getSqlSession().update("product.updateImages", product);
	}

	public void updateLookNuns(Product product) {
		getSqlSession().update("product.updateLookNuns", product);
	}

}
