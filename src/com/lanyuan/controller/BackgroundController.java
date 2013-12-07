package com.lanyuan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.dao.UserDao;
import com.lanyuan.entity.Resources;
import com.lanyuan.entity.User;
import com.lanyuan.entity.UserLoginList;
import com.lanyuan.service.ResourcesService;
import com.lanyuan.service.UserLoginListService;
import com.lanyuan.util.Common;

/**
 * 进行管理后台框架界面的类
 * @author lanyuan
 * 2013-11-19
 * @Email: mmm333zzz520@163.com
 * @version 1.0v
 */
@Controller
@RequestMapping ("/background/")
public class BackgroundController
{
	@Autowired
	private UserDao userDao;
	@Autowired
	private UserLoginListService userLoginListService;
	@Autowired
	private ResourcesService resourcesService;
	@Autowired
	private AuthenticationManager myAuthenticationManager;
	/**
	 * @return
	 */
	@RequestMapping ("login")
	public String login(Model model,HttpServletRequest request)
	{
		//重新登录时销毁该用户的Session
		Object o = request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		if(null != o){
			request.getSession().removeAttribute("SPRING_SECURITY_CONTEXT");
		}
		return "/background/framework/login";
	}
	
	@RequestMapping ("loginCheck")
	public String loginCheck(String username,String password,HttpServletRequest request){
		try {
			if (!request.getMethod().equals("POST")) {
				request.setAttribute("error","支持POST方法提交！");
			}
			if (Common.isEmpty(username) || Common.isEmpty(password)) {
				request.setAttribute("error","用户名或密码不能为空！");
				return "/background/framework/login";
			}
			// 验证用户账号与密码是否正确
			User users = this.userDao.querySingleUser(username);
			if (users == null || !users.getUserPassword().equals(password)) {
				request.setAttribute("error", "用户或密码不正确！");
			    return "/background/framework/login";
			}
			Authentication authentication = myAuthenticationManager
					.authenticate(new UsernamePasswordAuthenticationToken(username,password));
			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(authentication);
			HttpSession session = request.getSession(true);  
		    session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);  
		    // 当验证都通过后，把用户信息放在session里
			request.getSession().setAttribute("userSession", users);
			// 记录登录信息
			UserLoginList userLoginList = new UserLoginList();
			userLoginList.setUserId(users.getUserId());
			userLoginList.setLoginIp(Common.toIpAddr(request));
			userLoginListService.add(userLoginList);
		} catch (AuthenticationException ae) {  
			request.setAttribute("error", "登录异常，请联系管理员！");
		    return "/background/framework/login";
		}
		return "redirect:index.html";
	}
	
	/**
	 * @return
	 */
	@RequestMapping ("index")
	public String index(Model model)
	{
		return "/background/framework/main";
	}
	
	@RequestMapping ("top")
	public String top(Model model)
	{
		return "/background/framework/top";
	}
	
	@RequestMapping ("left")
	public String left(Model model,HttpServletRequest request)
	{
		try {
			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				        

			//String username = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String username = request.getUserPrincipal().getName();
			List<Resources> resources = resourcesService.getResourcesByUserName(username);
			model.addAttribute("resources", resources);
		} catch (Exception e) {
			//重新登录时销毁该用户的Session
			request.getSession().removeAttribute("SPRING_SECURITY_CONTEXT");
		}
		return "/background/framework/left";
	}
	
	@RequestMapping ("tab")
	public String tab(Model model)
	{
		return "/background/framework/tab/tab";
	}
	
	@RequestMapping ("center")
	public String center(Model model)
	{
		return "/background/framework/center";
	}
	
}
