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
															<TD bgColor=#f4f5fd height=60>
																&nbsp;&nbsp;欢迎
																<font color=red> ${session.user.userName }</font> 进入用户中心 ！
																<br>
																<br>
																&nbsp;&nbsp; 您的积分为：
																<font color="#FF0000">0</font> 　您的佣金提成：
																<font color="#FF0000">0.00元</font>
																<br>
																<br>
																&nbsp;&nbsp; 您本次登陆IP为 ：
																<font color=red><%=request.getRemoteAddr() %></font>
															</TD>
														</TR>
													</TBODY>
												</TABLE>
											</td>
										</tr>
										<tr>
											<td align="center" valign="middle">
											<script type="text/javascript">
										function pageNow(pageNow){
											
											if(pageNow < 1){
													alert("不好意思，已经是第一页啦！");
													return false ;
												}
											else
												{
													document.fenye.action="userInfo.html?pageNow="+pageNow;
													document.fenye.submit();
												}
										}
										</script>
										
												<table width="740" border="0" cellpadding="0"
													cellspacing="1" bgcolor="#b1bfee">
													<tr bgcolor="#f0f0f0" height="30">
														<td align="center" valign="middle" bgcolor="#f4f5fd">
															订单号
														</td>
														<td align="center" valign="middle" bgcolor="#f4f5fd">
															提交时间
														</td>
														<td align="center" valign="middle" bgcolor="#f4f5fd">
															总金额
														</td>
														<td align="center" valign="middle" bgcolor="#f4f5fd">
															订单状态
														</td>
														<td align="center" valign="middle" bgcolor="#f4f5fd">
															订单操作
														</td>
													</tr>
											<c:forEach items="${pageView.records }" var="key">
													<tr bgcolor="#FFFFFF" height="30">
														<td align="center" valign="middle">

															<a href="orderByIdList.html?orderId=${key.orderId}" style="color: red;">
																${key.orderId}</a>

														</td>
														<td align="center" valign="middle">
															<fmt:formatDate value="${key.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" />
														</td>
														<td align="center" valign="middle">
															${key.orderSunPrice}
														</td>
														<td align="center" valign="middle">
														<c:if test="${key.orderState eq '0'}">新订单，未处理</c:if>
														<c:if test="${key.orderState eq '1'}">已处理，未结账</c:if>
														<c:if test="${key.orderState eq '2'}">已结账</c:if>	
														</td>
															<td align=center valign="middle">
															<c:if test="${key.orderState eq '2'}">
															<div style="color: red;font-size: 10px;" align="center">
															该订单结账，不能操作！
															</div>
															</c:if>
															<c:if test="${key.orderState ne '2'}">
																<%-- <a href="updateState.html?orderId=${key.orderId}&orderState=2" style="color: red;">结账 </a> --%>
																&nbsp;
																<A href="javascript:void(0);" style="color: blue;"
																	onclick="{if(confirm('该操作不可恢复！\n\n确实删除该订单吗？ ')){location.href='deleteOrderById.html?orderId=${key.orderId}';}}">删除</a>
															</c:if>
															</td>
													</tr>
												</c:forEach>
												</table>
												<br/>
												<%@include file="/public/webfenye.jsp" %>
												
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
		</BODY>
	

</HTML>
