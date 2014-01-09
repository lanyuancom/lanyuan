package com.lanyuan.util;

import java.security.MessageDigest;
import java.sql.DriverManager;
import java.sql.ResultSet;

import sun.misc.BASE64Encoder;

import java.sql.*;

/**
 * MD5加密
 * @author lanyuan
 * @date 2014-1-1
 * @Email: mmm333zzz520@163.com
 * @version 1.0v
 */
public class Md5Tool {
	
	public static String getMd5(String password){
		String str = "";
		if(password !=null && !password.equals("")){
			try {
				MessageDigest md = MessageDigest.getInstance("MD5");
				BASE64Encoder base = new BASE64Encoder();
				//加密后的字符串
				str = base.encode(md.digest(password.getBytes("utf-8")));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return str;
	}
	public static void main(String[] args) {
		//驱动程序名

		String driverName="com.mysql.jdbc.Driver";

		//数据库用户名

		String userName="root";

		//密码

		String userPasswd="root";

		//数据库名

		String dbName="pos";

		//表名

		String tableName="payment";

		//联结字符串

		String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;

		

//		Connection connection=DriverManager.getConnection(url);
//
//		Statement statement = connection.createStatement();
//		String username=(String)session.getAttribute("userName");
//		String Channelname=(String)session.getAttribute("Channelname");
//		String sql="INSERT INTO `payment`(orderId,userName,tradingMoney,realMoney,channelname,payState)  VALUES ('"+TransID+"', '"+username+"', '"+OrderMoney+"', '"+realMoney+"','"+Channelname+"', '"+Result+"');";
//		statement.executeUpdate(sql);

		

		 try {
			 Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection(url);
			Statement st = conn.createStatement();
			String sql2 = "SELECT amountMoney,tradingRates,workCosts,afterWorkCosts,payMoney,userId,userName" + " FROM user where userName = 'super'";
			ResultSet set = st.executeQuery(sql2);
			while (set.next()) 
            {
				String amountMoney = set.getString("amountMoney");  
				System.err.println(Common.isEmpty(amountMoney));
            }
			
			set.close();
			st.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
