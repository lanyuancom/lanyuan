package com.lanyuan.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.entity.Pay;
import com.lanyuan.entity.User;
import com.lanyuan.entity.UserRates;
import com.lanyuan.service.PayService;
import com.lanyuan.service.UserService;
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
	private UserService userService;
	
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
		try {
			Double co = Double.parseDouble(pay.getCostsMoney());
			Double paMon = Double.parseDouble(pay.getSettlementCosts());
			String money = Common.sub(co, paMon) + "";
			pay.setPayMoney(money);
			Double countMeny = Double.parseDouble(pay.getCountMoney());//余额－结算金额
			String remainMoney =  Common.sub(countMeny,co) + "";
			pay.setRemainMoney(remainMoney);
			payService.add(pay);
			User user = userService.getById(request.getSession().getAttribute("userSessionId").toString());
			Double sun = Common.sub(Double.parseDouble(user.getAmountMoney()),co);
			user.setAmountMoney(sun + "");
			userService.modify(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:query.html";
	}
	public static void main(String[] args) {
		double d= 0.003;
		double b = 10000;
		System.out.println(b-b*d);
	}
	/**
	 * 分页查询文章
	 * @param model
	 * @param pay
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,Pay pay,String pageNow,HttpServletRequest request){
		User u = (User)request.getSession().getAttribute("userSession");
		if("super".equals(u.getRoleName())||"admin".equals(u.getRoleName())){
		
		}else{
			pay.setUserName(u.getUserName());
		}
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
	@RequestMapping(value="show")
	public String show(Model model,String payId){
		Pay pay = payService.getById(payId);
		model.addAttribute("pay", pay);
			return Common.ROOT_PATH+"/background/pay/show";
	}
	@RequestMapping(value="payRates")
	public String payRates(Model model,String ratesId,HttpServletRequest request){
		if(!Common.isEmpty(ratesId)){
			UserRates rates = userService.queryUserRatesById(ratesId);
			model.addAttribute("rates", rates);
			User u = userService.getById(request.getSession().getAttribute("userSessionId").toString());
			model.addAttribute("userInfo", u);
		}
		return Common.ROOT_PATH+"/background/pay/payRate";
	}
	
	@ResponseBody
	@RequestMapping("checkStatus")
	public String checkStatus(Pay pay,HttpServletRequest request){
		pay.setSettlementTime(new Date());
		payService.modify(pay);
		if("2".equals(pay.getPayState())){//审核不通过，返回金额
			pay=payService.getById(pay.getId()+"");
			User user = userService.getById(request.getSession().getAttribute("userSessionId").toString());
			Double sun = Double.parseDouble(user.getAmountMoney())+Double.parseDouble(pay.getCostsMoney());
			user.setAmountMoney(sun+"");
			userService.modify(user);
		}
		return null;
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
