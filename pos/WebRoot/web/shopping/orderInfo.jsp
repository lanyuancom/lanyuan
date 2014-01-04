<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<HTML>
	<head>
		<%@include file="/web/shopping/shophead.jsp"%>
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>

			<!-- 头部 -->
			<%@include file="/web/shopping/shopTop.jsp"%>
			<table width="932" border="0" cellspacing="0" cellpadding="0">
				<tr>

					<td width="186" align="center" valign="top" bgcolor="#f4f5fd">
						<%@include file="/web/shopping/leftInfo.jsp" %>
					</td>
					<td align="center" valign="top">
						<TABLE width=560 border=0 cellPadding=0 cellSpacing=0
							bordercolor="#587ad9">
							<TBODY>
								<TR>
									<TD height=12>
										<table>
											<tr>
												<td align="center" valign="middle">
													<TABLE cellSpacing=0 cellPadding=0 width=740 border=0
														style="BORDER-RIGHT: #b1bfee 1px solid; BORDER-TOP: #b1bfee 1px solid; BORDER-LEFT: #b1bfee 1px solid; BORDER-BOTTOM: #b1bfee 1px solid">
														<TBODY>
															<TR>
																<TD bgColor=#f4f5fd height=30>
																	<font color="#000000"> <B>定单明细查询</B>
																	</font>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</td>
											</tr>
											<tr>
												<td align="center" valign="middle">
													<table width="740" border="0" cellpadding="0"
														cellspacing="1" bgcolor="#b1bfee">
														<tr bgcolor="#FFFFFF">
															<td colspan="7">
																订单号为
																<strong><font color=red> ${resultMap.orderId}
																</font>
																</strong>&nbsp;&nbsp;&nbsp;&nbsp;提交时间：<fmt:formatDate value="${resultMap.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" />
																<br>
																<br>
																<table border=0>
																	<tr>
																		<td width=100 align=right>
																			定 货 人：&nbsp;&nbsp;
																		</td>
																		<td>
																			${webUser.userName }
																		</td>
																	</tr>
																	<tr>
																		<td width=100 align=right>
																			联系电话：&nbsp;&nbsp;
																		</td>
																		<td>
																			${webUser.userPhone }
																		</td>
																	</tr>
																	<tr>
																		<td width=100 align=right>
																			电子邮箱：&nbsp;&nbsp;
																		</td>
																		<td>
																			${webUser.userMail }
																		</td>
																	</tr>
																	<tr>
																		<td width=100 align=right>
																			收货地址：&nbsp;&nbsp;
																		</td>
																		<td>
																			${webUser.userAddress }
																		</td>
																	</tr>
																	<tr>
																		<td width=100 align=right>
																			邮政编码：&nbsp;&nbsp;
																		</td>
																		<td>
																			5102365
																		</td>
																	</tr>
																	<tr>
																		<td width=100 align=right>
																			配送方式：&nbsp;&nbsp;
																		</td>
																		<td>
																			货到付款，配送费用0元
																		</td>
																	</tr>
																	<tr>
																		<td width=100 align=right>
																			配送费用：&nbsp;&nbsp;
																		</td>
																		<td>
																			0.00
																		</td>
																	</tr>
																	<tr>
																		<td width=100 align=right>
																			订单备注：&nbsp;&nbsp;
																		</td>
																		<td>
																			暂无什么备注
																		</td>
																	</tr>
																	<tr>
																		<td align=right style="color: red;padding: 5px;" colspan="2">
																			注意：以上信息如有错误，请及时更新个人信息或直接联系客服，否则后果自负。
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
																<TR bgcolor="#FFFFFF" style="padding: 10px;">
																	<TD colspan="7">
																		 　　商品总价：<b><font color=red>${resultMap.orderSunPrice}</font></b>
																		
																		　　　　配送费用：<b><font color=red>0.00</font></b>
																		
																		　　　　总计费用：
																		<b><font color=red>${resultMap.orderSunPrice} 元</font></b>
																	</td>
																</TR>
																<tr bgcolor="#f4f5fd">
																	<td height="30" align="center">
																		商品名称
																	</td>
																	<td align="center">
																		购买数量
																	</td>
																	<td align="center">
																		商品单价
																	</td>
																	<td align="center">
																		<font color="B0266D">合 计</font>
																	</td>
																</tr>
														<script type="text/javascript">
																function pageNow(pageNow){
																	
																	if(pageNow < 1){
																			alert("不好意思，已经是第一页啦！");
																			return false ;
																		}
																	else
																		{
																			document.fenye.action="orderByIdList.html?orderId=${resultMap.orderId}&pageNow="+pageNow;
																			document.fenye.submit();
																		}
																}
																</script>
																<c:forEach items="${pageView.records }" var="key">
																<tr bgcolor="#FFFFFF">
																	<td height="30" align="center">
																		<a href="shopInfo.html?productId=${key.productId}" target="_blank">${key.productName }</a>
																	</td>
																	<td align="center">
																		${key.productNum }
																	</td>
																	<td align="center">
																		${key.price }
																	</td>
																	<td align="center">
																		${key.productSumPrice }
																	</td>
																</tr>
															</c:forEach>
															<tr bgcolor="#FFFFFF">
															<td colspan="7" style="padding-top: 10px;">
															<%@include file="/public/webfenye.jsp" %>
															</td>
															</tr>
													</TABLE>
													<br>
													<br>
											<table width="547" border="0" cellpadding="0"
														cellspacing="0" bgcolor="#FFFFFF">
											<tr align="center">
													
													<td width="109" colspan="2" valign="middle"style="padding-left: 10px;">
															
														<input name="image" type="image"
															src="order/gouwuche/car_zaixian.gif" alt=""
															width="110" height="40">
														</td>	
													<td width="109" colspan="2" valign="middle" style="padding-left: 10px;">		
													<input name="image" type="image"
															src="order/gouwuche/car_zhifubao.gif" alt=""
															width="110" height="40">
													</td>
												<td width="109" colspan="2" valign="middle" style="padding-left: 10px;">
														<input name="image" type="image"
															src="order/gouwuche/car_qita.gif" alt=""
															width="110" height="40">
												</td>
											</tr>
										</table>
											</td>
											</tr>
										</table>
									</TD>
								</TR>
							</TBODY>
						</TABLE>

					</td>
				</tr>
			</table>
			<center>

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

		</center>
	</body>
</html>
