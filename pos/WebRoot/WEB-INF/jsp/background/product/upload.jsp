<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <style type="text/css">
    
    .btn3_mouseout {
BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #2C59AA 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#C3DAF5); BORDER-LEFT: #2C59AA 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #2C59AA 1px solid
}
.btn3_mouseover {
BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #2C59AA 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#D7E7FA); BORDER-LEFT: #2C59AA 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #2C59AA 1px solid
}
    
    </style>
    
    <script type="text/javascript">
    
    function file(){
    	var uploadfile = document.getElementById("ce").value;
    	if(uploadfile==""){
    		alert("你还没有上传图片！！　　不上传请关闭！！！");
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
	}else
    	{
			if(uploadfile==""){
	    		alert("你还没有上传图片！！　　不上传请关闭！！！");
				return false;
	
	    		}
    	}
	document.uploadCril.action="${pageContext.servletContext.contextPath }/background/product/upload.html";
	document.uploadCril.submit();

        }
    
    </script>
  </head>
  
  <body>
  
    <form name="uploadCril" method="post" enctype="multipart/form-data">
    <input type="hidden" name="productId" value="${param.id}">
    <div align="center">
   		 
		 <font color="red">只允许上传图片,图片大小不能超过　2M　
		 <br/>
		 格式："image/png","image/gif","image/jpg","image/jpeg","image/pjpeg"
		 </font>
		<br/>
		<br/>
		<input id="ce" type="file" name="upload" size="50"/>
		<br/>
		<br/>
		<br/>
			<input class=btn3_mouseout onmouseover="this.className='btn3_mouseover'"
			onmouseout="this.className='btn3_mouseout'" type="submit" value=" 上传 " onclick="return file();">　　
			　
			<button class=btn3_mouseout onmouseover="this.className='btn3_mouseover'"
			onmouseout="this.className='btn3_mouseout'"  onclick="javascript:window.close();">关闭　</button>
		</div>
	</form>
  </body>
</html>
