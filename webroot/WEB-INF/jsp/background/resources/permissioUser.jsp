<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分配权限</title>
<%@include file="../../common/common-css.jsp" %>
     <script src="${pageContext.servletContext.contextPath }/js/jquery_1_7_2_min.js" type="text/javascript"></script>
     <script src="${pageContext.servletContext.contextPath }/js/ligerUI/base.js" type="text/javascript"></script>
    <link href="${pageContext.servletContext.contextPath }/js/ligerUI/ligerui-tree.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.servletContext.contextPath }/js/ligerUI/ligerTree.js" type="text/javascript"></script>
  <script type="text/javascript">
      	var tree;
        var manager=null;
        
        $(function ()
        {
           
            ${resources}
            tree=$("#tree1").ligerTree({ 
            	data:data, 
                textFieldName: 'fname', 
                attribute: ['fid', 'fname', 'pfid'],  
                idFieldName :'fid',
                parentIDFieldName :'pfid',
                checkbox: true,
                onSelect: onSelect

            });
            manager = $("#tree1").ligerGetTreeManager();
        });
        function onSelect(){};
        function getfun() //这里的异步加载逻辑取决于你的数据库设计，把选中节点的id传回去，传回子节点json然后加载  
        {
 			var fids="";
 			var notes = manager.getChecked();
             for (var i = 0; i < notes.length; i++)
             {
             	fids +=notes[i].data.fid+",";
             	if(notes[i].data.pfid != "" && notes[i].data.pfid != "null"){
             		fids +=notes[i].data.pfid+",";
             	};
             }
             if(fids == ""){
                 alert("还没有分配权限！！");
                 return;
             }
             if("${roleId}" != ""){
            	 $.ajax({
               		async:false, //请勿改成异步，下面有些程序依赖此请数据
               		type : "POST",
               		data:{roleId:"${roleId}",rescId:fids},
               		url: "${pageContext.servletContext.contextPath }/background/resources/saveRoleRescours.html",
               		dataType:'json',
               		success: function(json){
               			if(json == "1000"){
     						alert("分配成功,必须重新登录才生效！！");
     						window.close();
                       	}else if(json == "1001"){
                       		alert("分配失败！！");
                         };
                		}
               	});
      			// window.location="${pageContext.servletContext.contextPath }/function/addRoleFun?roleId=${roleId}&functionId="+fids;
             }else{
				alert("该用户还没有分配角色或用户的角色被删除了，请重新分配角色！！");
             }
        }
        $(function() {
        	$.ajaxSetup ({
                cache: false //关闭AJAX相应的缓存
             });
        });
    </script>
</head>
<body style="padding:10px">   
    <div style="width:300px; height:300px; margin:5px; float:left; border:1px solid #ccc; overflow:auto;  ">
    <ul id="tree1"></ul>
    </div> 
 
     <div align="center">
    <input type="button" class="input_btn_style1" name="btnSave" value="　保　存　" onclick="getfun();"/>　　
    <input id="backBt" type="button" value="　关　闭　" class="input_btn_style1" onclick="javascript:window.close();"/>
    </div>
</body>
</html>
