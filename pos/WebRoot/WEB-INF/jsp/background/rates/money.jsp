<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<%@include file="../../common/common-css.jsp"%>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function sub() {
		var amount = document.getElementById("payMoney").value;
		if (amount != "") {
			var url = "${pageContext.servletContext.contextPath }/background/rates/pay.html?amount="
					+ amount;
			//window.open (url, 'newwindow', 'height=100, width=400, top=200, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); //这句要写成一
			var h_sp1 = 150;
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
		}
	}
</script>
</head>

<body>
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
				<div align="right" class="STYLE1">支付金额：</div></td>
			<td>
				<div align="left" class="STYLE1" style="padding-left:10px;">
					<input style="height: 20px;width: 200px" name="payMoney"
						id="payMoney" />
				</div></td>
		</tr>
		<tr>
			<td colspan="2" style="padding: 10px">
				<div align="center">
					<input type="button" value="　立刻支付　" class="input_btn_style1"
						onclick="sub();" /> <input id="backBt" type="button" value="　返　回　"
						class="input_btn_style1"
						onclick="javascript:window.location.href='javascript:history.go(-1)'" />
				</div></td>
		</tr>
	</table>
</body>
</html>
