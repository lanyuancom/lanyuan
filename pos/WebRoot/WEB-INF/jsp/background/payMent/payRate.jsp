<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@include file="../../common/common-css.jsp" %>
    <style type="text/css">
      input{font-size: 12px}
    </style>
  </head>
  
  <body>
<br/>
<br/>  
<form action="${pageContext.servletContext.contextPath }/background/pay/add.html" method="post">
		<table class="ttab" height="100" width="70%" border="0" cellpadding="0" cellspacing="1"
			align="center">
			<tr>
				<td height="30"
					 colspan="2">
					<div align="center">
					<font color="blue" size="4" ><b>申请结算</b></font>
					</div>
				</td>
			</tr>
			<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
						通道名称：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<c:if test="${empty rates}">提成通道</c:if>
						<c:if test="${not empty rates}">${rates.channelname}</c:if>
						
						</div>
					</td>
				</tr>
			<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								上班时间结算：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<c:if test="${empty rates}">8</c:if>
						<c:if test="${not empty rates}">${rates.settlementCosts}</c:if>
						元/笔
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								其他时间结算：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<c:if test="${empty rates}">20</c:if>
						<c:if test="${not empty rates}">${rates.holidayCosts}</c:if>
						元/笔
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								结算限额：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<c:if test="${empty rates}">49990.0</c:if>
						<c:if test="${not empty rates}">${rates.settlementCaps}</c:if>
						元/次
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1">
								结算账号：
						</div>
					</td>
					<td>
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="userName"/>
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1">
								银行名称：
						</div>
					</td>
					<td>
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="bankName"/>
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								开户行（支行）：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="openBankName"/>
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								银行账号：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="bankAccount"/>
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								结算金额：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="payMoney"/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding: 10px">
						<div align="center">
			 				<input type="submit" value="　保　存　" class="input_btn_style1"/>　　　　
			 				<input id="backBt" type="button" value="　返　回　" class="input_btn_style1" onclick="javascript:window.location.href='javascript:history.go(-1)'"/>
		 				</div>
					</td>
				</tr>
		</table>
</form>
  </body>
</html>
