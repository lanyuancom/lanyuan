<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../../common/common-css.jsp"%>
<script type="text/javascript">
	function updateOrderList() {
		var productNum = document.getElementById('productNum').value;
		if (isNaN(productNum)) {
			alert("商品数量　你输入的不是一个数字　");
			return false;
		}
		document.updateCril.submit();
		return false;
	}
	function sunPice() {
		var productNum = document.getElementById('productNum');
		if (isNaN(productNum.value)) {
			alert("商品数量　你输入的不是一个数字　");
			return false;
		}
		var price = "${orderList.price}";
		var sun = parseFloat(productNum.value)*parseFloat(price);
		document.getElementById("productSumPriceSpan").innerHTML = sun;
		document.getElementById("productSumPrice").value = sun;
	}
</script>
</head>

<body>
	<br />
	<br />
	<form name="updateCril"
		action="${pageContext.servletContext.contextPath }/background/orderlist/update.html"
		method="post">
		<input type="hidden" name="orderId" value="${orderList.orderId}">
		<table class="ttab" height="100" width="70%" borderList="0"
			cellpadding="0" cellspacing="1" align="center">
			<tr>
				<td height="30" colspan="2">
					<div align="center">
						<font color="blue" size="8"><b>修改信息</b> </font>
					</div>
				</td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">用户：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						${orderList.userName}</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品名称：</div>
				</td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="productName"
							type="text" value="${orderList.productName}" /> <font
							color="red">*</font>
					</div>
				</td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品的单价：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<span id="priceSpan" style="font-size: 14;color: red;">${orderList.price}</span>
					</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">总价：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="productSumPrice"
							id="productSumPrice" type="hidden"
							value="${orderList.productSumPrice}" /> <span
							id="productSumPriceSpan" style="font-size: 14;color: red;">${orderList.productSumPrice}</span>
					</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品的数量：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="productNum"
							type="text" id="productNum" value="${orderList.productNum}"
							onblur="sunPice();" /> <font color="red">*</font>
					</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">送货地址：</div>
				</td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="userAddress"
							type="text" value="${orderList.userAddress}" /> <font
							color="red">*</font>
					</div>
				</td>
			</tr>
			<tr>
				<td width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">联系电话：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="userPhone"
							type="text" value="${orderList.userPhone}" /> <font color="red">*</font>
					</div></td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 10px">
					<div align="center">
						<input type="button" value="　保　存　" class="input_btn_style1"
							onclick="return updateOrderList();" /> <input id="backBt"
							type="button" value="　返　回　" class="input_btn_style1"
							onclick="javascript:window.location.href='javascript:history.go(-1)'" />
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
