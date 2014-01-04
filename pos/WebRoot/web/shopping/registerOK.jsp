<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<table width="768" height="5" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td></td>
				</tr>
			</table>
			<TABLE
				style="BORDER-RIGHT: #b1bfee 1px solid; BORDER-TOP: #b1bfee 1px solid; BORDER-LEFT: #b1bfee 1px solid; BORDER-BOTTOM: #b1bfee 1px solid"
				cellSpacing=0 cellPadding=0 width=768 align=center border=0 height="250">
				<TBODY>
					<TR>
						<TD align="center" bgColor=#f4f5fd>
							<div style="color: red;font-size: 32px;font-weight: 800;padding: 20px;">
								恭 喜 你 ！ 注  册  成  功 ！ ！ ！  ！ &nbsp;&nbsp;</div>
								<br/>
								<a href="denglu.html"><div style="color: blue;font-size: 22px;font-weight: 800;padding: 10px;">
								进入登录界面。。。。。。 &nbsp;&nbsp;</div></a>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			
			
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

