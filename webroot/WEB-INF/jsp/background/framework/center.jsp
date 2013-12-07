<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<style> 
.navPoint { 
COLOR: white; CURSOR: hand; FONT-FAMILY: Webdings; FONT-SIZE: 9pt 
} 
</style> 
<script>
function switchSysBar(){ 
if (document.getElementById("frmTitle").style.display=="")
{ 
	document.getElementById("img1").src="${pageContext.servletContext.contextPath }/images/main_41_1.gif";
	document.getElementById("frmTitle").style.display="none" ;
} 
else
{ 
	document.getElementById("img1").src="${pageContext.servletContext.contextPath }/images/main_41.gif";
	document.getElementById("frmTitle").style.display="" ;
} 
} 
</script>

</head>

<body style="overflow:hidden">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="171" id=frmTitle noWrap name="fmTitle" align="center" valign="top">
	<iframe name="I1" height="100%" width="171" src="${pageContext.servletContext.contextPath }/background/left.html" border="0" frameborder="0" scrolling="no">
	浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>	</td>
    <td width="9" valign="middle"  bgcolor="#0a5c8e" onclick="switchSysBar()" style="cursor: pointer;"><SPAN class=navPoint 
id=switchPoint title=关闭/打开左栏><img src="${pageContext.servletContext.contextPath }/images/main_41.gif" name="img1" width=9 height=52 id=img1></SPAN></td>
    <td align="center" valign="top"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
      <tr>
        <td height="8" style=" line-height:8px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
          <tr>
            <td width="14"><img src="${pageContext.servletContext.contextPath }/images/main_24.gif" width="14" height="8"></td>
            <td background="${pageContext.servletContext.contextPath }/images/main_26.gif" style="line-height:8px;">&nbsp;</td>
            <td width="7"><img src="${pageContext.servletContext.contextPath }/images/main_28.gif" width="7" height="8"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
          <tr>
            <td><iframe id="main" name="main" height="100%" width="100%" src="${pageContext.servletContext.contextPath }/background/tab.html" border="0" frameborder="0" scrolling="no"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
            <td width="3" style="width:3px; background:#0a5c8e;">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="12" style="line-height:12px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
          <tr>
            <td width="14" height="12"><img src="${pageContext.servletContext.contextPath }/images/main_46.gif" width="14" height="12"></td>
            <td background="${pageContext.servletContext.contextPath }/images/main_48.gif" style="line-height:12px;">&nbsp;</td>
            <td width="7"><img src="${pageContext.servletContext.contextPath }/images/main_50.gif" width="7" height="12"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
