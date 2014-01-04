<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<!-- 头部 -->
		<%@include file="/web/shopping/shopTop.jsp"%>
<center>
		<TABLE cellSpacing=0 cellPadding=0 width="932" border=0>
			<TR>
				<TD vAlign=top>
					<TABLE cellSpacing=0 cellPadding=0 width=932 border=0>
						<TR>
							<TD vAlign=bottom align=right width=210 height=31
								background="images/hot.jpg">
							</TD>
							<TD width=11></TD>
							<TD background=images/0608_6_2.gif vAlign=top align=left>
								<table width="100%" height="31" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<td width="6">
											<IMG height=31 src="images/t2_org.gif" width=6>
										</td>
										<td align="center" valign="middle">
											<A href="javascript:void(0);" >高级搜索</A>·
											<A href="javascript:void(0);" >新品上市</A>·
											<A href="javascript:void(0);" >精品推荐</A>·
											<A href="javascript:void(0);" >热卖商品</A>·
											<A href="javascript:void(0);" >特价商品</A>·
											<A href="javascript:void(0);" >热门排行</A>·
											<A href="javascript:void(0);" >购物指南</A>·
											<A href="javascript:void(0);" >支付向导</A>·
											<A href="javascript:void(0);" >汇款确认</A>·
											<A href="javascript:void(0);" >新闻公告</A>·
											<A href="javascript:void(0);" >在线留言</A>
										</td>
									</tr>
								</table>
							</TD>
						</TR>
						<TR>
							<TD colSpan=3 height=3></TD>
						</TR>
						<TR>
							<TD width=210 bgColor=#efefef>
								<TABLE cellSpacing=3 cellPadding=0 width="100%" border=0>
									<c:forEach items="${resultList }" var="key" begin="0" end="30" step="5">
										<TR align=middle>
											<TD
												style="background-image: url('images/a_v/remen.gif'); font-size: 10px; font-weight: 800; color: white;"
												height="56"  title="${key.productName }">
												<a href='shopInfo.html?productId=${key.productId}'
													style="color: yellow; font-size: 14px; font-weight: 600;">
													${fn:substring(key.productName,0,12) }... </a>
												<br />
												促销价：￥${key.price-30}
											</TD>
										</TR>
									</c:forEach>
								</TABLE>
							</TD>
							<TD width=11></TD>
							<TD vAlign=top>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
									<TR>
										<TD vAlign=top width=528>
											<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
												<TR>
													<TD colSpan=2>
														<a href='javascript:void(0);' > <img border=0 width=516
																height="205" src='images/a_v/b_anner.bmp'> </a>
													</TD>
												</TR>
												<TR>
													<TD colSpan=2 height=6>
													</TD>
												</TR>
												<TR>
													<TD align="left" valign="top">
														<script type="text/javascript">
														var swf_width=294
														var swf_height=213
														var files='images/a_v/b_anner001.jpg|images/a_v/b_anner002.jpg|images/a_v/b_anner003.jpg|images/a_v/b_anner004.jpg|images/a_v/b_anner005.jpg'
														var links='#|#|#|#|#'
														var texts='薇可61039杏色|薇可71001灰色|薇可2290西瓜红|薇可2308白色/不配内搭|薇可61039白色'
														document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="../images/flashfile/swflash.cab#version=9,0,47,0" width="'+ swf_width +'" height="'+ swf_height +'">');
														document.write('<param name="movie" value="images/a_v/b_annerflash.swf"><param name="quality" value="high">');
														document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
														document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'">');
														document.write('<embed src="images/a_v/b_annerflash.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 
														</script>
													</TD>
													<TD width="234" align=middle>
														<TABLE cellSpacing=0 cellPadding=0 border=0>
															<TR>
																<c:forEach items="${resultList }" var="key" begin="6"
																	end="15" step="3" varStatus="staturs">
																	<c:if test="${staturs.index%2==0}">
																		<tr>
																	</c:if>
																	<TD vAlign=top width=105 height=105>
																		<a href='shopInfo.html?productId=${key.productId}' title='${key.productName }'> <img
																				border=0 width=102 height=102
																				src='<%=basePath%>/${key.productImagesUrl }'> </a>
																	</TD>
																	<c:if test="${staturs.index%2==1}">
															</tr>
															</c:if>
															</c:forEach>
															</TR>
															<TR>
																<TD bgColor=#7bc7dd colSpan=2 height=3></TD>
															</TR>
														</TABLE>
													</TD>
												</TR>
											</TABLE>
										</TD>
										<TD vAlign=top>
											<TABLE width="179" border=0 cellPadding=0 cellSpacing=0>
												<TR vAlign=bottom align=right bgColor=#ce0c00>
													<TD height=25 background="images/news.jpg">
													</TD>
												</TR>
												<TR>
													<TD height="181" align="center" valign="top"
														bgcolor="#6DC0F8">
																<MARQUEE id=a onmouseover=a.stop() style="FONT-SIZE: 10pt; color: red;" onmouseout=a.start() scrollAmount=2 direction=up width=170 height=190>
															最新上线产品
															<DIV align="left">
																	<c:forEach items="${resultList }" var="key" begin="0"end="30" varStatus="staturs">
																	<c:if test="${staturs.index%2==0}"><br/><br/></c:if>
																	<a href='shopInfo.html?productId=${key.productId}' style="FONT-SIZE: 10pt; color: black;">${key.productName }　</a>
																	</c:forEach>	
															</DIV>
															</MARQUEE>
													</TD>
												</TR>
												<c:forEach items="${resultList }" var="key" begin="10"
													end="11">
													<TR>
														<TD align="center" valign="top" bgcolor="#FFFFFF"
															height="100">
															<a href='shopInfo.html?productId=${key.productId}' title='${key.productName }'> <img border=0
																	width=177 height=100
																	src='<%=basePath%>/${key.productImagesUrl }'> </a>
														</TD>
													</TR>
												</c:forEach>
											</TABLE>
										</TD>
									</TR>
								</TABLE>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
		</TABLE>



		<TABLE cellSpacing=0 cellPadding=0 width="932" border=0>
			<TR>
				<TD vAlign=top>
					<TABLE cellSpacing=0 cellPadding=0 width=932 border=0>
						<TR>
							<TD width=210 align="center" bgColor=#efefef>
								<TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
									<TBODY>
										<TR align=middle bgColor=#e98cd2>
											<TD height=107>
												<TABLE class=cfont cellSpacing=0 cellPadding=0 width="96%" style="text-align: left;"
													border=0>
													<TBODY>
														<TR>
															<TD>
																<FONT color=#ffffff> 您若有需求和订购咨询欢迎垂询</FONT>
															</TD>
														</TR>
														<TR>
														<TD>
																<FONT color=#ffffff>电话：13092659678</FONT>
															</TD>
														</TR>
														<TR>
														<TD>
																<FONT color=#ffffff>手机：13092659678</FONT>
														</TD>
														</TR>
														<TR>
														<TD>
																<FONT color=#ffffff>邮箱：</FONT><FONT color=#ffffff>372137032@qq.com</FONT>
														</TD>
														<TR>
														<TR>
														<TD>
																<FONT color=#ffffff>Q&nbsp;Q：372137032</FONT>

															</TD>
														</TR>
													</TBODY>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD>
											</TD>
										</TR>
										<TR align=middle bgColor=#ffffff>
											<TD>
												<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
													<TBODY>
														<TR>
															<TD colSpan=2 height=25 background="images/tese.gif">
															</TD>
														</TR>
														<TR>
															<TD bgColor=#e0e0e0 colSpan=2 height=2></TD>
														</TR>
														<TR>
															<TD colSpan=2 height=5></TD>
														</TR>
														<TR align=middle>
															<TD width="50%" height=32>
																<a href="productBrandList.html" ><IMG height=30
																		src="images/tese1.gif" width=97 border=0> </a>
															</TD>
															<TD>
																<a href="productBrandList.html" ><IMG height=30
																		src="images/tese2.gif" width=97 border=0> </a>
															</TD>
														</TR>
														<TR align=middle>
															<TD height=32>
																<a href="productBrandList.html" ><IMG height=30
																		src="images/tese3.gif" width=97 border=0> </a>
															</TD>
															<TD>
																<a href="productBrandList.html" ><IMG height=30
																		src="images/tese4.gif" width=97 border=0> </a>
															</TD>
														</TR>
														<TR align=middle>
															<TD height=32>
																<a href="productBrandList.html" ><IMG height=30
																		src="images/tese5.gif" width=97 border=0> </a>
															</TD>
															<TD>
																<a href="productBrandList.html" ><IMG height=30
																		src="images/tese6.gif" width=97 border=0> </a>
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
							</TD>
							<TD width=11></TD>
							<TD vAlign=top width=711>
								<TABLE cellSpacing=0 cellPadding=0 width="711" border=0>
									<TBODY>
										<TR bgColor=#c6c6c6>
											<TD height=1 colspan="2"></TD>
										</TR>
										<TR bgColor=#ebebeb>
											<TD height=28 background="images/index_bt_bg.gif" width="653">
												<img border="0" src="images/chaozhi.gif" width="200"
													height="16">
											</TD>
											<TD height=28 background="images/index_bt_bg.gif" width="58">
												更多
											</TD>
										</TR>
										<TR>
											<TD valign="middle" align="center" colspan="2">
												<table border=0 cellpadding=2 bgcolor='#FFFFFF'
													cellspacing=0 width='710'>
													<tr>
														<c:forEach items="${resultList }" var="key" begin="20"
															end="24">
															<td align='center' valign='top' width=142>

																<table border=0 cellspacing=0 cellpadding=1
																	valign=middle align=center>
																	<tr>
																		<td height="10" align="center" valign="middle"></td>
																	</tr>
																	<tr>
																		<td align="center" valign="middle">
																			<img width=120 height=120 border=0
																				src=images/small/pic_bg2.gif>
																			<p class="pic1">
																				<a href='shopInfo.html?productId=${key.productId}'> <img border=0
																						alt='${key.productName }'
																						src='<%=basePath%>/${key.productImagesUrl }' width="100" height="110"> </a>
																		</td>
																	</tr>
																	<tr>
																		<td align=center>
																			<table align=center>
																				<tr>
																					<td align=center>
																						<a href='shopInfo.html?productId=${key.productId}'>${key.productName
																							}</a>
																					</td>
																				</tr>
																				<tr>
																					<td align=left>
																						市场价：￥
																						<strike>${key.price } 
																					</td>
																				</tr>
																				<tr>
																					<td align=left>
																						<font color="#FF0000">优惠价：￥${fn:substring(key.price-10,0,4) }</font>
																					</td>
																				</tr>
																				<tr>
																					<td align=left>
																						<font color="#FF0000">会员价：￥<a href=''><font
																								color=red>请登录</font> </a> <br> </font>
																					</td>
																				</tr>
																			</table>
																		</td>
																	</tr>
																</table>
															</td>
														</c:forEach>


													</tr>
												</table>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
		<table width="932" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>

					<table>
						<tr>
							<td width="926" height="2"></td>
						</tr>
					</table>
					<TABLE cellSpacing=0 cellPadding=0 width=926align=center
						bgColor=#ffffff border=0>
						<TBODY>
							<TR>
								<TD>
									<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
										<TBODY>
											<TR>
												<TD>
													<table width="926" border="0" align="center"
														cellpadding="0" cellspacing="0" bgcolor=#FFFFFF>
														<tr>
															<td align=center>
																
																	<img border=0 width=463 src='images/a_v/b_anner31.jpg'>
																
															</td>
															<td align=center>
																
																	<img border=0 width=463 src='images/a_v/b_anner32.jpg'>
																
															</td>
														</tr>
													</table>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>

				</td>
			</tr>
		</table>
		<TABLE cellSpacing=0 cellPadding=0 width=932 border=0>
			<TBODY>
				<TR>
					<TD>
						<TABLE cellSpacing=0 cellPadding=0 width=926 border=0>
							<TBODY>
								<TR>
									<TD>
										<IMG height=4 alt="" src="images/1_k1_926_218_01.png" width=6>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k1_926_218_02.png"
											width=914>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k1_926_218_03.png" width=6>
									</TD>
								</TR>
								<TR>
									<TD background="images/1_k1_926_218_04.png"></TD>
									<TD width=914>
										<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
											background="images/1_k1_926_218_05.png"　>
											<TBODY>
												<TR>
													<TD width=160>
														<table width='160' height=208 border='0' align='center'
															cellpadding=0 cellspacing=0>
															<tr>
																<td width='160' class="shou" height=29 colspan=3
																	valign=middle>
																	<B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		
																		<a href="getByParentId.html?parentId=${nanzhuan}">
																		
																		男装
																		</a>
																	
																	</B>
																</td>
															</tr>
															<c:forEach items="${brandList }" var="key">
															<c:if test="${key.parentId eq nanzhuan}">
															<tr>
																<td align=center>
																	<IMG height='12' width='12' src='images/gry.gif'>
																</td>
																<td width=120  align=left>
																	<font color=#7D5DB1><a
																		href='productBrandList.html?productBrandId=${key.productBrandId }'>
																		${key.productBrandName }
																	</a></font>
																</TD>
															</tr>
															</c:if>
															</c:forEach>
																<tr>
																	<td width=175 colspan=3 height=10></td>
																</tr>
														</table>
													</TD>
													<TD align=middle>
														<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
															<TBODY>
																<TR>
																	<TD width="10" valign="middle">
																	</TD>
																	<TD valign="middle">
																		<table border=0 cellpadding=2 cellspacing=0
																			width='730'>
																			<tr>
																			<%  int i=0;%>
															<c:forEach items="${resultList }" var="key">
																				<c:if test="${key.bigBrandName eq '男装'}">
																				<%
																				
																				if(i<5){
																					i++;
																				
																				%>
																				<td align='center' valign='top'>
																									
																					<table border=0 cellspacing=0 cellpadding=1
																						valign=middle align=center>
																						<tr>
																							<br>
																							<td align="center" valign="middle">
																								<img width=120 height=120 border=0
																									src=images/small/pic_bg2.gif>
																								<p class="pic1">
																									<a href='shopInfo.html?productId=${key.productId}' title="${key.productName }">
																										<img border=0 alt='${key.productName }'
																											src='<%=basePath%>/${key.productImagesUrl }' width="100" height="110"> </a>
																							</td>
																						</tr>
																						<tr>
																							<td align=center>
																								<table align=center cellpadding="0"
																									cellspacing="0" style="padding-top: 10px;">
																									<tr>
																										<td align=center title="${key.productName }">
																											<a href='shopInfo.html?productId=${key.productId}'
																												>${fn:substring(key.productName,0,10) }..</a>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											市场价：￥
																											<strike>${key.price } 
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">优惠价：￥${fn:substring(key.price-30,0,4) }</font>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">会员价：￥<font
																												color=red>请登录</font> <br> </font>
																										</td>
																									</tr>

																								</table>
																							</td>
																						</tr>
																					</table>

																				</td>
																				<%} %>
																				</c:if>
																				</c:forEach>
																			</tr>
																		</table>
																	</TD>
																</TR>
															</TBODY>
														</TABLE>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
									<TD>
										<IMG height=208 alt="" src="images/1_k1_926_218_06.png"
											width=6>
									</TD>
								</TR>
								<TR>
									<TD>
										<IMG height=6 alt="" src="images/1_k1_926_218_07.png" width=6>
									</TD>
									<TD style="padding-top: 0px;">
										<IMG height=6 alt="" src="images/1_k1_926_218_08.png"
											width=914>
									</TD>
									<TD>
										<IMG height=6 alt="" src="images/1_k1_926_218_09.png" width=6>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width=932 border=0>
			<TBODY>
				<TR>
					<TD>
						<TABLE id=Table_01 height=218 cellSpacing=0 cellPadding=0
							width=926 border=0>
							<TBODY>
								<TR>
									<TD></TD>
									<TD height="8"></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<IMG height=4 alt="" src="images/1_k2_926_218_01.png" width=6>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k2_926_218_02.png"
											width=914>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k2_926_218_03.png" width=6>
									</TD>
								</TR>
								<TR>
									<TD background="images/1_k2_926_218_04.png"></TD>
									<TD width=914 height=208>
										<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
											background="images/1_k2_926_218_05.png">
											<TBODY>
												<TR>
													<TD width=160>
														<table width='160' height=208 border='0' align='center'
															cellpadding=0 cellspacing=0>
															<tr>
																<td width='160' height=29 colspan=3
																	valign=middle class="shou">
																	<B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
																		href='getByParentId.html?parentId=${nvzhuan}'>女装 </a> </B>
																</td>
															</tr>
															<c:forEach items="${brandList }" var="key">
															<c:if test="${key.parentId eq nvzhuan}">
															<tr>
																<td align=center>
																	<IMG height='12' width='12' src='images/gry.gif'>
																</td>
																<td width=120 align=left class='dfont'>
																	<a href='productBrandList.html?productBrandId=${key.productBrandId }'>${key.productBrandName } </a>
																</TD>
															</tr>
															</c:if>
															</c:forEach>
																<tr>
																	<td width=175 colspan=3 height=10></td>
																</tr>
														</table>
													</TD>
													<TD align=middle>
														<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
															<TBODY>
																<TR>
																	<TD width="10" valign="middle">
																	</TD>
																	<TD valign="middle">
																		<table border=0 cellpadding=2 cellspacing=0
																			width='730'>
																			<tr>
																			<%  int j=0;%>
															<c:forEach items="${resultList }" var="key">
																				<c:if test="${key.bigBrandName eq '女装'}">
																				<%
																				
																				if(j<5){
																					j++;
																				
																				%>
																				<td align='center' valign='top'>

																					<table border=0 cellspacing=0 cellpadding=1
																						valign=middle align=center>
																						<tr>
																							<br>
																							<td align="center" valign="middle">
																								<img width=120 height=120 border=0
																									src=images/small/pic_bg2.gif>
																								<p class="pic1">
																									<a href='shopInfo.html?productId=${key.productId}' title="${key.productName }">
																										<img border=0 alt='${key.productName }'
																											src='<%=basePath%>/${key.productImagesUrl }' width="100" height="110"> </a>
																							</td>
																						</tr>
																						<tr>
																							<td align=center>
																								<table align=center cellpadding="0"
																									cellspacing="0" style="padding-top: 10px;">
																									<tr>
																										<td align=center title="${key.productName }">
																											<a href='shopInfo.html?productId=${key.productId}'
																												>${fn:substring(key.productName,0,10) }..</a>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											市场价：￥
																											<strike>${key.price } 
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">优惠价：￥${fn:substring(key.price-30,0,4) }</font>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">会员价：￥<font
																												color=red>请登录</font> <br> </font>
																										</td>
																									</tr>

																								</table>
																							</td>
																						</tr>
																					</table>

																				</td>
																				<%} %>
																				</c:if>
																				</c:forEach>
																			</tr>
																		</table>
																	</TD>
																</TR>
															</TBODY>
														</TABLE>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
									<TD>
										<IMG height=208 alt="" src="images/1_k2_926_218_06.png"
											width=6>
									</TD>
								</TR>
								<TR>
									<TD>
										<IMG height=6 alt="" src="images/1_k2_926_218_07.png" width=6>
									</TD>
									<TD>
										<IMG height=6 alt="" src="images/1_k2_926_218_08.png"
											width=914>
									</TD>
									<TD>
										<IMG height=6 alt="" src="images/1_k2_926_218_09.png" width=6>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>

		<TABLE cellSpacing=0 cellPadding=0 width=932 border=0>
			<TBODY>
				<TR>
					<TD>
						<TABLE id=Table_01 height=218 cellSpacing=0 cellPadding=0
							width=926 border=0>
							<TBODY>
								<TR>
									<TD></TD>
									<TD height="8"></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<IMG height=4 alt="" src="images/1_k3_926_218_01.png" width=6>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k3_926_218_02.png"
											width=914>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k3_926_218_03.png" width=6>
									</TD>
								</TR>
								<TR>
									<TD background="images/1_k3_926_218_04.png"></TD>
									<TD width=914 height=208>
										<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
											background="images/1_k3_926_218_05.png">
											<TBODY>
												<TR>
													<TD width=160>
														<table width='160' height=208 border='0' align='center'
															cellpadding=0 cellspacing=0>
															<tr>
																<td width='160' class="shou" height=29 colspan=3
																	valign=middle>
																	<B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
																		href='getByParentId.html?parentId=${nanxie }'>男鞋 </a> </B>
																</td>
															</tr>
															<c:forEach items="${brandList }" var="key">
															<c:if test="${key.parentId eq nanxie}">
															<tr>
																<td align=center>
																	<IMG height='12' width='12' src='images/gry.gif'>
																</td>
																<td width=120 align=left class='dfont'>
																	<a href='productBrandList.html?productBrandId=${key.productBrandId }'>
																	${key.productBrandName } </a>
																</TD>
															</tr>
															</c:if>
															</c:forEach>
															
																<tr>
																	<td width=175 colspan=3 height=10></td>
																</tr>
														</table>
													</TD>
													<TD align=middle>
														<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
															<TBODY>
																<TR>
																	<TD width="10" valign="middle">
																	</TD>
																	<TD valign="middle">
																		<table border=0 cellpadding=2 cellspacing=0
																			width='730'>
																			<tr>
																			<%  int x=0;%>
															<c:forEach items="${resultList }" var="key">
																				<c:if test="${key.bigBrandName eq '男鞋'}">
																				<%
																				
																				if(x<5){
																					x++;
																				
																				%>
																				<td align='center' valign='top'>

																					<table border=0 cellspacing=0 cellpadding=1
																						valign=middle align=center>
																						<tr>
																							<br>
																							<td align="center" valign="middle">
																								<img width=120 height=120 border=0
																									src=images/small/pic_bg2.gif>
																								<p class="pic1">
																									<a href='shopInfo.html?productId=${key.productId}' title="${key.productName }">
																										<img border=0 alt='${key.productName }'
																											src='<%=basePath%>/${key.productImagesUrl }' width="100" height="110"> </a>
																							</td>
																						</tr>
																						<tr>
																							<td align=center>
																								<table align=center cellpadding="0"
																									cellspacing="0" style="padding-top: 10px;">
																									<tr>
																										<td align=center title="${key.productName }">
																											<a href='shopInfo.html?productId=${key.productId}'
																												>${fn:substring(key.productName,0,10) }..</a>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											市场价：￥
																											<strike>${key.price } 
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">优惠价：￥${fn:substring(key.price-30,0,4) }</font>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">会员价：￥<font
																												color=red>请登录</font> <br> </font>
																										</td>
																									</tr>

																								</table>
																							</td>
																						</tr>
																					</table>
																					</td>
																				<%} %>
																				</c:if>
																				</c:forEach>
																			</tr>
																		</table>
																	</TD>
																</TR>
															</TBODY>
														</TABLE>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
									<TD>
										<IMG height=208 alt="" src="images/1_k3_926_218_06.png"
											width=6>
									</TD>
								</TR>
								<TR>
									<TD>
										<IMG height=6 alt="" src="images/1_k3_926_218_07.png" width=6>
									</TD>
									<TD>
										<IMG height=6 alt="" src="images/1_k3_926_218_08.png"
											width=914>
									</TD>
									<TD>
										<IMG height=6 alt="" src="images/1_k3_926_218_09.png" width=6>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width=932 border=0>
			<TBODY>
				<TR>
					<TD>
						<TABLE id=Table_01 height=218 cellSpacing=0 cellPadding=0
							width=926 border=0>
							<TBODY>
								<TR>
									<TD></TD>
									<TD height="8"></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<IMG height=4 alt="" src="images/1_k4_926_218_01.png" width=6>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k4_926_218_02.png"
											width=914>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k4_926_218_03.png" width=6>
									</TD>
								</TR>
								<TR>
									<TD background="images/1_k4_926_218_04.png"></TD>
									<TD width=914>
										<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
											background="images/1_k4_926_218_05.png">
											<TBODY>
												<TR>
													<TD width=160>
														<table width='160' height=208 border='0' align='center'
															cellpadding=0 cellspacing=0>
															<tr>
																<td width='160' class='shou' height=29 colspan=3
																	valign=middle>
																	<B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
																		href='getByParentId.html?parentId=${nvxie }'>女鞋 </a> </B>
																</td>
															</tr>
															<c:forEach items="${brandList }" var="key">
															<c:if test="${key.parentId eq nvxie}">
															<tr>
																<td align=center>
																	<IMG height='12' width='12' src='images/gry.gif'>
																</td>
																<td width=120 align=left class='dfont'>
																	<a href='productBrandList.html?productBrandId=${key.productBrandId }'>
																	${key.productBrandName } </a>
																</TD>
															</tr>
															</c:if>
															</c:forEach>
																<tr>
																	<td width=175 colspan=3 height=10></td>
																</tr>
														</table>
													</TD>
													<TD align=middle>
														<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
															<TBODY>
																<TR>
																	<TD width="10" valign="middle">
																	</TD>
																	<TD valign="middle">
																		<table border=0 cellpadding=2 cellspacing=0
																			width='730'>
																			<tr>
																			<%  int q=0;%>
															<c:forEach items="${resultList }" var="key">
																				<c:if test="${key.bigBrandName eq '女鞋'}">
																				<%
																				
																				if(q<5){
																					q++;
																				
																				%>
																				<td align='center' valign='top'>

																					<table border=0 cellspacing=0 cellpadding=1
																						valign=middle align=center>
																						<tr>
																							<br>
																							<td align="center" valign="middle">
																								<img width=120 height=120 border=0
																									src=images/small/pic_bg2.gif>
																								<p class="pic1">
																									<a href='shopInfo.html?productId=${key.productId}' title="${key.productName }">
																										<img border=0 alt='${key.productName }'
																											src='<%=basePath%>/${key.productImagesUrl }' width="100" height="110"> </a>
																							</td>
																						</tr>
																						<tr>
																							<td align=center>
																								<table align=center cellpadding="0"
																									cellspacing="0" style="padding-top: 10px;">
																									<tr>
																										<td align=center title="${key.productName }">
																											<a href='shopInfo.html?productId=${key.productId}'
																												>${fn:substring(key.productName,0,10) }..</a>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											市场价：￥
																											<strike>${key.price } 
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">优惠价：￥${fn:substring(key.price-30,0,4) }</font>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">会员价：￥<font
																												color=red>请登录</font> <br> </font>
																										</td>
																									</tr>

																								</table>
																							</td>
																						</tr>
																					</table>

																					
																				</td>
																				<%} %>
																				</c:if>
																				</c:forEach>
																			</tr>
																		</table>
																	</TD>
																</TR>
															</TBODY>
														</TABLE>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
									<TD>
										<IMG height=208 alt="" src="images/1_k4_926_218_06.png"
											width=6>
									</TD>
								</TR>
								<TR>
									<TD>
										<IMG height=6 alt="" src="images/1_k4_926_218_07.png" width=6>
									</TD>
									<TD>
										<IMG height=6 alt="" src="images/1_k4_926_218_08.png"
											width=914>
									</TD>
									<TD>
										<IMG height=6 alt="" src="images/1_k4_926_218_09.png" width=6>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width=932 border=0>
			<TBODY>
				<TR>
					<TD>
						<TABLE id=Table_01 height=218 cellSpacing=0 cellPadding=0
							width=926 border=0>
							<TBODY>
								<TR>
									<TD></TD>
									<TD height="8"></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<IMG height=4 alt="" src="images/1_k5_926_218_01.png" width=6>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k5_926_218_02.png"
											width=914>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k5_926_218_03.png" width=6>
									</TD>
								</TR>
								<TR>
									<TD background="images/1_k5_926_218_04.png"></TD>
									<TD width=914 height=208>
										<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
											background="images/1_k5_926_218_05.png">
											<TBODY>
												<TR>
													<TD width=160>
														<table width='160' height=208 border='0' align='center'
															cellpadding=0 cellspacing=0>
															<tr>
																<td width='160' class='shou' height=29 colspan=3
																	valign=middle>
																	<B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
																		href='getByParentId.html?parentId=${fushi }'>服装配饰</a> </B>
																</td>
															</tr>
															<c:forEach items="${brandList }" var="key">
															<c:if test="${key.parentId eq fushi}">
															<tr>
																<td align=center>
																	<IMG height='12' width='12' src='images/gry.gif'>
																</td>
																<td width=120 align=left class='dfont'>
																	<a href='productBrandList.html?productBrandId=${key.productBrandId }'>
																	${key.productBrandName }</a>
																</TD>
															</tr>
															</c:if>
															</c:forEach>
																<tr>
																	<td width=175 colspan=3 height=10></td>
																</tr>
														</table>
													</TD>
													<TD align=middle>
														<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
															<TBODY>
																<TR>
																	<TD width="10" valign="middle">
																	</TD>
																	<TD valign="middle">
																		<table border=0 cellpadding=2 cellspacing=0
																			width='730'>
																			<tr>
																			<%  int s=0;%>
															<c:forEach items="${resultList }" var="key">
																				<c:if test="${key.bigBrandName eq '服装配饰'}">
																				<%
																				
																				if(s<5){
																					s++;
																				
																				%>
																				<td align='center' valign='top'>

																					<table border=0 cellspacing=0 cellpadding=1
																						valign=middle align=center>
																						<tr>
																							<br>
																							<td align="center" valign="middle">
																								<img width=120 height=120 border=0
																									src=images/small/pic_bg2.gif>
																								<p class="pic1">
																									<a href='shopInfo.html?productId=${key.productId}' title="${key.productName }">
																										<img border=0 alt='${key.productName }'
																											src='<%=basePath%>/${key.productImagesUrl }' width="100" height="110"> </a>
																							</td>
																						</tr>
																						<tr>
																							<td align=center>
																								<table align=center cellpadding="0"
																									cellspacing="0" style="padding-top: 10px;">
																									<tr>
																										<td align=center title="${key.productName }">
																											<a href='shopInfo.html?productId=${key.productId}'
																												>${fn:substring(key.productName,0,10) }..</a>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											市场价：￥
																											<strike>${key.price } 
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">优惠价：￥${fn:substring(key.price-30,0,4) }</font>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">会员价：￥<font
																												color=red>请登录</font> <br> </font>
																										</td>
																									</tr>

																								</table>
																							</td>
																						</tr>
																					</table>
																				</td>
																				<%} %>
																				</c:if>
																				</c:forEach>
																			</tr>
																		</table>
																	</TD>
																</TR>
															</TBODY>
														</TABLE>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
									<TD>
										<IMG height=208 alt="" src="images/1_k5_926_218_06.png"
											width=6>
									</TD>
								</TR>
								<TR>
									<TD>
										<IMG height=6 alt="" src="images/1_k5_926_218_07.png" width=6>
									</TD>
									<TD>
										<IMG height=6 alt="" src="images/1_k5_926_218_08.png"
											width=914>
									</TD>
									<TD>
										<IMG height=6 alt="" src="images/1_k5_926_218_09.png" width=6>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width=932 border=0>
			<TBODY>
				<TR>
					<TD>
						<TABLE id=Table_01 height=218 cellSpacing=0 cellPadding=0
							width=926 border=0>
							<TBODY>
								<TR>
									<TD></TD>
									<TD height="8"></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<IMG height=4 alt="" src="images/1_k7_926_218_01.png" width=6>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k7_926_218_02.png"
											width=914>
									</TD>
									<TD>
										<IMG height=4 alt="" src="images/1_k7_926_218_03.png" width=6>
									</TD>
								</TR>
								<TR>
									<TD background="images/1_k7_926_218_04.png"></TD>
									<TD width=914 height=208>
										<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
											background="images/1_k7_926_218_05.png">
											<TBODY>
												<TR>
													<TD width=160>
														<table width='160' height=208 border='0' align='center'
															cellpadding=0 cellspacing=0>
															<tr>
																<td width='160' class='shou' height=29 colspan=3
																	valign=middle>
																	<B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
																		href='getByParentId.html?parentId=${tiyu }'>体育用品
																	</a> </B>
																</td>
															</tr>
															<c:forEach items="${brandList }" var="key">
															<c:if test="${key.parentId eq tiyu}">
															<tr>
																<td align=center>
																	<IMG height='12' width='12' src='images/gry.gif'>
																</td>
																<td width=120 align=left class='dfont'>
																	<a href='productBrandList.html?productBrandId=${key.productBrandId }'>${key.productBrandName }</a>
																</TD>
															</tr>
															</c:if>
															</c:forEach>
																<tr>
																	<td width=175 colspan=3 height=10></td>
																</tr>
														</table>
													</TD>
													<TD align=middle>
														<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
															<TBODY>
																<TR>
																	<TD width="10" valign="middle">
																	</TD>
																	<TD width="730" valign="middle">
																		<table border=0 cellpadding=2 cellspacing=0
																			width='730'>
																			<tr>
																			<%  int b=0;%>
															<c:forEach items="${resultList }" var="key">
																				<c:if test="${key.bigBrandName eq '体育用品'}">
																				<%
																				
																				if(b<5){
																					b++;
																				
																				%>
																				<td align='center' valign='top'>
																					<table border=0 cellspacing=0 cellpadding=1
																						valign=middle align=center>
																						<tr>
																							<br>
																							<td align="center" valign="middle">
																								<img width=120 height=120 border=0
																									src=images/small/pic_bg2.gif>
																								<p class="pic1">
																									<a href='shopInfo.html?productId=${key.productId}' >
																										<img border=0 alt='${key.productName}'
																											src='<%=basePath%>/${key.productImagesUrl}' width="100" height="110"> </a>
																							</td>
																						</tr>
																						<tr>
																							<td align=center>
																								<table align=center cellpadding="0"
																									cellspacing="0">
																									<tr>
																										<td align=center>
																											<a href='shopInfo.html?productId=${key.productId}'
																												>${key.productName }</a>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											市场价：￥
																											<strike>${key.price }
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">优惠价：￥${key.price-30 }</font>
																										</td>
																									</tr>
																									<tr>
																										<td align=left>
																											<font color="#FF0000">会员价：￥<font
																												color=red>请登录</font> <br> </font>
																										</td>
																									</tr>
																								</table>
																							</td>
																						</tr>
																					</table>

																				</td>
																				<%} %>
																				</c:if>
																				</c:forEach>

																			</tr>
																		</table>
																	</TD>
																</TR>
															</TBODY>
														</TABLE>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
									<TD>
										<IMG height=208 alt="" src="images/1_k7_926_218_06.png"
											width=6>
									</TD>
								</TR>
								<TR>
									<TD>
										<IMG height=6 alt="" src="images/1_k7_926_218_07.png" width=6>
									</TD>
									<TD>
										<IMG height=6 alt="" src="images/1_k7_926_218_08.png"
											width=914>
									</TD>
									<TD>
										<IMG height=6 alt="" src="images/1_k7_926_218_09.png" width=6>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<table width="932" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>

					<table>
						<tr>
							<td width="768" height="2"></td>
						</tr>
					</table>
					<TABLE cellSpacing=0 cellPadding=0 width=768 align=center
						bgColor=#ffffff border=0>
						<TBODY>
							<TR>
								<TD>
									<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
										<TBODY>
											<TR>
												<TD>
													<table width="926" border="0" align="center"
														cellpadding="0" cellspacing="0" bgcolor=#FFFFFF>
														<tr>
															<td align=center>
																 <img border=0 width=463
																		src='images/a_v/b_anner15.jpg'>
															</td>
															<td align=center>
																<img border=0 width=463
																		src='images/a_v/b_anner10.jpg'>
															</td>
														</tr>
													</table>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>

				</td>
			</tr>
		</table>
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
