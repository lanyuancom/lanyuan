<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>无标题文档</title>
		<LINK href="${pageContext.servletContext.contextPath }/css/admin.css" type="text/css" rel="stylesheet">
		<SCRIPT language=javascript>
	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
		return;
	}
</SCRIPT>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
	</head>

	<body>
		<table width="171" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td valign="top">
					<table width="100%" height="100%" border="0" cellpadding="0"
						cellspacing="0" style="table-layout: fixed;">
						<tr>
							<td style="width: 3px; background: #0a5c8e;">
								&nbsp;
							</td>
							<td>
								<table width="100%" height="100%" border="0" cellpadding="0"
									cellspacing="0" style="table-layout: fixed;">
									<tr>
										<td height="5" style="line-height: 5px; background: #0a5c8e;">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td height="23" background="${pageContext.servletContext.contextPath }/images/main_29.gif">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="40%">
														&nbsp;
													</td>
													<td width="42%">
														<font
															style="height: 1; font-size: 9pt; color: #bfdbeb; filter: glow(color =   #1070a3, strength =   1);font-weight: 600;">后台管理</font>
													</td>
													<td width="18%">
														&nbsp;
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td bgcolor="#e5f4fd">
											<table width="100%" height="100%" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td valign="top">
														<div align="center">
															<TABLE height="100%" cellSpacing=0 cellPadding=0
																width=170 background="${pageContext.servletContext.contextPath }/images/menu_bg.jpg" border=0>
																<TR>
																	<TD vAlign=top align=middle>

																		
																		<c:forEach items="${resources}" var="key" varStatus="stut">
																			<c:if test="${key.type eq 0}">
																			<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
																				<TR height=22>
																					<TD style="PADDING-LEFT: 30px"
																						background="${pageContext.servletContext.contextPath }/images/main_43.gif">
																						<A class=menuParent onclick='expand("${stut.index}")'
																							href="javascript:void(0);"><font color="white">${key.name}</font>
																						</A>
																					</TD>
																				</TR>
																			</TABLE>
																			<TABLE id='child${stut.index}' style="DISPLAY: none" cellSpacing=0
																			cellPadding=0 width="100%" border=0>
																			<c:forEach items="${resources}" var="k">
																			<c:if test="${k.parentId eq key.id}">
																			<TR height=20>
																				<TD align=middle width=30>
																					<IMG height=9 src="${pageContext.servletContext.contextPath }/images/menu_icon.gif" width=9>
																				</TD>
																				<TD>
																					<A class=menuChild href="${pageContext.servletContext.contextPath }${k.resUrl}" target="main">${k.name}</A>
																				</TD>
																			</TR>
																				</c:if>
																		</c:forEach>
																		</TABLE>
																			</c:if>
																		</c:forEach>
																		
																		

																	</TD>
																	<TD width=1 bgColor=#d1e6f7></TD>
																</TR>
															</TABLE>
														</div>
													</td>

												</tr>
												<tr>
													<td height="23" background="${pageContext.servletContext.contextPath }/images/main_45.gif">
														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tr>
																<td width="18%">
																	&nbsp;
																</td>
																<td width="64%">
																	<div align="center">
																		<font
																			style="height: 1; font-size: 9pt; color: #bfdbeb; filter: glow(color =   #1070a3, strength =   1)">版本2013-12
																			V1.0 </font>
																	</div>
																</td>
																<td width="18%">
																	&nbsp;
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td height="9"
														style="line-height: 9px; background: #0a5c8e;">
														&nbsp;
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
			</tr>
		</table>
	</body>
</html>
