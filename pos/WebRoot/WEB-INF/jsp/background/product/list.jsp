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
<form id="fenye" name="fenye" action="${pageContext.servletContext.contextPath }/background/product/query.html" method="post">
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
                    <td class="STYLE1"><a href="${pageContext.servletContext.contextPath }/productBrand/addUI">新增</a></td>
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
				商品名称：<input type="text" name="productName" value="${param.productName}" style="height: 20px"/>　　
					小类型：<select name="productBrandId">
							<option value="0">所有类型</option>
					<c:forEach items="${brandNameList}" var="key">
					<c:if test="${key.parentId ne '0'}">
							<option value="${key.productBrandId}" <c:if test="${key.productBrandId eq param.productBrandId}">selected="selected"</c:if> >${key.productBrandName}</option>
						</c:if>
						</c:forEach>	
					</select>　
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
        <td><table class="ttab" width="100%" border="0" cellpadding="0" cellspacing="1"
									bgcolor="b5d6e6" onmouseover="changeto()"
									onmouseout="changeback()">
									<tr>
										<td height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<input id="chose" type="checkbox" name="checkbox" value="checkbox"  onclick="selectAllCheckBox()"/>
											</div>
										</td>
										<td height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">序号</span>
											</div>
										</td>
										<td height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">商品名称</span>
											</div>
										</td>
										<td height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">小类型</span>
											</div>
										</td>
										<td height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">大类型</span>
											</div>
										</td>
										<td background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">商品价</span>
											</div>
										</td>
										<td width="6%" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">商品单位</span>
											</div>
										</td>
										<td height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">浏览次数</span>
											</div>
										</td>
										<td height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1">商品出产地</span>
											</div>
										</td>
										
										<td width="20%" height="22"
											background="${pageContext.servletContext.contextPath }/images/bg.gif"
											bgcolor="#FFFFFF" class="STYLE1">
											<div align="center">
												基本操作
											</div>
										</td>
									</tr>
									<c:forEach items="${pageView.records}" var="key">
										<tr>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center">
													<input type="checkbox" name="check" value="${key.productId}" />
												</div>
											</td>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center" class="STYLE1">
													<div align="center">
														${key.productId}
													</div>
												</div>
											</td>
											<td height="20" bgcolor="#FFFFFF">
												<div align="left">
													<span class="STYLE1">${key.productName}</span>
												</div>
											</td>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">${key.productBrandName}</span>
												</div>
											</td>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center">
												<c:forEach items="${brandNameList}" var="k">
												<c:if test="${key.parentId eq k.productBrandId}">
													<span class="STYLE1">${k.productBrandName}</span>
													</c:if>
													</c:forEach>
												</div>
											</td>
											<td bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">${key.price}</span>
												</div>
											</td>
											<td bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">${key.productUnit}</span>
												</div>
											</td>
											<td bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">${key.productLookNuns}</span>
												</div>
											</td>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">${key.productProduce}</span>
												</div>
											</td>

											<td height="20" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE4"><img
															src="${pageContext.servletContext.contextPath }/images/33.gif" width="16"
															height="16" /><a href="${pageContext.servletContext.contextPath }/background/product/getById.html?productId=${key.productId}&type=1">详细</a>&nbsp; &nbsp;<img
															src="${pageContext.servletContext.contextPath }/images/edt.gif" width="16"
															height="16" /><a href="${pageContext.servletContext.contextPath }/background/product/getById.html?productId=${key.productId}&type=1">修改</a>&nbsp; &nbsp;<img
															src="${pageContext.servletContext.contextPath }/images/del.gif" width="16"
															height="16"/><a href="javascript:void(0);" onclick="deleteId('${pageContext.servletContext.contextPath }/background/product/deleteById.html?productId=${key.productId}')">删除</a></span>
												</div>
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