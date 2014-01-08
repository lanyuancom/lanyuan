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

	String MerchantID = "122800";//分配的商户号
	String TransID = MerchantID + TradeDate;//生成商户流水号
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>在线支付</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link
	href="${pageContext.servletContext.contextPath }/fcfu_files/milk.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.servletContext.contextPath }/fcfu_files/style.css"
	rel="stylesheet" type="text/css">

<style type="text/css">
</style>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/jquery_1_7_2_min.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function showTabs(showId, hidenId) {
		$("#" + showId).show();
		$("#" + hidenId).hide();
	}
	function sub() {
		var amount = document.getElementById("OrderMoney").value;
		if (amount == "") {
			alert("请输入支付金额！");
		}else{
		document.onlinePayForm.submit();
		}
	}
</script>
</head>

<body>
	<div class="main">

		<div class="fbg">
			<div class="header_resize">
				<div class="menu_nav"></div>
				<div>
					<h1>
						<small style="color: red;">在线收银台</small>
					</h1>
				</div>
				<div class="clr"></div>
			</div>
		</div>

		<div class="content">
			<div class="content_resize">
				<div class="mainbar">
					<div class="article">
						<h2>
							<span> </span>
						</h2>
						<div class="clr"></div>
						<form id="form1" name="onlinePayForm" method="post"
							action="${pageContext.servletContext.contextPath }/pay.jsp"
							novalidate="novalidate">
							<input width="350" type="hidden" name="Merchant_url"  value="http://www.ttzf.cn/merchant_url.jsp" />
					<input type="hidden" name="Return_url"  value="http://www.ttzf.cn/return_url.jsp" />
					<input type="hidden" name="NoticeType"  value="0" />
					<input type="hidden"  name="TransID" value="<%=TransID%>" />
					<input name='TradeDate' type="hidden" value= "<%=TradeDate%>" />
      <input width="350" type="hidden" name="MerchantID" value="<%=MerchantID%>"/>
							<ol>
								<li>
									<div for="name">结算客户&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<div class="inputClass">
										客户账户&nbsp;&nbsp;<span style="color:red;">${userSession.userName}</span>&nbsp;&nbsp;&nbsp;&nbsp;客户姓名&nbsp;&nbsp;<span
											style="color:red;">${userSession.userRealname}</span>
									</div></li>
								<li>
									<div for="email">支付通道&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<div class="inputClass">宝付通道
									<input name="Channelname"
											id="Channelname" type="hidden" class="text" value="宝付通道">
									</div></li>
								<li>
									<div>
										付款金额&nbsp;&nbsp;&nbsp;&nbsp;<input name="OrderMoney"
											id="OrderMoney" type="text" class="text" style="height: 30px;">
									</div>
									<label class="label"></label></li>
								<li>
									<div for="message">
										付款说明&nbsp;&nbsp;&nbsp;&nbsp;<input name="AdditionalInfo"
											type="text" class="text" style="height: 30px;">
									</div></li>
								<li>
									<div for="message">风险说明&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<div class="inputClass" style="color:red;">近期有不法分子通过本平台进行诈骗活动，在受害者付款后，随即电话关机消声觅迹。因受害者从未见过客户，亦不知客户商铺地址，故无法索要货物(服务)或追回款项。目前已有大量受害者被骗，涉及金额数十万元。本平台特别提醒：切勿向陌生客户付款，以防被骗造成资金损失。您付款后，资金将直接进入该客户绑定的银行账户，本平台无法为您追回该笔款项。</div>
								</li>
								<li>
									<div>我已了解支付风险；我熟悉该客户，确信付款后可以收到货物(服务)。</div></li>
								<li>
									<div for="message">支付银行&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<div id="sbox" class="inputClass">
										<div class="zf-bt">
											<div class="zf-btk">
												<a class="con" onclick="javascript:showTabs('cxk','xyk')"
													id="one1">储蓄卡</a>
											</div>
											<div class="zf-btk">
												<a onclick="javascript:showTabs('xyk','cxk')" id="one2"
													class="">信用卡</a>
											</div>
										</div>




										<div id="cxk" style="width:700px;height:550px;">

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1001"> <img alt="" width="131" height="31"
													src="./fcfu_files/1001.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1002"> <img alt="" width="131" height="31"
													src="./fcfu_files/1002.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1003"> <img alt="" width="131" height="31"
													src="./fcfu_files/1003.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1004"> <img alt="" width="131" height="31"
													src="./fcfu_files/1004.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1005"> <img alt="" width="131" height="31"
													src="./fcfu_files/1005.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1006"> <img alt="" width="131" height="31"
													src="./fcfu_files/1006.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1008"> <img alt="" width="131" height="31"
													src="./fcfu_files/1008.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1009"> <img alt="" width="131" height="31"
													src="./fcfu_files/1009.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1020"> <img alt="" width="131" height="31"
													src="./fcfu_files/1020.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1022"> <img alt="" width="131" height="31"
													src="./fcfu_files/1022.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1026"> <img alt="" width="131" height="31"
													src="./fcfu_files/1026.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1035"> <img alt="" width="131" height="31"
													src="./fcfu_files/1035.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1036"> <img alt="" width="131" height="31"
													src="./fcfu_files/1036.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1038"> <img alt="" width="131" height="31"
													src="./fcfu_files/1038.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1039"> <img alt="" width="131" height="31"
													src="./fcfu_files/1039.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1059"> <img alt="" width="131" height="31"
													src="./fcfu_files/1059.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1032"> <img alt="" width="131" height="31"
													src="./fcfu_files/1032.jpg">
											</div>

										</div>
										<div id="xyk" style="width:700px;height:550px;display:none;">

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1026"><img alt="" width="131" height="31"
													src="./fcfu_files/1026.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1035"><img alt="" width="131" height="31"
													src="./fcfu_files/1035.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1036"><img alt="" width="131" height="31"
													src="./fcfu_files/1036.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1038"><img alt="" width="131" height="31"
													src="./fcfu_files/1038.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1039"><img alt="" width="131" height="31"
													src="./fcfu_files/1039.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1001"><img alt="" width="131" height="31"
													src="./fcfu_files/1001.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1002"><img alt="" width="131" height="31"
													src="./fcfu_files/1002.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1003"><img alt="" width="131" height="31"
													src="./fcfu_files/1003.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1004"><img alt="" width="131" height="31"
													src="./fcfu_files/1004.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1005"><img alt="" width="131" height="31"
													src="./fcfu_files/1005.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1006"><img alt="" width="131" height="31"
													src="./fcfu_files/1006.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1008"><img alt="" width="131" height="31"
													src="./fcfu_files/1008.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1009"><img alt="" width="131" height="31"
													src="./fcfu_files/1009.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1020"><img alt="" width="131" height="31"
													src="./fcfu_files/1020.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1022"><img alt="" width="131" height="31"
													src="./fcfu_files/1022.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1059"><img alt="" width="131" height="31"
													src="./fcfu_files/1059.jpg">
											</div>

											<div style="float: left;width:200px;height:80px;">
												<input type="radio" name="PayID" id="payId"
													value="1032"><img alt="" width="131" height="31"
													src="./fcfu_files/1032.jpg">
											</div>

										</div>
									</div></li>
								<li></li>
								<li>
									<div id="button">
										<input name="Submit" id="btnSave" type="button"
											class="form_blue_01" value="到网上银行支付" onclick="sub();">
										&nbsp;&nbsp;&nbsp;&nbsp;
									</div></li>
								<div class="clr"></div>
							</ol>
						</form>
					</div>
				</div>
			</div>
			<div class="clr"></div>
		</div>
	</div>

	<div class="fbg">
		<div class="fbg_resize"></div>
	</div>

</body>
</html>
</body>
</html>
