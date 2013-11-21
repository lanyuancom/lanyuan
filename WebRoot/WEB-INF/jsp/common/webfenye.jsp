<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="${pageContext.servletContext.contextPath }/images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;总记录数:${pageView.rowCount}条 |每页显示:${pageView.pageSize}条 | 总页数:${pageView.pageCount}页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40" class="STYLE4">
                  <a href="#" onclick="pageNow('1');">
                  	首页
                  </a>
                  </td>
                  <td width="45" class="STYLE4">
                  <a href="#" onclick="return pageNow('${pageView.pageNow - 1}')">
                  	上一页
                  </a>
                  </td>
                  <td align="center">
                  <c:forEach begin="${pageView.pageindex.startindex}" end="${pageView.pageindex.endindex}" var="key">
						<c:if test="${pageView.pageNow==key}">
							&nbsp;<span class="current" style="color: red;font-size: 20px;"> ${key}</span>
						</c:if>
						<c:if test="${pageView.pageNow!=key}">
							&nbsp;<a href="#" onclick="pageNow('${key}')">${key}</a>
						</c:if>
					</c:forEach>&nbsp;
                  </td>
                  <td width="45" class="STYLE4">
                  <a href="#" onclick="pageNow('${pageView.pageNow + 1}')">
                  	下一页
                  </a>
                  </td>
                  <td width="40" class="STYLE4">
                  <a href="#" onclick="pageNow('${pageView.pageCount}')">
                 	尾页
                  </a>
                  </td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="${pageContext.servletContext.contextPath }/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table>