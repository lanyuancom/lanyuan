package com.lanyuan.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.entity.Resources;
import com.lanyuan.entity.Roles;
import com.lanyuan.service.ResourcesService;
import com.lanyuan.service.RolesService;
import com.lanyuan.util.Common;
import com.lanyuan.util.PageView;

/**
 * 
 * @author lanyuan
 * 2013-11-19
 * @Email: mmm333zzz520@163.com
 * @version 1.0v
 */
@Controller
@RequestMapping(value="/background/role/")
public class RoleController {
	@Autowired
	private RolesService rolesService;
	@Autowired
	private ResourcesService resourcesService;
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(Model model){
		this.permissio(model);
		return "/background/role/add";
	} 
	/**
	 * 权限树
	 * @return
	 */
	@RequestMapping(value="permissio")
	public String permissio(Model model){
		List<Resources> allRes = resourcesService.findAll();
		StringBuffer sb = new StringBuffer();
		sb.append("var data = [];");
		for (Resources r : allRes) {
				sb.append("data.push({ fid: '"
						+ r.getId() + "', pfid: '"
						+ r.getParentId()
						+ "', fname: '" + r.getName()
						+ "'});");

			}
		model.addAttribute("resources", sb);
		return "/background/resources/permissioUser";
	}
	/**
	 * 保存新增
	 * @param model
	 * @param role
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,Roles role,String rescId){
		rolesService.add(role);
		return "redirect:query.html";
	}
	
	/**
	 * 分页查询
	 * @param model
	 * @param role
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,Roles role,String pageNow){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = rolesService.query(pageView, role);
		model.addAttribute("pageView", pageView);
		return "/background/role/list";
	}
	
	/**
	 * 根据id删除
	 * @param model
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value="deleteById")
	public String deleteById(Model model,String roleId){
		rolesService.delete(roleId);
		return "redirect:query.html";
	}
	
	/**
	 * 查询单条记录
	 * @param model
	 * @param roleId
	 * @param type
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String roleId,int typeKey){
		Roles role = rolesService.getById(roleId);
		model.addAttribute("role", role);
		if(typeKey == 1){
			return "/background/role/edit";
		}else{
			return "/background/role/show";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param role
	 * @return
	 */
	@RequestMapping(value="update")
	public String updaterole(Model model,Roles role){
		rolesService.modify(role);
		return "redirect:query.html";
	}
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(String[] check,Model model){
		for(String id : check){
			rolesService.delete(id);
		}
		return "redirect:query.html";
	}
//	/**
//	 * 某个用户拥有的权限
//	 * @return
//	 */
//	@RequestMapping(value="permissioUser")
//	public String permissioUser(Model model,String userId){
//		List<role> role = rolesService.getUserrole(userId);
//		List<role> allRes = rolesService.findAll();
//		StringBuffer sb = new StringBuffer();
//		sb.append("var data = [];");
//		for (role r : allRes) {
//			boolean flag = false;
//			for (role ur : role) {//用户拥有的权限
//				if (ur.getId().equals(r.getId())) {
//					sb.append("data.push({ fid: '"
//							+ r.getId() + "', pfid: '"
//							+ r.getParentId()
//							+ "', fname: '" + r.getName()
//							+ "',ischecked: true});");
//					flag = true;
//				}
//			}
//			if (!flag) {
//				sb.append("data.push({ fid: '"
//						+ r.getId() + "', pfid: '"
//						+ r.getParentId()
//						+ "', fname: '" + r.getName()
//						+ "'});");
//
//			}
//		}
//		Roles roles = userService.findbyUserRole(userId);
//		model.addAttribute("roles", roles);
//		model.addAttribute("role", sb);
//		return "/background/role/permissioUser";
//	}
}
