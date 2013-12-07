<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>定时任务监控管理</title>
<%@include file="../../common/common-css.jsp"%>
   <link href="${pageContext.servletContext.contextPath }/css/showLoading.css" rel="stylesheet" media="screen" /> 
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/jquery.showLoading.js"></script>
	
<script language="JavaScript" src="${pageContext.servletContext.contextPath }/FusionCharts/FusionCharts.js"></script>
<style type="text/css">
body{
font-size: 12px;
}
.ttab{
text-align: center;
}
.list{float:left;}
.list li{text-align:left; padding-left:5px;height:25px;border:#FFFFCC dashed 1px; text-decoration:underline;}
.config_text{width:400px; height:35px; border:#CCCCCC solid 1px;background:#FFCC99;}
.inputclass {
    border: 1px solid #DDDDDD;
    color: #333333;
    font-size: 13px;
    outline: medium none;
    width:80px;
    background: none repeat scroll 0 0 #FFFF9D;
}
.tab_div{margin:5px;height:440px;overflow-x:hidden;}
.block_panel{ float:left;width:99%;}
.block_table{ float:left; width:250px; text-align:left; border:0;}
.block_icon_disk{text-align:center; background:url(${pageContext.request.contextPath}/images/icons/other/disk.jpg) no-repeat;}
.block_icon_cpuInfos{text-align:center; background:url(${pageContext.request.contextPath}/images/icons/other/disk.jpg) no-repeat;}
.block_stat{ background:#FFFFFF; border:#666666 solid 1px; height:15px; width:150px;}

</style>
<script type="text/javascript">
$(function(){
	$(".loading").showLoading(); 
	var url = "${pageContext.request.contextPath}/background/serverInfo/warnInfo.html";
	$.ajax({
		type : 'POST',
		url : url,
		dataType : 'json',
		success : function(data) {
		 var tbodyContent="";
		 	tbodyContent = tbodyContent + "<tr>";
		 	tbodyContent = tbodyContent + "<td>CPU</td><td style='padding-left:10px;text-align: left;'>使用率："+data.cpuUsage+"%</td>";
		 	tbodyContent = tbodyContent + "<td>使用率超出 <input class='inputclass' name='cpu' id='cpu' type='text' value='"+data.cpu+"'/> %,发送邮箱提示 <input type='button' value='更新' id='btnLoadData' class='input_btn_style1' onclick='modifySer(\"cpu\");'/></td><td rowspan='3'><input class='inputclass'style='width:180px;height:24px;' name='toEmail' id='toEmail' type='text' value='"+data.toEmail+"'/><input type='button' value='更新' id='btnLoadData' class='input_btn_style1'style='padding: 3px 11px;' onclick='modifySer(\"toEmail\");'/></td>";
		 	 tbodyContent = tbodyContent + "</tr>";
		 	tbodyContent = tbodyContent + "<tr>";
		 	tbodyContent = tbodyContent + "<td>服务器内存</td><td style='padding-left:10px;text-align: left;'>总内存："+data.TotalMem+"<br/>空闲内存："+data.FreeMem+"<br/>使用率："+data.serverUsage+"%</td>";
		 	tbodyContent = tbodyContent + "<td>使用率超出 <input class='inputclass' name='ram' id='ram' type='text' value='"+data.ram+"'/> %,发送邮箱提示 <input type='button' value='更新' id='btnLoadData' class='input_btn_style1' onclick='modifySer(\"ram\");'/></td>";
			 tbodyContent = tbodyContent + "</tr>";
			 tbodyContent = tbodyContent + "<tr>";
			 	tbodyContent = tbodyContent + "<td>JVM内存</td><td style='padding-left:10px;text-align: left;'>JVM总内存："+data.JvmTotalMem+"<br/>JVM空闲内存："+data.JvmFreeMem+"<br/>使用率："+data.JvmUsage+"%</td>";
			 	tbodyContent = tbodyContent + "<td>使用率超出 <input class='inputclass' name='jvm' id='jvm' type='text' value='"+data.jvm+"'/> %,发送邮箱提示 <input type='button' value='更新' id='btnLoadData' class='input_btn_style1' onclick='modifySer(\"jvm\");'/></td>";
				 tbodyContent = tbodyContent + "</tr>";
		 $('#tbody').html(tbodyContent);
		fchart("CPU使用情况","%", "剩余", (100-data.cpuUsage), "已经使用", data.cpuUsage, "cpu", "cpuchart");
		fchart("内存使用情况","%", "剩余", (100-data.serverUsage), "已经使用", data.serverUsage, "ram", "ramchart");
		fchart("JVM使用情况","%", "剩余", (100-data.JvmUsage), "已经使用", data.JvmUsage, "jvm", "jvmchart");
		 var disk = data.diskInfos;
		 var html = "";
		 if(disk == null || disk == undefined || disk == ""){
			 $('#diskInfos').html("无法获取系统磁盘信息");
			 $(".loading").hideLoading();
			 return;
		 }
			
		html = createDiskInfosHtml(disk);
		 $('#diskInfos').html(html);
		 $(".loading").hideLoading();
	}
	});
});
function createDiskInfosHtml(datas){
	var html = "";
	var name,title,availSize,freeSize,percentSize;
	for(var index in datas){
		var info = datas[index];
		name = "磁盘 "+info['devName'];
		totalSize = info['totalSize'];
		availSize = info['availSize'];
		percentSize = 150 * (info['usedSize']/info['totalSize']);
		html = html + "<table class=\"block_table\">";
		html = html + "<tr><th width=\"20%\">&nbsp;</th><th width=\"80%\">"+name+"</th></tr>";
		html = html + "<tr>";
		html = html + "<td rowspan=\"2\" class=\"block_icon_disk\"></td>";
		html = html + "<td><div class=\"block_stat\"><div style=\"background:#46AF6D;height:15px; width:"+percentSize+"px;\">&nbsp;</div></div></td>";
		html = html + "</tr>";
		html = html + "<tr><td>"+availSize+"G 可用 共"+totalSize+"G </td></tr>";
		html = html + "</table>";
	}
	return html;
}
function modifySer(key){
	$.ajax({
        async: false,
        url: "${pageContext.request.contextPath}/background/serverInfo/modifySer.html",
        data:{"key":key,"value":$("#"+key).val()},
        dataType: "json",
        success: function (data) {
    	    if(data.flag){
    	    	alert("更新成功！");
    	    }else{
    	    	alert("更新失败！");
    	    }
        }
	});
}
 function fchart(name,pen,label1,value1,label2,value2,charId,divId){
  	var text_chart="('<chart baseFontSize=\"12\" caption=\""+name+"\" numberPrefix=\""+pen+"\"><set value=\""+value1+"\" label=\""+label1+"\" color=\"AFD8F8\" /><set value=\""+value2+"\" label=\""+label2+"\" color=\"F6BD0F\" /></chart>')";
	  var chart = new FusionCharts("${pageContext.request.contextPath}/FusionCharts/Pie3D.swf", charId, "350", "200");
	  chart.setDataXML(text_chart);		   
	  chart.render(divId);  
 }
	 
</script>
</head>
<body>
<div style="height: 588px;overflow-y: scroll;">
<div class="loading" style="height: 650px;">
<center>
<table class="ttab" width="99%">
  <thead>
  <tr style="background-color:#e8f3fd;">
   <td width="100">名称</td>
    <td width="100">参数</td>
	<td width="275">预警设置</td>
	<td width="275">邮箱设置</td>
  </tr>
  </thead>
<tbody id="tbody">
</tbody>
</table>
<table>
<tr>
<td><div id="cpuchart"></div></td>
<td><div id="ramchart"></div></td>
<td><div id="jvmchart"></div></td>
</tr>
</table>
<br/>
<h1 style="background-color:#e8f3fd; width:99%;text-align: left;">磁盘信息</h1><br/>
<div class="block_panel" id="diskInfos"></div>
</center>
</div>
</div>
</body>
</html>