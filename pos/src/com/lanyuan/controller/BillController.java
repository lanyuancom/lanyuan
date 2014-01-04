package com.lanyuan.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.entity.Bill;
import com.lanyuan.service.BillService;
import com.lanyuan.util.Common;
import com.lanyuan.util.PageView;

/**
 * 
 * @author Dylan
 *
 */
@Controller
@RequestMapping(value="/background/bill/")
public class BillController {
	@Autowired
	private BillService billService;
	
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(){
		return Common.ROOT_PATH+"/background/bill/add";
	} 
	
	/**
	 * 保存新增文章
	 * @param model
	 * @param bill
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,Bill bill,HttpServletRequest request){
		billService.add(bill);
		return "redirect:query.html";
	}
	
	/**
	 * 分页查询文章
	 * @param model
	 * @param bill
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,Bill bill,String pageNow){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = billService.query(pageView, bill);
		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/bill/list";
	}
	
	/**
	 * 根据id删除文章
	 * @param model
	 * @param billId
	 * @return
	 */
	@RequestMapping(value="deleteById")
	public String deleteById(Model model,String billId){
		billService.delete(billId);
		return "redirect:query.html";
	}
	
	/**
	 * 查询单条记录
	 * @param model
	 * @param billId
	 * @param type
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String billId,int type){
		Bill bill = billService.getById(billId);
		model.addAttribute("bill", bill);
		if(type == 1){
			return Common.ROOT_PATH+"/background/bill/edit";
		}else{
			return Common.ROOT_PATH+"/background/bill/show";
		}
	}
	
	/**
	 * 更新修改的文章信息
	 * @param model
	 * @param bill
	 * @return
	 */
	@RequestMapping(value="update")
	public String updateBill(Model model,Bill bill){
		billService.modify(bill);
		return "redirect:query.html";
	}
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(String[] check,Model model){
		for(String id : check){
			billService.delete(id);
		}
		return "redirect:query.html";
	}
}
