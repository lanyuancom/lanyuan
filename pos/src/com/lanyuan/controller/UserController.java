package com.lanyuan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.entity.Roles;
import com.lanyuan.entity.User;
import com.lanyuan.entity.UserRates;
import com.lanyuan.entity.UserRoles;
import com.lanyuan.service.RolesService;
import com.lanyuan.service.UserRatesService;
import com.lanyuan.service.UserService;
import com.lanyuan.util.Common;
import com.lanyuan.util.Md5Tool;
import com.lanyuan.util.PageView;

/**
 * 
 * @author lanyuan
 * 
 * 2013-1-30 下午05:04:57
 * 
 * Email:mmm333zzz520@163.com
 */
@Controller
@RequestMapping("/background/user/")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private RolesService rolesService;
	@Autowired
	private UserRatesService userRatesService;
	/**
	 * @param model
	 * 存放返回界面的model
	 * @return
	 */
	@RequestMapping("query")
	public String query(Model model, User user, String pageNow,HttpServletRequest request) {
		User u = (User)request.getSession().getAttribute("userSession");
		PageView pageView = null;
		if (Common.isEmpty(pageNow)) {
			pageView = new PageView(1);
		} else {
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		user.setStatus(null);
		if("super".equals(u.getRoleName())||"admin".equals(u.getRoleName())){
			pageView = userService.query(pageView, user);
			model.addAttribute("pageView", pageView);
		}else{
			//非管理员
			if(user != null){
				user.setParentNumber(request.getSession().getAttribute("userSessionId").toString());
				pageView = userService.query(pageView, user);
			}
		}
		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/user/list";
	}
	
	@RequestMapping("edit")
	public String edit(Model model, User user, String pageNow,HttpServletRequest request) {
		User u = (User)request.getSession().getAttribute("userSession");
		if(!"super".equals(u.getRoleName())){
			user.setParentNumber(request.getSession().getAttribute("userSessionId").toString());
		}
		PageView pageView = null;
		if (Common.isEmpty(pageNow)) {
			pageView = new PageView(1);
		} else {
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = userService.query(pageView, user);
		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/user/edit";
	}
	/**
	 * 保存数据
	 * 
	 * @param model
	 * @param videoType
	 * @return
	 */
	@RequestMapping("add")
	public String add(Model model, User user,HttpServletRequest request) {
		String card = user.getUserIdCard();
		int s = card.length()-6;
		card=card.substring(s, card.length());
		user.setUserPassword(Md5Tool.getMd5(card));
		userService.add(user);
		List<Roles> r= rolesService.queryAll(new Roles());
		for (Roles roles : r) {//新增用户默认为普通用户
			if("simple".equals(roles.getRoleKey())){
				User u =  userService.querySingleUser(user.getUserName());
				UserRoles userRoles = new UserRoles();
				userRoles.setUserId(u.getUserId());
				userRoles.setRoleId(roles.getId());
				rolesService.saveUserRole(userRoles);
			}
		}
		UserRates userRates = new UserRates();
		UserRates rates =  userService.queryUserRatesById(user.getRatesId());
		user.setChannelname(rates.getChannelname());
		userRates.setChannelname(rates.getChannelname());
		userRates.setSettlementCaps(rates.getSettlementCaps());
		userRates.setUserName(user.getUserName());
		userRates.setTradingRates(user.getTradingRates());
		userRates.setSettlementCosts(user.getWorkCosts());
		userRates.setMark(rates.getMark());
		userService.saveUserRates(userRates);
		return "redirect:query.html";
	}
	@ResponseBody
	@RequestMapping("checkUserPhone")
	public Map<String, String> checkUserPhone(String userName){
		User users = this.userService.querySingleUser(userName);
		Map<String, String> map = new HashMap<String, String>();
		if (users == null) {
			map.put("data", "true");
		}else{
			map.put("data", "false");
		}
		return map;
	}
	@RequestMapping("checkUserStatus")
	public String checkUserStatus(Model model,String userId) {
		User user = userService.getById(userId);
		model.addAttribute("userInfo", user);
		return Common.ROOT_PATH+"/background/user/checkUserStatus";
	}
	
	@ResponseBody
	@RequestMapping("checkStatus")
	public String checkStatus(User user){
		userService.modify(user);
		return null;
	}
	@RequestMapping("saveUserRates")
	public String saveRates(UserRates userRates){
		userService.saveUserRates(userRates);
		return "redirect:queryUserRates.html";
	}
	/**
	 * 跑到新增界面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("addUI")
	public String addUI(Model model,HttpServletRequest request) {
		User u = (User)request.getSession().getAttribute("userSession");
		if("super".equals(u.getRoleName())||"admin".equals(u.getRoleName())){
			UserRates userRates=new UserRates();
			List<UserRates> rates=userRatesService.queryUserNull(userRates);
			model.addAttribute("rates", rates);
		}else{
			UserRates userRates=new UserRates();
			userRates.setUserName(u.getUserName());
			List<UserRates> rates=userService.queryAllUserRates(userRates);
			model.addAttribute("rates", rates);
		}
		return Common.ROOT_PATH+"/background/user/add";
	}

	/**
	 * 删除
	 * 
	 * @param model
	 * @param videoTypeId
	 * @return
	 */
	@RequestMapping("deleteById")
	public String deleteById(Model model, String userId) {
		userService.delete(userId);
		return "redirect:query.html";
	}
	@RequestMapping("queryUserRates")
	public String queryUserRates(String pageNow,Model model, UserRates userRates,HttpServletRequest request) {
		User u = (User)request.getSession().getAttribute("userSession");
		if("super".equals(u.getRoleName())||"admin".equals(u.getRoleName())){
		}else{
			userRates.setParentNumber(u.getUserId()+"");
		}
		PageView pageView = null;
		if (Common.isEmpty(pageNow)) {
			pageView = new PageView(1);
		} else {
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = userService.queryUserRates(pageView, userRates);
		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/rates/childRates";
	}
	@RequestMapping("checkRates")
	public String checkRates(Model model,String id,HttpServletRequest request) {
		User u = (User)request.getSession().getAttribute("userSession");
		if("super".equals(u.getRoleName())||"admin".equals(u.getRoleName())){
			UserRates userRates=new UserRates();
			List<UserRates> rates=userService.queryAllUserRates(userRates);
			model.addAttribute("rates", rates);
		}else{
			UserRates userRates=new UserRates();
			userRates.setUserName(u.getUserName());
			List<UserRates> rates=userService.queryAllUserRates(userRates);
			model.addAttribute("rates", rates);
		}
		UserRates userRates=userService.queryUserRatesById(id);
		model.addAttribute("userName", userRates.getUserName());
		return Common.ROOT_PATH+"/background/rates/checkRates";
	}
	@ResponseBody
	@RequestMapping("checkRatesName")
	public Map<String, String> checkRatesName(PageView pageView,UserRates userRates){
		PageView p=this.userService.queryUserRates(pageView,userRates);
		Map<String, String> map = new HashMap<String, String>();
		if (p.getRecords() == null) {
			map.put("data", "false");
		}else if (p.getRecords() != null && p.getRecords().size()!=0) {
			map.put("data", "false");
		}else{
			map.put("data", "true");
		}
		return map;
	}
	/**
	 * 修改界面
	 * 
	 * @param model
	 * @param videoTypeIds
	 * @return
	 */
	@RequestMapping("getById")
	public String getById(Model model, String userId,HttpServletRequest request) {
		User user = userService.getById(userId);
		model.addAttribute("user", user);
		User u = (User)request.getSession().getAttribute("userSession");
		if("super".equals(u.getRoleName())||"admin".equals(u.getRoleName())){
			UserRates userRates=new UserRates();
			List<UserRates> rates=userRatesService.queryUserNull(userRates);
			model.addAttribute("rates", rates);
		}else{
			UserRates userRates=new UserRates();
			userRates.setUserName(u.getUserName());
			List<UserRates> rates=userService.queryAllUserRates(userRates);
			model.addAttribute("rates", rates);
		}
		return Common.ROOT_PATH+"/background/user/edit";
	}
	@RequestMapping("show")
	public String show(Model model,HttpServletRequest request) {
		User u = userService.getById(request.getSession().getAttribute("userSessionId").toString());
		model.addAttribute("userInfo", u);
		return Common.ROOT_PATH+"/background/user/show";
	}
	/**
	 * 更新类型
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("update")
	public String update(Model model, User user,UserRoles userRoles) {
		user.setUserPassword(Md5Tool.getMd5(user.getUserPassword()));
		userService.modify(user);
		if(userRoles.getRoleId()!=null)
		rolesService.saveUserRole(userRoles);
		return "redirect:query.html";
	}
	
	@RequestMapping("edituserrates")
	public String edituserrates(Model model, String ratesId) {
		UserRates ur=userService.queryUserRatesById(ratesId);
		model.addAttribute("rates", ur);
		return Common.ROOT_PATH+"/background/rates/edituserrates";
	}
	
	@RequestMapping("updateUserRates")
	public String updateUserRates(Model model, UserRates userRates) {
		userService.updateUserRates(userRates);
		return "redirect:queryUserRates.html";
	}
	
	@ResponseBody
	@RequestMapping("updatePass")
	public String updatePass(Model model, User user) {
		user.setUserPassword(Md5Tool.getMd5(user.getUserPassword()));
		userService.modify(user);
		return null;
	}
	@RequestMapping("updatePassUI")
	public String updatePassUI() {
		return Common.ROOT_PATH+"/background/user/updatePass";
	}
	/**
	 * 删除所选的
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("deleteAll")
	public String deleteAll(Model model, String[] check) {
		for (String string : check) {
			userService.delete(string);
		}
		return "redirect:query.html";
	}
	
	/**
	 * 给用户分配角色界面
	 * @return
	 */
	@RequestMapping("userRole")
	public String userRole(Model model,String userId){
		User user = userService.getById(userId);
		model.addAttribute("user", user);
		List<Roles> roles = rolesService.queryAll(new Roles());
		model.addAttribute("roles", roles);
		return Common.ROOT_PATH+"/background/user/userRole";
	}
	/**
	 * 保存用户分配角色
	 * @return
	 */
	@ResponseBody
	@RequestMapping("allocation")
	public String allocation(Model model,UserRoles userRoles){
		String errorCode = "1000";
		try {
			rolesService.saveUserRole(userRoles);
		} catch (Exception e) {
			e.printStackTrace();
			errorCode="1001";
		}
		return errorCode;
	}
}