package com.lanyuan.log;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lanyuan.dao.LogDao;
import com.lanyuan.entity.Log;
import com.lanyuan.util.Common;
import com.lanyuan.util.SysContent;

/**
 * AOP注解方法实现日志管理 利用spring AOP 切面技术记录日志 定义切面类（这个是切面类和切入点整天合在一起的),这种情况是共享切入点情况;
 * 
 * @author lanyuan 2013-11-19
 * @Email: mmm333zzz520@163.com
 * @version 1.0v
 */
@Aspect
// 该注解标示该类为切面类
@Component
public class LogAopAction {
	@Autowired
	private LogDao logDao;
	
	@Around("execution(* com.lanyuan.service.impl.*.* (..))")
	public Object logAll(ProceedingJoinPoint point) {
		Object result = null;
		// 执行方法名
		String methodName = point.getSignature().getName();
		String className = point.getTarget().getClass().getSimpleName();
		String user = null;
		Long start = 0L;
		Long end = 0L;
		String ip = null;
		// 当前用户
		try {
			// 执行方法所消耗的时间
			start = System.currentTimeMillis();
			result = point.proceed();
			end = System.currentTimeMillis();
			 HttpServletRequest request = SysContent.getRequest();  
			// ip
			ip = Common.toIpAddr(request);
			// 登录名
			user = Common.getAuthenticatedUsername();
			// System.out.println("Username:" +user);
		} catch (Throwable e) {
			// e.printStackTrace();
		}
		String name = null;
		// 操作范围
		if (className.indexOf("Resources") > -1) {
			name = "资源管理";
		} else if (className.indexOf("Roles") > -1) {
			name = "角色管理";
		} else if (className.indexOf("User") > -1) {
			name = "用户管理";
		}else{
			name=className;
		}
		// 操作类型
		String opertype = "";
		if (methodName.indexOf("saveUserRole") > -1) {
			opertype = "update用户的角色";
		} else if (methodName.indexOf("saveRoleRescours") > -1) {
			opertype = "update角色的权限";
		} else if (methodName.indexOf("add") > -1 || methodName.indexOf("save") > -1) {
			opertype = "save操作";
		} else if (methodName.indexOf("update") > -1 || methodName.indexOf("modify") > -1) {
			opertype = "update操作";
		} else if (methodName.indexOf("delete") > -1) {
			opertype = "delete操作";
		}else{
			opertype=methodName;
		}
		String[] clazz = {"get","find","query","count","login"};
		boolean b = false;
		for (int i = 0; i < clazz.length; i++) {
			if(opertype.indexOf(clazz[i])>-1){
				b=true;
			}
		}
		if(!b){
			Long time = end - start;
			Log log = new Log();
			log.setUsername(user);
			log.setModule(name);
			log.setAction(opertype);
			log.setActionTime(time.toString());
			log.setUserIP(ip);
			logDao.add(log);
		}
		return result;
	}
}
