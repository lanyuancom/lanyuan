package com.lanyuan.security;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.web.FilterInvocation;
import org.springframework.stereotype.Service;
/**
 * 核心的InterceptorStatusToken token = super.beforeInvocation(fi);会调用我们定义的accessDecisionManager:decide(Object object)和securityMetadataSource
 
  :getAttributes(Object object)方法。
 * 自己实现的过滤用户请求类，也可以直接使用 FilterSecurityInterceptor
 * 
 * AbstractSecurityInterceptor有三个派生类：
 * FilterSecurityInterceptor，负责处理FilterInvocation，实现对URL资源的拦截。
 * MethodSecurityInterceptor，负责处理MethodInvocation，实现对方法调用的拦截。
 * AspectJSecurityInterceptor，负责处理JoinPoint，主要是用于对切面方法(AOP)调用的拦截。
 * 
 * 还可以直接使用注解对Action方法进行拦截，例如在方法上加：
 * @PreAuthorize("hasRole('ROLE_SUPER')")
 * 
 * 
 * @author lanyuan
 * 2013-11-19
 * @Email: mmm333zzz520@163.com
 * @version 1.0v
 */
@Service
public class MySecurityFilter extends AbstractSecurityInterceptor implements Filter {
	//与applicationContext-security.xml里的myFilter的属性securityMetadataSource对应，
	//其他的两个组件，已经在AbstractSecurityInterceptor定义
	@Autowired
	private MySecurityMetadataSource securityMetadataSource;
	@Autowired
	private MyAccessDecisionManager accessDecisionManager;
	@Autowired
	private AuthenticationManager myAuthenticationManager; 
	
	@PostConstruct
	public void init(){
//		System.err.println(" ---------------  MySecurityFilter init--------------- ");
		super.setAuthenticationManager(myAuthenticationManager);
		super.setAccessDecisionManager(accessDecisionManager);
	}
	
	@Override
	public SecurityMetadataSource obtainSecurityMetadataSource() {
		return this.securityMetadataSource;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		FilterInvocation fi = new FilterInvocation(request, response, chain);
		invoke(fi);
	}
	
	private void invoke(FilterInvocation fi) throws IOException, ServletException {
		// object为FilterInvocation对象
                  //super.beforeInvocation(fi);源码
		//1.获取请求资源的权限
		//执行Collection<ConfigAttribute> attributes = SecurityMetadataSource.getAttributes(object);
		//2.是否拥有权限
		//this.accessDecisionManager.decide(authenticated, object, attributes);
//		System.err.println(" ---------------  MySecurityFilter invoke--------------- ");
		InterceptorStatusToken token = super.beforeInvocation(fi);
		try {
			fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
		} finally {
			super.afterInvocation(token, null);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
	}
	
	public void destroy() {
		
	}

	@Override
	public Class<? extends Object> getSecureObjectClass() {
		//下面的MyAccessDecisionManager的supports方面必须放回true,否则会提醒类型错误
		return FilterInvocation.class;
	}
}