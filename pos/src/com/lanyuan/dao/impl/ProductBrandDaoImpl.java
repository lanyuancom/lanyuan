package com.lanyuan.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.ProductBrandDao;
import com.lanyuan.entity.ProductBrand;

@Repository("productBrandDao")
public class ProductBrandDaoImpl extends BaseDaoImpl<ProductBrand> implements ProductBrandDao{

	public List<ProductBrand> findTopBrand() {
		return getSqlSession().selectList("productbrand.findTopBrand");
	}

	public List<ProductBrand> findByParentId(String parentId) {
		return getSqlSession().selectList("productbrand.findByParentId",parentId);
	}
}
