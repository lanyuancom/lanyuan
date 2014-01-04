package com.lanyuan.dao;


import com.lanyuan.base.BaseDao;
import com.lanyuan.entity.Product;

public interface ProductDao extends BaseDao<Product>{

	public void updateImages(Product product);
	
	public void updateLookNuns(Product product);
	
}
