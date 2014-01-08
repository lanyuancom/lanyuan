<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../../common/common-css.jsp" %>
<%@include file="../../common/common-js.jsp" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/fenyecss.css" />
	<script type="text/javascript">
	function openWindow(url,windowName){
		window.open(url,windowName);
	}
	
	</script>
	<style type="text/css">
	  input{font-size: 12px}
	</style>
</head>
<body>
<form id="fenye" name="fenye" action="${pageContext.servletContext.contextPath }/background/rates/query.html" method="post">
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
				支付通道：<input type="text" name="channelname" value="${param.channelname}" style="height: 20px"/>　　
				<input type="submit" value="开始查询" class="input_btn_style1"/>&nbsp;&nbsp;
				<input type="button" value="重置" class="input_btn_style1" onclick="clearText()"/>
			</div>
		</fieldset>
	</div>
  </td>
  </tr>
  <tr>
    <td>
     <div style="padding-left: 10px;padding-bottom: 5px;">
         <input type="button" value="批量删除" class="input_btn_style1" onclick="return deleteAll()"/>&nbsp;&nbsp;
     </div>
    <table class="listtable" width="100%">
      <tr>
        <td width="8" background="${pageContext.servletContext.contextPath }/images/tab_12.gif">&nbsp;</td>
        <td><table class="ttab" width="100%" cellspacing="1" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" >
              <input id="chose" type="checkbox" name="checkbox" onclick="selectAllCheckBox()" />
            </td>
 			<td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">支付通道</td>
            <td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">通道说明</span></td>
            <td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">交易费率</span></td>
            <td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">结算费用 </span></td>
             <td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">结算限额 </td>
            <td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">支付链接</td>
            <td width="23%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">操作</td>
          </tr>
          
          <c:forEach var="rates" items="${pageView.records}">
          <tr>
            <td height="20" >
              <input type="checkbox" name="check" value="${rates.id}" />
            </td>
            
            <td height="20" ><span class="STYLE1">${rates.channelname}</span></td>
            <td height="20" ><span class="STYLE1">${rates.mark}</span></td>
            <td height="20" ><span class="STYLE1">${rates.tradingRates}</span></td>
            <td height="20" ><span class="STYLE1">${rates.settlementCosts} 元/笔</span></td>
            <td height="20" ><span class="STYLE1">${rates.settlementCaps} 元/次</span></td>
            <td height="20" ><span class="STYLE1">
     <a href="javascript:void(0);" onclick="openWindow('${pageContext.servletContext.contextPath }/background/rates/money.html?ratesId=${rates.id}','支付');">立即支付</a>
            </span></td>
            <td height="20" ><span class="STYLE4">
             <a href="${pageContext.servletContext.contextPath }/background/payMent/query.html">
                                     充值记录
            </a>&nbsp;&nbsp;
             <a href="${pageContext.servletContext.contextPath }/background/pay/payRates.html?ratesId=${rates.id}&type=1">
                                      申请结算
            </a>&nbsp; &nbsp;
            <a href="${pageContext.servletContext.contextPath }/background/pay/query.html">
           	待结算款项
           	</a>
            <sec:authorize ifAnyGranted="ROLE_rates_update">
            &nbsp; &nbsp;
             <img src="${pageContext.servletContext.contextPath }/images/edt.gif" width="16" height="16" />
            <a href="${pageContext.servletContext.contextPath }/background/rates/getById.html?ratesId=${rates.id}&type=1">
                                     编辑
            </a></sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_rates_delete">
            &nbsp; &nbsp;
            <img src="${pageContext.servletContext.contextPath }/images/del.gif" width="16" height="16" />
            	<a href="javascript:void(0);" onclick="deleteId('${pageContext.servletContext.contextPath }/background/rates/deleteById.html?ratesId=${rates.id}')">
            	删除</a>
            	</sec:authorize>
            	</span>
            	</td>
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