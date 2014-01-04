package com.lanyuan.util;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * session监听器
 *这个类是创建session监听
 *和摧毁session
 *w为了防止用户在购物时又打开另一个
 *新窗口购物．当关闭原先的浏览器时
 *购物车不会丢失
 * @author Administrator
 *
 */
public class SiteSessionListener implements HttpSessionListener {

	/**
	 * 定义一个集合　存放session
	 */
	private static Map<String,HttpSession> sessions = new HashMap<String,HttpSession>();
	
	private static String sessionID = null;
	
	//为个是创建session
	public void sessionCreated(HttpSessionEvent sessionEvent) {
		//通过sessionEvent这个session事件　获得sessionID．
		//然后放进session
		//System.out.println("session  id   ======= "+sessionEvent.getSession().getId());
		sessionID =sessionEvent.getSession().getId();
		sessions.put(sessionID, sessionEvent.getSession());

	}
	
	public static String getSessionID() {
		return sessionID;
	}

	//当session超时，要在集合中清除session
	//为样可以防止内在泄漏
	public void sessionDestroyed(HttpSessionEvent sessionEvent) {
		// TODO Auto-generated method stub
		sessions.remove(sessionEvent.getSession().getId());
	}

	//获得原先用户的session
	public static HttpSession getSession(String sessionID){
		return sessions.get(sessionID);
	}

	
}
