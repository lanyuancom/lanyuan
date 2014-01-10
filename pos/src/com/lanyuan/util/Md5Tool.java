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
		System.err.println(Md5Tool.getMd5("123456"));
		
	}
}
