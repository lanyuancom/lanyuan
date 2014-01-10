<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@include file="../../common/common-css.jsp" %>
    <style type="text/css">
      input{font-size: 12px}
    </style>
    
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/jquery_1_7_2_min.js"></script>
    <script type="text/javascript">
    function sub(){
     var rates = document.getElementById("ratesId").value;
      var su = rates.split(",");
      var b = "";
       $.ajax({
                url: "${pageContext.servletContext.contextPath }/background/user/checkRatesName.html?_k="+new Date(),
                type: "POST",
                async:false,
                data: {"userName":"${userName}","channelname":su[3]},
                dataType:'json',
                success: function(data) {
               		if(data.data=="false"){
               			b="1";
               		}else{
               			b="";
               		}
                }

            });
            if(b=="1"){
            	alert("该客户已经存在通道："+su[3]);
            	 document.getElementById("ratesId").value="";
            	return;
            }
            document.getElementById("userName").value="${userName}";
            document.getElementById("channelname").value=su[3];
      document.getElementById("tradingRates").value=su[0];
      
      document.getElementById("settlementCosts").value=su[1];
      
      document.getElementById("settlementCaps").value=su[2];
     
    }
  function saveRate(){
  	var rates = document.getElementById("ratesId").value;
  	if(rates==""){
  		alert("请选择通道");
  	}else{
  		 document.saveRates.submit();
  	}
  }
    </script>
  </head>
  
  <body>
<br/>
<br/>  
<form action="${pageContext.servletContext.contextPath }/background/user/saveUserRates.html" method="post" name="saveRates">
		<table class="ttab" height="100" width="70%" border="0" cellpadding="0" cellspacing="1"
			align="center">
			<tr>
				<td height="30"
					 colspan="2">
					<div align="center">
					<font color="blue" size="5" ><b>新增客户费率</b></font>
					</div>
				</td>
			</tr>
			<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								支付通道：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input type="hidden"  id="channelname" name="channelname"/>
						
						<input type="hidden"  id="userName" name="userName"/>
						<select id="ratesId" name="ratesId" onchange="sub();">
						<option value="">选择通道</option>
						<c:forEach var="key" items="${rates}">
						<option value="${key.tradingRates},${key.settlementCosts},${key.settlementCaps},${key.channelname}">${key.channelname}</option>
						</c:forEach>
						</select>
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								交易费率：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px"  id="tradingRates" name="tradingRates"/>*如千分之三,填写：0.003
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1">
								结算费率：
						</div>
					</td>
					<td>
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" id="settlementCosts" name="settlementCosts"/>元/笔
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30"width="20%" >
						<div align="right" class="STYLE1" >
								结算限额：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" id="settlementCaps" name="settlementCaps"/>元/次
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding: 10px">
						<div align="center">
			 				<input type="button" value="　保　存　" class="input_btn_style1" onclick="saveRate()"/>　　　　
			 				<input id="backBt" type="button" value="　返　回　" class="input_btn_style1" onclick="javascript:window.location.href='javascript:history.go(-1)'"/>
		 				</div>
					</td>
				</tr>
		</table>
</form>
  </body>
</html>
