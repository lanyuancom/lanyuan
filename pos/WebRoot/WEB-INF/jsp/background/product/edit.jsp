<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../../common/common-css.jsp"%>
<script type="text/javascript">
//上传图片页面
	  function openWindow() {
	  window.location.href='${pageContext.servletContext.contextPath }/background/product/uploadUI.html?id=${product.productId}';
	} 
</script>
</head>

<body>
<div style="height: 100%;overflow-y: auto;">
	<br />
	<br />
	<form
		action="${pageContext.servletContext.contextPath }/background/product/update.html"
		method="post">
		<input type="hidden" name="productId" value="${product.productId}">
		<table class="ttab" height="100" width="50%" border="0"
			cellpadding="0" cellspacing="1" align="center">
			<tr>
				<td height="30" bgcolor="#FFFFFF" colspan="2">
					<div align="center">
						<font color="blue" size="8"><b>新增信息</b>
						</font>
					</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品名称：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input id="productName" style="height: 20px;width: 200px"
							name="productName" value="${product.productName}" /> <font
							color="red">*</font>
					</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">类型：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<select name="productBrandId">
						<option value="0">选择类型</option>
								<c:forEach items="${brandNameList}" var="key">
									<option  value="${key.productBrandId}" <c:if test="${product.productBrandId eq key.productBrandId}"> selected="selected"</c:if> >${key.productBrandName}</option>
								</c:forEach>
					</select>	
						<font color="red">*</font>
					</div></td>
			</tr>
			<tr>
				<td width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品图片地址：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
					如果图片不能正确显示，请点击：
							<input id="upload" type="button" class="btn3_mouseover"
								 onclick="return openWindow();" value="修改图片">
								　　<img src="${pageContext.servletContext.contextPath }${product.productImagesUrl}" width="100" height="80"/>
								<a href="${pageContext.servletContext.contextPath }${product.productImagesUrl}" target="_bank">查看原图</a>
					</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品价：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input id="price" style="height: 20px;width: 200px" name="price" value="${product.price}"/>

					</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品单位：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input id="productUnit" style="height: 20px;width: 200px"
							name="productUnit" value="${product.productUnit}"/> <font color="red">*</font>
					</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品出产地：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input id="productProduce" style="height: 20px;width: 200px"
							name="productProduce" value="${product.productProduce}" /> <font color="red">*</font>
					</div></td>
			</tr>
			<tr>
				<td width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品简介：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<textarea id="productProfile" rows="6" cols="30"
							name="productProfile">${product.productProfile}</textarea>
						<font color="red">*</font>
					</div></td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 10px">
					<div align="center">
						<input type="submit" value="　保　存　" class="input_btn_style1" /> <input
							id="backBt" type="button" value="　返　回　" class="input_btn_style1"
							onclick="javascript:window.location.href='javascript:history.go(-1)'" />
					</div></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>
