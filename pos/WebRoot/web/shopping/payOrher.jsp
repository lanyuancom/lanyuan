<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>支付方式</title>
 
	<%@include file="/web/shopping/shophead.jsp"%>	

  </head>
  
  <body>
  <%@include file="/web/shopping/shopTop.jsp"%>
  <center>
  <h2 class="detail-title">
        				快捷支付（含卡通）介绍
        			</h2>
   <div class="detail-content" style="text-align: left;width: 930px;">
    <strong>支付（含卡通）</strong>是支付宝联合各大银行推出的全新最安全、轻松的支付方式。<strong>付款时无需登录网上银行，只需关联您的信用卡或者借记卡</strong>，每次付款时只需输入支付宝支付密码即可完成付款。<br>
	<br>
	<strong>安全：</strong>3大安全体系设计，让您安心购物<br>
	<strong>便捷：</strong>3步在线支付流程，让您轻松购物<br>
	<strong>保障：</strong>72小时完成赔付，让您放心购物<br>
	<br>
	<br>
	<strong>付款流程：</strong><br>
	<br>
	<img style="width: 560.0px;height: 51.0px;" src="${pageContext.servletContext.contextPath }/web/shopping/images/payother.jpg" alt=""><br>
	<br>
	<strong>快捷支付（含卡通）类型：</strong>储蓄卡快捷支付、信用卡快捷支付和支付宝卡通，       			</div>
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
