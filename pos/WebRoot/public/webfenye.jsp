<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/css.css" charset="utf-8" />
<form name="fenye" method="post">		
<div class="meneame">
<font size="2">
总记录数:${pageView.rowCount}条 | 每页显示:${pageView.pageSize}条 | 总页数:${pageView.pageCount}页</font>
			-----------------------------
	<a href="#" onclick="pageNow('1')" >首页</a> <a href="#" onclick="return pageNow('${pageView.pageNow - 1}')"> < </a>
	
	<c:forEach begin="${pageView.pageindex.startindex}"end="${pageView.pageindex.endindex}" var="key">
	<c:if test="${pageView.pageNow==key}">
		<font color="blue" size="4"> <b>- ${key} -</b></font>
	</c:if>
	<c:if test="${pageView.pageNow!=key}">
	<a href="#"  onclick="pageNow('${key}')">${key}</a>
	</c:if>
	</c:forEach>
	
	<a href="#" onclick="pageNow('${pageView.pageNow + 1}')"> > </a>
	
	<a href="#" onclick="pageNow('${pageView.pageCount}')">尾页 </a>
</div>
</form>