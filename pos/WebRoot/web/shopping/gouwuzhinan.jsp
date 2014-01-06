<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>购物指南</title>
 
	<%@include file="/web/shopping/shophead.jsp"%>	

  </head>
  
  <body>
  <%@include file="/web/shopping/shopTop.jsp"%>
  <center>
	<div class="help_right" style="width: 930px;text-align: left;">
		<p style="font-size:15px;font-weight:bold;margin-bottom:15px;">购物指南</p>
		商城在线购物流程<br>
		<br>第一步：选购<br>浏览/搜索您所需要的商品，选择您需要的尺码，点击“放入购物车”。 <br>
		<br>第二步：加入购物车<br>放入购物车后，如果您还想购买其他感兴趣的商品，点击购物车中的“继续购物”或者进入其它页面、搜索商品继续购买。
		<br>
		<br>第三步：登录/注册<br>如果您未注册登记过，请点击新用户注册页面，只需要几秒，填写基本的注册信息，完成注册，然后登录。
		<br>
		<br>第四步：填写详细收货信息<br>请您详细准确填写您的收货地址、Email、电话、邮编等资料。<br>
		<br>第五步：选择配送方式<br>有以下配送方式：普通快递、EMS、顺丰；<br>
		<br>有特殊安排，如其它时间送货等，请与客服人员联系&nbsp;&nbsp;<b>400-8610-400</b>&nbsp;&nbsp;<br>
		<br>第六步：选择付款方式<br>付款方式任选其一：货到付款、在线支付（选择在线支付方式时，订单超24小时未付款，系统将自动取消订单）
		。 <br>点击“提交订单”按钮， 检查信息，如果没有问题，点击“确认提交”按钮。<br>
		<br>第七步：生成订单<br>请您记住订单编号以便查询。 <br>
		<br>第八步：客服人员核实订单<br>如果有特殊情况客服人员给您打电话核实订单，核实产品，确认您的收货信息等。<br>
		<br>如商品发现缺货、检测出瑕疵无法发货时，客服人员会及时联系您；已付款订单会帮助您操作退款。<br>
		<br>第九步：发货<br>客服人员核实完订单后一般24小时内即可发货，同时订单中所留手机号会收到短信通知，告知您所发快递公司。<br>
		<br>第十步：验收商品<br>当您收到货物后，请仔细核对您所订购的商品种类、数量、规格以及相应的赠品，合格后，请在送货单上签字。如果您对我们的服务不满意，请勿拆开、损坏商品及外包装，并欢迎您拨打我们的客服热线，提出您的意见和建议，帮助我们提高服务质量。<br>
		<b>注意：</b>货到付款订单，若您对我们的服务和商品不满意，您可以当场拒签，不产生任何费用!<br>
		<br>
		<br>
		<font color="#FF0000"><b>特别说明：</b>
		</font><br>
		<br>当订单提交成功后，仅表示已成功收到了您的订单，只有当我们使用短信或电子邮件通知您已经将商品发出时，我们和您之间的订购合同才成立。<br>
		<br>
	</div>
		<TABLE cellSpacing=0 cellPadding=0 width=932 align=center border=0>
				<TBODY>
					<TR>
						<TD>
							<TABLE cellSpacing=0 cellPadding=0 width=100% align=center
								bgColor=#ffffff border=0>
								<TBODY>
									<hr size="1" color="#B2D800" width=99.4%>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD>
							<%@include file="/web/shopping/shoppingbotton.jsp"%>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
												</center>
</body>
</html>
