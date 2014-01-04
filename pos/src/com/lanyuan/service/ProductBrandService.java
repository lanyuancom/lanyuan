package com.lanyuan.service;

import java.util.List;

import com.lanyuan.base.BaseDao;
import com.lanyuan.entity.ProductBrand;

public interface ProductBrandService extends BaseDao<ProductBrand>{
	public List<ProductBrand> findTopBrand();
}
