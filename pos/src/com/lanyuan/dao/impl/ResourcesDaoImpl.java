package com.lanyuan.dao.impl;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.lanyuan.base.impl.BaseDaoImpl;
import com.lanyuan.dao.ResourcesDao;
import com.lanyuan.entity.ResourceRoles;
import com.lanyuan.entity.Resources;


@Repository("resourcesDao")
public class ResourcesDaoImpl extends BaseDaoImpl<Resources> implements ResourcesDao
{

	public List<Resources> findAll() {
		return getSqlSession().selectList("resources.findAll");
	}
	//<!-- 根据用户Id获取该用户的权限-->
	public List<Resources> getUserResources(String userId){
		return getSqlSession().selectList("resources.getUserResources",userId);
	}
	//<!-- 根据用户名获取该用户的权限-->
	public List<Resources> getResourcesByUserName(String username){
		return getSqlSession().selectList("resources.getResourcesByUserName",username);
	}
	//<!-- 根据用户Id获取该用户的权限-->
	public List<Resources> getRoleResources(String roleId){
		return getSqlSession().selectList("resources.getRoleResources",roleId);
	}
	public void saveRoleRescours(ResourceRoles resourceRoles){
		 getSqlSession().insert("resources.saveRoleRescours",resourceRoles);
	}
	public void deleteRoleRescours(String roleId){
		getSqlSession().delete("resources.deleteRoleRescours",roleId);
	}
}
