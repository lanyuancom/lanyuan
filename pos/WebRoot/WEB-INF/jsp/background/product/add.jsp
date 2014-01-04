<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../../common/common-css.jsp"%>
<script type="text/javascript">
function uploadfile(){
    	var uploadfile = document.getElementById("upload").value;
    	if(uploadfile==""){
    		alert("你还没有上传图片！！");
			return false;

    		}
    	if(uploadfile!=""){
			var types = ["jpg","gif","bmp","png"];
			var ext = uploadfile.substring(uploadfile.length-3).toLowerCase();
			var sing = false;
			for(var i=0; i<types.length;i++){
				if (ext==types[i]){
					sing = true; 
				}
			}
		if(!sing){
			alert("只允许上传图片image/png,image/gif,image/jpg,image/jpeg,image/pjpeg");
			return false;
		}		
	}
 }
</script>
</head>

<body>
	<br />
	<br />
	<form
		action="${pageContext.servletContext.contextPath }/background/product/add.html"
		method="post" enctype="multipart/form-data">
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
							name="productName" value="${productName}" /> <font
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
									<option  value="${key.productBrandId}">${key.productBrandName}</option>
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
						<input id="upload" type="file" name="upload" /> <font color="red">*</font>
					</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品价：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input id="price" style="height: 20px;width: 200px" name="price" />

					</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品单位：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input id="productUnit" style="height: 20px;width: 200px"
							name="productUnit" /> <font color="red">*</font>
					</div></td>
			</tr>
			<tr>
				<td height="30" width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品出产地：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<input id="productProduce" style="height: 20px;width: 200px"
							name="productProduce" value="大陆" /> <font color="red">*</font>
					</div></td>
			</tr>
			<tr>
				<td width="40%" bgcolor="#FFFFFF">
					<div align="right" class="STYLE1">商品简介：</div></td>
				<td bgcolor="#FFFFFF">
					<div align="left" class="STYLE1" style="padding-left:10px;">
						<textarea id="productProfile" rows="6" cols="30"
							name="productProfile"></textarea>
						<font color="red">*</font>
					</div></td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 10px">
					<div align="center">
						<input type="submit" value="　保　存　" class="input_btn_style1"  onclick="return uploadfile();"/> <input
							id="backBt" type="button" value="　返　回　" class="input_btn_style1"
							onclick="javascript:window.location.href='javascript:history.go(-1)'" />
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
