package com.lanyuan.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.entity.OrderList;
import com.lanyuan.service.OrderListService;
import com.lanyuan.util.Common;
import com.lanyuan.util.PageView;

@Controller
@RequestMapping(value="/background/orderlist/")
public class OrderListController {
	@Autowired
	private OrderListService orderListService;
	
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(){
		return Common.ROOT_PATH+"/background/orderList/add";
	} 
	
	/**
	 * 保存新增文章
	 * @param model
	 * @param orderList
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,OrderList orderList,HttpServletRequest request){
		orderListService.add(orderList);
		return "redirect:query.html";
	}
	
	/**
	 * 分页查询文章
	 * @param model
	 * @param orderList
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,OrderList orderList,String pageNow){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = orderListService.query(pageView, orderList);
		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/orderList/list";
	}
	
	/**
	 * 根据id删除文章
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteById")
	public String deleteById(Model model,String id){
		orderListService.delete(id);
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
		OrderList orderList = orderListService.getById(id);
		model.addAttribute("orderList", orderList);
		if(type == 1){
			return Common.ROOT_PATH+"/background/orderList/edit";
		}else{
			return Common.ROOT_PATH+"/background/orderList/show";
		}
	}
	
	/**
	 * 更新修改的文章信息
	 * @param model
	 * @param orderList
	 * @return
	 */
	@RequestMapping(value="update")
	public String updateOrderList(Model model,OrderList orderList){
		orderListService.modify(orderList);
		return "redirect:query.html";
	}
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(String[] check,Model model){
		for(String id : check){
			orderListService.delete(id);
		}
		return "redirect:query.html";
	}
}
