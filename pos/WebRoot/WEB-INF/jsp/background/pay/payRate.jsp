<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@include file="../../common/common-css.jsp" %>
    <script type="text/javascript">
    function sub() {
    var settlementCosts="${rates.settlementCosts}";//结算手续费
      var amountMoney= "${userInfo.amountMoney}";//余额
     var sun = parseFloat(amountMoney)-parseFloat(settlementCosts);
	if (sun > 0) {
		var amount = document.getElementById("costsMoney").value;
		if(amount.indexOf("0.")!=-1){
		  alert("结算金额为整数！");
	    	return;
		}
		if (amount==""||isNaN(parseFloat(amount))) {
	    	alert("输入金额:"+amount+"  有误！");
	    	return;
	    }else if(parseFloat(amount)-parseFloat(amountMoney)>=0){
	    	alert("结算金额不能大于账号余额！");
	    	return;
	    }else if(parseFloat(amount)-parseFloat(settlementCosts)<=0){
	    	alert("结算金额不能小于结算手续费！");
	    	return;
	    }else{
	    	document.onlinePayForm.submit();
	    }
	  	
	}else{
			alert("账号余额不足以结算！");
		}
	}
    </script>
    <style type="text/css">
      input{font-size: 12px}
    </style>
  </head>
  
  <body>
<br/>
<br/>  
<form action="${pageContext.servletContext.contextPath }/background/pay/add.html" method="post" name="onlinePayForm" id="onlinePayForm">
		<table class="ttab" height="100" width="50%" border="0" cellpadding="0" cellspacing="1"
			align="center">
			<tr>
				<td height="30"
					 colspan="5">
					<div align="center">
					<font color="blue" size="4" ><b>申请结算</b></font>
					</div>
				</td>
			</tr>
			<tr>	
				<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
						客户名称：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						${userInfo.userRealname} 
						<input type="hidden" name="userName" value="${userInfo.userRealname}">
						</div>
					</td>
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
			<td height="30" width="20%">
						<div align="right" class="STYLE1">账号余额：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.amountMoney}
							<input type="hidden" name="countMoney" id="amountMoney" value="${userInfo.amountMoney}">
						</div>
					</td>
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								结算手续费：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<c:if test="${empty rates}">8</c:if>
						<c:if test="${not empty rates}">${rates.settlementCosts}</c:if>
						元/笔
						<input type="hidden" name="settlementCosts" id="settlementCosts" value="${rates.settlementCosts}">
						</div>
					</td>
				</tr>
				<tr>	
				<td height="30" width="20%">
						<div align="right" class="STYLE1">银行户名：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.bankAccountName}
							<input type="hidden" name="openBankName" value="${userInfo.bankAccountName}">
						</div>
					</td>
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
				
				<td height="30" width="20%">
						<div align="right" class="STYLE1">银行账号：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.bankAccount}
							<input type="hidden" name="bankAccount" value="${userInfo.bankAccount}">
						</div>
					</td>
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						</div>
					</td>
				</tr>
				<tr>
				<td height="30" width="20%">
						<div align="right" class="STYLE1">银行名称：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.bankName} 
							<input type="hidden" name="bankName" value="${userInfo.bankName}">
						</div>
					</td>
					</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								结算金额：
						</div>
					</td>
					<td colspan="4">
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="costsMoney" id="costsMoney"/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="padding: 10px">
						<div align="center">
			 				<input type="button" value="　申请结算　" class="input_btn_style1" onclick="sub();"/>　　　　
			 				<input id="backBt" type="button" value="　返　回　" class="input_btn_style1" onclick="javascript:window.location.href='javascript:history.go(-1)'"/>
		 				</div>
					</td>
				</tr>
		</table>
</form>
  </body>
</html>
