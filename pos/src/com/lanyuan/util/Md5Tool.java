package com.lanyuan.util;

import java.math.BigDecimal;
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
		Double a = 99.7;
		Double b = Double.parseDouble("90");
		System.out.println(Md5Tool.sub(a, b));
		
		
	}
	public static double sub(double v1,double v2){
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.subtract(b2).doubleValue();
    } 
}
