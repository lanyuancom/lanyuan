<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@include file="../../common/common-css.jsp" %>
     <script src="${pageContext.servletContext.contextPath }/js/jquery_1_7_2_min.js" type="text/javascript"></script>
  <script type="text/javascript">
  function allocation(){
       $.ajax({
      		async:false, //请勿改成异步，下面有些程序依赖此请数据
      		type : "POST",
      		data:{userId:"${user.userId}",roleId:$('input[name="roleId"]:checked').val()},
      		url: "${pageContext.servletContext.contextPath }/background/user/allocation.html",
      		dataType:'json',
      		success: function(json){
      			if(json == "1000"){
      			window.dialogArguments.location.reload();
		          alert("分配成功！！");
		          window.close();
              	}else if(json == "1001"){
              		alert("分配失败！！");
                };
       		}
      	});
      }
  </script>
  
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
					<font color="blue" size="3" ><b>分配角色</b></font>
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
						${user.userName}
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								所属角色
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<c:if test="${empty user.roleName}">
						<font color="red">没有分配角色</font>
						</c:if>
						<c:if test="${not empty user.roleName}">
						<font color="blue">${user.roleName}</font>
						</c:if>
						</div>
					</td>
				</tr>
				<tr>
				<td colspan="2">
				<table class="listtable" width="100%">
      <tr>
        <td width="8" background="${pageContext.servletContext.contextPath }/images/tab_12.gif">&nbsp;</td>
        <td><table class="ttab" width="100%" cellspacing="1" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" >
            </td>
 			<td width="15%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">角色名</td>
            <td width="5%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">是否禁用</span></td>
            <td width="12%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">描述</span></td>
          </tr>
          
          <c:forEach var="role" items="${roles}">
          <tr>
            <td height="20" >
              <input type="radio" name="roleId" value="${role.id}" />
            </td>
            <td height="20" ><span class="STYLE1">${role.name}</span></td>
            <td height="20" ><span class="STYLE1">
             <c:if test="${role.enable eq '0'}">
            <font color="red">禁用</font>
            </c:if>
            <c:if test="${role.enable eq '1'}">
            <font color="blue">正常</font>
            </c:if></span></td>
            <td height="20" ><span class="STYLE1">${role.description}</span></td>
          </tr>
          </c:forEach>
        </table></td>
        <td width="8" background="${pageContext.servletContext.contextPath }/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table>
				</td>
				</tr>
				<tr>
					<td colspan="2" style="padding: 10px">
						<div align="center">
			 				<input type="button" value="　保　存　" class="input_btn_style1" onclick="allocation();"/>　　　　
			 				<input id="backBt" type="button" value="　关　闭　" class="input_btn_style1" onclick="javascript:window.close();"/>
		 				</div>
					</td>
				</tr>
		</table>
  </body>
</html>
