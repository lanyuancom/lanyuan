package com.lanyuan.util;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.GZIPInputStream;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * 模仿网站登录
 * @author lanyuan
 * 2013-7-31 下午03:41:32
 * Email:mmm333zzz520@163.com
 */
public class Jhost {
	public static void main(String[] args) {
		
		//Jhost.toJhost(u,p);
	}

	public Map<String, Object> toJhost(String username,String password){
		URL url=null;
		Map<String, Object> map=new HashMap<String, Object>();
		try {
			//网站登录
			url = new URL("http://www.jhost.cn/os/loginCheck.action?user="+username+"&pass="+password+"&module=login");
			HttpURLConnection httpConn = (HttpURLConnection) url
					.openConnection();
			httpConn.setRequestMethod("GET");
			httpConn.setConnectTimeout(15000);
			httpConn.setReadTimeout(20000);
			httpConn.connect();
			if (httpConn.getResponseCode() == 200) {
				String sessionId = "";
				String cookieVal = null;
				String key = null;
				for (int i = 1; (key = httpConn.getHeaderFieldKey(i)) != null; i++) {
					System.out.println(key + "-----"+ httpConn.getHeaderField(i));
					if (key.equalsIgnoreCase("set-cookie")) {
						cookieVal = httpConn.getHeaderField(i);
						cookieVal = cookieVal.substring(0, cookieVal
								.indexOf(";"));
						System.out.println(cookieVal);
						String[] str = sessionId.split(";");
						boolean flag = false;
						for (int t = 0; t < str.length; t++) {
							if (str[t] == cookieVal)
								flag = true;
						}
						if (!flag) {
							sessionId = sessionId + cookieVal + ";";
						}
					}
				}
				sessionId = sessionId.substring(0, sessionId.length() - 1);
				BufferedReader in = null;
				InputStream inz = httpConn.getInputStream();
				in = new BufferedReader(new InputStreamReader(inz, "UTF-8"));
				String str = httpConn.getHeaderField("Content-Encoding");
				if (str != null && str.trim().endsWith("gzip")) {
					GZIPInputStream gzin = new GZIPInputStream(inz);
					in = new BufferedReader(
							new InputStreamReader(gzin, "UTF-8"));
				}
				String line = "";
				while ((line = in.readLine()) != null) {
					if(!Common.isEmpty(line)){
						JSONObject jsobj = new JSONObject(line);
						if(jsobj.toString().indexOf("errors")>-1){
							JSONArray jsonarr = jsobj.getJSONArray("errors");
							JSONObject obj1 = jsonarr.getJSONObject(0);
							map.put("logoInfo",  obj1.getString("msg"));//网站登录
							System.out.println(line);
						}
						
					}
				}
				Object logoinfo = map.get("logoInfo");
				if(logoinfo==null){
					//查询续期时间
					url = new URL(
							"http://www.jhost.cn/user/userControl.action?start=0&limit=1000&action=USER_SERVICES");
					httpConn = (HttpURLConnection) url.openConnection();
					httpConn.setRequestMethod("GET");
					System.out.println("second:" + sessionId);
					httpConn.setRequestProperty("Cookie", sessionId);
					httpConn.setDoOutput(true);
					httpConn.setDoInput(true);
					httpConn.setConnectTimeout(15000);
					httpConn.setUseCaches(false);
					String renewalInfos = Common.readHtml(httpConn.getInputStream(),
							"UTF-8");//查询续期时间
					JSONObject jsobj = new JSONObject(renewalInfos);
					JSONArray jsonarr = jsobj.getJSONArray("root");
					map.put("renewalInfos", jsonarr.toString());
					System.out.println(renewalInfos);
				}
				//续期后返回信息
				url = new URL(
						"http://www.jhost.cn/user/userControl.action?addDay=3&action=ADD_TIME");
				httpConn = (HttpURLConnection) url.openConnection();
				httpConn.setRequestMethod("GET");
				System.out.println("second:" + sessionId);
				httpConn.setRequestProperty("Cookie", sessionId);
				httpConn.setDoOutput(true);
				httpConn.setDoInput(true);
				httpConn.setConnectTimeout(15000);
				httpConn.setUseCaches(false);
				String returnInfos = Common.readHtml(httpConn.getInputStream(),
						"UTF-8");//续期后返回信息
				System.out.println(returnInfos);
				map.put("returnInfos", returnInfos);
			} else {
				System.out.println("返回服务器状态：" + httpConn.getResponseCode()+ "　连接失败！！");
				map.put("returnInfos", "返回服务器状态：" + httpConn.getResponseCode()+ "　连接失败！！");
			}
		}catch (SocketTimeoutException e) {
			//连接超时
			System.out.println(new Date()+"连接超时："+e);
			map.put("returnInfos", new Date()+"连接超时："+e);
			return map;
		}catch (Exception e) {
			System.out.println(new Date()+" 出现异常："+e);
			map.put("returnInfos", "出现异常");
			return map;
		}
		return map;
	}
}
