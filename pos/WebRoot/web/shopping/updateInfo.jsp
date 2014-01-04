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

		<table width=932 border=0 align=center cellpadding=0 cellspacing=0
			bgcolor="#FFFFFF" class="grayline">
			<tr>
				<td align="center" valign="top" width="185"></td>
				<td bgcolor="#CCCCCC" width="1"></td>
				<td valign="top" bgcolor="#FfFfFf" width="570">



					<table width="932" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="186" align="center" valign="top" bgcolor="#f4f5fd">
								<%@include file="/web/shopping/leftInfo.jsp"%>


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
																		<TD bgColor=#f4f5fd height=25><font
																			color="#000000"> <B>会员信息更改(带</B> </font><B><FONT
																				color=#ffffff><FONT color=#ff0000>*</FONT><font
																					color="#000000">项为必填项)</font> </FONT> </B>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
														</td>
													</tr>
													<tr>
														<td align="center" valign="middle"><script
																type="text/javascript">
															function useryanzheng() { 
																var userReaName=document.getElementById('userReaName').value;
																if(userReaName.length>20 && userReaName==""){
																	alert("名称　不能为空　或　太长啦　！！　");
																	return false ;

																}
																
																var userAge=document.getElementById('userAge').value;
																if(isNaN(userAge)){
																	alert("年龄　你输入的不是一个数字　");
																	return false ;
																}
																if(userAge.length>4){
																	alert("年龄　　太长啦　！！　");
																	return false ;

																}
																
																var userAddress=document.getElementById('userAddress').value;
																if(userAddress.length>100 || userAddress==""){
																	alert("地址　不能为空　或　太长啦　！！　");
																	return false ;

																}
																var userPhone=document.getElementById('userPhone').value;
																if(userPhone.length>30 || userPhone==""){
																	alert("手机　不能为空　或　太长啦　！！　");
																	return false ;

																}
																var userMail=document.getElementById('userMail').value;
																if(userMail.length>45 || userMail==""){
																	alert("email　不能为空　或　太长啦　！！　");
																	return false ;

																}
																var userQQ=document.getElementById('userQQ').value;
																if(userQQ.length>15){
																	alert("QQ 太长啦　！！　");
																	return false ;

																}
																document.myinfo.action="updateInfo.html?userId=${webUser.userId}";
																document.myinfo.submit();
															}
															if ("${update}"=="0") {
																alert("更新成功！！！！");
															}
															</script>
															<form name="myinfo" id="myinfo" method="post">
																<TABLE width="740" border="0" cellpadding="0"
																	cellspacing="0"
																	style="BORDER-RIGHT: #b1bfee 1px solid; BORDER-TOP: #b1bfee 1px solid; BORDER-LEFT: #b1bfee 1px solid; BORDER-BOTTOM: #b1bfee 1px solid">
																	<TBODY>
																		<TR vAlign=center align=left>
																			<TD width="52%" height=35>&nbsp; 会员称谓： <font
																				color="#FF0000"><b>${webUser.userName}</b> </font>
																			</TD>
																			<TD width="48%" height=30>&nbsp; 佣金提成： <font
																				color="#FF0000"><b>0.00元</b> </font>
																			</TD>
																		</TR>
																		<TR vAlign=center align=left>
																			<TD height=35>&nbsp; 我的积分： <font color="#FF0000"><b>0</b>
																			</font>
																			</TD>
																			<TD height=30></TD>
																		</TR>
																		<TR vAlign=center align=left>
																			<TD height=35 colSpan=2>
																				<table height="100%" width="100%" border="0"
																					cellpadding="0" cellspacing="1" align="center">
																					<tr>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">昵称：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px"
																									name="userNickname" id="userNickname"
																									value="${webUser.userNickname}" />
																							</div></td>
																						<td height="30" width="13%">
																							<div align="right" class="STYLE1">开户所在省：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px" id="province"
																									name="province" value="${webUser.province}" />
																								<font color="red">*客户结算账户开户行所在省级行政区</font>
																							</div></td>
																					</tr>
																					<tr>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">真实姓名：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px"
																									name="userRealname" id="userReaName"
																									value="${webUser.userRealname}" />
																							</div></td>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">开户所在市：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px" id="city"
																									name="city" value="${webUser.city}" /> <font
																									color="red">*客户结算账户开户行所在市级行政区</font>
																							</div></td>
																					</tr>
																					<tr>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">年龄：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px" id="userAge"
																									name="userAge" value="${webUser.userAge}" />
																							</div></td>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">银行名称：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px" id="bankName"
																									name="bankName" value="${webUser.bankName}" />
																								<font color="red">*客户结算的银行名称，如：中国银行</font>
																							</div></td>
																					</tr>
																					<tr>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">性别：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input type="radio" name="userSex" value="男"
																									<c:if test="${webUser.userSex eq '男'}">checked="checked" </c:if>>
																								男 <input type="radio" name="userSex" value="女"
																									<c:if test="${webUser.userSex eq '女'}">checked="checked" </c:if>>
																								女
																							</div></td>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">所属支行或分行：</div>
																						</td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px"
																									name="subbranchBank" id="subbranchBank"
																									value="${webUser.subbranchBank}" /> <font
																									color="red">*如：北京分行或三元桥支行</font>
																							</div></td>
																					</tr>
																					<tr>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">省份：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px"
																									name="shengfen" id="shengfen"
																									value="北京" />
																							</div></td>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">银行户名：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px"
																									name="bankAccountName" id="bankAccountName"
																									value="${webUser.bankAccountName}" /> <font
																									color="red">*客户结算的银行账户户名</font>
																							</div></td>
																					</tr>
																					<tr>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">地址：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px"
																									name="userAddress" id="userAddress"
																									value="${webUser.userAddress}" />
																							</div></td>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">银行账号：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px"
																									name="bankAccount" id="bankAccount"
																									value="${webUser.bankAccount}" /> <font
																									color="red">*客户结算的银行账户账号</font>
																							</div></td>
																					</tr>
																					<tr>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">电话：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px" id="userPhone"
																									name="userPhone" value="${webUser.userPhone}" />
																							</div></td>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">账号类型：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input type="radio" name="accountType"
																									value="个人账号"
																									<c:if test="${webUser.accountType eq '个人账号'}">checked="checked"</c:if> />：个人账号
																								<input type="radio" name="accountType"
																									value="企业账号"
																									<c:if test="${webUser.accountType eq '企业账号'}">checked="checked"</c:if> />：企业账号
																							</div></td>
																					</tr>
																					<tr>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">邮箱：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px" id="userMail"
																									name="userMail" value="${webUser.userMail}" />
																							</div></td>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">是否付费：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input type="radio" name="pay" value="是"
																									<c:if test="${webUser.pay eq '是'}">checked="checked"</c:if> />：是
																								<input type="radio" name="pay" value="否"
																									<c:if test="${webUser.pay eq '否'}">checked="checked"</c:if> />：否
																							</div></td>
																					</tr>
																					<tr>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">QQ：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px" id="userQQ"
																									name="userQQ" value="${webUser.userQQ}" />
																							</div></td>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">备注：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px" id="mark"
																									name="mark" value="${webUser.mark}" />
																							</div></td>
																					</tr>
																					<tr>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">级别：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px"
																									name="level" readonly="readonly"
																									value="${webUser.level}" />
																							</div></td>
																						<td height="30" width="10%">
																							<div align="right" class="STYLE1">用户状态：</div></td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input type="radio" name="status" value="待审核"
																									<c:if test="${webUser.status eq '待审核'}">checked="checked"</c:if> />：待审核
																								<input type="radio" name="status" value="审核通过"
																									<c:if test="${webUser.status eq '审核通过'}">checked="checked"</c:if> />：审核通过
																							</div></td>
																					</tr>
																					<tr>

																						<td height="30" width="8%">
																							<div align="right" class="STYLE1">上级代理用户名编号：</div>
																						</td>
																						<td>
																							<div align="left" class="STYLE1"
																								style="padding-left:10px;">
																								<input style="height: 20px;width: 200px"
																									name="parentNumber" readonly="readonly"
																									value="${webUser.parentNumber}" />
																							</div></td>
																					</tr>
																				</table>
																			</TD>
																		</TR>

																		<TR align=middle>
																			<TD colSpan=2 height=40><INPUT class=button
																				type="button" value="更  新" style="cursor: pointer;"
																				name=to onclick="return useryanzheng();">

																				<INPUT name=to2 type=button class=button
																				style="cursor: pointer;" id="submit2" value=取　消>
																			</TD>
																		</TR>
																</TABLE>
															</form>
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
									<TD><%@include file="/web/shopping/shoppingbotton.jsp"%>
									</TD>
								</TR>
							</TBODY>
						</TABLE>


					</center>
					</center>
</body>
</html>


