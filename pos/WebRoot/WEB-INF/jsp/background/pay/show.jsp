<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@include file="../../common/common-css.jsp" %>
    
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/jquery_1_7_2_min.js"></script>
    <script type="text/javascript">
    function checkUser(status){
    	$.ajax({
                url: "${pageContext.servletContext.contextPath }/background/pay/checkStatus.html",
                type: "POST",
                async:false,
                data: {"payState":status,"id":"${pay.id}"},
                dataType:'json',
                success: function(data) {
               		alert("处理成功！！");
               		window.location.href="${pageContext.servletContext.contextPath }/background/pay/query.html";
                }

            });
    }
    </script>
    <style type="text/css">
      input{font-size: 12px}
    </style>
  </head>
  
  <body>
<br/>
<br/>  
		<table class="ttab" height="100" width="70%" border="0" cellpadding="0" cellspacing="1"
			align="center">
			<tr>
				<td height="30"
					 colspan="2">
					<div align="center">
					<font color="blue" size="6" ><b>审核结算</b></font>
					</div>
				</td>
			</tr>
			<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								用户名：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						${pay.userName}
						</div>
					</td>
				</tr>
			<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
							银行名称
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						${pay.bankName}
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
						${pay.openBankName}
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1">
								银行账号：
						</div>
					</td>
					<td>
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						${pay.bankAccount}
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
						${pay.costsMoney}
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								结算手续费：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						${pay.settlementCosts}
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								结算应得金额：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						${pay.payMoney}
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								申请结算时间：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
							<fmt:formatDate value="${pay.payTime}" pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								状态：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<c:if test="${pay.payState eq '0'}"><font color="red">等审核</font></c:if>
			<c:if test="${pay.payState eq '1'}"><font color="blue">已经结算</font></c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding: 10px">
						<div align="center">
			 				<input type="button" value="　审核通过　" class="input_btn_style1"
								onclick="checkUser('1');" />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input type="button" value="　不通过　" class="input_btn_style1"
								onclick="checkUser('2');" />
		 				</div>
					</td>
				</tr>
		</table>
  </body>
</html>
