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

	</head>
	
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<!-- 头部 -->
<%@include file="/web/shopping/shopTop.jsp"%>


			<table width="932" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="743" align="left" valign="top"
						background=list/zbhz_right_bg.gif>
						<table width="743" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<IMG height=4 src="list/zbhz_line.gif" width=743>
								</td>
							</tr>
							<tr>
								<td>
									<table width="930" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="300" height="300" align="center" valign="middle">
												<table width=300 height="300" border=0 align=center
													cellpadding=1 cellspacing=0 valign=middle>
													<tr>
														<td align=center valign=middle
															background="images/list_bg.gif">

															
																<img border=0 src='<%=basePath%>/${product.productImagesUrl}' width="270" height="280"> 
														</td>
													</tr>
												</table>

											</td>
											<td align="left" valign="top">
												<table width="99%" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td>
															<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
																height="26">
																<TBODY>
																	<TR>

																		<TD background="images/tdbg.png" height="24" style="color: white;font-weight: 800;font-style: 2;">
																			　　　商品信息
																		</TD>

																	</TR>
																	<TR>
																		<TD colSpan=3 background="images/com_zj_line.gif"></TD>
																	</TR>
																	<TR>
																		<TD colSpan=3 height=3></TD>
																	</TR>
																	<TR>

																		<TD height=20 colspan="2">
																			&nbsp;&nbsp;&nbsp; 市场价：￥
																			<strike>${product.price}
																		</TD>
																	</TR>
																	<TR>

																		<TD height=20 colspan="2">
																			<font color="#FF0000">&nbsp;&nbsp;&nbsp;
																				优惠价：￥${fn:substring(product.price-10,0,4) }</font>
																		</TD>
																	</TR>
																	<TR>
																		<TD class=com_zongji_red height=20 colspan="2">
																			<font color="#FF0000">&nbsp;&nbsp;&nbsp; 会员价：￥<a
																				href='logoin.html'><font color=red>请登录</font>
																			</a>
																			<br> </font>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
														</td>
													</tr>
													<tr>
														<td>
															<TABLE cellSpacing=0 cellPadding=0 width=100% border=0>
																<TBODY>
																	<TR>
																		<TD width=5 height="205">
																			<IMG height=205 src="images/com_zj_left_01.gif"
																				width=5>
																		</TD>
																		<TD vAlign=top background=images/com_zj_bg_01.gif>
																			<TABLE cellSpacing=0 cellPadding=0 width="100%"
																				border=0>
																				<TBODY>
																					<TR>
																						<TD vAlign=top width="100%" height=80>
																							<TABLE cellSpacing=0 cellPadding=0 width=100%
																								border=0>
																								<TBODY>
																								<TR>

																										<TD width=65 height=24 align=right>
																											商品名称：
																										</TD>

																										<TD align="left">
																											${product.productName}
																										</TD>

																										<TD width=100 height=24 align=right>
																											
																										</TD>

																										<TD align="left"></TD>
																									</TR>
																									<TR>

																										<TD width=65 height=24 align=right>
																											商品ID号：
																										</TD>

																										<TD align="left">
																											${product.productId}
																										</TD>

																										<TD width=100 height=24 align=right>
																											商品品牌：
																										</TD>

																										<TD align="left">不详</TD>
																									</TR>
																									<TR>

																										<TD align=right height=24>
																											商品货号：
																										</TD>

																										<TD align="left">
																											000000
																										</TD>

																										<TD align=right height=24>
																											商品单位：
																										</TD>

																										<TD align="left">
																											${product.productUnit}
																										</TD>
																									</TR>
																									<TR>

																										<TD align=right height=24>
																											<font color="#FF0000">获得积分：</font>
																										</TD>
																										<TD align="left">
																											<font color="#FF0000">1</font>
																										</TD>

																										<TD align=right height=24>
																											浏览次数：
																										</TD>
																										<TD align="left">
																											${product.productLookNuns}
																										</TD>
																									</TR>
																								</TBODY>
																							</TABLE>
																						</TD>
																					</TR>
																					<TR>
																						<TD height=30 align="center" vAlign=middle>

																							<a href="shoppingCar.html?productId=${product.productId}" >
																							<img
																									border=0 src=images/an_bag_tellme.gif
																									alt=千寻万觅，要的就是它>
																							</a>

																							<a href="javascript:void(0);"><img
																									src=images/an_bag2.gif alt=放入收藏夹 width="85"
																									height="24" border=0>
																							</a>
																						</TD>
																					</TR>
																					<TR>
																						<TD width="100%" height=60 align="left"
																							vAlign=middle>
																							<TABLE cellSpacing=0 cellPadding=0 width="100%"
																								border=0>
																								<TBODY>
																									<TR>
																										<TD vAlign=bottom width="96%">
																											<TABLE cellSpacing=0 cellPadding=0
																												width="100%" border=0>
																												<TBODY>
																													<TR>
																														<TD width="13%" align="left" valign="top">
																															<font color="#ff5b02">　商品简介：</font>
																														</TD>
																														<TD align=left>
																															<font color="#6a6a6a">${product.productProfile}</font>
																														</TD>
																													</TR>
																												</TBODY>
																											</TABLE>
																										</TD>
																									</TR>
																								</TBODY>
																							</TABLE>
																						</TD>
																					</TR>
																				</TBODY>
																			</TABLE>
																		</TD>
																		<TD width=5>
																			<IMG height=205 alt=""
																				src="images/com_zj_right_01.gif" width=5>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td>
						
										<TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
											<TBODY>
											<TR>
											<TD background="images/tdbg.png" height="24" style="color: white;font-weight: 800;font-style: 2;">
											　　　商品介绍
											</TD>
											</TR>
												<TR>
													<TD vAlign=top>
														<br/>
														<P>
															<SPAN><SPAN><IMG
																		src="<%=basePath%>/${product.productImagesUrl}" border=0 width="200">
															</SPAN>
															</SPAN>
														</P>
														<P>
															<SPAN><SPAN><IMG
																		src="<%=basePath%>/${product.productImagesUrl}" border=0 width="300">
															</SPAN>
															</SPAN>
														</P>
														<P>
															<SPAN><SPAN><IMG
																		src="<%=basePath%>/${product.productImagesUrl}" border=0 width="600">
															</SPAN>
															</SPAN>
														</P>
														
													</TD>
												</TR>
											</TBODY>
										</TABLE>
										
								</td>
							</tr>
							<tr>
								<td height="10"></td>
							</tr>

							<tr>
								
							<TD background="images/tdbg.png" height="24" style="color: white;font-weight: 800;font-style: 2;">
								　　　客户评价
							</TD>
						
							</tr>
							<tr>
								<td>
									<table width="99%">
										<br>
										&nbsp;&nbsp;此商品暂无客户评价&nbsp;&nbsp;
										<br>
										<br>
									</table>
								</td>
							</tr>

							<tr>
								<td align=left>

									<table cellSpacing="0" cellPadding="0" width="99%" align="left"
										border="0">
										<tr>
											<td width="100%" height=1 bgcolor="#0DC57D">
											</td>
										</tr>
										<tr>
											<td width="100%" height=10>
											</td>
										</tr>

										<tr>
											<form name="pinglunform" action="" method="post">
												<td>
													<table cellSpacing="0" cellPadding="0" width="100%"
														align="center" border="0">
														<tr>
															<td width="15%">
																姓名/ID：
															</td>
															<td width="85%">
																<input id="name" value="" maxLength="16" name="name"
																	size="15" class=formwidth3>
																<font color="#FF0000">*</font>
																<font color=#ff5b02> <input type="radio" checked
																		value="5" name="jibie">★★★★★ <input
																		type="radio" value="4" name="jibie">★★★★ <input
																		type="radio" value="3" name="jibie">★★★ <input
																		type="radio" value="2" name="jibie">★★ <input
																		type="radio" value="1" name="jibie">★ </font>
															</td>
														</tr>
														<tr>
															<td width="10%">
																邮&nbsp;&nbsp;箱：
															</td>
															<td width="90%">
																<input id="mail" size="30" name="mail" class=formwidth3>
																<font color="#FF0000">*</font>
															</td>
														</tr>
														<tr>
															<td width="10%">
																验证码：
															</td>
															<td width="90%">
																
															</td>
														</tr>
														<tr>
															<td vAlign="top">
																评&nbsp;&nbsp;论：
																<br>
																<font color=red>≤200字</font>
															</td>
															<td>
																<textarea id="nr" name="nr" rows="4" cols="80"
																	class=formwidth4 style="overflow: auto;"></textarea>
															</td>
														</tr>
														<tr>
															<td></td>
															<td height="30" valign="middle">
																
															</td>
														</tr>
													</table>
												</td>
											</form>
										</tr>
									</table>
								</td>
							</tr>


							<tr>
								<td align=center>
									&nbsp;
								</td>
							</tr>

							<tr>
								<td background="images/tdbg.png" height="24" style="color: white;font-weight: 800;font-style: 2;">
									　　　推荐其他
								</td>
							</tr>
							<tr>
								<td>
									<TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
										<TBODY>
											<TR>
												<TD width=15>
												</TD>
												<TD>
													<script language=javascript src=include/pic1.js></script>
													<table border=0 cellpadding=2 bgcolor='#FFFFFF'
														cellspacing=0 width=735>
														<tr>
														<c:forEach items="${resultList }" var="key" begin="0" end="60" step="10" >
															<td align='center' valign='top' class='yc' width='120'>
																<table cellspacing=0 cellpadding=0 width="120">
																	<tr>
																		<td width="32%">

																			<br>
																			<div align="center">
																				<img width=120 height=120 border=0
																					src=images/small/pic_bg2.gif>
																				<p class="pic1">
																					<a href='shopInfo.html?productId=${key.productId}'> <img border=0 alt='${key.productName }'
																							src='<%=basePath%>/${key.productImagesUrl }' width="100" height="110">
																					</a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td valign=top align="right">
																			<TABLE cellSpacing=3 cellPadding=3 width="100%"
																				border=0>
																				<TBODY>
																					<TR>
																						<TD class=product_font colSpan=2>
																							<DIV align=center>
																								<A href="shopInfo.html?productId=${key.productId}" >${key.productName }</a>
																								<BR>
																								市场价：￥
																								<strike>${key.price }</strike>
																								<BR>
																								<SPAN class=hy_cont> 优惠价：￥<font
																									color=#FF0000>${fn:substring(key.price-10,0,4) }</font>
																								</SPAN>
																								<br>
																								会员价：￥
																								<a href='logoin.html'><font color=#FF0000>请登录</font>
																								</a>
																								<br>
																							</DIV>
																						</TD>
																					</TR>
																				</TBODY>
																			</TABLE>
																		</td>
																	</tr>
																	<tr>
																		<td align="center">
																			<a href="shoppingCar.html?productId=${key.productId}" ><img
																					src="images/small/buy.gif" border=0 alt="我要购买该商品">
																			</a>
																			<a href="javascript:void(0);" ><img
																					src=images/small/fav.gif border=0 alt=收藏该商品>
																			</a>
																		</td>
																	</tr>
																</table>
															</td>
															</c:forEach>
															
															
															<table>
																<tr>
																	<td height='5'></td>
																</tr>
															</table>
															<br>
															</TD>
														</TR>
														</TBODY>
													</TABLE>
												</td>
											</tr>
									</table>
								</td>
							</tr>
						</table>
						<center>

							<TABLE cellSpacing=0 cellPadding=0 width=932 align=center
								border=0>
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
							
					</TD>
				</TR>
				</TBODY>
			</TABLE>
		</center>
		</center>
	</body>


</html>

