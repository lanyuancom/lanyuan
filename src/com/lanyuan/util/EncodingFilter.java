package com.lanyuan.util;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * 对HTTP请求进行编码
 * @author lanyuan
 * 2013-11-19
 * @Email: mmm333zzz520@163.com
 * @version 1.0v
 */
public class EncodingFilter implements Filter {

	/**
	 * 默认编码
	 */
	public static final String DEFAULT_ENCODING = "UTF-8";

	/**
	 * 过滤器参数
	 */
	public static final String ENCODING = "encoding";

	/**
	 *编码
	 */
	private String encoding;
	
	/**
	 * 对请求进行代理
	 */
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest) req;
		if(request.getMethod().toUpperCase().equals("GET")){
			req =new RequestWrapper((HttpServletRequest) req);
		}else{
			req.setCharacterEncoding(encoding);
		}
		res.setCharacterEncoding(encoding);
		chain.doFilter(req, res);
	}

	/**
	 * do nothing
	 */
	public void destroy() {
	}


	/**
	 * 初始化编码
	 */
	public void init(FilterConfig config) throws ServletException {
		String encoding = config.getInitParameter(ENCODING);
		if (encoding == null) {
			this.encoding = DEFAULT_ENCODING;
		} else {
			this.encoding = encoding;
		}
	}

	/**
	 * 方法处理映射
	 */
	private static final Map<String, Integer> methods = new HashMap<String, Integer>();
	static {
		methods.put("getParameter", 0);
		methods.put("getParameterValues", 1);
		methods.put("getParameterMap", 2);
	}
	
	/**
	 * HTTP请求包装
	 * @author lj
	 *
	 */
	class RequestWrapper extends HttpServletRequestWrapper {
		/**
		 * 参数名与值映射
		 */
		private Map<String, String[]> map = null;
		
		private String uri;
		private StringBuffer url;

		/**
		 * 对请求进行包装
		 * @param request
		 */
		@SuppressWarnings("unchecked")
		public RequestWrapper(HttpServletRequest request) {
			super(request);
			map = new HashMap<String, String[]>();
			Map<String, String[]> m = request.getParameterMap();
			try {
				for(Entry<String, String[]> set : m.entrySet()){
					int k=0;
					for(String v : set.getValue()){
						set.getValue()[k++] = new String(v.getBytes("ISO8859-1"), encoding);
					}
					map.put(set.getKey(), set.getValue());
				}
				map = Collections.unmodifiableMap(map);
				uri=request.getRequestURI();
				url=request.getRequestURL();
			} catch (UnsupportedEncodingException e) {
				throw new UnsupportedOperationException(e);
			}
		}

		@Override
		public StringBuffer getRequestURL(){
			return url;
		}

		@Override
		public String getRequestURI(){
			return uri;
		}

		@Override
		public String getParameter(String name){
			String[] value = map.get(name);
			if(value!=null){
				switch(value.length){
				case 0:
					return "";
				case 1:
					return value[0];
				default:
					StringBuilder rs=new StringBuilder();
					for(String v:value){
						rs.append(',');
						rs.append(v);
					}
					return rs.substring(1);
				}
			}
			return null;
		}

		@Override
		public String[] getParameterValues(String name){
			return map.get(name);
		}

		@Override
		public Map<String,String[]> getParameterMap(){
			return map;
		}
	}


}
