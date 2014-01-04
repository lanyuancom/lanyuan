<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@include file="../../common/common-css.jsp" %>
  </head>
  
  <body>
  <div style="height: 100%;overflow-y: auto;">
<br/>
<br/>  
		<table class="ttab" height="100" width="60%" border="0" cellpadding="0" cellspacing="1" align="center">
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">用户名：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.userName}
						</div></td>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">开户所在省：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.province}
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">所属角色：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.roleName}
						</div></td>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">开户所在市：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.city}
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">昵称：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.userNickname}
						</div></td>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">银行名称：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.bankName}
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">真实姓名：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.userRealname}
						</div></td>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">所属支行或分行：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.subbranchBank}
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">年龄：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.userAge}
						</div></td>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">银行户名：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.bankAccountName}
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">性别：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.userSex}
						</div></td>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">银行账号：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.bankAccount}
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">地址：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.userAddress}
						</div></td>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">账号类型：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.accountType}
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">电话：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.userPhone}
						</div></td>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">是否付费：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.pay}
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">邮箱：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.userMail}
						</div></td>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">备注：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.mark}
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">QQ：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.userQQ}
						</div></td>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">用户状态：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.status}
						</div></td>
				</tr>
				<tr>
				<td height="30" width="20%">
						<div align="right" class="STYLE1">级别：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.level}
						</div></td>
					<td height="30" width="13%">
						<div align="right" class="STYLE1">上级代理用户名编号：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.parentNumber}
						</div></td>
				</tr>
			</table>
</div>
  </body>
</html>
