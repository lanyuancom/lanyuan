<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<html>
	<head>
		<%@include file="/web/shopping/shophead.jsp"%>
		
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery_1_7_2_min.js"></script>
		<script type="text/javascript">
		function sum(id){
		var am = $("#amount_"+id).val();
			if(isNaN(am)){
					alert("你输入的不是一个数字");
					return false ;

				} else if(am == 0){
					alert("数量不能为  空 或  0 ! ");
					return false ;

				}
		  $.ajax({
                url: "updateAmount.html?amount_"+id+"="+am+"&_k="+new Date(),
                type: "POST",
                dataType:'json',
                success: function(data) {
               		$("#amount_"+id+"_1").html(data.amount);
                	$("#totalPrice").html(data.totalPrice);
                }

            });
		
		
		}
		
		function edit(){

			
			 
			var list=document.getElementById('ce').getElementsByTagName('input');
			
			for( var i=0;i<list.length;i++)
			{
				 
				if(isNaN(list[i].value)){
					alert("你输入的不是一个数字");
					return false ;

				} else if(list[i].value == 0){
					alert("数量不能为  空 或  0 ! ");
					return false ;

				}
				
				
			}
			
			 document.form1.action = "updateAmount.html";
			 document.form1.submit();
		}
		</script>
	</head>
	<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="20">
		<center>

	<%@include file="/web/shopping/shopTop.jsp"%>
	
			<table width="768" border="0" cellspacing="0" cellpadding="0"
				align="center">
				<tr>
					<td height="30">
						<table width="768" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td>
									<img src="order/gouwuche/800buy_car_step.gif" width="160"
										height="48">
								</td>
								<td background="order/gouwuche/800buy_car_bg.gif">
									<img src="order/gouwuche/800buy_car_step7.gif" width="153"
										height="48">
								</td>
								<td background="order/gouwuche/800buy_car_bg.gif">
									<img src="order/gouwuche/800buy_car_step2.gif" width="153"
										height="48">
								</td>
								<td background="order/gouwuche/800buy_car_bg.gif">
									<img src="order/gouwuche/800buy_car_step8.gif" width="154"
										height="48">
								</td>
								<td>
									<img src="order/gouwuche/800buy_car_step4.gif" width="108"
										height="48">
								</td>
							</tr>
						</table>
						<font color="#FF3333">&nbsp;</font>
					</td>
				</tr>
				<tr>
					<td>
						<table border="0" align="center" width="930" cellpadding="0"
							cellspacing="0">
							
								<tr align="center" bgcolor="#EEEEEE">
									<td>
									<form action="" method="post" name="form1"target="_self"> 
										<table width="100%" border="0" cellpadding="0" cellspacing="1"
											bgcolor="#999999" id="ce">
											<tr bgcolor="#f0f0f0">
												<td height="22" align="center">
													商 品 名 称
												</td>
												<td width="70" align="center">
													市场价
												</td>
												<td width="60" align="center">
													优惠价
												</td>
												<td width="80" align="center">
													数 量
												</td>
												<td width="80" align="center">
													优惠价小计
												</td>
												<td width="60" align="center">
													获得积分
												</td>
												<td width="60" align="center">
													删除
												</td>
											</tr>

 									<c:forEach items="${shoppingCar.items }" var="key" varStatus="row">
											<tr bgcolor="#FFFFFF">
												<td height="20" align="center" valign="middle">
													<a target="_blank" href='shopInfo.html?productId=${key.product.productId}'>${key.product.productName}</a>
												</td>
												<td align="center" class="shich_cont">
												￥<fmt:formatNumber value="${key.product.price+30}" pattern="##.#" minFractionDigits="2" />
												</td>
												<td align="center">
													<font color="#FF0000">￥${key.product.price}</font>
												</td>
												<td align="center" >
													<input type="Text" name="amount_${key.product.productId}" id="amount_${key.product.productId}" value="${key.amount}" size="4"
														maxlength="4" style="background-color: #99FFCC;" onkeyup="sum('${key.product.productId}');">
												</td>
												<td align=center>
													<font color="#FF0000" >￥<span id="amount_${key.product.productId}_1"><fmt:formatNumber value="${key.product.price * key.amount}" pattern="##.#" minFractionDigits="2" /></span></font>
												</td>
												<td name="fen" align=center >
													1
												</td>
												<td align=center>
													<a href="deleteCar.html?productId=${key.product.productId}">删除</a>
												</td>
											</tr>
										</c:forEach>
											 <c:if test="${empty shoppingCar.items }">
												  <tr height="26" align="center" bgcolor="#FFFFFF">
													<td colspan="10" style="color: red;">&nbsp;对不起,您目前尚未选购任何商品!</td>
												  </tr>							  	
											  </c:if>
										</table>
									</form>
									</td>
								</tr>
								 <c:if test="${!empty shoppingCar.items }">
								<tr align="left">
									<td colspan="6" bgcolor="#ffffff" height=35 style="padding: 10px;">
										<table width="724" height="35" border="0" cellpadding="0"
											cellspacing="0">
											<tr>
												<td width="620">
													购物款总计：
													<font color="#FF0000">￥<span id="totalPrice">${shoppingCar.totalSellPrice}</span></font> 
													
													　　　最多获得积分：
													<font color="#FF0000">10</font>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="6" bgcolor="#ffffff" height=40 align=center style="padding: 20px;">
										<table width="724" border="0" cellpadding="0" cellspacing="0"
											bgcolor="#FFFFFF">
											<tr>
												<td width="200">
													&nbsp;
												</td>
												<td width="119" align="right"><img
															src="order/gouwuche/800buy_gwc_jx.gif" alt="" width="125"
															height="39" border="0" style="cursor:pointer"
															onclick="javascript:window.location.href='productBrandList.html'"
															>
													
												</td>
												<td width="100" style="padding-left: 10px;padding-right: 10px;">
													<a href="deleteAll.html"><img
															src=order/gouwuche/dellAll.png width=125 height=39
															border=0>
													</a>
												</td>
												<td width="359">
													<a href="confirmOrder.html"><img
															src=order/gouwuche/800buy_gwc_buy.gif width=125 height=39
															border=0>
													</a>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								</c:if>
								<tr>
									<td colspan="6" bgcolor="#ffffff" height=20 align=center>
										&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
									</td>
								</tr>
							</form>
						</table>
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
