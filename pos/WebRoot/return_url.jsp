<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
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
	String additionalInfo = request.getParameter("additionalInfo");//订单附加消息	
	String SuccTime = request.getParameter("SuccTime");//支付完成时间
	String Md5Sign = request.getParameter("Md5Sign");//MD5签名
	String Md5key = "gamzkmjdrbpbct9v";
	String md5 = MerchantID+TransID+Result+resultDesc+factMoney+additionalInfo+SuccTime+Md5key;//MD5签名格式
	String WaitSign = oMD5.getMD5ofStr(md5);	
	if(WaitSign.compareTo(Md5Sign)==0){
		//校验通过开始处理订单		
		out.println("OK");//全部正确了输出OK		
	}else{
		out.println("Md5CheckFail'");//MD5校验失败

	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- TemplateBeginEditable name="doctitle" -->
<title>充值接口-服务器返回结果</title>

</head>

<body>    
</body>
</html>
