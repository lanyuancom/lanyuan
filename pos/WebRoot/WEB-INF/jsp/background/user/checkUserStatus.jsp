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
                url: "${pageContext.servletContext.contextPath }/background/user/checkStatus.html",
                type: "POST",
                async:false,
                data: {"status":status,"userId":"${userInfo.userId}"},
                dataType:'json',
                success: function(data) {
               		alert("处理成功！！");
               		window.location.href="${pageContext.servletContext.contextPath }/background/user/query.html";
                }

            });
    }
    </script>
  </head>
  
  <body>
  <div style="height: 100%;overflow-y: auto;">
<br/>
<br/>  
		<table class="ttab" height="100" width="90%" border="0"
				cellpadding="0" cellspacing="1" align="center">
				<tr>
					<td height="30" colspan="4">
						<div align="center">
							<font color="blue" size="5"><b>审核客户</b> </font>
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">用户名：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.userName}
						</div>
					</td>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">银行户名：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.bankAccountName}
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">密码：</div>
					</td>
					<td>
						<div align="left" class="STYLE1"
							style="padding-left:10px;color: red;">*默认密码为身份证后6位 </div>
					</td>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">银行账号：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.bankAccount}
						</div>
					</td>
				</tr>
				<tr>
				
				<td height="30" width="10%">
						<div align="right" class="STYLE1">真实姓名：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.userRealname} 
						</div>
					</td>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">银行名称：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.bankName} 
						</div>
					</td>
				</tr>
				<tr>
					
					<td height="30" width="10%">
						<div align="right" class="STYLE1">身份证：</div>
					</td>
					<td>
						<div align="left" class="STYLE1"
							style="padding-left:10px;color: red;">
								${userInfo.userIdCard} 
						</div>
					</td>
					
					<td height="30" width="10%">
						<div align="right" class="STYLE1">开户所在省：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.province} 
						</div>
					</td>
				</tr>
				<tr>
				<td height="30" width="10%">
						<div align="right" class="STYLE1">费率通道：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
						${userInfo.channelname} 
						</div>
					</td>
					
					<td height="30" width="10%">
						<div align="right" class="STYLE1">开户所在市：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.city} 
						</div>
					</td>
				</tr>
				<tr>
					
					<td height="30" width="10%">
						<div align="right" class="STYLE1">QQ：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.userQQ}
						</div>
					</td>
					
					<td height="30" width="10%">
						<div align="right" class="STYLE1">所属支行或分行：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.subbranchBank}
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">开通费：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userInfo.pay}
						</div>
					</td>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">账号类型：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
						${userInfo.accountType}
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">用户状态：</div>
					</td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;color: red">
						<c:if test="${userInfo.status eq '0'}">待审核
						<input type="hidden" name="status" value="${userInfo.status}" />
						</c:if>
							<c:if test="${userInfo.status eq '1'}">审核通过
						<input type="hidden" name="status" value="${userInfo.status}" />
						</c:if>
							<c:if test="${userInfo.status eq '2'}">审核不通过
						<input type="hidden" name="status" value="${userInfo.status}" />
						</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="padding: 10px">
						<div align="center">
							<input type="button" value="　同　意　" class="input_btn_style1"
								onclick="checkUser('1');" />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input type="button" value="　不同意　" class="input_btn_style1"
								onclick="checkUser('2');" />
						</div>
					</td>
				</tr>
			</table>
</div>
  </body>
</html>
