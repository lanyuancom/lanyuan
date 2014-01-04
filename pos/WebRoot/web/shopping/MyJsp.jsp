<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="com.vnv.bank.common.util.MD5"%>
<%@ page import="com.vnv.bank.common.util.DateUtil"%>
<%@ page import="java.util.Date"%>
<%
    /* 
     * <p>Title: </p>
     * <p>Description: 订单提交JSP范例</p>
     * <p>Copyright: Copyright (c) 2007</p>
     * <p>Company: 银生</p>
     * @author jl
     * @version 1.0
     */
    request.setCharacterEncoding("UTF-8");
    String version = request.getParameter("version");
    if(version==null||version.length()==0) version="3.0.0"; //接口版本
    String requestUrl = request.getParameter("requestUrl");
    if(requestUrl==null||requestUrl.length()==0) requestUrl = "https://www.unspay.com/unspay/page/linkbank/payRequest.do";
    String merchantId = request.getParameter("merchantId");
    if(merchantId==null) merchantId = "2120131224144601001"; //注册商户在银生的客户编号
    String merchantKey = request.getParameter("merchantKey");
    if(merchantKey==null) merchantKey = "123456789";         //注册商户在银生设置的密钥
    String merchantUrl = request.getParameter("merchantUrl");
    if(merchantUrl==null||merchantUrl.length()==0) merchantUrl = "http://localhost/merchant/mockMerchantResponse.jsp";  //商户反馈url
    String responseMode = request.getParameter("responseMode");
    if(responseMode==null) responseMode = "1";     //响应方式，1-页面响应，2-后台响应，3-两者都需
    String assuredPay = request.getParameter("assuredPay");       //是否担保支付
    if(assuredPay==null) assuredPay = "";
    String cardAssured = request.getParameter("cardAssured");
    if(cardAssured==null) cardAssured = "0";
    
    //订单的生成 
    String time = DateUtil.date2String(new Date(), "yyyyMMddHHmmss");  //订单创建时间
    String orderId = "GD" + time;//订单id[商户网站]
    String currencyType = "CNY";        //货币种类，暂时只支持人民币：CNY
    String amount = request.getParameter("amount");
    if(amount==null) amount = "0.1";  //支付金额
    String remark = request.getParameter("remark");
    if(remark==null) remark = "";    //备注，附加信息
    String bankCode = request.getParameter("bankCode"); //银行代码或者商联卡支付或者银生账户支付
    if(bankCode==null) bankCode="";
    boolean b2b = Boolean.valueOf(request.getParameter("b2b")).booleanValue();;       //是否B2B支付
    String commodity = request.getParameter("commodity"); //商品名称
    String orderUrl = request.getParameter("orderUrl");  //订单url
    
    StringBuffer s = new StringBuffer();
    s.append("merchantId=").append(merchantId);
    s.append("&merchantUrl=").append(merchantUrl);
    s.append("&responseMode=").append(responseMode);
          s.append("&orderId=").append(orderId);
    s.append("&currencyType=").append(currencyType);
    s.append("&amount=").append(amount);
    s.append("&assuredPay=").append(assuredPay);
    s.append("&time=").append(time);
    s.append("&remark=").append(remark);
    s.append("&merchantKey=").append(merchantKey);
    //md5加密
    String mac = new MD5().getMD5ofStr(s.toString());
%>
<HTML>
<HEAD>
<TITLE>商户银生支付</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
body,td,p,li,input,select {
	FONT-SIZE: 12px;
	text-decoration: none;
	line-height: 18px
}

.ncss {
	font-size: 12px;
	text-decoration: none;
	line-height: 18px;
}

.n2 {
	font-size: 11pt;
	line-height: 18px;
	text-decoration: none;
	color: #363636;
	font-weight: bold;
}

.login {
	font-size: 13px;
	font-weight: bold;
	color: #333333;
	line-height: 18px;
}

.lan {
	font-size: 12px;
	font-weight: bold;
	color: #003399;
}

.xin {
	color: #FF0000;
	font-size: 9pt;
	text-decoration: none;;
	font-weight: bold
}

.xt {
	font-size: 12px;
	line-height: 18px;
	text-decoration: none;
	font-weight: bold;
	color: #000000;
}

.lan {
	line-height: 18px;
	text-decoration: none
}

a:link {
	color: #003399;
	text-decoration: underline;
}

a:visited {
	text-decoration: underline;
	color: #003399;
}

a:hover {
	text-decoration: none;
	color: #6FB7FF;
}

a:active {
	text-decoration: underline;
	color: #000000;
}

body {
	margin-left: 0px;
	margin-top: 0px;
}

.style8 {
	color: #000066;
	font-weight: bold;
	font-size: 16;
}

.style1 {
	font-size: 16px
}
-->
</style>
<script type="text/javascript">
function toSubmit(btnObj){
	//btnObj.disabled = true;
	btnObj.form.submit();
}
</script>
</HEAD>
<BODY>
<form name="frm" method="post" target="_blank"
      action="<%=requestUrl%>">
  <DIV align="center" class="style1"> <span class="style8"><br>
    网上花店<br>
    </span>
    <table width="751" border="0" cellpadding="0" cellspacing="0"
          bgcolor="#F6F9FF" id="table">
      <tr>
        <td width="50" height="1" bgcolor="#D8D8D8"></td>
      </tr>
      <tr>
        <td height="39" style="color: #3F5786; padding-left: 18px"><span style="font-size: 14px">模拟商户网站生成订单页：<strong> </strong> </span><strong>假设本页面是在商户网站上</strong> </td>
      </tr>
      <tr>
        <td align="center"><table width="96%" border="0" cellspacing="0"
                cellpadding="0">
            <tr>
              <td background="images/main_dotline.gif" height="1"></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td height="25" align="center"><table width="100%" border="0" cellspacing="1"
                cellpadding="4">
            <tr align="center" bgcolor="#3F5786">
              <td height="25" colspan="3"><strong><font color="#FFFFFF">生成订单</font> </strong> </td>
            </tr>
            <tr>
              <td height="25">&nbsp;</td>
              <td width="50%" align="right"><strong> 订单号： </strong> </td>
              <td width="50%"><%=orderId%> </td>
            </tr>
            <tr>
              <td height="25">&nbsp;</td>
              <td height="20" align="right"><strong> 总价格： </strong> </td>
              <td><font color="#FF0000">￥<%=amount%> </font> </td>
            </tr>
          </table>
          <input type="hidden" name="version" value="<%=version%>">
          <input type="hidden" name="merchantId" value="<%=merchantId%>">
          <input type="hidden" name="merchantUrl" value="<%=merchantUrl%>">
          <input type="hidden" name="responseMode" value="<%=responseMode%>">
          <input type="hidden" name="orderId" value="<%=orderId%>">
          <input type="hidden" name="amount" value="<%=amount%>">
          <input type="hidden" name="currencyType" value="<%=currencyType%>">
          <input type="hidden" name="assuredPay" value="<%=assuredPay%>">
          <input type="hidden" name="time" value="<%=time%>">
          <input type="hidden" name="remark" value="<%=remark%>">
          <input type="hidden" name="mac" value="<%=mac%>">
          <input type="hidden" name="bankCode" value="<%=bankCode%>">
          <input type="hidden" name="b2b" value="<%=b2b%>">
          <%if(commodity!=null){%>
          <input type="hidden" name="commodity" value="<%=commodity%>">
          <%}%>
          <%if(orderUrl!=null){%>
          <input type="hidden" name="orderUrl" value="<%=orderUrl%>">
          <%}%>
          <input type="hidden" name="cardAssured" value="<%=cardAssured%>">
          <table width="80%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="25" colspan="3" align="center"
                    style="padding-bottom: 5px"><input type="button" onClick="toSubmit(this)"
                      value="通过银生支付">
              </td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td height="1" bgcolor="#D8D8D8"></td>
      </tr>
    </table>
    <br>
  </DIV>
</form>
</BODY>
</HTML>