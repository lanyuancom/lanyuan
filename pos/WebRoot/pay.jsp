<%@page import="com.lanyuan.entity.User"%>
<%@page import="com.lanyuan.util.Common"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@ page import="test.md5"%>
<jsp:useBean id='oMD5' scope='request' class='test.md5'/>
<%  
	String MerchantID = request.getParameter("MerchantID");//商户号
	String PayID = request.getParameter("PayID");//支付渠道
	String TradeDate = request.getParameter("TradeDate");//下单日期
	String TransID = request.getParameter("TransID");//商户流水号
	String OrderMoney = request.getParameter("OrderMoney");//订单金额
	String oMen = OrderMoney;
	if (!"".equals(OrderMoney)) 
	{	Double a;
		a = Double.parseDouble(OrderMoney)*100; //使用分进行提交
		OrderMoney=String.valueOf(a);
	}
	else{
		OrderMoney = ("0");
	}
	String AdditionalInfo = request.getParameter("AdditionalInfo");//订单附加信息
	String Merchant_url = request.getParameter("Merchant_url");//通知商户页面端地址
	String Return_url = request.getParameter("Return_url");//服务器底层通知地址
	String NoticeType = request.getParameter("NoticeType");//通知类型	
	String Md5key = "cy7rpxdafzb98l8d";///////////md5密钥（KEY）
	String md5 =new String( MerchantID+PayID+TradeDate+TransID+OrderMoney+Merchant_url+Return_url+NoticeType+Md5key);//MD5签名格式
	String Md5Sign = oMD5.getMD5ofStr(md5);//计算MD5值
	String URL_old="https://paygate.baofoo.com/PayReceive/payindex.aspx";//借贷混合
	String URL_new="https://paygate.baofoo.com/PayReceive/bankpay.aspx";//借贷分离

	session.setAttribute("OrderMoney",oMen); //设置提交金额的Session
	session.setAttribute("Channelname",request.getParameter("Channelname"));
	session.setAttribute("tradingRates",request.getParameter("tradingRates"));//交易费率
	User u = (User)session.getAttribute("userSession");
	session.setAttribute("userName",u.getUserName());
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>充值接口-提交信息处理</title>
</head>


<body onload="pay.submit()">
<form method="post" name="pay" id="pay" action="<%=URL_old%>">
<TABLE>
<TR>
	<TD><input name='MerchantID' type='hidden' value= "<%=MerchantID%>"/>
	<input name='PayID' type='hidden' value= "<%=PayID%>"/>		
	<input name='TradeDate' type='hidden' value= "<%=TradeDate%>" />
	<input name='TransID' type='hidden' value= "<%=TransID%>" />
	<input name='OrderMoney' type='hidden' value= "<%=OrderMoney%>"/>
	<input name='AdditionalInfo' type='hidden' value= "<%=AdditionalInfo%>"/>
	<input name='Merchant_url' type='hidden' value= "<%=Merchant_url%>"/>
	<input name='Return_url' type='hidden' value= "<%=Return_url%>"/>	
	<input name= 'Md5Sign' type='hidden' value="<%=Md5Sign%>"/>
	<input name='NoticeType' type='hidden' value= "<%=NoticeType%>"/>
	</TD>
</TR>
</TABLE>
	
</form>	

</body>
</html>
