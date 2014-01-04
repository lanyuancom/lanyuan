<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<HTML>
	<HEAD>
		<%@include file="/web/shopping/shophead.jsp"%>
	</HEAD>
	<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="20">
		<center>

	<%@include file="/web/shopping/shopTop.jsp"%>

			<table width="768" border="0" cellpadding="0" cellspacing="0"
				bgcolor="#FFFFFF">
				<tr>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
							<TBODY>
								<TR>
									<TD>
										<IMG height=48 src="order/gouwuche/800buy_car_step.gif"
											width=160>
									</TD>
									<TD background=order/gouwuche/800buy_car_bg.gif>
										<IMG height=48 src="order/gouwuche/800buy_car_step1.gif"
											width=153>
									</TD>
									<TD background=order/gouwuche/800buy_car_bg.gif>
										<IMG height=48 src="order/gouwuche/800buy_car_step2.gif"
											width=153>
									</TD>
									<TD background=order/gouwuche/800buy_car_bg.gif>
										<IMG height=48 src="order/gouwuche/800buy_car_step5.gif"
											width=154>
									</TD>
									<TD>
										<IMG height=48 src="order/gouwuche/800buy_car_step6.gif"
											width=108>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="241">
									<img src="order/gouwuche/800buy_car_thank.gif" alt=""
										width="432" height="37">
								</td>
								<td class="award"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<table width="768" border="0" cellpadding="0" cellspacing="0"
				bgcolor="#FFFFFF">
				<tr>
					<td colspan="3">
					</td>
					<input type=hidden value="ok" name="confirm">
				</tr>
				<tr>
					<td width="109">
					</td>
					<td width="550" align="center">
						<table width="550" height="50" cellpadding="0" cellspacing="0"
							class="jiesuan">
							<tr>
								<td width="565">

									<table width="100%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="#D1D2D3">
										<tr bgcolor="#FFFFFF">
											<td width="22%" height="25" align="center">
												您的定单编号为：
											</td>
											<td colspan="2">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="6%">
														</td>
														<td width="94%" height="25">
															<span class="bold">${orderId}</span>（查询订单请记住定单号）
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr bgcolor="#FFFFFF">
											<td width="22%" height="25" align="center">
												您提交定单时间：
											</td>
											<td colspan="2">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="6%">
														</td>
														<td width="94%" height="24">
															<% 
															java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
															
															java.util.Date currentTime = new java.util.Date();//得到当前系统时间
															
															String str_date1 = formatter.format(currentTime); //将日期时间格式化 
															%>
															<%=str_date1 %>

														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr bgcolor="#FFFFFF">
											<td width="22%" align="center">
												订货人信息：
											</td>
											<td colspan="2">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="6%">
														</td>
														<td width="94%" height="25">
															姓名：${webUser.userRealname }
														</td>
													</tr>
													<tr>
														<td>
														</td>
														<td height="25">
															地址：${webUser.userAddress}
														</td>
													</tr>
													<tr>
														<td>
														</td>
														<td height="25">
															邮编：021514
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr bgcolor="#FFFFFF">
											<td rowspan="6" align="center">
												您的订单金额：
											</td>
											<td width="267" height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="10">
														</td>
														<td width="285" height="25">
															商品总计金额：
														</td>
													</tr>
												</table>
											</td>
											<td width="151" height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="5%">
														</td>
														<td width="87%">
															￥
															<font color="#FF0000">${orderSunPrice}</font>元
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr bgcolor="#FFFFFF">
											<td height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="10">
														</td>
														<td width="285" height="25">
															您共节省金额
														</td>
													</tr>
												</table>
											</td>
											<td height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="5%">
														</td>
														<td width="87%">
															<SPAN class=zk_cont>￥<font color="#FF0000">100</font>元</SPAN>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr bgcolor="#FFFFFF">
											<td height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="10">
														</td>
														<td width="285" height="25">
															您共获得积分：
														</td>
													</tr>
												</table>
											</td>
											<td height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="5%">
														</td>
														<td width="87%">
															<font color="#FF0000">10</font>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr bgcolor="#FFFFFF">
											<td height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="10">
														</td>
														<td width="285" height="25">
															配送金额：
														</td>
													</tr>
												</table>
											</td>
											<td height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="5%">
														</td>
														<td width="87%">
															￥
															<font color="#FF0000">10</font>元
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr bgcolor="#FFFFFF">
											<td height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="10">
														</td>
														<td width="285" height="25">
															配送方式：
														</td>
													</tr>
												</table>
											</td>
											<td height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="5%">
														</td>
														<td width="87%">
															货到付款，配送费用<font color="#FF0000"> 0 </font>元
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr bgcolor="#FFFFFF">
											<td height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="10">
														</td>
														<td width="285" height="25">
															金额：
														</td>
													</tr>
												</table>
											</td>
											<td height="28">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="5%">
														</td>
														<td width="87%">
															￥
															<font color="#FF0000"><b>${orderSunPrice}</b>
															</font>元
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td width="109">
					</td>
				</tr>
			</table>
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
	</BODY>
</HTML>