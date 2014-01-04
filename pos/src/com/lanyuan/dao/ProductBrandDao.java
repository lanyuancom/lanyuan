package com.lanyuan.dao;

import java.util.List;

import com.lanyuan.base.BaseDao;
import com.lanyuan.entity.ProductBrand;

public interface ProductBrandDao extends BaseDao<ProductBrand>{
	public List<ProductBrand> findTopBrand();
	
	public List<ProductBrand> findByParentId(String parentId);
}
