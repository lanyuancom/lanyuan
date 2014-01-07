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
	if (!"".equals(OrderMoney)) 
	{	Double a;
		a = Double.parseDouble(OrderMoney)*100; //使用分进行提交
		OrderMoney=String.valueOf(a);
	}
	else{
		OrderMoney = ("0");
	}
	String Merchant_url = request.getParameter("Merchant_url");//通知商户页面端地址
	String Return_url = request.getParameter("Return_url");//服务器底层通知地址
	String NoticeType = request.getParameter("NoticeType");//通知类型	
	String Md5key = "gamzkmjdrbpbct9v";///////////md5密钥（KEY）
	String md5 =new String( MerchantID+PayID+TradeDate+TransID+OrderMoney+Merchant_url+Return_url+NoticeType+Md5key);//MD5签名格式
	String Md5Sign = oMD5.getMD5ofStr(md5);//计算MD5值
	String URL_old="https://paytest.baofoo.com/PayReceive/payindex.aspx";//借贷混合
	String URL_new="https://paytest.baofoo.com/PayReceive/bankpay.aspx";//借贷分离

	session.setAttribute("OrderMoney",OrderMoney); //设置提交金额的Session
 %>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>充值接口-提交信息处理</title>
</head>

<body>
<table border="1" width="100%" cellspacing="0" cellpadding="4"
		style="border-collapse: collapse;height: 100%" bgcolor="#FFFFEC">
		<tr>
			<td bgcolor="#3399FF" style="font-size:12px;color:#ffffff" height=24>正在加载中...</td>
		</tr>
		<tr>
			<td style="font-size:12px;line-height:200%" align=center>正在加载页面中...请耐心等待.....<br>

				<marquee style="border:1px solid #000000" direction="right"
					width="300" scrollamount="5" scrolldelay="10" bgcolor="#ECF2FF">
					<table cellspacing="1" cellpadding="0">
						<tr height=8>
							<td bgcolor=#3399FF width=8></td>
							<td></td>
							<td bgcolor=#3399FF width=8></td>
							<td></td>
							<td bgcolor=#3399FF width=8></td>
							<td></td>
							<td bgcolor=#3399FF width=8></td>
							<td></td>
						</tr>
					</table>
				</marquee>
			</td>
		</tr>
	</table>
<form method="post" name="pay" id="pay" action="<%=URL_old%>" target="_blank">
<input name='MerchantID' type='hidden' value= "<%=MerchantID%>"/>
	<input name='PayID' type='hidden' value= "<%=PayID%>"/>		
	<input name='TradeDate' type='hidden' value= "<%=TradeDate%>" />
	<input name='TransID' type='hidden' value= "<%=TransID%>" />
	<input name='OrderMoney' type='hidden' value= "<%=OrderMoney%>"/>
	<input name='Merchant_url' type='hidden' value= "<%=Merchant_url%>"/>
	<input name='Return_url' type='hidden' value= "<%=Return_url%>"/>	
	<input name= 'Md5Sign' type='hidden' value="<%=Md5Sign%>"/>
	<input name='NoticeType' type='hidden' value= "<%=NoticeType%>"/>
	
</form>	

<script type="text/javascript">
		window.setInterval("toSubmit()", 2000);
		window.setInterval("closewin()", 4000);
		var i = "0";
		function toSubmit() {
			if (i == "0") {
				document.pay.submit();
				i = "1";
			}
		}
		function closewin() {
			if (i == "1") {
				window.close();
			}
		}
	</script>
</body>
</html>
