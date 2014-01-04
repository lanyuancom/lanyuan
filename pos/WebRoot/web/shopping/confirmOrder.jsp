<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ page import="com.vnv.bank.common.util.MD5"%>
<%@ page import="com.vnv.bank.common.util.DateUtil"%>
<%@ page import="com.lanyuan.entity.ShoppingCar"%>
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
    if(merchantUrl==null||merchantUrl.length()==0) merchantUrl = "http://localhost:8888/pospos/submitOrder.html";  //商户反馈url
    String responseMode = request.getParameter("responseMode");
    if(responseMode==null) responseMode = "1";     //响应方式，1-页面响应，2-后台响应，3-两者都需
    String assuredPay = request.getParameter("assuredPay");       //是否担保支付
    if(assuredPay==null) assuredPay = "";
    String cardAssured = request.getParameter("cardAssured");
    if(cardAssured==null) cardAssured = "0";
    
    //订单的生成 
    String time = DateUtil.date2String(new Date(), "yyyyMMddHHmmss");  //订单创建时间
    String orderId = "GD" + request.getSession().getAttribute("code");//订单id[商户网站]
    String currencyType = "CNY";        //货币种类，暂时只支持人民币：CNY
    //#########################       ######################3
    ShoppingCar shoppingCar = (ShoppingCar) request.getSession().getAttribute("shoppingCar");
    
    String amount = shoppingCar.getTotalSellPrice()+"";
    if(amount=="") amount = "0.1";  //支付金额
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
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<html>
	<head>
		<%@include file="/web/shopping/shophead.jsp"%>
		<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery_1_7_2_min.js"></script>
	</head>
	<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="20">
		<center>

			<%@include file="/web/shopping/shopTop.jsp"%>

			<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
				<TBODY>
					<TR>
						<TD>
							<IMG height=48 src="order/gouwuche/800buy_car_step.gif" width=160>
						</TD>
						<TD background=order/gouwuche/800buy_car_bg.gif>
							<IMG height=48 src="order/gouwuche/800buy_car_step1.gif"
								width=153>
						</TD>
						<TD background=order/gouwuche/800buy_car_bg.gif>
							<IMG height=48 src="order/gouwuche/800buy_car_step2.gif"
								width=153>
						</TD>
						<TD background=order/gouwuche/800buy_car_bg.gif>
							<IMG height=48 src="order/gouwuche/800buy_car_step3.gif"
								width=154>
						</TD>
						<TD>
							<IMG height=48 src="order/gouwuche/800buy_car_step4.gif"
								width=108>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
				<TBODY>
					<TR>
						<TD height="50" align="left" valign="top">
							<IMG height=40 src="order/gouwuche/800buy_car_gouwu.gif"
								width=260>
						</TD>
						<td align="right" style="font-size: 16">总计：
											<SPAN class=zk_cont><font
												color=red>￥<b>${shoppingCar.totalSellPrice}</b> </font> </SPAN></td>
					</TR>
				</TBODY>
			</TABLE>

			<TABLE cellSpacing=1 cellPadding=0 width=768 bgColor=#999999 border=0>
				<TBODY>
					<TR align=middle bgColor=#f0f0f0>
						<TD height="25">
							商品名称
						</TD>
						<TD width=80>
							市场价
						</TD>
						<TD width=80>
							优惠价
						</TD>
						<TD width=80>
							会员价
						</TD>
						<TD width=80>
							数量
						</TD>
						<TD width=100>
							获得积分
						</TD>
						<TD width=100>
							小计
						</TD>
					</TR>
				 <c:forEach items="${shoppingCar.items }" var="key" >
					<TR align=middle>
						<TD height="20" bgColor=#ffffff>
							<a href='shopInfo.html?productId=${key.product.productId}' target="_blank">${key.product.productName}</a>
						</TD>
						<TD class="shich_cont" bgColor=#ffffff>
							￥${key.product.price + 30  }
						</TD>
						<TD class=zk_cont bgColor=#ffffff>
							<font color="#FF0000">￥${key.product.price  }</font>
						</TD>
						<TD bgColor=#ffffff>
							<font color="#FF0000">￥<b>${key.product.price  } </b> </font>
						</TD>
						<!--<td bgcolor="#FFFFFF" class="zk_cont"><font color="#A72B31">￥</font></td>-->
						<TD bgColor=#ffffff>
							${key.amount }
						</TD>
						<TD class=zk_cont bgColor=#ffffff>
							1
						</TD>
						<TD class=zk_cont bgColor=#ffffff>
							<font color="#FF0000">￥${key.product.price * key.amount}</font>
						</TD>
					</TR>
					</c:forEach>
				</TBODY>
			</TABLE>
			<TABLE width=768 height="50" border=0 align=center cellPadding=0
				cellSpacing=0>
				<TBODY>
					<TR>
						<TD width=300>
							<TABLE height=50 cellSpacing=0 cellPadding=0 width="100%"
								border=0>
								<TBODY>
									<TR>
										<TD width=280>
											购物款总计(优惠价)：
											<SPAN class=zk_cont><FONT color=#ff0000>￥</FONT><font
												color=red><b>${shoppingCar.totalSellPrice}</b> </font> </SPAN>
										</TD>
										<TD width=150>
											节省：
											<SPAN class=zk_cont><FONT color=#a72b31>￥</FONT><font
												color="#A72B31">${fn:length(shoppingCar.items)*30}</font> </SPAN>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
						<TD width=150>
							共获得积分：
							<font color="#FF0000">10</font>
						</TD>
						<TD width=60>
							您还可以：
						</TD>
						<TD>
							<a href="shoppingCar.html"> <IMG style="CURSOR: hand"
									height=32 src="order/gouwuche/800buy_car_botton1.gif" width=73
									border=0> </a>
						</TD>
					</TR>
				</TBODY>
			</TABLE>

<script type="text/javascript">
function sub(){
var list=document.getElementById('bb').getElementsByTagName('input');

for( var i=0;i<list.length;i++)
{
	 
	if(list[i].value == ""){
		alert("送货信息栏中存在一个为  空 ! ");
		return false ;

	}
	
	
}
 document.frm.submit();
}
function updatefrom(){
var u = document.getElementById('upd').value;
var list=document.getElementById('bb').getElementsByTagName('input');
	if("0"==u){
	document.getElementById('ims').innerHTML='<img style="cursor: pointer;" height="32" src="order/gouwuche/800buy_car_save.gif" width="73" border="0" onclick="updatefrom();">';
	
	    for( var i=0;i<list.length;i++)
		{
			//list[i].style["background"]="#9D9D9D";//
			list[i].disabled=false;
		}
		document.getElementById('userAddress').disabled=false;
		document.getElementById('upd').value="1";
	}else if("1"==u){
	document.getElementById('ims').innerHTML='<img style="cursor: pointer;" height="32" src="order/gouwuche/800buy_car_info.gif" width="73" border="0" onclick="updatefrom();">';
	  var formdata = $('#submitOrder').serialize();
	   $.ajax({
                url: "updateUser.html?_k="+new Date(),
                data:formdata,
                type: "POST",
                dataType:'json',
                success: function(data) {
               		if(data.messages=="true"){
               			alert("修改信息成功！");
               		}else{
               			alert("修改失败！！");
               		}
                }

            });
             for( var i=0;i<list.length;i++)
		{
			//list[i].style["background"]="#9D9D9D";//
			list[i].disabled=true;
		}
		document.getElementById('userAddress').disabled=true;
	  document.getElementById('upd').value="0";
	}

}
</script>
<form name="frm" method="post" target="_blank"
      action="<%=requestUrl%>">
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
</form>
			<form id="submitOrder" name="submitOrder" action="" method=post>
				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR bgcolor="#d1d2d3">
							<TD colSpan=4 height=10></TD>
						</TR>
						<TR>
							<TD width=10 bgColor=#d1d2d3></TD>
							<TD>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
									<TBODY>
										<TR>
											<TD vAlign=top width=20>
												<IMG height=48 src="order/gouwuche/800buy_car_arrow.gif"
													width=20/>
											</TD>
											<TD vAlign=top>
												<TABLE id="bb" cellSpacing=0 cellPadding=0 width="100%" border=0>
													<TBODY>
														<TR>
															<TD>
																<IMG height=31
																	src="order/gouwuche/800buy_car_songhuo.gif" width=242>
															</TD>
															<td id="ims">				<img style="cursor: pointer;" height="32" src="order/gouwuche/800buy_car_info.gif" width="73" border="0" onclick="updatefrom();">
															</td>
														</TR>
														<TR>
															<TD>
																<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
																	<TBODY>
																		<TR>
																			<TD>
																				<TABLE height=25 cellSpacing=0 cellPadding=0
																					width="100%" border=0>
																					<TBODY>
																					<tr>
																					<td colspan="10" align="center" style="padding: 10px;">
																						<span style="font-size: 14px;color: blue;font-weight: 800;">此　订　单　编　号　为：</span>
																						<span style="font-size: 14px;color: red;font-weight: 800;">${code}</span>
																					</td>
																					</tr>
																						<TR>
																							<TD width=75>
																								收货人姓名：
																							</TD>
																							<TD width=90>
																							<input id="upd" type="hidden" value="0">
																							<input name="orderId" type="hidden" value="${code}">
																							<input name="userId" type="hidden" value="${webUser.userId}">
																								<input class=buttonface type="text" maxlength=16 size="8" name="userRealname" value="${webUser.userRealname}" disabled="disabled">
																							</TD>
																							<TD width=50>
																								性别：
																							</TD>
																							<TD width=100>
																								
																								<input type="radio" name="userSex" value="男" <c:if test="${webUser.userSex eq '男'}">checked="checked" </c:if>>
																								男
																								<input type="radio" name="userSex" value="女" <c:if test="${webUser.userSex eq '女'}">checked="checked" </c:if>>
																								女
																							</TD>
																							<td> </td><td> </td>
																						</TR>
																					</TBODY>
																				</TABLE>
																			</TD>
																		</TR>

																		<TR>
																			<TD>
																				<TABLE cellSpacing=0 cellPadding=0 width="100%"
																					border=0>
																					<TBODY>
																						<TR>
																							<TD width=75>
																								收货人地址：
																							</TD>
																							<TD colSpan=10>
																								<TEXTAREA id="userAddress" name="userAddress" rows=4
																									wrap=off cols=50 disabled="disabled">${webUser.userAddress}</TEXTAREA>
																								<FONT color=#9d282f>(地址限50字以内)</FONT>
																							</TD>
																						</TR>
																					</TBODY>
																				</TABLE>
																			</TD>
																		</TR>
																		<TR>
																			<TD>
																				<TABLE height=25 cellSpacing=0 cellPadding=0
																					width="100%" border=0>
																					<TBODY>
																						<TR>
																							<TD width=45>
																								&nbsp;邮编：
																							</TD>
																							<TD width=60>
																								<input type="text" name="userAddressNum" size="8"
																									maxlength=6 value="2351252" disabled="disabled">
																							</TD>
																							<TD width=40>
																								手机：
																							</TD>
																							<script type="text/javascript">
																							function check(obj) {
																					        if(!/^[0-9]+$/.test(obj.value)){ 
																					              alert( "你的手机号非法！！ ") 
																					              obj.focus(); 
																					        } 
																							}
																							</script>
																							
																							
																							<TD width=100>
																								<input type="text" name="userPhone" size="10"
																									maxlength=15 value="${webUser.userPhone}"onchange= "check(this); " disabled="disabled">
																							</TD>

																							<TD width=60>
																								E-Mail：
																							</TD>

																							<TD width=100>
																								<input type="text" name="userMail" size="15"
																									maxlength=100 value="${webUser.userMail}" disabled="disabled">
																							</TD>

																						</TR>
																						<TR>
																							
																							<TD width=25>
																								<input type="radio" name="ifbenren" value="1" checked="checked">
																							</TD>
																							<TD width=50>
																								本人提货
																							</TD>
																							<TD width=25>
																								<input type="radio" name="ifbenren" value="2">
																							</TD>
																							<TD colspan="5">
																								为他人定购
																							</TD>
																						</TR>
																					</TBODY>
																				</TABLE>
																			</TD>
																		</TR>
																	</TBODY>
																</TABLE>
															</TD>
														</TR>
													</TBODY>
												</TABLE>
										</TR>
										<TR>
											<TD bgColor=#d1d2d3 colSpan=4 height=10></TD>
										</TR>
								</TABLE>
								<TD width=10 bgColor=#d1d2d3></TD>
						</tr>
				</table>
				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR>
							<TD height=10></TD>
						</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR bgColor=#d1d2d3>
							<TD colSpan=3 height=6></TD>
						</TR>
						<TR>
							<TD width=6 bgColor=#d1d2d3></TD>
							<TD>
								<TABLE height=25 cellSpacing=0 cellPadding=0 width="100%"
									border=0>
									<TBODY>
										<TR>
											<TD align=middle width=150>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贺卡留言或要求：
											</TD>
											<TD width=300>
												<textarea name="Notes" cols="45" rows="3"></textarea>
											</TD>
											<TD>
												&nbsp;&nbsp;(60字内)
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
							<TD width=6 bgColor=#d1d2d3></TD>
						</TR>
						<TR bgColor=#d1d2d3>
							<TD colSpan=3 height=6></TD>
						</TR>
						<TR>
							<TD width=6 bgColor=#d1d2d3></TD>
							<TD>
								<TABLE height=25 cellSpacing=0 cellPadding=0 width="100%"
									border=0>
									<TBODY>
										<TR>
											<TD>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<FONT color=red>精美包装盒，</FONT><font color="#FF0000">让您的礼物更神秘、漂亮。</font>（注：工作人员会根据礼物大小选择包装盒。外形超大的礼物，不支持本服务）
											</TD>
											<TD></TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
							<TD width=6 bgColor=#d1d2d3></TD>
						</TR>
						<TR bgColor=#d1d2d3>
							<TD colSpan=3 height=6></TD>
						</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR>
							<TD height=10></TD>
						</TR>
					</TBODY>
				</TABLE>

				<TABLE cellSpacing=0 cellPadding=0 width=768 align=center border=0>
					<TBODY>
						<TR bgColor=#d1d2d3>
							<TD colSpan=3 height=10></TD>
						</TR>
						<TR>
							<TD width=10 bgColor=#d1d2d3></TD>
							<TD>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
									<TBODY>
										<TR>
											<TD vAlign=top width=20>
												<IMG height=48 src="order/gouwuche/800buy_car_arrow.gif"
													width=20>
											</TD>
											<TD vAlign=top>
												<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
													<TBODY>
														<TR>
															<TD>
																<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
																	<TBODY>
																		<TR>
																			<TD width=128>
																				<IMG height=30
																					src="order/gouwuche/800buy_car_shfs.gif" width=128>
																			</TD>
																			<TD align=right>
																				<IMG height=29
																					src="order/gouwuche/800buy_car_shfs1.gif" width=111>
																			</TD>
																		</TR>
																	</TBODY>
																</TABLE>
															</TD>
														</TR>
														<TR>
															<TD height="30" align="left">
																购物满2000元免邮费
															</TD>
														</TR>
														<TR>
															<TD align="left">
																<tr bgcolor='#FFFFFF'>
																	<td>
																		<input type='radio' name='peisong' value='0.0' checked="checked">
																		货到付款，配送费用：0.0元||
																		<input type='radio' name='peisong' value='5'>
																		普通邮寄，配送费用：5.0元||
																		<input type='radio' name='peisong' value='15'>
																		特快专递，配送费用：15.0元||
																		<input type='radio' name='peisong' value='15'>
																		申通快运，配送费用：15.0元
																	</TD>
																</TR>
																<tr>
																	<td height="20"></td>
																</tr>
													</TBODY>
												</TABLE>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
							<TD width=10 bgColor=#d1d2d3></TD>
						</TR>
						<TR bgColor=#d1d2d3>
							<TD colSpan=3 height=10>
							
							</TD>
						</TR>
					</TBODY>
				</TABLE>

				<div align="center" style="padding: 10px;">
				<img height=42 width=105 src="images/car_botton2.gif" style="cursor: pointer;" onclick="return sub();">
				</div>
			</form>

			<TABLE cellSpacing=0 cellPadding=0 width=932 align=center border=0>
				<TBODY>
					<TR>
						<TD>
							<TABLE cellSpacing=0 cellPadding=0 width=100% align=center
								bgColor=#ffffff border=0>
								<TBODY>
									<hr size="1" color="#B2D800" width=99.4%>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD>
							<%@include file="/web/shopping/shoppingbotton.jsp"%>
						</TD>
					</TR>
				</TBODY>
			</TABLE>

		</center>
	</body>
</html>
