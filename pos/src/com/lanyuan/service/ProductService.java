package com.lanyuan.service;


import com.lanyuan.base.BaseDao;
import com.lanyuan.entity.Product;

public interface ProductService extends BaseDao<Product>{
	
	public void updateImages(Product product);
	
	public void updateLookNuns(Product product) ;
}
