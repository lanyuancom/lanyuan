<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../../common/common-css.jsp" %>
<%@include file="../../common/common-js.jsp" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/fenyecss.css" />
	<style type="text/css">
	  input{font-size: 12px}
	</style>
</head>
<body>
<form id="fenye" name="fenye" action="${pageContext.servletContext.contextPath }/background/pay/query.html" method="post">
<table width="100%">
  <tr>
    <td height="30" background="${pageContext.servletContext.contextPath }/images/tab_05.gif"><table width="100%">
      <tr>
        <td width="12" height="30"><img src="${pageContext.servletContext.contextPath }/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%">
          <tr>
            <td width="46%" valign="middle"><table width="100%">
              <tr>
                <td width="5%"><div align="center"><img src="${pageContext.servletContext.contextPath }/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="${pageContext.servletContext.contextPath }/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  <td align="center">
  <!-- 这里的表单 name 必须是fenye -->
  	<div class="search_k" align="left">
		<fieldset class="search">
			<legend><img src="${pageContext.servletContext.contextPath }/images/search_btn.gif" align="middle"/>&nbsp;<span class="STYLE1" style="color: blue;">高级查找</span></legend>
			<div class="search_content">
				用户名：<input type="text" name="userName" value="${param.userName}" style="height: 20px"/>
				<select id="payState" name="payState">
				<option value="">请选择状态</option>
				<option value="0" <c:if test="${param.payState eq '0'}"> selected="selected"</c:if>>未结算</option>
				<option value="1" <c:if test="${param.payState eq '1'}"> selected="selected"</c:if>>已经结算</option>
				</select>　　
				<input type="submit" value="开始查询" class="input_btn_style1"/>&nbsp;&nbsp;
				<input type="button" value="重置" class="input_btn_style1" onclick="clearText()"/>
			</div>
		</fieldset>
	</div>
  </td>
  </tr>
  <tr>
    <td>
     <sec:authorize ifAnyGranted="ROLE_pay_delete">
    <div style="padding-left: 10px;padding-bottom: 5px;">
         <input type="button" value="批量删除" class="input_btn_style1" onclick="return deleteAll()"/>&nbsp;&nbsp;
     </div>
     </sec:authorize>
    <table class="listtable" width="100%">
      <tr>
        <td width="8" background="${pageContext.servletContext.contextPath }/images/tab_12.gif">&nbsp;</td>
        <td><table class="ttab" width="100%" cellspacing="1" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" >
              <input id="chose" type="checkbox" name="checkbox" onclick="selectAllCheckBox()" />
            </td>
 			<td width="7%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">用户名</td>
            <td width="10%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">银行名称</span></td>
            <td width="10%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">开户行（支行）</span></td>
            <td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">银行账号</td>
            <td width="5%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">结算金额</td>
            <td width="6%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">结算手续费</td>
            <td width="7%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">结算应得金额</td>
            <td width="11%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">申请结算时间</td>
            <td width="11%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">结算时间</td>
            <td width="6%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">状态</td>
            <sec:authorize ifAnyGranted="ROLE_pay_delete">
            <td width="23%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">操作</td>
         	</sec:authorize>
          </tr>
          
          <c:forEach var="pay" items="${pageView.records}">
          <tr>
            <td height="20" >
              <input type="checkbox" name="check" value="${pay.id}" />
            </td>
            
            <td height="20" ><span class="STYLE1">${pay.userName}</span></td>
            <td height="20" ><span class="STYLE1">${pay.bankName}</span></td>
            <td height="20" ><span class="STYLE1">${pay.openBankName}</span></td>
            <td height="20" ><span class="STYLE1">${pay.bankAccount}</span></td>
            <td height="20" ><span class="STYLE1">${pay.costsMoney}</span></td>
            <td height="20" ><span class="STYLE1">${pay.settlementCosts}</span></td>
            <td height="20" ><span class="STYLE1">${pay.payMoney}</span></td>
            <td height="20" ><span class="STYLE1"><fmt:formatDate value="${pay.payTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span></td>
            <td height="20" ><span class="STYLE1"><fmt:formatDate value="${pay.settlementTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span></td>
            
            <td height="20" ><span class="STYLE1">
			<c:if test="${pay.payState eq '0'}"><font color="red">等审核</font></c:if>
			<c:if test="${pay.payState eq '2'}"><font color="blue">审核不通过</font></c:if>
			<c:if test="${pay.payState eq '1'}"><font color="blue">已经结算</font></c:if>
	</span></td>
            
            <td height="20" ><span class="STYLE4">
            <c:if test="${userSession.roleName ne 'admin'||userSession.roleName ne 'super'}">
            <c:if test="${pay.payState eq '0'}"><font color="red">
     <a href="${pageContext.servletContext.contextPath }/background/pay/show.html?payId=${pay.id}">       
            审核
            </a>
            </font></c:if></c:if>
           <%--  <img src="${pageContext.servletContext.contextPath }/images/del.gif" width="16" height="16" />
            	<a href="${pageContext.servletContext.contextPath }/background/pay/getById.html?payId=${pay.id}&type=0">
            	显示详细信息</a>
            	&nbsp;&nbsp;
            <img src="${pageContext.servletContext.contextPath }/images/edt.gif" width="16" height="16" />
            <a href="${pageContext.servletContext.contextPath }/background/pay/getById.html?payId=${pay.id}&type=1">
                                     编辑
            </a> --%>
          
            &nbsp; &nbsp;
             <sec:authorize ifAnyGranted="ROLE_pay_delete">
            <img src="${pageContext.servletContext.contextPath }/images/del.gif" width="16" height="16" />
            	<a href="javascript:void(0);" onclick="deleteId('${pageContext.servletContext.contextPath }/background/pay/deleteById.html?payId=${pay.id}')">
            	删除</a></sec:authorize>
            	</span></td>
          </tr>
          </c:forEach>
        </table></td>
        <td width="8" background="${pageContext.servletContext.contextPath }/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="${pageContext.servletContext.contextPath }/images/tab_19.gif"><%@include file="../../common/webfenye.jsp" %>
    </td>
  </tr>
</table>
</form>
</body>
</html>