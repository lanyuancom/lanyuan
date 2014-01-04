package com.lanyuan.service;


import java.util.List;

import com.lanyuan.base.BaseDao;
import com.lanyuan.entity.Resources;

public interface ResourcesService  extends BaseDao<Resources>{
	//<!-- 根据用户Id获取该用户的权限-->
	public List<Resources> getUserResources(String userId);
	//<!-- 根据用户Id获取该用户的权限-->
	public List<Resources> getRoleResources(String roleId);
	//<!-- 根据用户名获取该用户的权限-->
	public List<Resources> getResourcesByUserName(String username);
	public void saveRoleRescours(String roleId,List<String> list);
}
