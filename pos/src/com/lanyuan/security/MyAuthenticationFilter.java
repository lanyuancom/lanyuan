package com.lanyuan.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.lanyuan.dao.UserDao;
import com.lanyuan.entity.User;
import com.lanyuan.entity.UserLoginList;
import com.lanyuan.service.UserLoginListService;
import com.lanyuan.service.UserService;
import com.lanyuan.util.Common;

/**
 * 这个类主要是用户登录验证
 * @author lanyuan
 * 2013-6-7 下午03:53:07
 * Email:mmm333zzz520@163.com
 */
public class MyAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	private static final String USERNAME = "username";
	private static final String PASSWORD = "password";

	@Autowired
	private UserDao userDao;
	@Autowired
	private UserLoginListService userLoginListService;
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
		if (!request.getMethod().equals("POST")) {
			throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
		}

		String username = obtainUsername(request).trim();
		String password = obtainPassword(request).trim();
		//System.out.println(">>>>>>>>>>000<<<<<<<<<< username is " + username);
		if (Common.isEmpty(username)|| Common.isEmpty(password)) {
			BadCredentialsException exception = new BadCredentialsException("用户名或密码不能为空！");//在界面输出自定义的信息！！
			throw exception;
		}

		// 验证用户账号与密码是否正确
		User users = this.userDao.querySingleUser(username);
		if (users == null || !users.getUserPassword().equals(password)) {
			BadCredentialsException exception = new BadCredentialsException("用户名或密码不匹配！");//在界面输出自定义的信息！！
			//request.setAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, exception);
			throw exception;
		}
		//当验证都通过后，把用户信息放在session里
		request.getSession().setAttribute("userSession", users);
		//记录登录信息
		UserLoginList userLoginList = new UserLoginList();
		userLoginList.setUserId(users.getUserId());
		System.out.println("userId----"+users.getUserId()+"---ip--"+Common.toIpAddr(request));
		userLoginList.setLoginIp(Common.toIpAddr(request));
		userLoginListService.add(userLoginList);
		// 实现 Authentication
		UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
		// 允许子类设置详细属性
		setDetails(request, authRequest);

		// 运行UserDetailsService的loadUserByUsername 再次封装Authentication
		return this.getAuthenticationManager().authenticate(authRequest);
	}

	@Override
	protected String obtainUsername(HttpServletRequest request) {
		Object obj = request.getParameter(USERNAME);
		return null == obj ? "" : obj.toString();
	}

	@Override
	protected String obtainPassword(HttpServletRequest request) {
		Object obj = request.getParameter(PASSWORD);
		return null == obj ? "" : obj.toString();
	}
	
	@Override
	protected void setDetails(HttpServletRequest request, UsernamePasswordAuthenticationToken authRequest) {
		super.setDetails(request, authRequest);
	}
}
