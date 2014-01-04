package com.lanyuan.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.entity.OrderManager;
import com.lanyuan.service.OrderManagerService;
import com.lanyuan.util.Common;
import com.lanyuan.util.PageView;

@Controller
@RequestMapping(value="/background/orderManager/")
public class OrderManagerController {
	@Autowired
	private OrderManagerService orderManagerService;
	
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(){
		return Common.ROOT_PATH+"/background/orderManager/add";
	} 
	
	/**
	 * 保存新增文章
	 * @param model
	 * @param orderManager
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,OrderManager orderManager,HttpServletRequest request){
		orderManagerService.add(orderManager);
		return "redirect:query.html";
	}
	
	/**
	 * 分页查询文章
	 * @param model
	 * @param orderManager
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,OrderManager orderManager,String pageNow){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = orderManagerService.query(pageView, orderManager);
		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/orderManager/list";
	}
	
	/**
	 * 根据id删除文章
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteById")
	public String deleteById(Model model,String id){
		orderManagerService.delete(id);
		return "redirect:query.html";
	}
	
	/**
	 * 查询单条记录
	 * @param model
	 * @param id
	 * @param type
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String id,int type){
		OrderManager orderManager = orderManagerService.getById(id);
		model.addAttribute("orderManager", orderManager);
		if(type == 1){
			return Common.ROOT_PATH+"/background/orderManager/edit";
		}else{
			return Common.ROOT_PATH+"/background/orderManager/show";
		}
	}
	
	/**
	 * 更新修改的文章信息
	 * @param model
	 * @param orderManager
	 * @return
	 */
	@RequestMapping(value="update")
	public String updateOrderManager(Model model,OrderManager orderManager){
		orderManagerService.modify(orderManager);
		return "redirect:query.html";
	}
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(String[] check,Model model){
		for(String id : check){
			orderManagerService.delete(id);
		}
		return "redirect:query.html";
	}
}
