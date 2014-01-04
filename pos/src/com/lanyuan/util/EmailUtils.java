package com.lanyuan.util;

import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.lanyuan.task.SpringTaskController;


/**
 * 简单的邮件发送
 * 
 * @author Administrator
 * 
 */
public class EmailUtils {

	public static void main(String[] args) throws Exception {
		Properties prop = new Properties();
		InputStream in = SpringTaskController.class.getResourceAsStream("/config.properties");
		prop.load(in);
		EmailUtils.sendMail(prop.getProperty("fromEmail"), prop.getProperty("toEmail"), prop.getProperty("emailName"), prop.getProperty("emailPassword"), "１１１１１１１１", "１１１１１１１");
	}
	/**
	 * 发送邮件　(暂时只支持163邮箱发送)
	 * @param fromEmail　发送邮箱
	 * @param toEmail　接收邮箱
	 * @param emailName　163邮箱登录名
	 * @param emailPassword　密码
	 * @param title　发送主题
	 * @param centent　发送内容
	 * @throws Exception
	 */
	public static void sendMail(String fromEmail,String toEmail,String emailName,String emailPassword,String title, String centent) throws Exception {
		
		Properties properties = new Properties();// 创建Properties对象
		properties.setProperty("mail.transport.protocol", "smtp");// 设置传输协议
		properties.put("mail.smtp.host", "smtp.163.com");// 设置发信邮箱的smtp地址
		properties.setProperty("mail.smtp.auth", "true"); // 验证
		Authenticator auth = new AjavaAuthenticator(emailName,
				emailPassword); // 使用验证，创建一个Authenticator
		Session session = Session.getDefaultInstance(properties, auth);// 根据Properties，Authenticator创建Session
		Message message = new MimeMessage(session);// Message存储发送的电子邮件信息
		message.setFrom(new InternetAddress(fromEmail));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(
				toEmail));// 设置收信邮箱
		// 指定邮箱内容及ContentType和编码方式
		message.setContent(centent, "text/html;charset=utf-8");
		message.setSubject(title);// 设置主题
		message.setSentDate(new Date());// 设置发信时间
		Transport.send(message);// 发送

	}
}

// 创建传入身份验证信息的 Authenticator类
class AjavaAuthenticator extends Authenticator {
	private String user;
	private String pwd;

	public AjavaAuthenticator(String user, String pwd) {
		this.user = user;
		this.pwd = pwd;
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(user, pwd);
	}
}