package com.lanyuan.dao;


import java.util.List;

import com.lanyuan.base.BaseDao;
import com.lanyuan.entity.ResourceRoles;
import com.lanyuan.entity.Resources;


public interface ResourcesDao extends BaseDao<Resources>{
	public List<Resources> findAll();
	//<!-- 根据用户Id获取该用户的权限-->
	public List<Resources> getUserResources(String userId);
	//<!-- 根据角色Id获取该角色的权限-->
	public List<Resources> getRoleResources(String roleId);
	//<!-- 根据用户名获取该用户的权限-->
	public List<Resources> getResourcesByUserName(String username);
	public void saveRoleRescours(ResourceRoles resourceRoles);
	public void deleteRoleRescours(String roleId);
}
