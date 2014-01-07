<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@page import="java.text.*"%>
<% 	//获取当前交易时间
	Date currTime = new Date();
    //时间以yyyy-MM-dd HH:mm:ss的方式表示
    SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.CHINA);
    //时间以yyyyMMDDHHmmss的方式表示 
    SimpleDateFormat formatter2 = new SimpleDateFormat("yyyyMMddHHmmss",Locale.CHINA);
    String webdate=new String(formatter1.format(currTime));
    String TradeDate=new String(formatter2.format(currTime));

	String MerchantID = "100754";//分配的商户号
	String TransID = MerchantID + TradeDate;//生成商户流水号
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'money.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/jquery_1_7_2_min.js"></script>
<%@include file="../../common/common-css.jsp"%>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function sub() {
	var amount = document.getElementById("OrderMoney").value;
		if (amount != "") {
		var f=$("form").serialize();
			var url = "${pageContext.servletContext.contextPath }/background/rates/pay.html?"
					+ f;
			//window.open (url, 'newwindow', 'height=100, width=400, top=200, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); //这句要写成一
			var h_sp1 = 80;
			var w_sp1 = 450;
			//兼容IE，firefox,google.模态窗口居中问题
			var iTop2 = (window.screen.availHeight - 20 - h_sp1) / 2;
			var iLeft2 = (window.screen.availWidth - 10 - w_sp1) / 2;
			var params = 'menubar:no;dialogHeight='
					+ h_sp1
					+ 'px;dialogWidth='
					+ w_sp1
					+ 'px;dialogLeft='
					+ iLeft2
					+ 'px;dialogTop='
					+ iTop2
					+ 'px;resizable=yes;scrollbars=0;resizeable=0;center=yes;location:no;status:no;scroll:no'
			window.showModalDialog(url, window, params);
		}else{
			alert("请输入支付金额！");
		}
	}
</script>
</head>

<body>

<form method="post" name="form1" id="form1" action="${pageContext.servletContext.contextPath }/background/rates/pay.html">
	<table class="ttab" height="100" width="70%" border="0" cellpadding="0"
		cellspacing="1" align="center">
		<tr>
			<td height="30" colspan="2">
				<div align="center">
					<font color="blue" size="4"><b>立即支付</b>
					</font>
				</div></td>
		</tr>
		<tr>
			<td height="30" width="20%">
				<div align="right" class="STYLE1">商户名称：</div></td>
			<td>
				<div align="left" class="STYLE1" style="padding-left:10px;">
					宝付公司
				</div></td>
		</tr>
		<tr>
			<td height="30" width="20%">
				<div align="right" class="STYLE1">收款方：</div></td>
			<td>
				<div align="left" class="STYLE1" style="padding-left:10px;">
					宝付公司
				</div></td>
		</tr>
		<tr>
			<td height="30" width="20%">
				<div align="right" class="STYLE1">选择支付方式：</div></td>
			<td>
				<div align="left" class="STYLE1" style="padding-left:10px;">
					<select name="PayID" id="PayID" ><!--充值方式，神州行1 联通2 电信3 盛大11 完美12 征途14 骏网一卡通15 网易 16 网银支付总1000-->
			    <option value="1">神州行</option>
                <option value="2">联通卡</option>
                <option value="3">电信卡</option>
                <option value="11">盛大卡</option>
                <option value="12">完美卡</option>
                <option value="14">征途卡</option>
                <option value="15">骏网一卡通</option>
                <option value="16">网易卡</option>
				<option value="1000">网银支付（总）</option>
				<option value="1001">招商银行</option>
				<option value="1002">工商银行</option>
				<option value="1003">建设银行</option>
				<option value="1004">浦发银行</option>
				<option value="1005">农业银行</option>
				<option value="1006">民生银行</option>
				<option value="1009">兴业银行</option>
				<option value="1020">交通银行</option>
				<option value="1022">光大银行</option>
				<option value="1026">中国银行</option>
				<option value="1032">北京银行</option>		
				<option value="1035">平安银行</option>
				<option value="1036">广发银行</option>
				<option value="1039">中信银行</option>
				<option value="1080">银联在线</option>
      </select>
      <input width="350" type="hidden" name="MerchantID" value="<%=MerchantID%>"/>
				</div></td>
		</tr>
		<tr>
			<td height="30" width="20%">
				<div align="right" class="STYLE1">交易时间：</div></td>
			<td>
				<div align="left" class="STYLE1" style="padding-left:10px;">
				<%=TradeDate%>
					<input name='TradeDate' type="hidden" value= "<%=TradeDate%>" />
				</div></td>
		</tr>
		<tr>
			<td height="30" width="20%">
				<div align="right" class="STYLE1">商户流水号:：</div></td>
			<td>
				<div align="left" class="STYLE1" style="padding-left:10px;">
				<%=TransID%>
					<input width="350" type="hidden"  name="TransID" value="<%=TransID%>" />
				</div></td>
		</tr>
		<tr>
			<td height="30" width="20%">
				<div align="right" class="STYLE1">支付金额：</div></td>
			<td>
				<div align="left" class="STYLE1" style="padding-left:10px;">
					<input width="350" type="text" name="OrderMoney" value="" id="OrderMoney"/>
					<input width="350" type="hidden" name="Merchant_url"  value="http://183.233.189.114:7878/pos/merchant_url.jsp" />
					<input width="350" type="hidden" name="Return_url"  value="http://183.233.189.114:7878/pos/return_url.jsp" />
					<input width="350" type="hidden" name="NoticeType"  value="0" />
				</div></td>
		</tr>
		<tr>
			<td colspan="2" style="padding: 10px">
				<div align="center">
					<input type="button" value="　立刻支付　" class="input_btn_style1" onclick="sub();"/> 
					<input id="backBt" type="button" value="　返　回　"
						class="input_btn_style1"
						onclick="javascript:window.location.href='javascript:history.go(-1)'" />
				</div></td>
		</tr>
	</table>
	</form>
</body>
</html>
