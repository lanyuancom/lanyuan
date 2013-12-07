<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../../common/common-css.jsp"%>
   <link href="${pageContext.servletContext.contextPath }/css/showLoading.css" rel="stylesheet" media="screen" /> 
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/jquery.showLoading.js"></script>
	
<script language="JavaScript" src="${pageContext.servletContext.contextPath }/FusionCharts/FusionCharts.js"></script>
<style type="text/css">
input {
	font-size: 12px
}
.ttab{
font-size: 14px
}
.label{
 background-color:#e8f3fd;
 text-align: right;
 padding-right: 10px;
}
td span{
	margin-left: 10px;
}
.block_panel {
	float: left;
	width: 99%;
}

.block_table {
	float: left;
	width: 250px;
	text-align: left;
	border: 0;
}

.block_icon_disk {
	text-align: center;
	background:
		url(${pageContext.request.contextPath}/images/icons/other/disk.jpg)
		no-repeat;
}

.block_icon_cpuInfos {
	text-align: center;
	background:
		url(${pageContext.request.contextPath}/images/icons/other/disk.jpg)
		no-repeat;
}

.block_stat {
	background: #FFFFFF;
	border: #666666 solid 1px;
	height: 15px;
	width: 150px;
}

li,ul {
	margin: 0;
	padding: 0;
	list-style-type: 0
}

li img {
	vertical-align: bottom;
}

.dhooo_tab {
	width: 100%;
	height: 100%;
	margin-left: 1px;
	margin-right: 1px;
	background: #fff
		url(${pageContext.request.contextPath}/images/main_bg.gif) repeat-x 0
		100%;
	border: 1px solid #aaa;
	position: relative;
}

.tab_btn li {
	float: left;
	width: 60px
}

.tab_btn li {
	font-size: 12px;
	display: block;
	padding: 10px;
	margin-right: 5px;
	zoom: 1;
	text-decoration: none;
	color: #fff;
	line-height: 50%;
	cursor: pointer;
}

.tab_btn li.hot {
	background: #fff;
	color: #333;
	font-weight: bold;
	cursor: default;
}

.tab_btn {
	overflow: hidden;
	height: 28px;
	padding-left: 20px;
	padding-top: 5px;
	background: url(${pageContext.request.contextPath}/images/tabbar.gif)
		repeat-x;
}

.tab_btn_num {
	position: absolute;
	right: 50px;
	bottom: 15px;
}

.tab_btn_num li {
	width: 20px;
	height: 20px;
	background: #CC3300;
	border: 2px solid #993300;
	overflow: hidden;
	color: #fff;
	filter: alpha(opacity = 80);
	opacity: 0.8;
	float: left;
	cursor: default;
	font-size: 12px;
	line-height: 20px;
	margin: 0px 5px;
	font-family: Arial;
}

.tab_btn_num li.hot {
	background: #FFCC00;
	color: #993300;
	border: 2px solid #FF0000;
}
.form_tltle {
    background: #CAE8EA;
    border-bottom: 1px solid #C1DAD7 1px solid;
    border-top: 1px solid #C1DAD7 1px solid;
    height: 37px;
border-left: #C1DAD7 1px solid;
border-right: #C1DAD7 1px solid;
line-height: 37px;
text-align: left;
text-indent: 1em;
font-weight: bold;
}
</style>
<script type="text/javascript">
	function changeTab(index) {
		for ( var i = 1; i <= 4; i++) {
			document.getElementById("li_" + i).className = "bb";
			document.getElementById("li_" + index).className = "hot";
			document.getElementById("div" + i).style.display = "none";
		}

		document.getElementById("div" + index).style.display = "block";
	}

	$(document).ready(function() {
	$(".dhooo_tab").showLoading(); 
		loadTabData();
	});
	function loadTabData() {
		$.ajax({
					type : 'POST',
					url : "${pageContext.request.contextPath}/background/serverInfo/info.html",
					dataType : 'json',
					success : function(json) {
						allLoadFinished = true;
						var data = json['data'];
						var _target;
						var html;
						for ( var index in data) {
							if (index == 'diskInfos') {
								html = createDiskInfosHtml(index, data[index]);
							} else if (index == 'cpuInfos') {
								html = createCpuInfosHtml(data[index]);
							} else {
								html = data[index];
							}
							_target = $("#" + index);
							if (_target)
								_target.html(html);
						}
						var sun=$("#jvmTotalMem").html()-$("#jvmFreeMem").html();
						fchart("JVM","M", "剩余容量", $("#jvmFreeMem").html(), "已经使用", sun, "JVM", "jvmchart");
						var memPercent = (100 * data['usedMem'] / data['totalMem'])
								.toFixed(1)
								+ "%";
						var swapPercent = (100 * data['usedSwap'] / data['totalSwap'])
								.toFixed(1)
								+ "%";
						$("#mem_percent").css("width", memPercent);
						$("#swap_percent").css("width", swapPercent);
						$("#memPercent").html(memPercent);
						$("#swapPercent").html(swapPercent);
						$(".dhooo_tab").hideLoading();
					}
				});
	}

	function createCpuInfosHtml(datas) {
		var html = "";
		for ( var index in datas) {
			var info = datas[index];
			var title = info['vendor'] + " " + info['model'];
			var usedPercent = info['used'];
			html = html + "<div class=\"form_tltle\">第 "
					+ (parseInt(index) + 1) + " 块CPU</div>";
			html = html
					+ "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"form2column\">";
			html = html + "<tr><td class=\"label\">CPU信息:</td>";
			html = html + "<td>" + title + "</td></tr>";
			html = html + "<tr><td class=\"label\">使用情况:</td>";
			html = html
					+ "<td><div class=\"block_stat\"><div style=\"background:#46AF6D;height:15px; width:"+usedPercent+";\">&nbsp;</div></div> &nbsp;使用率："
					+ usedPercent + "</td>";
			html = html + "</table>";
		}
		return html;
	}

	function createDiskInfosHtml(type, datas) {
		var html = "";
		var name, title, availSize, freeSize, percentSize;
		for ( var index in datas) {
			var info = datas[index];
			name = "磁盘 " + info['devName'];
			totalSize = info['totalSize'];
			availSize = info['availSize'];
			percentSize = 150 * (info['usedSize'] / info['totalSize']);
			html = html + "<table class=\"block_table\">";
			html = html + "<tr><th width=\"20%\">&nbsp;</th><th width=\"80%\">"
					+ name + "</th></tr>";
			html = html + "<tr>";
			html = html + "<td rowspan=\"2\" class=\"block_icon_disk\"></td>";
			html = html
					+ "<td><div class=\"block_stat\"><div style=\"background:#46AF6D;height:15px; width:"+percentSize+"px;\">&nbsp;</div></div></td>";
			html = html + "</tr>";
			html = html + "<tr><td>" + availSize + "G 可用 共" + totalSize
					+ "G </td></tr>";
			html = html + "</table>";
		}
		return html;
	}
	 function fchart(name,pen,label1,value1,label2,value2,charId,divId){
  	var text_chart="('<chart baseFontSize=\"14\" caption=\""+name+"\" numberPrefix=\""+pen+"\"><set value=\""+value1+"\" label=\""+label1+"\" color=\"AFD8F8\" /><set value=\""+value2+"\" label=\""+label2+"\" color=\"F6BD0F\" /></chart>')";
	  var chart = new FusionCharts("${pageContext.request.contextPath}/FusionCharts/Pie3D.swf", charId, "400", "250");
	  chart.setDataXML(text_chart);		   
	  chart.render(divId);  
 }
   </script>
</head>

<body>
	<div class="dhooo_tab">
		<ul class="tab_btn" id="myTab_btns1">
			<li id="li_1" onclick="changeTab('1')" class="hot">运行环境</li>
			<li id="li_2" onclick="changeTab('2')">CPU信息</li>
			<li id="li_3" onclick="changeTab('3')">内存信息</li>
			<li id="li_4" onclick="changeTab('4')">磁盘信息</li>
		</ul>
				<div id="div1" style="display :block">
				<table style="height: 90%;width: 100%;">
				<tr>
				<td>
					<table border="0" cellpadding="0" cellspacing="0" class="ttab" style="height: 100%;width: 100%;">

						<tr>
							<td class="label" width="160px">当前服务器时间:</td>
							<td><span id="serverTime"></span>
							</td>
						</tr>
						<tr>
							<td class="label">服务器名:</td>
							<td><span id="serverName"></span>
							</td>
						</tr>
						<tr>
							<td class="label">操作系统:</td>
							<td><span id="serverOs"></span>
							</td>
						</tr>
						<tr>
							<td class="label">Java目录:</td>
							<td><span id="javaHome"></span>
							</td>
						</tr>
						<tr>
							<td class="label">Java版本:</td>
							<td><span id="javaVersion"></span>
							</td>
						</tr>
						<tr>
							<td class="label">Java临时目录:</td>
							<td><span id="javaTmpPath"></span>
							</td>
						</tr>
						<tr>
							<td class="label">JVM总内存:</td>
							<td><span id="jvmTotalMem"></span> M</td>
						</tr>
						<tr>
							<td class="label">JVM最大内存容量:</td>
							<td><span id="jvmMaxMem"></span> M</td>
						</tr>
						<tr>
							<td class="label">JVM空闲内存:</td>
							<td><span id="jvmFreeMem"></span> M</td>
						</tr>
					</table>
					</td>
				<td><div id="jvmchart"></div></td>
				</tr>
				</table>
				</div>
				<div id="div2" style="display :none">
					<div class="block_panel" id="cpuInfos"></div>
				</div>
				<div id="div3" style="display :none">
					<table border="0" cellpadding="0" cellspacing="0" class="ttab" style="height: 90%;width: 100%;">
						<tr>
							<td class="label">总内存容量:</td>
							<td><span id="totalMem"></span> M</td>
						</tr>
						<tr>
							<td class="label">已用内存:</td>
							<td><span id="usedMem"></span> M</td>
						</tr>
						<tr>
							<td class="label">可用内存:</td>
							<td><span id="freeMem"></span> M</td>
						</tr>
						<tr>
							<td class="label">使用率:</td>
							<td><div class="block_stat">
									<div id="mem_percent"
										style="background:#46AF6D;height:15px; width:30px;">&nbsp;</div>
								</div>
								<span id="memPercent"></span>
							</td>
						</tr>
						<tr>
							<td class="label" width="160px">总交换区容量:</td>
							<td><span id="totalSwap"></span> M</td>
						</tr>
						<tr>
							<td class="label">已用交换区:</td>
							<td><span id="usedSwap"></span> M</td>
						</tr>
						<tr>
							<td class="label">可用交换区:</td>
							<td><span id="freeSwap"></span> M</td>
						</tr>
						<tr>
							<td class="label">使用率:</td>
							<td><div class="block_stat">
									<div id="swap_percent"
										style="background:#46AF6D;height:15px; width:30px;">&nbsp;</div>
								</div>
								<span id="swapPercent"></span>
							</td>
						</tr>
					</table>
				</div>
				<div id="div4" style="display :none">
					<div class="block_panel" id="diskInfos"></div>
				</div>
			</div>
</body>
</html>
