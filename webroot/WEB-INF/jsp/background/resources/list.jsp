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
<form id="fenye" name="fenye" action="${pageContext.servletContext.contextPath }/background/resources/query.html" method="post">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：文章管理-添加文章</td>
              </tr>
            </table></td>
            <td width="54%"><table align="right" >
              <tr>
                <td width="60"><table width="87%" >
                  <tr>
                    <td class="STYLE1"><div align="center">
                      <input type="checkbox" name="checkbox11" id="choseAll" onclick="selectAllCheckBox()" />
                    </div></td>
                    <td class="STYLE4">全选</td>
                  </tr>
                </table></td>
                <td width="52"><table width="88%">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="${pageContext.servletContext.contextPath }/images/11.gif" width="14" height="14" /></div></td>
                    <td class="STYLE4">
                    <a href="javascript:void(0);"  onclick="return deleteAll()">
                    	删除
                    </a>
                    	</td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="${pageContext.servletContext.contextPath }/images/22.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><a href="${pageContext.servletContext.contextPath }/resources/addUI">新增</a></td>
                  </tr>
                </table></td>
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
				名称：<input type="text" name="name" value="${param.name}" style="height: 20px"/>　　
				<input type="submit" value="开始查询" class="input_btn_style1"/>&nbsp;&nbsp;
				<input type="button" value="重置" class="input_btn_style1" onclick="clearText()"/>
			</div>
		</fieldset>
	</div>
  </td>
  </tr>
  <tr>
    <td><table class="listtable" width="100%">
      <tr>
        <td width="8" background="${pageContext.servletContext.contextPath }/images/tab_12.gif">&nbsp;</td>
        <td><table class="ttab" width="100%" cellspacing="1" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" >
              <input id="chose" type="checkbox" name="checkbox" onclick="selectAllCheckBox()" />
            </td>
 			<td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">资源名</td>
            <td width="10%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">资源KEY</span></td>
            <td width="20%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">资源URL</span></td>
            <td width="8%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">资源类型</td>
            <td width="5%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">优先级</td>
            <td width="10%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">上级资源</td>
            <td width="23%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">操作</td>
          </tr>
          
          <c:forEach var="resources" items="${pageView.records}">
          <tr>
            <td height="20" >
              <input type="checkbox" name="check" value="${resources.id}" />
            </td>
            
            <td height="20" ><span class="STYLE1">${resources.name}</span></td>
            <td height="20" ><span class="STYLE1">${resources.resKey}</span></td>
            <td height="20" ><span class="STYLE1">${resources.resUrl}</span></td>
            <td height="20" ><span class="STYLE1">
            <c:if test="${resources.type eq '0'}">
            <font color="red">目录</font>
            </c:if>
            <c:if test="${resources.type eq '1'}">
            <font color="blue">菜单</font>
            </c:if>
            <c:if test="${resources.type eq '2'}">
         					  	按扭
            </c:if>
            </span></td>
            <td height="20" ><span class="STYLE1">${resources.level}</span></td>
            <td height="20" ><span class="STYLE1">${resources.parentName}</span></td>
            <td height="20" ><span class="STYLE4">
            <sec:authorize ifAnyGranted="ROLE_sys_res_show">
            <img src="${pageContext.servletContext.contextPath }/images/del.gif" width="16" height="16" />
            	<a href="${pageContext.servletContext.contextPath }/background/resources/getById.html?resourcesId=${resources.id}&&typeKey=0">
            	显示详细信息</a>
            	&nbsp;&nbsp;
				</sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_sys_res_edit">
            <img src="${pageContext.servletContext.contextPath }/images/edt.gif" width="16" height="16" />
            <a href="${pageContext.servletContext.contextPath }/background/resources/getById.html?resourcesId=${resources.id}&&typeKey=1">
                                     编辑
            </a>
            &nbsp; &nbsp;
            </sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_sys_res_delete">
            <img src="${pageContext.servletContext.contextPath }/images/del.gif" width="16" height="16" />
            	<a href="javascript:void(0);" onclick="deleteId('${pageContext.servletContext.contextPath }/background/resources/deleteById.html?resourcesId=${resources.id}')">
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