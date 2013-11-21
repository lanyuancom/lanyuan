<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@include file="../../common/common-css.jsp" %>
  </head>
  
  <body>
<br/>
<br/>  
<form action="${pageContext.servletContext.contextPath }/background/role/update.html" method="post">
		<input type="hidden" name="id" value="${role.id}">
		<table class="ttab" height="100" width="70%" border="0" cellpadding="0" cellspacing="1"
			align="center">
			<tr>
				<td height="30"
					 colspan="2">
					<div align="center">
					<font color="blue" size="8" ><b>修改信息</b></font>
					</div>
				</td>
			</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								角色名：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
							 <input style="height: 20px;width: 200px" name="name" type="text" value="${role.name}"/>
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								角色roleKey：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
							 <input style="height: 20px;width: 200px" name="roleKey" type="text" value="${role.roleKey}"/>
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								是否禁用：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input name="enable" type="radio" <c:if test="${role.enable eq '0'}">checked="checked"</c:if> value="0"/>:禁用　　
						<input name="enable" type="radio" <c:if test="${role.enable eq '1'}">checked="checked"</c:if> value="1"/>:正常
						</div>
					</td>
				</tr>
<tr>	
	<td height="30"width="20%" >
		<div align="right" class="STYLE1" >
				描述：
		</div>
	</td>
	<td >
		<div align="left" class="STYLE1"  style="padding-left:10px;">
			<input style="height: 20px;width: 200px" name="description" type="text" value="${role.description}"/>
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
