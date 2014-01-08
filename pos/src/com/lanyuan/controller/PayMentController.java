package com.lanyuan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.entity.PayMent;
import com.lanyuan.entity.Rates;
import com.lanyuan.service.PayMentService;
import com.lanyuan.service.RatesService;
import com.lanyuan.util.Common;
import com.lanyuan.util.PageView;

/**
 * 
 * @author Dylan
 *
 */
@Controller
@RequestMapping(value="/background/payMent/")
public class PayMentController {
	@Autowired
	private PayMentService payMentService;
	@Autowired
	private RatesService ratesService;
	
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(){
		return Common.ROOT_PATH+"/background/payMent/add";
	} 
	
	/**
	 * 保存新增文章
	 * @param model
	 * @param payMent
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,PayMent payMent,HttpServletRequest request){
		payMentService.add(payMent);
		return "redirect:query.html";
	}
	
	/**
	 * 分页查询文章
	 * @param model
	 * @param payMent
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,PayMent payMent,String pageNow){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = payMentService.query(pageView, payMent);
		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/payMent/list";
	}
	@RequestMapping(value="benefit")
	public String benefit(){
		return Common.ROOT_PATH+"/background/payMent/benefit";
	}
	/**
	 * 根据id删除文章
	 * @param model
	 * @param payMentId
	 * @return
	 */
	@RequestMapping(value="deleteById")
	public String deleteById(Model model,String payMentId){
		payMentService.delete(payMentId);
		return "redirect:query.html";
	}
	
	/**
	 * 查询单条记录
	 * @param model
	 * @param payMentId
	 * @param type
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String payMentId){
		PayMent payMent = payMentService.getById(payMentId);
		model.addAttribute("payMent", payMent);
			return Common.ROOT_PATH+"/background/payMent/edit";
	}
	@RequestMapping(value="payMentRates")
	public String payMentRates(Model model,String ratesId){
		if(!Common.isEmpty(ratesId)){
			Rates rates = ratesService.getById(ratesId);
			model.addAttribute("rates", rates);
		}
		return Common.ROOT_PATH+"/background/payMent/payMentRate";
	}
	/**
	 * 更新修改的文章信息
	 * @param model
	 * @param payMent
	 * @return
	 */
	@RequestMapping(value="update")
	public String updatePayMent(Model model,PayMent payMent){
		payMentService.modify(payMent);
		return "redirect:query.html";
	}
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(String[] check,Model model){
		for(String id : check){
			payMentService.delete(id);
		}
		return "redirect:query.html";
	}
}
