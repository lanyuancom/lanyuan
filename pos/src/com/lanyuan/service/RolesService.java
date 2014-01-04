package com.lanyuan.service;



import com.lanyuan.base.BaseDao;
import com.lanyuan.entity.Roles;
import com.lanyuan.entity.UserRoles;

public interface RolesService  extends BaseDao<Roles>{
	public void saveUserRole(UserRoles userRoles);
}
