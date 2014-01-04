package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.RolesDao;
import com.lanyuan.entity.Roles;
import com.lanyuan.entity.UserRoles;
import com.lanyuan.service.RolesService;
import com.lanyuan.util.PageView;

@Transactional
@Service("rolesService")
public class RolesServiceImpl implements RolesService {
	@Autowired
	private RolesDao rolesDao;

	public PageView query(PageView pageView, Roles roles) {
		return rolesDao.query(pageView, roles);
	}

	public void add(Roles roles) {
		rolesDao.add(roles);
		
	}

	public void delete(String id) {
		rolesDao.delete(id);
		
	}

	public Roles getById(String id) {
		return rolesDao.getById(id);
	}

	public void modify(Roles roles) {
		rolesDao.modify(roles);
	}
	public void saveUserRole(UserRoles userRoles) {
		rolesDao.deleteUserRole(userRoles.getUserId().toString());
		rolesDao.saveUserRole(userRoles);
	}

	public List<Roles> queryAll(Roles t) {
		return rolesDao.findAll();
	}

}
