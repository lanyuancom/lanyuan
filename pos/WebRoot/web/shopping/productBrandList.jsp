<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<html>
	<head>
<%@include file="/web/shopping/shophead.jsp"%>
		<style type=text/css>
.pic1 {
	MARGIN-TOP: -117px;
	MARGIN-left: 0px
}

.pic3 {
	MARGIN-TOP: -90px;
	MARGIN-left: 0px
}

.pic2 {
	padding-top: 6px
}

.com_zongji_name {
	FONT-SIZE: 14px;
	COLOR: #ff5b02
}

.formwidth3 {
	BORDER-RIGHT: #cccccc 1px solid;
	BORDER-TOP: #cccccc 1px solid;
	BORDER-LEFT: #cccccc 1px solid;
	WIDTH: 180px;
	BORDER-BOTTOM: #cccccc 1px solid
}

.formwidth4 {
	BORDER-RIGHT: #cccccc 1px solid;
	BORDER-TOP: #cccccc 1px solid;
	BORDER-LEFT: #cccccc 1px solid;
	WIDTH: 450px;
	BORDER-BOTTOM: #cccccc 1px solid
}

.con {
	MARGIN: 0px auto;
	WIDTH: 743px;
}

</style>

	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<%@include file="/web/shopping/shopTop.jsp"%>
			
			<table width="932" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="180" align="left" valign="top"
						background=images/left_bg.gif>

						<!-- 左侧 -->
						<%@include file="/web/shopping/searchZuo.jsp"%>
					</td>
					<td width="9"></td>
					<td width="743" align="left" valign="top">

						<table width="743" border="0" cellpadding="0" cellspacing="0">


							<tr>
								<td height="10">
								<table width="100%">
									<tr>
									<td style="padding: 10px; color: red;font-weight: 800;">
									<c:forEach items="${brandList }" var="k">
										<c:if test="${param.productBrandId eq k.productBrandId}">
										<c:set var="bn" value="${k.productBrandName}"></c:set>  
										<c:set var="an" value="${k.parentId}"></c:set> 
										</c:if>
										</c:forEach>
										<c:forEach items="${brandList}" var="avc">
										<c:if test="${an eq avc.productBrandId}"><c:set var="pan" value="${avc.productBrandName}"></c:set>  </c:if>
										</c:forEach>
										你目前所在的位置　>>>　${pan}　>>>　${bn}
									</td>
									</tr>
								</table>
								
								</td>
							</tr>
							
								<tr>
									<TD background="images/tdbg.png" height="24"
										style="color: white; font-weight: 800; font-style: 2;padding-left: 30px;">
										所属　${bn}　的商品
									</TD>
								</tr>
								<tr>
									<td>
										<DIV class="con">
										<script type="text/javascript">
										function pageNow(pageNow){
											
											if(pageNow < 1){
													alert("不好意思，已经是第一页啦！");
													return false ;
												}
											else
												{
													var par = "pageNow="+pageNow
													if("${param.productBrandId}" != ""){
													  par+= "&productBrandId=${param.productBrandId}"
													}
													document.search.action="productBrandList.html?"+par;
													document.search.submit();
												}
										}
										</script>
											<c:forEach items="${pageView.records }" var="k">
												
													<DL class=w260>
														<DT style="padding-left: 10px;">
														<A href="shopInfo.html?productId=${k.productId}">
														 <img alt="${k.productName }" src="<%=basePath%>/${k.productImagesUrl }" width="120" height="130" border="0">
														 </A>
														</DT>
														<DT>
														 <DIV align="left" style="padding-left: 10px;">
														 <div align="center" style="padding-top: 5px;">
															<A href="shopInfo.html?productId=${k.productId}" style="text-decoration: none;font-size: 10px;padding-top: 3px;">
															${fn:substring(k.productName,0,18) }..
															</a>
														</div>	
															市场价：￥
															<strike>${k.price }</strike>
															<BR>
															<SPAN class=hy_cont> 优惠价：￥<font color=#FF0000>${fn:substring(k.price-10,0,4) }</font>
															</SPAN>
															<br>
															会员价：￥
															<a href='logoin.html'><font color=#FF0000>请登录</font>
															</a>
															<br>
														</DIV>
														<div style="padding-left: 5px;padding-top: 5px;">
														<a href="shoppingCar.html?productId=${k.productId}" ><img
																src="images/small/buy.gif" border=0 alt="我要购买该商品">
														</a>
														<a href="javascript:void(0);" ><img
																src=images/small/fav.gif border=0 alt=收藏该商品>
														</a>
														</div>
														</DT>
														
													</DL>
												
											</c:forEach>
										</DIV>
									</td>
								</tr>
								<tr>
								<td>
								<%@include file="/public/webfenye.jsp" %>
								</td>
								
								</tr>
						</table>


					</td>
				</TR>

			</TABLE>

			<TABLE cellSpacing=0 cellPadding=0 width=932 align=center border=0>
				<TBODY>
					<TR>
						<TD>
							<TABLE cellSpacing=0 cellPadding=0 width=100% align=center
								bgColor=#ffffff border=0>
								<TBODY>
									<hr size="1" color="#B2D800" width=99.4%>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD>
							<%@include file="/web/shopping/shoppingbotton.jsp"%>
						</TD>
					</TR>
				</TBODY>
			</TABLE>

		</center>

	</body>


</html>

