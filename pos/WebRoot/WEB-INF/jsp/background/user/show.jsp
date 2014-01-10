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
		<table class="ttab" height="100" width="70%" border="0"
				cellpadding="0" cellspacing="1" align="center">
				<tr>
					<td height="30" colspan="4">
						<div align="center">
							<font color="blue" size="5"><b>结算账号</b> </font>
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" width="15%">
						<div align="right" class="STYLE1">用户名：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.userName}
						</div>
					</td>
					<td height="30" width="15%">
						<div align="right" class="STYLE1">银行户名：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.bankAccountName}
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" width="15%">
						<div align="right" class="STYLE1">账号余额：</div>
					</td>
					<td>
						<div align="left" class="STYLE1"
							style="padding-left:10px;color: red;">${userInfo.amountMoney} </div>
					</td>
					<td height="30" width="15%">
						<div align="right" class="STYLE1">银行账号：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.bankAccount}
						</div>
					</td>
				</tr>
				<tr>
				
				<td height="30" width="15%">
						<div align="right" class="STYLE1">真实姓名：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.userRealname} 
						</div>
					</td>
					<td height="30" width="15%">
						<div align="right" class="STYLE1">银行名称：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.bankName} 
						</div>
					</td>
				</tr>
				<tr>
					
					<td height="30" width="15%">
						<div align="right" class="STYLE1">身份证：</div>
					</td>
					<td>
						<div align="left" class="STYLE1"
							style="padding-left:10px;color: red;">
								${userInfo.userIdCard} 
						</div>
					</td>
					
					<td height="30" width="15%">
						<div align="right" class="STYLE1">开户所在省：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.province} 
						</div>
					</td>
				</tr>
				<tr>
				<td height="30" width="15%">
						<div align="right" class="STYLE1">费率：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
						${userInfo.tradingRates} &nbsp; &nbsp;
						</div>
					</td>
					
					<td height="30" width="15%">
						<div align="right" class="STYLE1">开户所在市：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.city} 
						</div>
					</td>
				</tr>
				<tr>
					
					<td height="30" width="15%">
						<div align="right" class="STYLE1">QQ：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.userQQ}
						</div>
					</td>
					
					<td height="30" width="15%">
						<div align="right" class="STYLE1">所属支行或分行：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.subbranchBank}
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" width="15%">
						<div align="right" class="STYLE1">开通费：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.pay}
						</div>
					</td>
					<td height="30" width="15%">
						<div align="right" class="STYLE1">账号类型：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
						${userInfo.accountType}
						</div>
					</td>
				</tr>
			</table>
</div>
  </body>
</html>
