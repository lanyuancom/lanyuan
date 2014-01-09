<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@include file="../../common/common-css.jsp" %>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery_1_7_2_min.js"></script>
    <script type="text/javascript">
    function upass(){
      $.ajax({
                url: "${pageContext.servletContext.contextPath }/background/user/updatePass.html",
                type: "POST",
                data: $("#updatePass").serialize(),
                dataType:'json',
                success: function(data) {
               		alert("修改密码成功！");
                }

            });
    
    }
    </script>
  </head>
  
  <body>
  <div style="height: 100%;overflow-y: auto;">
<br/>
<br/>  
<form name="updatePass" id="updatePass" method="post">
<input type="hidden" name="userId" value="${userSessionId}">
		<table class="ttab" height="100" width="40%" border="0" cellpadding="0" cellspacing="1" align="center">
				<tr>
					<td height="30" colspan="4">
						<div align="center">
							<font color="blue" size="6"><b>修改密码</b>
							</font>
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">用户名：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							${userSession.userName}
						</div></td>
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">新密码：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" name="userPassword"
								type="password" />
								*用户新密码
						</div></td>
				</tr>
				<tr>
					<td colspan="4" style="padding: 10px">
						<div align="center">
							<input type="button" value="　保　存　" class="input_btn_style1" onclick="upass();"/> <input
								id="backBt" type="button" value="　返　回　" class="input_btn_style1"
								onclick="javascript:window.location.href='javascript:history.go(-1)'" />
						</div></td>
				</tr>
			</table>
</form>
</div>
  </body>
</html>
