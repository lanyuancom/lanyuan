package com.lanyuan.util;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * spring AOP获得session
由于Spring 的AOP面向切面编程，与Servlet容器没有任何关联，所以想要获得Session会话比较麻烦。
当然Struts2同样不依赖Servlet容器，可以在Spring AOP中可以使用com.opensymphony.xwork2.ActionContext，就可以获得Session。
但是在Servlet中或struts1中，可以通过ThreadLocal方式将session保存，Spring AOP中获得Session对象。

//这个是保存request和session的类
 * @author lanyuan
 * @date 2014-1-9
 * @Email: mmm333zzz520@163.com
 * @version 1.0v
 */
public class SysContent {  
    private static ThreadLocal<HttpServletRequest> requestLocal= new ThreadLocal<HttpServletRequest>();  
    private static ThreadLocal<HttpServletResponse> responseLocal= new ThreadLocal<HttpServletResponse>();  
      
   public static HttpServletRequest getRequest() {  
       return (HttpServletRequest)requestLocal.get();  
   }  
   public static void setRequest(HttpServletRequest request) {  
       requestLocal.set(request);  
   }  
   public static HttpServletResponse getResponse() {  
       return (HttpServletResponse)responseLocal.get();  
   }  
   public static void setResponse(HttpServletResponse response) {  
       responseLocal.set(response);  
   }  
   public static HttpSession getSession() {  
       return (HttpSession)((HttpServletRequest)requestLocal.get()).getSession();  
   }  
} 
