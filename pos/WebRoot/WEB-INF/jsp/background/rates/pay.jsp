<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="com.vnv.bank.common.util.MD5"%>
<%@ page import="com.vnv.bank.common.util.DateUtil"%>
<%
	/* 
	 * <p>Title: </p>
	 * <p>Description: 订单提交JSP范例</p>
	 * <p>Copyright: Copyright (c) 2007</p>
	 * <p>Company: 银生</p>
	 * @author jl
	 * @version 1.0
	 */
	request.setCharacterEncoding("UTF-8");
	String version = request.getParameter("version");
	if (version == null || version.length() == 0)
		version = "3.0.0"; //接口版本
	String requestUrl = request.getParameter("requestUrl");
	if (requestUrl == null || requestUrl.length() == 0)
		requestUrl = "https://www.unspay.com/unspay/page/linkbank/payRequest.do";
	String merchantId = request.getParameter("merchantId");
	if (merchantId == null)
		merchantId = "2120131224144601001"; //注册商户在银生的客户编号
	String merchantKey = request.getParameter("merchantKey");
	if (merchantKey == null)
		merchantKey = "123456789"; //注册商户在银生设置的密钥
	String merchantUrl = request.getParameter("merchantUrl");
	if (merchantUrl == null || merchantUrl.length() == 0)
		merchantUrl = "http://localhost:8888/pospos/submitOrder.html"; //商户反馈url
	String responseMode = request.getParameter("responseMode");
	if (responseMode == null)
		responseMode = "1"; //响应方式，1-页面响应，2-后台响应，3-两者都需
	String assuredPay = request.getParameter("assuredPay"); //是否担保支付
	if (assuredPay == null)
		assuredPay = "";
	String cardAssured = request.getParameter("cardAssured");
	if (cardAssured == null)
		cardAssured = "0";
	//订单的生成 
	String time = DateUtil.date2String(new Date(), "yyyyMMddHHmmss"); //订单创建时间
	String orderId = "GD" + time;//订单id[商户网站]
	String currencyType = "CNY"; //货币种类，暂时只支持人民币：CNY
	String amount = request.getParameter("amount");
	if (amount == null)
		amount = "1"; //支付金额
	String remark = request.getParameter("remark");
	if (remark == null)
		remark = ""; //备注，附加信息
	String bankCode = request.getParameter("bankCode"); //银行代码或者商联卡支付或者银生账户支付
	if (bankCode == null)
		bankCode = "";
	boolean b2b = Boolean.valueOf(request.getParameter("b2b"))
			.booleanValue();; //是否B2B支付
	String commodity = request.getParameter("commodity"); //商品名称
	String orderUrl = request.getParameter("orderUrl"); //订单url

	StringBuffer s = new StringBuffer();
	s.append("merchantId=").append(merchantId);
	s.append("&merchantUrl=").append(merchantUrl);
	s.append("&responseMode=").append(responseMode);
	s.append("&orderId=").append(orderId);
	s.append("&currencyType=").append(currencyType);
	s.append("&amount=").append(amount);
	s.append("&assuredPay=").append(assuredPay);
	s.append("&time=").append(time);
	s.append("&remark=").append(remark);
	s.append("&merchantKey=").append(merchantKey);
	//md5加密
	String mac = new MD5().getMD5ofStr(s.toString());
%>
<HTML>
<HEAD>
<TITLE>商户银生支付</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</HEAD>
<BODY>
	<form name="frm" method="post" target="_blank" action="<%=requestUrl%>">
		<input type="hidden" name="version" value="<%=version%>"> <input
			type="hidden" name="merchantId" value="<%=merchantId%>"> <input
			type="hidden" name="merchantUrl" value="<%=merchantUrl%>"> <input
			type="hidden" name="responseMode" value="<%=responseMode%>">
		<input type="hidden" name="orderId" value="<%=orderId%>"> <input
			type="hidden" name="amount" value="<%=amount%>"> <input
			type="hidden" name="currencyType" value="<%=currencyType%>">
		<input type="hidden" name="assuredPay" value="<%=assuredPay%>">
		<input type="hidden" name="time" value="<%=time%>"> <input
			type="hidden" name="remark" value="<%=remark%>"> <input
			type="hidden" name="mac" value="<%=mac%>"> <input
			type="hidden" name="bankCode" value="<%=bankCode%>"> <input
			type="hidden" name="b2b" value="<%=b2b%>">
		<%
			if (commodity != null) {
		%>
		<input type="hidden" name="commodity" value="<%=commodity%>">
		<%
			}
		%>
		<%
			if (orderUrl != null) {
		%>
		<input type="hidden" name="orderUrl" value="<%=orderUrl%>">
		<%
			}
		%>
	</form>
	<table border="1" width="100%" cellspacing="0" cellpadding="4"
		style="border-collapse: collapse" bgcolor="#FFFFEC" height="100%">
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
	<script type="text/javascript">
		window.setInterval("toSubmit()", 2000);
		window.setInterval("closewin()", 3000);
		var i = "0";
		function toSubmit() {
			if (i == "0") {
				document.frm.submit();
				i = "1";
			}
		}
		function closewin() {
			if (i == "1") {
				window.close();
			}
		}
	</script>
</BODY>
</HTML>