<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<HTML>
	<head>
	
		<style>
<!--
BODY {
	background-position: center;
	background-repeat: repeat;
}
a:link{
	color:#HTVAWD;
    text-decoration:none;
}
 a:hover {
    color:red;
    text-decoration:none;
    }
 a{
    text-decoration:none;
    }
.shou a:hover{
	font-weight:800;
	color:#fffe8f;
    text-decoration:underline;
}
.shou A{
	font-weight:800;
	color:#FFFFFF;
    text-decoration:none;
}
-->
</style>

	</HEAD>
	<body background="images/bg3.gif" leftmargin="0" topmargin="0"
		marginwidth="0" marginheight="0">
		<center>
			<TABLE height="30" cellSpacing="0" cellPadding="0" width="932"
				align="center" bgColor="#ff6600" border="0">
				<TR>

					<TD align="left" width="100%"></TD>
				</TR>
			</TABLE>
			<table width="932" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="left" valign="top">
						<TABLE height=64 cellSpacing=0 cellPadding=0 width=932 border=0>
							<TBODY>
								<TR>
									<TD width=215 align=right>
										<img border=0 src='images/zztf.jpg'>
									</TD>
									<TD align=right vAlign="top">
										<TABLE class=cfont cellSpacing=0 cellPadding=0 width="100%"
											border=0 style="padding-top: 5px;">
											<TBODY>
											<tr>
											<TD align="center" width=300>
														
														
													</TD>
											<td height="30" width="100" align="left">
														<a href="login.html"><IMG height=21
													src="images/login.gif" width=44 align=absMiddle border=0>
											</A>
											<a href="registerUI.html"><IMG height=21
													src="images/register.gif" width=44 align=absMiddle border=0>
											</A>&nbsp;
													</td>
											</tr>
												<TR>
													<TD align="center" width=300>
														
														
													</TD>
													<TD height=30 width="320" valign="middle">
														<A href="userInfo.html"><img
																src="images/top/mya.gif" width="67" height="17"
																border="0" align="absmiddle">
														</A>
														<FONT color=#757575>|</FONT>
														<img src="images/top/car.gif" width="17" height="14"
															align="absmiddle">
														<A href="shoppingCar.html" target="_blank">购物车<font color="red">${fn:length(shoppingCar.items)}</font></A>
														<FONT color=#757575>|</FONT>
														<a href="javascript:void(0);" onclick="alert('此功能正在完善，给你带来的不便敬请原谅！！！')">积分兑奖</a>
														<FONT color=#757575>|</FONT>
														<a href="javascript:void(0);" onclick="alert('此功能正在完善，给你带来的不便敬请原谅！！！')">新闻公告</a>
														<FONT color=#757575>|</FONT>
														<a href="javascript:void(0);" onclick="alert('此功能正在完善，给你带来的不便敬请原谅！！！')">在线留言</a>
													</TD>
												</tr>

											</TBODY>
										</TABLE>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</td>
				</tr>
			</table>
			<TABLE cellSpacing=0 cellPadding=0 width="932" border=0>
				<TR vAlign=bottom>
					<TD height=30 colSpan=2>
						<TABLE cellSpacing=0 cellPadding=0 width="100%" bgColor=#ce0c00
							border=0>
							<TBODY>
								<TR>
									<TD width=3 height=3></TD>
									<TD></TD>
									<TD width=3 height=3></TD>
								</TR>
								<TR>
									<TD bgColor=#ce0c00></TD>
									<TD align=middle height=20>
										<TABLE  cellSpacing=0 cellPadding=0 width="100%"
											border=0 id="tabb">
											<TBODY>
												<TR class="shou">
												<td align=center >
														<a href="${pageContext.servletContext.contextPath }/index.html">首页
														</a>
													</td>
													<c:forEach var="top" items="${brandList}">
													<c:if test="${top.parentId eq 0}">
													<c:if test="${top.productBrandName eq '男装'}">
													<c:set var="nanzhuan" value="${top.productBrandId }"/>
													<TD width=2 background=images/dotline.gif></TD>
													<td align=center>
														<a href='shopSearch.html?parentId=${top.productBrandId }'>男装
														</a>
													</td>
													</c:if>
													<c:if test="${top.productBrandName eq '男鞋'}">
													<c:set var="nanxie" value="${top.productBrandId }"/>
													<TD width=2 background=images/dotline.gif></TD>
													<td align=center>
														<a href='shopSearch.html?parentId=${top.productBrandId }'>男鞋
														</a>
													</td>
													</c:if>
													<c:if test="${top.productBrandName eq '女装'}">
													<c:set var="nvzhuan" value="${top.productBrandId }"/>
													<TD width=2 background=images/dotline.gif></TD>
													<td align=center>
														<a href='shopSearch.html?parentId=${top.productBrandId }'>
														女装
														</a>
													</td>
													</c:if>
													<c:if test="${top.productBrandName eq '女鞋'}">
													<c:set var="nvxie" value="${top.productBrandId }"/>
													<TD width=2 background=images/dotline.gif></TD>
													<td align=center>
														<a href='shopSearch.html?parentId=${top.productBrandId }'>
														女鞋
														</a>
													</td>
													</c:if>
													<c:if test="${top.productBrandName eq '服装配饰'}">
													<c:set var="fushi" value="${top.productBrandId }"/>
													<TD width=2 background=images/dotline.gif></TD>
													<td align=center>
														<a href='shopSearch.html?parentId=${top.productBrandId }'>
														服装配饰
														</a>
													</td>
													</c:if>
													<c:if test="${top.productBrandName eq '体育用品'}">
													<c:set var="tiyu" value="${top.productBrandId }"/>
													<TD width=2 background=images/dotline.gif></TD>
													<td align=center>
														<a href='shopSearch.html?parentId=${top.productBrandId}'>
														体育用品
														</a>
													</td>
													</c:if>
													</c:if>
													</c:forEach>
													<TD width=2 background=images/dotline.gif></TD>
													<TD width=2 background=images/dotline.gif></TD>
													<td align=center>
														<a href="lianxi.html" target="_blank">
														联系我们
														</a>
													</td>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
									<TD></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD></TD>
									<TD></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</table>
			<TABLE cellSpacing=0 cellPadding=0 width="932" border=0>
				<TBODY>
					<TR>
						<TD height=1></TD>
					</TR>
					<TR>
						<TD background=images/t1_bg.gif bgColor=#ce0c00 height=37>
							<TABLE cellSpacing=0 cellPadding=0 width=932 border=0>
								<TBODY>
									<TR class=cfont>
										<TD width="400" align="center">
											<TABLE class=cfont cellSpacing=0 cellPadding=0 width="400"
												border=0>
												<TBODY>
													<TR>
														<TD align=right width=10>
														</TD>
														<form name="search" action="" method=post>
															<TD align=right>
																<FONT color=#ffffff> <select name='fenlei'>
																		<option value='' selected>
																			所有类别
																		</option>
																		</select>
																</FONT>
															</TD>
															<TD align=middle>
																<input id="pname" name="productName" type="text" size="19"
																	class="800_inputcolor" value="${param.productName}">
															</TD>
															<style>
																a.button5 {font-weight:bold;
background: transparent url('images/button_right_05.png') no-repeat scroll top right; 
display: block;float: left;height: 34px;margin-right: 6px;
padding-right: 20px;text-decoration: none;color: #000000;
font-family: Arial, Helvetica, sans-serif;font-size:12px;}
a.button5 span{line-height: 22px;padding: 7px 0 5px 18px;
background: transparent url('images/button_left_05.png') no-repeat;display: block;}
a.button5:hover span{text-decoration:underline;}

																</style>
																<script type="text/javascript">
																
																function searchProductName(){
																	var list=document.getElementById('pname');	 
																		if(list.value == ""){
																			alert("请输入你的查找的商品名称！！！ ! ");
																			return false ;

																		}

																	 document.search.action = "productBrandList.html";
																	 document.search.submit();
																	}
																</script>
															<TD>
																<a class="button5" href="javascript:void(0);" onclick="return searchProductName();" style="text-decoration: none;"><span style="text-decoration: none;">找商品</span></a>
															</TD>
														</FORM>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
										<TD width="532" class="shou">
											<b><FONT color=#fffe8f>热门商品：</font></b>
											<%-- <c:forEach items="${resultList }" var="key" begin="4" end="29" step="5" >　
											<a href='shopInfo.html?productId=${key.productId}'target=_blank>
											${key.productName }
											</A>
											</c:forEach> --%>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD height=3></TD>
					</TR>
				</TBODY>
			</TABLE>
		</center>
	</body>
</html>