package com.lanyuan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.entity.Pay;
import com.lanyuan.entity.Rates;
import com.lanyuan.service.PayService;
import com.lanyuan.service.RatesService;
import com.lanyuan.util.Common;
import com.lanyuan.util.PageView;

/**
 * 
 * @author Dylan
 *
 */
@Controller
@RequestMapping(value="/background/pay/")
public class PayController {
	@Autowired
	private PayService payService;
	@Autowired
	private RatesService ratesService;
	
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(){
		return Common.ROOT_PATH+"/background/pay/add";
	} 
	
	/**
	 * 保存新增文章
	 * @param model
	 * @param pay
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,Pay pay,HttpServletRequest request){
		payService.add(pay);
		return "redirect:query.html";
	}
	
	/**
	 * 分页查询文章
	 * @param model
	 * @param pay
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,Pay pay,String pageNow){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = payService.query(pageView, pay);
		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/pay/list";
	}
	@RequestMapping(value="benefit")
	public String benefit(){
		return Common.ROOT_PATH+"/background/pay/benefit";
	}
	/**
	 * 根据id删除文章
	 * @param model
	 * @param payId
	 * @return
	 */
	@RequestMapping(value="deleteById")
	public String deleteById(Model model,String payId){
		payService.delete(payId);
		return "redirect:query.html";
	}
	
	/**
	 * 查询单条记录
	 * @param model
	 * @param payId
	 * @param type
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String payId){
		Pay pay = payService.getById(payId);
		model.addAttribute("pay", pay);
			return Common.ROOT_PATH+"/background/pay/edit";
	}
	@RequestMapping(value="payRates")
	public String payRates(Model model,String ratesId){
		if(!Common.isEmpty(ratesId)){
			Rates rates = ratesService.getById(ratesId);
			model.addAttribute("rates", rates);
		}
		return Common.ROOT_PATH+"/background/pay/payRate";
	}
	/**
	 * 更新修改的文章信息
	 * @param model
	 * @param pay
	 * @return
	 */
	@RequestMapping(value="update")
	public String updatePay(Model model,Pay pay){
		payService.modify(pay);
		return "redirect:query.html";
	}
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(String[] check,Model model){
		for(String id : check){
			payService.delete(id);
		}
		return "redirect:query.html";
	}
}
