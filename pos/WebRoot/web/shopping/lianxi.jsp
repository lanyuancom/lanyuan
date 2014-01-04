<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>联系我们</title>
    
	<%@include file="/web/shopping/shophead.jsp"%>	

  </head>
  
  <body>
  <%@include file="/web/shopping/shopTop.jsp"%>
  <center>
												<table class="cfont" cellspacing="0" cellpadding="0" width="40%" height="200px;" style="text-align: left;background:#FFBBFF; " border="0">
													<tbody>
														<tr>
															<td>
																<font color="#000000"> 您若有需求和订购咨询欢迎垂询</font>
															</td>
														</tr>
														<tr>
														<td>
																<font color="#000000">电话：13092659678</font>
															</td>
														</tr>
														<tr>
														<td>
																<font color="#000000">手机：13092659678</font>
														</td>
														</tr>
														<tr>
														<td>
																<font color="#000000">邮箱：</font><font color="#000000">372137032@qq.com</font>
														</td>
														</tr><tr>
														<td>
																<font color="#000000">Q&nbsp;Q：372137032</font>

															</td>
														</tr>
													</tbody>
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
  </body>
</html>
