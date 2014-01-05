<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
* {
	font-size:12px;
	margin:0;
	padding:0; 
} 
fieldset {
	padding:10px;
	margin:10px;
	width:100%;
	color:#333; 
	border:#06c dashed 1px;
} 
legend {
	color:#06c;
	font-weight:800; 
	background:#fff;
	border:#b6b6b6 solid 1px;
	padding:3px 6px;
} 
ul {
	list-style-type: none;
	margin:8px 0 4px 0;
} 
li {
	margin-top:4px;
}
</style>
</head>

<body>
<div align="center" style="width: 100%;">
<table width="80%">
<tr>
	<td><fieldset> 
  <legend>${article.title}</legend> 
   ${article.content}
</fieldset></td>
</tr>
</table></div>
</body>
</html>
