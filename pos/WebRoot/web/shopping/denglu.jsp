<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<html>
	<head>
		<%@include file="/web/shopping/shophead.jsp"%>
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<!-- 头部 -->
			<%@include file="/web/shopping/shopTop.jsp"%>
			<TABLE cellSpacing=0 cellPadding=0 width=932 border=0>
				<TBODY>
					<TR>
						<TD width=3></TD>
						<TD width=765 bgColor=#efe7ef height=1></TD>
					</TR>
					<TR>
						<TD>
						</TD>
						<TD align=middle bgColor=#f7f6f7>
							<TABLE height=20 cellSpacing=0 cellPadding=0 width=765 border=0>
								<TBODY>
									<TR>
										<TD></TD>
									</TR>
								</TBODY>
							</TABLE>
							<TABLE cellSpacing=0 cellPadding=0 width=695 border=0>
								<TBODY>
									<TR>
										<TD class=title_01 vAlign=bottom
											background=images/peisong_fy_01.gif height=25>
											&nbsp;&nbsp;
											<FONT color=#ffffff>&gt;&gt;会员登录区</FONT>
										</TD>
									</TR>
									<TR>
										<TD align=middle background=images/peisong_fy_02.gif>
											<TABLE cellSpacing=0 cellPadding=2 width=677 border=0>
												<TBODY>
													<TR>
														<TD class=title_02 align=middle height=22></TD>
													</TR>
													<TR>
														<TD vAlign=top align=middle>
															<TABLE cellSpacing=0 cellPadding=0 width=672 border=0>
																<TBODY>
																	<TR>
																		<TD>
																			<IMG height=27 src="images/new_user_06.gif" width=672>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
															<TABLE cellSpacing=0 cellPadding=0 width=672
																background=images/new_user_07.gif border=0>
																<TBODY>
																	<TR>
																		<TD vAlign=top align=right width=185>
																			<TABLE cellSpacing=0 cellPadding=3 width=176 border=0>
																				<TBODY>
																					<TR>
																						<TD width=40 height="20" align=middle>
																							<IMG height=9 src="images/new_user_09.gif"
																								width=19>
																						</TD>
																						<TD width=124>
																							<A class=d href="registerUI.html"><FONT
																								color=#9e0b0e>新会员注册</FONT> </A>
																						</TD>
																					</TR>
																					<TR>
																						<TD align=middle width=40>
																							<IMG height=9 src="images/new_user_09.gif"
																								width=19>
																						</TD>
																						<TD width=124>
																							<A class=s href="logoUI.html">会员登录</A>
																						</TD>
																					</TR>
																					<TR>
																						<TD align=middle width=40>
																							<IMG height=9 src="images/new_user_09.gif"
																								width=19>
																						</TD>
																						<TD width=124>
																							<A class=s href="javascript:void(0);" onclick="alert('此功能正在完善，给你带来的不便敬请原谅！！！')"><FONT
																								color=#9e0b0e>更改顾客密码</FONT> </A>
																						</TD>
																					</TR>
																					<TR>
																						<TD align=middle width=40>
																							<IMG height=9 src="images/new_user_09.gif"
																								width=19>
																						</TD>
																						<TD width=124>
																							<A class=s href="javascript:void(0);" onclick="alert('此功能正在完善，给你带来的不便敬请原谅！！！')">申请/更改密码保护</A>
																						</TD>
																					</TR>
																					<TR>
																						<TD align=middle width=40>
																							<IMG height=9 src="images/new_user_09.gif"
																								width=19>
																						</TD>
																						<TD width=124>
																							<A class=s href="javascript:void(0);" onclick="alert('此功能正在完善，给你带来的不便敬请原谅！！！')"><FONT
																								color=#9e0b0e>查询/修改登记信息</FONT> </A>
																						</TD>
																					</TR>
																					<TR>
																						<TD align=middle width=40>
																							<IMG height=9 src="images/new_user_09.gif"
																								width=19>
																						</TD>
																						<TD width=124>
																							<A class=s href="javascript:void(0);" onclick="alert('请登录后再查看，谢谢合作！！！！')"><FONT
																								color=#9e0b0e>订单明细查询</FONT> </A>
																						</TD>
																					</TR>
																					<TR>
																						<TD align=middle width=40>
																							<IMG height=9 src="images/new_user_09.gif"
																								width=19>
																						</TD>
																						<TD width=124>
																							<a href="javascript:void(0);" onclick="alert('请联系客服，谢谢合作！！！！')"><FONT color=#9e0b0e>汇款确认</FONT>
																							</a>
																						</TD>
																					</TR>
																				</TBODY>
																			</TABLE>
																		</TD>
																		<TD vAlign=top align=middle>
																			<TABLE height=204 cellSpacing=0 cellPadding=0
																				width=350 border=0>
																				<TBODY>
																					<TR>
																						<TD class=title_01 align=middle height=30>
																							会员登录
																						</TD>
																					</TR>
																					<TR>
																						<TD align=middle height=1>
																							<IMG height=1 src="images/new_user_11.gif"
																								width=280>
																						</TD>
																					</TR>
																					<script type="text/javascript">
																					if ("${error}" == "error") {
																						alert(" 你 输 入 的 用 户 名 或 密 码 错 误 ！！！！");
																					}
																					 function denglu(){
																						  var password=document.getElementById('userPassword').value;
																						  var userName=document.getElementById('userName').value;
																						  if(!userName.replace(/[^\w\.\/]/ig,''))
																							{
																									alert("用户名称　只能输入英文字母和数字,不能输入中文　！！　");
																									return false ;
																							}
																							if(password == ""){
																								alert("密码　不能这空　！！　");
																								return false ;
																			
																							}
																							if(password.length>40){
																								alert("密码　太长啦　！！　");
																								return false ;
																			
																							}
																							if(userName == ""){
																								alert("用户名　不能这空　！！　");
																								return false ;
																			
																							}
																							if(userName.length>20){
																								alert("用户名称　太长啦　！！　");
																								return false ;
																			
																							}
																							document.loginbox.action = "login.html";
																							   document.loginbox.submit();
																				  
																				}
																					</script>
																					<form method="post" name="loginbox" action="">
																						<TR>
																							<TD align=left>
																								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																								<FONT color=#ff6000>用 户 名：</FONT>
																								<INPUT id="userName" class=form_cont size=16 name="userName">
																							</TD>
																						</TR>
																						<TR>
																							<TD align=left>
																								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																								<FONT color=#ff6000>密 　 码：</FONT>
																								<INPUT id="userPassword" class=form_cont size=17 type="password"
																									name="userPassword">
																							</TD>
																						</TR>
																						<TR>
																							<TD align=middle>

																								<A href="javascript:void(0);" onclick="denglu();"><img width=56 height=17
																									src="images/new_user_enter.gif" alt="登录"
																									border=0></A>　
																								<A href="registerUI.html"><IMG height=17
																										src="images/new_user_reset.gif" width=56
																										align=absMiddle alt="注册" border=0> </A>&nbsp;&nbsp;
																								<A href="javascript:void(0);" onclick="alert('此功能正在完善，给你带来的不便敬请原谅！！！')"><font color="#9e0b0e">忘记密码了？</font>
																								</A>
																							</TD>
																						</TR>
																					</FORM>
																				</TBODY>
																			</TABLE>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
															<TABLE cellSpacing=0 cellPadding=0 width=672 border=0>
																<TBODY>
																	<TR>
																		<TD vAlign=top align=middle>
																			<IMG height=30 src="images/new_user_08.gif" width=672>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
															<BR>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
									<TR>
										<TD>
											<IMG height=33 src="images/peisong_fy_03.gif" width=696>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
							<TABLE cellSpacing=0 cellPadding=0 width=765 border=0>
								<TBODY>
									<TR>
										<TD vAlign=top height=26></TD>
									</TR>
									<TR>
										<TD bgColor=#efe7ef height=5></TD>
									</TR>
								</TBODY>
							</TABLE>
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
