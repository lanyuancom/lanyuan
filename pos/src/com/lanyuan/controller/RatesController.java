package com.lanyuan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.entity.Rates;
import com.lanyuan.entity.User;
import com.lanyuan.entity.UserRates;
import com.lanyuan.service.RatesService;
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
public class RatesController {
	@Autowired
	private RatesService ratesService;
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
	public String add(Model model,Rates rates,HttpServletRequest request){
		ratesService.add(rates);
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
	public String query(Model model,UserRates userRates,Rates rates,String pageNow,HttpServletRequest request){
		User u = (User)request.getSession().getAttribute("userSession");
		PageView pageView = null;
		if (Common.isEmpty(pageNow)) {
			pageView = new PageView(1);
		} else {
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		if("super".equals(u.getRoleName())||"admin".equals(u.getRoleName())){
			pageView.setRecords(ratesService.queryAll(rates));
		}else{
			userRates.setUserName(u.getUserName());
			pageView.setRecords(userService.queryAllUserRates(userRates));
			List<Rates> rs =ratesService.queryAll(new Rates());
			List list = pageView.getRecords();
			for (Object object : list) {
				UserRates ur = (UserRates)object;
				for (Rates r : rs) {
					if(ur.getChannelname().equals(r.getChannelname())){
						ur.setMark(r.getMark());
					}
				}
			}
		}

		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/rates/list";
	}
	@RequestMapping(value="queryChildRates")
	public String queryChildRates(Model model,User user,String pageNow,HttpServletRequest request){
		User u = (User)request.getSession().getAttribute("userSession");
		if("super".equals(u.getRoleName())||"admin".equals(u.getRoleName())){
		
		}else{
			user.setParentNumber(request.getSession().getAttribute("userSessionId").toString());
		}
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = userService.queryChildRates(pageView, user);
		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/rates/childRates";
	}
	
	/**
	 * 根据id删除文章
	 * @param model
	 * @param ratesId
	 * @return
	 */
	@RequestMapping(value="deleteById")
	public String deleteById(Model model,String ratesId){
		ratesService.delete(ratesId);
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
		Rates rates = ratesService.getById(ratesId);
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
	public String updateRates(Model model,Rates rates){
		ratesService.modify(rates);
		return "redirect:query.html";
	}
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(String[] check,Model model){
		for(String id : check){
			ratesService.delete(id);
		}
		return "redirect:query.html";
	}
}
