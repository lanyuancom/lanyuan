package com.lanyuan.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.entity.UserRates;
import com.lanyuan.entity.User;
import com.lanyuan.service.UserRatesService;
import com.lanyuan.service.UserService;
import com.lanyuan.util.Common;
import com.lanyuan.util.PageView;

/**
 * 
 * @author Dylan
 *
 */
@Controller
@RequestMapping(value="/background/rates/")
public class UserRatesController {
	@Autowired
	private UserRatesService userRatesService;
	@Autowired
	private UserService userService;
	
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(){
		return Common.ROOT_PATH+"/background/rates/add";
	} 
	
	/**
	 * 保存新增文章
	 * @param model
	 * @param rates
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,UserRates rates,HttpServletRequest request){
		userRatesService.add(rates);
		return "redirect:query.html";
	}
	@RequestMapping(value="money")
	public String money(Model model,String ratesId,HttpServletRequest request){
		UserRates rates = userService.queryUserRatesById(ratesId);
		model.addAttribute("rates", rates);
		User user = userService.getById(request.getSession().getAttribute("userSessionId").toString());
		model.addAttribute("userInfo", user);
		return "money";
	}
	@RequestMapping(value="pay")
	public String pay(){
		return Common.ROOT_PATH+"/background/rates/pay";
	}
	/**
	 * 分页查询文章
	 * @param model
	 * @param rates
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,UserRates userRates,String pageNow,HttpServletRequest request){
		User u = (User)request.getSession().getAttribute("userSession");
		PageView pageView = null;
		if (Common.isEmpty(pageNow)) {
			pageView = new PageView(1);
		} else {
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		if("super".equals(u.getRoleName())||"admin".equals(u.getRoleName())){
			pageView=userRatesService.query(pageView, userRates);
		}else{
			userRates.setUserName(u.getUserName());
			pageView=userRatesService.queryChildUserNotNull(pageView, userRates);
		}
		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/rates/list";
	}
	
	/**
	 * 根据id删除文章
	 * @param model
	 * @param ratesId
	 * @return
	 */
	@RequestMapping(value="deleteById")
	public String deleteById(Model model,String ratesId){
		userRatesService.delete(ratesId);
		return "redirect:query.html";
	}
	
	/**
	 * 查询单条记录
	 * @param model
	 * @param ratesId
	 * @param type
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String ratesId,int type){
		UserRates rates = userRatesService.getById(ratesId);
		model.addAttribute("rates", rates);
		if(type == 1){
			return Common.ROOT_PATH+"/background/rates/edit";
		}else{
			return Common.ROOT_PATH+"/background/rates/show";
		}
	}
	
	/**
	 * 更新修改的文章信息
	 * @param model
	 * @param rates
	 * @return
	 */
	@RequestMapping(value="update")
	public String updateUserRates(Model model,UserRates rates){
		userRatesService.modify(rates);
		return "redirect:query.html";
	}
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(String[] check,Model model){
		for(String id : check){
			userRatesService.delete(id);
		}
		return "redirect:query.html";
	}
}
