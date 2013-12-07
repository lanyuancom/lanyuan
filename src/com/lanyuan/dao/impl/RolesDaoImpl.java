package com.lanyuan.dao.impl;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.RolesDao;
import com.lanyuan.entity.Roles;
import com.lanyuan.entity.UserRoles;


@Repository("rolesDao")
public class RolesDaoImpl extends BaseDaoImpl<Roles> implements RolesDao
{

	public List<Roles> findAll() {
		return getSqlSession().selectList("roles.findAll");
	}

	public void saveUserRole(UserRoles userRoles ) {
		getSqlSession().insert("roles.saveUserRole", userRoles);
	}

	public void deleteUserRole(String userId) {
		getSqlSession().delete("roles.deleteUserRole", userId);
	}
}
