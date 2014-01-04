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
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.5.2.js"></script>
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
				cellSpacing=0 cellPadding=0 width=768 align=center border=0>
				<TBODY>
					<TR>
						<TD width="550" height=25 align=left bgColor=#f4f5fd>
							<DIV class=title>
								<IMG src="images/gry.gif" align=absMiddle>
								<SPAN style="FONT: bold 14px arial, 宋体">注册所需资料（带</SPAN><SPAN
									class=b_red>*</SPAN><SPAN style="FONT: bold 14px arial, 宋体">为必填项）&nbsp;</SPAN>
							</DIV>
						</TD>
						<TD align=right bgColor=#f4f5fd>
							<SPAN style="FONT: 12px arial, 宋体; COLOR: #757575">注册步骤: <SPAN
								style="FONT: 12px arial, 宋体; COLOR: #ff0000">1.填写资料</SPAN>
								2.注册成功&nbsp;&nbsp;</SPAN>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<script type="text/javascript">	
			var bool = '';
			//验证用户名是否存在
			function getAjax(){
			var uname = $("#userName").val();
				if(uname == ""){
					$("#td").html("<font color='red'>用户名不能为空！！</font>");
					return;

				}
				 $.ajax({
                url: "ajaxName.html?userName="+uname+"&_k="+new Date(),
                type: "POST",
                dataType:'json',
                success: function(data) {
               		//清空显示层中的数据
				$("#td").html("");
				bool = data.messages;
					if (bool == "true") {
						$("#td").html("<font color='red'>验证成功，该用户尚未注册！</font>");
					}
					if(bool == "false"){
						$("#td").html("<font color='red'>验证失败，该用户已存在！</font>");
					}
                }

            });
				
		}
		  function saveUserCril(){
			  var password=document.getElementById('userPassword').value;
			  var pw2=document.getElementById('pw2').value;
			  var userName=document.getElementById('userName').value;
			  if(!userName.replace(/[^\w\.\/]/ig,''))
				{
						alert("用户名称　只能输入英文字母和数字,不能输入中文　！！　");
						return false ;
				}
			  if (bool == "false") {
				  alert("  "+userName+"  已经存在，不能注册，请使用别的用户名！！！");
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
				var userMail=document.getElementById('userMail').value;
				if(userMail.length>45 || userMail == ""){
					alert("email　不能为空　或　太长啦　！！　");
					return false ;

				}
				
				document.ADDUser.action="register.html";
				document.ADDUser.submit();
	}
		</script>
			<form name="ADDUser" method="POST">
				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR>
							<TD width="380">
								<TABLE cellSpacing=0 cellPadding=0 width=380 border=0>
									<TBODY>
									<tr>
									<td colspan="2">
									<span id="td"style="padding-left: 100px;font-size: 15px;font-weight: 800;"></span>
									</td>
									</tr>
										<TR>
											<TD
												style="PADDING-RIGHT: 15px; PADDING-LEFT: 14px; PADDING-BOTTOM: 15px; FONT: 14px arial, 宋体; PADDING-TOP: 15px"
												align=right width=180>
												<SPAN class=b_red>*</SPAN>&nbsp;通行证用户名
											</TD>
											<TD align=left width=200>
												<input  id="userName"name="userName" type="text" size="25" maxlength="16"
													class=regtxt onblur="getAjax();">
											</TD>
										</TR>
										<TR>
											<TD
												style="PADDING-RIGHT: 20px; PADDING-LEFT: 60px; PADDING-BOTTOM: 10px; PADDING-TOP: 0px"
												colSpan=2>
												<SPAN id=send></SPAN>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
							<TD width=1 background=images/ssh.gif></TD>
							<TD width="388" align=left
								style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; FONT: 12px arial, 宋体; COLOR: #aaaaaa; PADDING-TOP: 10px">
								长度为
								<SPAN class=red>4～16</SPAN>个字符。可使用数字、字母、中文，禁用特殊符号。
								<BR>
								<SPAN class=red>为了避免重复，推荐您使用自己的电话号码，QQ号码</SPAN>
							</TD>
						</TR>
						<TR>
							<TD width=379 background=images/gge.gif colSpan=3 height=1></TD>
						</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR>
							<TD
								style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 15px; PADDING-TOP: 15px">
								<TABLE cellSpacing=0 cellPadding=0 width=380 border=0>
									<TBODY>
										<TR>
											<TD
												style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; FONT: 14px arial, 宋体; PADDING-TOP: 5px"
												align=right width=180>
												<SPAN class=b_red>*</SPAN>&nbsp;输入登录密码
											</TD>
											<TD align=left width=200>
												<input  id="userPassword" name="userPassword" type="password" size="25" maxlength="16"
													class=regtxt>
											</TD>
										</TR>
										<TR>
											<TD
												style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; FONT: 14px arial, 宋体; PADDING-TOP: 5px"
												align=right width=180>
												<SPAN class=b_red>*</SPAN>&nbsp;登录密码确认
											</TD>
											<TD align=left width=200>
												<input id="pw2" name="pw2" type="password" size="25" maxlength="16"
													class=regtxt>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
							<TD width=1 background=images/ssh.gif></TD>
							<TD width=388 align=left
								style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; FONT: 12px arial, 宋体; COLOR: #aaaaaa; PADDING-TOP: 10px">
								汉字以外的任何字符，长度为
								<SPAN class=red>6～16</SPAN>个字符，英文字母需区分大小写；密码请不要与帐号名相同。
							</TD>
						</TR>
						<TR>
							<TD background=images/gge.gif colSpan=3 height=1></TD>
						</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR>
							<TD
								style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 15px; PADDING-TOP: 15px">
								<TABLE cellSpacing=0 cellPadding=0 width=380 border=0>
									<TBODY>
										<TR>
											<TD
												style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; FONT: 14px arial, 宋体; PADDING-TOP: 5px"
												align=right width=180>
												<SPAN class=b_red>*</SPAN>&nbsp;邮箱地址&nbsp;&nbsp;
											</TD>
											<TD width=200>
												<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
													<TBODY>
														<TR>
															<TD align=left>
																<input id="userMail"name="userMail" type="text" size="25"
																	maxlength="50" class=regtxt>
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
							<TD width=1 background=images/ssh.gif></TD>
							<TD
								style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; FONT: 12px arial, 宋体; COLOR: #aaaaaa; PADDING-TOP: 10px"
								align=left width=388>
								<SPAN class=red>如果将来您忘记了二级密码，您可以通过邮箱重设。</SPAN>
							</TD>
						</TR>
						<TR>
							<TD background=images/gge.gif colSpan=3 height=1></TD>
						</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR>
							<TD
								style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 15px; PADDING-TOP: 15px">
								<TABLE cellSpacing=0 cellPadding=0 width=380 border=0>
									<TBODY>
										<TR>
											<TD
												style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; FONT: 14px arial, 宋体; PADDING-TOP: 5px"
												align=right width=180>
												真实姓名
											</TD>
											<TD align=left width=200>
												<input id="userReaName" name="userReaName" type="text" size="25" maxlength="20"
													class=regtxt>
											</TD>
										</TR>
										<TR>
											<TD
												style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; FONT: 14px arial, 宋体; PADDING-TOP: 5px"
												align=right width=180>
												联系电话
											</TD>
											<TD align=left width=200>
												<input name="HomePhone" type="text" value="" size="25"
													maxlength="20" class=regtxt>
											</TD>
										</TR>
										<TR>
											<TD
												style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; FONT: 14px arial, 宋体; PADDING-TOP: 5px"
												align=right width=180>
												移动电话
											</TD>
											<TD align=left width=200>
												<input id="userPhone"name="userPhone" type="text" value="" size="25"
													maxlength="20" class=regtxt>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
							<TD width=1 background=images/ssh.gif></TD>
							<TD
								style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; FONT: 12px arial, 宋体; COLOR: #aaaaaa; PADDING-TOP: 10px"
								align=left width=388>
								<SPAN class=red>收货人真实姓名，请准确填写！</SPAN>
								<br>
								留下您的联系电话或移动电话，以备不时之需
							</TD>
						</TR>
						<TR>
							<TD background=images/gge.gif colSpan=3 height=1></TD>
						</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR>
							<TD
								style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 15px; PADDING-TOP: 15px">
								<TABLE cellSpacing=0 cellPadding=0 width=380 border=0>
									<TBODY>
										<TR>
											<TD
												style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; FONT: 14px arial, 宋体; PADDING-TOP: 5px"
												align=right width=180>
												联系地址
											</TD>
											<TD align=left width=200>
												<input  id="userAddress"name="userAddress" type="text" value="" size="25"
													maxlength="100" class=regtxt>
											</TD>
										</TR>
										<TR>
											<TD
												style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; FONT: 14px arial, 宋体; PADDING-TOP: 5px"
												align=right width=180>
												邮政编码
											</TD>
											<TD align=left width=200>
												<input name="ZipCode" type="text" value="" size="25"
													maxlength="8" class=regtxt>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
							<TD width=1 background=images/ssh.gif></TD>
							<TD width=388 align=left
								style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; FONT: 12px arial, 宋体; COLOR: #aaaaaa; PADDING-TOP: 10px">
								收货人的真实地址和邮政编码，请准确填写
							</TD>
						</TR>
						<TR>
							<TD background=images/gge.gif colSpan=3 height=1></TD>
						</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR>
							<TD
								style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 15px; PADDING-TOP: 15px">
								<TABLE cellSpacing=0 cellPadding=0 width=380 border=0>
									<TBODY>
										<TR>
											<TD
												style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; FONT: 14px arial, 宋体; PADDING-TOP: 5px"
												align=right width=180>
												推荐人
											</TD>
											<TD align=left width=200>
												<input name="tjr" type="text" class=regtxt id="tjr" value=""
													size="25" maxlength="100">
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
							<TD width=1 background=images/ssh.gif></TD>
							<TD width=388 align=left
								style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; FONT: 12px arial, 宋体; COLOR: #aaaaaa; PADDING-TOP: 10px">
								介绍您来我们网站的会员帐号，若没有可不填
							</TD>
						</TR>
						<TR>
							<TD background=images/gge.gif colSpan=3 height=1></TD>
						</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR>
							<TD>
							</TD>
						</TR>
						<TR>
							<TD bgColor=#a5b6e7 height=2></TD>
						</TR>
						<TR>
							<TD>
							</TD>
						</TR>
						<TR>
							<TD align=middle>
								<input type=button value="提交注册" class=button name="ok" onclick="return saveUserCril();">
								&nbsp;&nbsp;
								<input type=reset value="重填" class=button name="Reset">
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</form>
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

