<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="green-black" style="text-align: left">
总记录数：${pageView.rowCount}条 |　每页显示：${pageView.pageSize}条 |　总页数：${pageView.pageCount}页｜  当前页：${pageView.pageNow}　  
<a href="javascript:void(0);" onclick="pageNow('1');">
	首页
</a>
<c:if test="${pageView.pageNow eq 1}">
<span class="disabled">
	上一页
</span>
</c:if>
<c:if test="${pageView.pageNow ne 1}">
<a href="javascript:void(0);" onclick="return pageNow('${pageView.pageNow - 1}')">
	上一页
</a>
</c:if>
	<c:forEach begin="${pageView.pageindex.startindex}" end="${pageView.pageindex.endindex}" var="key">
		<c:if test="${pageView.pageNow==key}">
		<span class="current">${key}</span>
		</c:if>
		<c:if test="${pageView.pageNow!=key}">
			&nbsp;<a href="javascript:void(0);" onclick="pageNow('${key}')">${key}</a>
		</c:if>
	</c:forEach>
<c:if test="${pageView.pageNow ne pageView.pageCount}">	
<a href="javascript:void(0);" onclick="pageNow('${pageView.pageNow + 1}')">
 	下一页
 </a>	
</c:if>
<c:if test="${pageView.pageNow eq pageView.pageCount}">	
<span class="disabled">
 	下一页
</span>	
</c:if>
 <a href="javascript:void(0);" onclick="pageNow('${pageView.pageCount}')">
	尾页
 </a>
</div>