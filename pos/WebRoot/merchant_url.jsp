<%@page import="com.lanyuan.controller.PayMentController"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.mysql.jdbc.Driver" %>

<%@ page import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@ page import="test.md5"%>
<%@ page import="test.getErrorInfo"%>
<jsp:useBean id='oMD5' scope='request' class='test.md5'/>
<jsp:useBean id='oInfo' scope='request' class='test.getErrorInfo'/>
<%  
	String MerchantID = request.getParameter("MerchantID");//商户号
	String TransID = request.getParameter("TransID");//商户流水号
	String Result = request.getParameter("Result");//支付结果
	String resultDesc = request.getParameter("resultDesc");//支付结果描述
	String factMoney = request.getParameter("factMoney");//实际成功金额
//		out.println("<script>alert('支付结果:"+Result+",实际成功金额:"+factMoney+"');</script>");
		Double a = Double.parseDouble(factMoney)/100; //使用元显示
//		out.println("<script>alert('使用元显示,实际成功金额:"+a+"');</script>");
	   String FactMoney=String.valueOf(a);
	
	String additionalInfo = request.getParameter("additionalInfo");//订单附加消息	
	String SuccTime = request.getParameter("SuccTime");//支付完成时间
	String Md5Sign = request.getParameter("Md5Sign");//MD5签名
	String Md5key = "cy7rpxdafzb98l8d"; ///////////md5密钥（KEY）
	String md5 = new String(MerchantID+TransID+Result+resultDesc+factMoney+additionalInfo+SuccTime+Md5key);//MD5签名格式
	String WaitSign = oMD5.getMD5ofStr(md5);//计算MD5值
	String lbresultDesc = oInfo.getErrorInfo(Result,resultDesc);//支付结果文字描述
	String OrderMoney=(String)session.getAttribute("OrderMoney");//获取提交金额的Session
//	out.println("<script>alert('提交金额:"+OrderMoney+"');</script>");
	Double b = Double.parseDouble(OrderMoney)/100; //使用元显示
//	out.println("<script>alert('使用元显示,提交金额:"+b+"');</script>");
	String lbOrderMoney=String.valueOf(b);
	if(WaitSign.compareTo(Md5Sign)==0){
		//校验通过开始处理订单
		//if(OrderMoney.compareTo(factMoney)==0){
		//卡面金额与用户提交金额一致
		//提示：这个int类型的 如果存在小数的话，这个 除法算出的金额可能会不正确，如果存在小数 推荐使用BigDecimal
		out.println("<script>alert('支付成功');</script>");//全部正确了输出OK
		
		String tradingRates=(String)session.getAttribute("tradingRates");
		Double tr = Double.parseDouble(tradingRates);
		String realMoney = (a-a*tr)+"";//交易成功金额　－　交易成功金额*费率
//驱动程序名

String driverName="com.mysql.jdbc.Driver";

//数据库用户名

String userName="pospos";

//密码

String userPasswd="pos123456789";

//数据库名

String dbName="pospos";

//表名

String tableName="payment";

//联结字符串

String url="jdbc:mysql://223.244.227.11/"+dbName+"?user="+userName+"&password="+userPasswd;

Class.forName("com.mysql.jdbc.Driver").newInstance();

Connection connection=DriverManager.getConnection(url);

Statement statement = connection.createStatement();
String username=(String)session.getAttribute("userName");
String Channelname=(String)session.getAttribute("Channelname");
String sql="INSERT INTO `payment`(orderId,userName,tradingMoney,realMoney,channelname,payState)  VALUES ('"+TransID+"', '"+username+"', '"+OrderMoney+"', '"+realMoney+"','"+Channelname+"', '"+Result+"');";
statement.executeUpdate(sql);

statement.close();

connection.close();
		//}else{
		//out.println("<script>alert('实际成交金额与您提交的订单金额不一致，请接收到支付结果后仔细核对实际成交金额，以免造成订单金额处理差错。');</script>");	//实际成交金额与商户提交的订单金额不一致
		//}
	}else{
		out.println("<script>alert('Md5CheckFail');</script>");//MD5校验失败，订单信息不显示
		TransID="";
		lbresultDesc="";
		FactMoney="";
		lbOrderMoney="";
		additionalInfo="";
		SuccTime="";
		}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- TemplateBeginEditable name="doctitle" -->
<title>充值接口-商户充值结果</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
<script type="text/javascript">
function closewin() {
				window.close();
		}

</script>
</head>

<body>
<form id="form1" method="get" name="form1">
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="30" align="center">
				<h1>
					※ 宝付在线支付完成 ※
				</h1>
			</td>
		</tr>
	</table>
	<table bordercolor="#cccccc" cellspacing="5" cellpadding="0" width="400" align="center"
		border="0">		
		<tr>
			<td class="text_12" bordercolor="#ffffff" align="right" width="150" height="20">
				订单号：</td>
			<td class="text_12" bordercolor="#ffffff" align="left">
			<%=TransID%>
				</td>
		</tr>
		<tr>
			<td class="text_12" bordercolor="#ffffff" align="right" width="150" height="20">
				支付结果描述：</td>
			<td class="text_12" bordercolor="#ffffff" align="left">
			<%=Result%>　　(0 表示失败  1表示成功)
				</td>
		</tr>
		<tr>
			<td class="text_12" bordercolor="#ffffff" align="right" width="150" height="20">
				实际成功金额：</td>
			<td class="text_12" bordercolor="#ffffff" align="left">
			<%=FactMoney%>
				</td>
		</tr>
		<tr>
			<td class="text_12" bordercolor="#ffffff" align="right" width="150" height="20">
				提交的金额：</td>
			<td class="text_12" bordercolor="#ffffff" align="left">
			<%=b%>
				</td>
		</tr>		
			<td class="text_12" bordercolor="#ffffff" align="right" width="150" height="20">
				订单附加消息：</td>
			<td class="text_12" bordercolor="#ffffff" align="left">
			<%=additionalInfo%>
				</td>
		</tr>
		<tr>
			<td class="text_12" bordercolor="#ffffff" align="right" width="150" height="20">
				交易成功时间：</td>
			<td class="text_12" bordercolor="#ffffff" align="left">
			<%=SuccTime%>
				</td>
		</tr>
		<tr><td>
		<input type="button"  value="关闭窗口" onclick="closewin();"/>
		</td></tr>		
	</table> 
</form>
</body>
</html>
