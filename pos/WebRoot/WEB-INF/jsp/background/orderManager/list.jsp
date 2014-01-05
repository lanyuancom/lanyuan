<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../../common/common-css.jsp"%>
<%@include file="../../common/common-js.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/fenyecss.css" />
<style type="text/css">
input {
	font-size: 12px
}
</style>
</head>
<body>
	<form id="fenye" name="fenye"
		action="${pageContext.servletContext.contextPath }/background/orderManager/query.html"
		method="post">
		<table width="100%">
			<tr>
				<td height="30"
					background="${pageContext.servletContext.contextPath }/images/tab_05.gif"><table
						width="100%">
						<tr>
							<td width="12" height="30"><img
								src="${pageContext.servletContext.contextPath }/images/tab_03.gif"
								width="12" height="30" /></td>
							<td><table width="100%">
									<tr>
										<td width="46%" valign="middle"><table width="100%">
												<tr>
													<td width="5%"><div align="center">
															<img
																src="${pageContext.servletContext.contextPath }/images/tb.gif"
																width="16" height="16" />
														</div></td>
													<td width="95%" class="STYLE1"></td>
												</tr>
											</table></td>
										<td width="54%"><table align="right">
												<tr>
													<td width="60"><table width="87%">
															<tr>
																<td class="STYLE1"><div align="center">
																		<input type="checkbox" name="checkbox11" id="choseAll"
																			onclick="selectAllCheckBox()" />
																	</div></td>
																<td class="STYLE4">全选</td>
															</tr>
														</table></td>
													<td width="52"><table width="88%">
															<tr>
																<td class="STYLE1"><div align="center">
																		<img
																			src="${pageContext.servletContext.contextPath }/images/11.gif"
																			width="14" height="14" />
																	</div></td>
																<td class="STYLE4"><a href="javascript:void(0);"
																	onclick="return deleteAll()"> 删除 </a>
																</td>
															</tr>
														</table></td>
													<td width="60"><table width="90%">
															<tr>
																<td class="STYLE1"><div align="center">
																		<img
																			src="${pageContext.servletContext.contextPath }/images/22.gif"
																			width="14" height="14" />
																	</div></td>
																<td class="STYLE1"><a
																	href="${pageContext.servletContext.contextPath }/resources/addUI">新增</a>
																</td>
															</tr>
														</table></td>
												</tr>
											</table></td>
									</tr>
								</table></td>
							<td width="16"><img
								src="${pageContext.servletContext.contextPath }/images/tab_07.gif"
								width="16" height="30" /></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td align="center">
					<!-- 这里的表单 name 必须是fenye -->
					<div class="search_k" align="left">
						<fieldset class="search">
							<legend>
								<img
									src="${pageContext.servletContext.contextPath }/images/search_btn.gif"
									align="middle" />&nbsp;<span class="STYLE1"
									style="color: blue;">高级查找</span>
							</legend>
							<div class="search_content">
								用户账号：：<input type="text" name="userName" value="${param.userName}"
									style="height: 20px" /> <input type="submit" value="开始查询"
									class="input_btn_style1" />&nbsp;&nbsp; <input type="button"
									value="重置" class="input_btn_style1" onclick="clearText()" />
							</div>
						</fieldset>
					</div>
				</td>
			</tr>
			<tr>
				<td><table class="listtable" width="100%">
						<tr>
							<td width="8"
								background="${pageContext.servletContext.contextPath }/images/tab_12.gif">&nbsp;</td>
							<td><table  class="ttab" width="100%" border="0" cellpadding="0" cellspacing="1"
									 onmouseover="changeto()"
									onmouseout="changeback()">
									<tr>
										<td height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<input id="chose" type="checkbox" name="checkbox" value="checkbox"  onclick="selectAllCheckBox()"/>
											</div>
										</td>
										<td height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">订单号</span>
											</div>
										</td>
										<td height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">用户</span>
											</div>
										</td>
										<td height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">订单总价</span>
											</div>
										</td>
										<td background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">下单时间</span>
											</div>
										</td>
										<td background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">下单状态</span>
											</div>
										</td>
										<td width="20%" height="22"
											background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF" class="STYLE1">
											<div align="center">
												基本操作
											</div>
										</td>
									</tr>
									<c:forEach items="${pageView.records}" var="key">
										<tr>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center">
													<input type="checkbox" name="check" value="${key.orderId}" />
												</div>
											</td>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center" class="STYLE1">
													<div align="center">
														${key.orderId}
													</div>
												</div>
											</td>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">${key.userName}</span>
												</div>
											</td>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">${key.orderSunPrice}</span>
												</div>
											</td>
											<td bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1"><fmt:formatDate value="${key.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
												</div>
											</td>
											<td bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">
													<c:if test="${key.orderState eq '0' }">已下单,未处理</c:if>
													<c:if test="${key.orderState eq '1' }">正在处理...</c:if>
													<c:if test="${key.orderState eq '2' }">已结单</c:if>
													</span>
												</div>
											</td>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE4">
													<c:if test="${key.orderState ne '2'}">
													<img src="${pageContext.servletContext.contextPath }/images/moey.png" width="16"
															height="16" /><a href="${pageContext.servletContext.contextPath }/background/orderManager/update.html?orderId=${key.orderId}&orderState=2">结算</a>&nbsp; &nbsp;</c:if><img
															src="${pageContext.servletContext.contextPath }/images/del.gif" width="16"
															height="16"/><a href="${pageContext.servletContext.contextPath }javascript:void(0);" onclick="return deleteById('${key.orderId}');">删除</a></span>
												</div>
											</td>
										</tr>
									</c:forEach>
								</table></td>
							<td width="8"
								background="${pageContext.servletContext.contextPath }/images/tab_15.gif">&nbsp;</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="35"
					background="${pageContext.servletContext.contextPath }/images/tab_19.gif"><%@include
						file="../../common/webfenye.jsp"%></td>
			</tr>
		</table>
	</form>
</body>
</html>