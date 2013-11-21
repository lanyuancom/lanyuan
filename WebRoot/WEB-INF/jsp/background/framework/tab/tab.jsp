<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<SCRIPT src="${pageContext.servletContext.contextPath }/js/Clock.js" type=text/javascript></SCRIPT>
<title>无标题文档</title>
</head>

<body bgcolor="#353c44">
<div>
<center style="color: white;font-weight: 800;font-size: 30px;" >尊贵的：<span style="color: yellow;font-weight: 800;">${admin.userName}${admin.superName}</span>　　您好！！！！ 欢迎进入蓝缘管理系统:</center>
<dir style="color: white;font-size: 20px;">
你的身份是: <span style="color: yellow;">
 <c:if test="${admin.level eq '0'}">超级管理员</c:if> 
  <c:if test="${admin.level ne '0'}"> 普通用户</c:if>
  </span>
　　现在的时间是:<span class="STYLE7"><b><SPAN id=clock style="color: yellow;"></SPAN></b>
 <SCRIPT type=text/javascript>
    var clock = new Clock();
    clock.display(document.getElementById("clock"));
</SCRIPT></span>
</dir>　
</div>
<div style="padding: 8px;background-color: gray;" align="center">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="690" height="200">
  <param name="movie" value="${pageContext.servletContext.contextPath }/js/20101262241501.swf" />
  <param name="quality" value="high" />
  <embed src="${pageContext.servletContext.contextPath }/js/20101262241501.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"width="690" height="200"></embed>
</object>

</div>
</body>
</html>
