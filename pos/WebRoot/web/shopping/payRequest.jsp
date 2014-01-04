<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.vnv.bank.common.util.MD5"%>
<%
	String merchantId = request.getParameter("merchantId");
	String merchantKey = "111111"; //密钥
	String responseMode = request.getParameter("responseMode");
    String orderId = request.getParameter("orderId");
    String currencyType = request.getParameter("currencyType");
    String amount = request.getParameter("amount");
	String returnCode = request.getParameter("returnCode");
	String returnMessage = request.getParameter("returnMessage"); 
	String mac = request.getParameter("mac") ;
	
	boolean success = "0000".equals(returnCode);
	boolean paid = "0001".equals(returnCode);
	
	StringBuffer s = new StringBuffer(50);
	//拼成数据串
	s.append("merchantId=").append(merchantId);
	s.append("&responseMode=").append(responseMode);
	s.append("&orderId=").append(orderId);
	s.append("&currencyType=").append(currencyType);
	s.append("&amount=").append(amount);
	s.append("&returnCode=").append(returnCode);
	s.append("&returnMessage=").append(returnMessage);
	s.append("&merchantKey=").append(merchantKey);
	
	//md5加密 
	String nowMac = new MD5().getMD5ofStr(s.toString());
	if(nowMac.equals(mac)){ //若mac校验匹配
	
	}else{  //若mac校验不匹配
		if(success||paid){
			success = false;
			paid = false;
			returnCode = "0401";
			returnMessage = "mac值校验错误！";
		}
	}
%>
<HTML>
	<HEAD>
		<TITLE>模拟商户支付响应</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<META content="MSHTML 6.00.2800.1106" name=GENERATOR>
				<style type="text/css">
<!--
body,td,p,li,input,select {FONT-SIZE:12px;text-decoration: none;line-height:18px}
.ncss {
	font-size: 12px;
	text-decoration: none;
	line-height: 18px;
}
.n2 {
	font-size: 11pt;
	line-height: 18px;
	text-decoration: none;
	color: #363636;
	font-weight: bold;
}
.login {
	font-size: 13px;
	font-weight: bold;
	color: #333333;
	line-height: 18px;
}
.lan {
	font-size: 12px;
	font-weight: bold;
	color: #003399;
}
.xin {
	color: #FF0000;
	font-size: 9pt;
	text-decoration: none;
; font-weight: bold
}
.xt {
	font-size: 12px;
	line-height: 18px;
	text-decoration: none;
	font-weight: bold;
	color: #000000;
}
.lan {  line-height: 18px; text-decoration: none}
a:link {
	color: #003399;
	text-decoration: underline;
}
a:visited {
	text-decoration: underline;
	color: #003399;
}
a:hover {
	text-decoration: none;
	color: #6FB7FF;
}
a:active {
	text-decoration: underline;
	color: #000000;
}
body {
	margin-left: 0px;
	margin-top: 0px;
}
.style8 {
	color: #000066;
	font-weight: bold;
	font-size: 16;
}
.style1 {font-size: 16px}

-->
</style>

<!--
body,td,p,li,input,select {FONT-SIZE:12px;text-decoration: none;line-height:18px}
.ncss {
	font-size: 12px;
	text-decoration: none;
	line-height: 18px;
}
.n2 {
	font-size: 11pt;
	line-height: 18px;
	text-decoration: none;
	color: #363636;
	font-weight: bold;
}
.login {
	font-size: 13px;
	font-weight: bold;
	color: #333333;
	line-height: 18px;
}
.lan {
	font-size: 12px;
	font-weight: bold;
	color: #003399;
}
.xin {
	color: #FF0000;
	font-size: 9pt;
	text-decoration: none;
; font-weight: bold
}
.xt {
	font-size: 12px;
	line-height: 18px;
	text-decoration: none;
	font-weight: bold;
	color: #000000;
}
.lan {  line-height: 18px; text-decoration: none}
a:link {
	color: #003399;
	text-decoration: underline;
}
a:visited {
	text-decoration: underline;
	color: #003399;
}
a:hover {
	text-decoration: none;
	color: #6FB7FF;
}
a:active {
	text-decoration: underline;
	color: #000000;
}
body {
	margin-left: 0px;
	margin-top: 0px;
}
.style8 {
	color: #000066;
	font-weight: bold;
	font-size: 16;
}
.style1 {font-size: 16px}

-->

	</HEAD>
	<BODY>

		
<DIV align=center class="style1"> <span class="style8"><br>
  网上花店<br>
  </span> 
  <table width="751" border="0" cellpadding="4" cellspacing="1" bgcolor="#F6F9FF" id="table">
    <tr>
					<td width="50" height="1" bgcolor="#D8D8D8"></td>
				</tr>
				<tr>
					<td align="center">
						<table width="96%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="1"><strong>假设本页面是在商户网站上</strong></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="39" style="color:#3F5786;padding-left:18px">
						<span style="font-size:14px"> 订单号：<%=orderId%></span>
					</td>
				</tr>
				<tr>
					<td height="39" style="color:#3F5786;padding-left:18px">
						<span style="font-size:14px"> 支付金额：<%=amount%></span>
					</td>
				</tr>
				<% if(success) {%>
				<tr>
					<td height="39" style="color:#3F5786;padding-left:18px">
						<span style="font-size:14px"> 模拟商户网站接受银生的数据：交易成功</span>
					</td>
				</tr>
				<% } else if(paid) {%>
				<tr>
					<td height="39" style="color:#3F5786;padding-left:18px">
						<span style="font-size:14px"> 模拟商户网站接受银生的数据：买方已付款，等待商户发货</span>
					</td>
				</tr>
                <% } else if("0002".equals(returnCode)) {%>
                <tr>
                    <td height="39" style="color:#3F5786;padding-left:18px">
                        <span style="font-size:14px"> 模拟商户网站接受银生的数据：卖方已发货，等待买方确认</span>
                    </td>
                </tr>
                <% } else if("0006".equals(returnCode)) {%>
                <tr>
                    <td height="39" style="color:#3F5786;padding-left:18px">
                        <span style="font-size:14px"> 模拟商户网站接受银生的数据：交易取消</span>
                    </td>
                </tr>
                <% } else if("0007".equals(returnCode)) {%>
                <tr>
                    <td height="39" style="color:#3F5786;padding-left:18px">
                        <span style="font-size:14px"> 模拟商户网站接受银生的数据：买方申请退款</span>
                    </td>
                </tr>
                <% } else if("0008".equals(returnCode)) {%>
                <tr>
                    <td height="39" style="color:#3F5786;padding-left:18px">
                        <span style="font-size:14px"> 模拟商户网站接受银生的数据：卖方拒绝退款，进入争议处理</span>
                    </td>
                </tr>
                <% } else if("0009".equals(returnCode)) {%>
                <tr>
                    <td height="39" style="color:#3F5786;padding-left:18px">
                        <span style="font-size:14px"> 模拟商户网站接受银生的数据：退款成功</span>
                    </td>
                </tr>
                <% } else if("0011".equals(returnCode)) {%>
                <tr>
                    <td height="39" style="color:#3F5786;padding-left:18px">
                        <span style="font-size:14px"> 模拟商户网站接受银生的数据：等待银行反馈</span>
                    </td>
                </tr>
				<% } else {%>
				<tr>
					<td height="39" style="color:#3F5786;padding-left:18px">
						<span style="font-size:14px"> 模拟商户网站接受银生的数据：付款出错，错误信息如下：</span>
					</td>
				</tr>
				<tr>
					<td height="39" style="color:#FF0000;padding-left:18px">
						[<%=returnCode%>]<%=returnMessage%>
					</td>
				</tr>
				<% } %>
				<tr>
					<td height="1" bgcolor="#D8D8D8"></td>
				</tr>
			</table>
		</DIV>
	</BODY>
</HTML>
