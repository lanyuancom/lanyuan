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

	<%@include file="/web/shopping/shopTop.jsp"%>
			<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
				<TBODY>
					<TR>
						<TD>
							<IMG height=48 src="order/gouwuche/800buy_car_step.gif" width=160>
						</TD>
						<TD background=order/denglu/800buy_car_bg.gif>
							<IMG height=48 src="order/denglu/800buy_car_step1.gif" width=153>
						</TD>
						<TD background=order/denglu/800buy_car_bg.gif>
							<IMG height=48 src="order/denglu/800buy_car_step9.gif" width=153>
						</TD>
						<TD background=order/denglu/800buy_car_bg.gif>
							<IMG height=48 src="order/denglu/800buy_car_step10.gif" width=154>
						</TD>
						<TD>
							<IMG height=48 src="order/denglu/800buy_car_step4.gif" width=108>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
				<TBODY>
					<TR>
						<TD height=10></TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width=714 align=center border=0>
				<TBODY>
					<TR>
						<TD>
							<TABLE cellSpacing=0 cellPadding=0 width=714 align=center
								bgColor=#e9e9e9 border=0>
								<TBODY>
									<TR>
										<TD vAlign=top>
											&nbsp;
										</TD>
										<TD vAlign=top>
											<IMG height=32 src="order/denglu/800buy_login_font.gif"
												width=464>
										</TD>
										<TD width=89>
											<IMG height=60 src="order/denglu/800buy_login_arrow.gif"
												width=63>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD>
							<TABLE cellSpacing=0 cellPadding=0 width=714 align=center
								bgColor=#e9e9e9 border=0>
								<TBODY>
									<TR>
										<TD>
											<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
												<TBODY>
													<TR>
														<TD width=74>
															&nbsp;
														</TD>
														<TD>
															&nbsp;
														</TD>
													</TR>
													<TR>
														<TD>
															&nbsp;
														</TD>
														<TD>
															<FORM method="post" name="loginbox" action="">
															<script type="text/javascript">	
															
															if ("${err}" == "err") {
																alert(" 你 输 入 的 用 户 名 或 密 码 错 误 ！！！！");
															}
															
															 function shopdenglu(){
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
																		document.loginbox.action = "shopdenglu.html";
																		   document.loginbox.submit();
															  
															}
																</script>
																<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
																	<TBODY>
																		<TR>
																			<TD width=80 height=25>
																				用 户 名：
																			</TD>
																			<TD width=150>
																				<INPUT class=buttonface size=18 name="userName"id="userName" value="${userName}">
																			</TD>
																			<TD>
																				&nbsp;
																			</TD>
																			<TD>
																				&nbsp;
																			</TD>
																		</TR>
																		<TR>
																			<TD height=32>
																				密 码：
																			</TD>
																			<TD>
																				<INPUT class=buttonface type=password
																					name="userPassword" id="userPassword">
																			</TD>
																			<TD width=160>
																				<img style="cursor: pointer"  src="order/denglu/800buy_login_button.gif"onclick="return shopdenglu();" >
																					
																			</TD>
																			<TD>
																				<A href="javascript:void(0);">忘记密码</A>
																			</TD>
																		</TR>
																	</TBODY>
																</TABLE>
															</FORM>
														</TD>
													</TR>
													<TR>
														<TD>
															&nbsp;
														</TD>
														<TD>
															&nbsp;
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width=714 border=0>
				<TBODY>
					<TR>
						<TD align=right background=order/denglu/800buy_login_bg.gif
							height=34>
							<IMG height=34 src="order/denglu/800buy_login_pic.gif" width=75>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width=714 bgColor=#e9e9e9 border=0>
				<TBODY>
					<TR>
						<TD>
							<TABLE cellSpacing=0 cellPadding=0 width=714 align=center
								bgColor=#e9e9e9 border=0>
								<TBODY>
									<TR>
										<TD vAlign=top width=65>
											&nbsp;
										</TD>
										<TD vAlign=top width=194 height=20>
											&nbsp;
										</TD>
										<TD vAlign=top width=455>
											&nbsp;
										</TD>
									</TR>
									<TR>
										<TD width=72>
											&nbsp;
										</TD>
										<TD>
											
										</TD>
										<TD vAlign=top>
											<IMG height=33
													src="order/denglu/800buy_kstd.gif" width=104 border=0>
											
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD>
							<IMG height=25 src="order/denglu/800buy_login_font2.gif"
								width=468>
						</TD>
					</TR>
					<TR>
						<TD>
						<script type="text/javascript">	
		  function fastRegister(){
		 	 alert("快速注册渠道暂未开通！！");
						return false ;
			  var password=document.getElementById('p1').value;
			  var pw2=document.getElementById('p2').value;
			  var userName=document.getElementById('u').value;
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
				if (password != pw2) {
					alert("两次密码不一致！！！");
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
				var userMail=document.getElementById('m').value;
				if(userMail.length>45 || userMail == ""){
					alert("email　不能为空　或　太长啦　！！　");
					return false ;

				}
				
				document.AddUser.action="fastRegister.html";
				document.AddUser.submit();
			}
		</script>
							<form name="AddUser" action="" method="POST">
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
									<TBODY>
										<TR>
											<TD width=72>
												&nbsp;
											</TD>
											<TD>
												<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
													<TBODY>
														<TR>
															<TD width=60 height=25>
																用 户 名：
															</TD>
															<TD width=150>
																<INPUT class=buttonface size=20 name=userName id="u">
															</TD>
															<TD style="color: red; padding-left: 8px;">
																4—16位，可使用数字、字母、中文，禁用特殊符号
															</TD>
														</TR>
														<TR>
															<TD height=25>
																密 码：
															</TD>
															<TD>
																<INPUT id="p1" class=buttonface type=password size=21 name=userPassword>
															</TD>
															<TD  style="color: red; padding-left: 8px;">
																6—16位，请输入数字或大、小写字母作为密码
															</TD>
														</TR>
														<TR>
															<TD height=25>
																确认密码：
															</TD>
															<TD>
																<INPUT class=buttonface type=password size=21 name=pw2 id="p2">
															</TD>
															<TD  style="color: red; padding-left: 8px;">
																请再输一遍确认
															</TD>
														</TR>
														<TR>
															<TD height=25>
																Email：
															</TD>
															<TD>
																<INPUT id="m" class=buttonface size=20 name=userMail>
															</TD>
															<TD>
																&nbsp;
															</TD>
														</TR>
													</TBODY>
												</TABLE>
												<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
													<TBODY>
														<TR>
															<TD>
																<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
																	<TBODY>
																		<TR>
																			<TD height=25  style="color: red; padding-left: 8px;">
																				请您填写有效E-mail地址，订单确认信、购物券
																			</TD>
																		</TR>
																		<TR>
																			<TD height=25  style="color: red; padding-left: 8px;">
																				等重要邮件需发送到这个E-mail地址
																			</TD>
																		</TR>
																	</TBODY>
																</TABLE>
															</TD>
															<TD width=200>
																<img src="order/denglu/800buy_login_button.gif" style="cursor: pointer;" width=104
																	height=33 onclick="return fastRegister();">
															</TD>
														</TR>
													</TBODY>
												</TABLE>
											</TD>
											<TD width=135>
												<IMG height=201 src="order/denglu/800buy_login_pic2.gif"
													width=135>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</form>
						</TD>
					</TR>
					<TR>
						<TD>
							&nbsp;
						</TD>
					</TR>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width=714 align=center
				bgColor=#e9e9e9 border=0>
				<TBODY>
					<TR>
						<TD>
							&nbsp;
						</TD>
						<TD>
							&nbsp;
						</TD>
						<TD>
							&nbsp;
						</TD>
						<TD>
							&nbsp;
						</TD>
					</TR>
					
				</TBODY>
			</TABLE>
			
			
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
