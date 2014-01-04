<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>退货，退款说明</title>
    
	 
    <title>支付方式</title>
 
	<%@include file="/web/shopping/shophead.jsp"%>	

  </head>
  
  <body>
  <%@include file="/web/shopping/shopTop.jsp"%>
  <center>
   <div class="sub_con" style="width: 930px;">
            <div class="sub_con_tit">退换货政策</div>
            <div class="sub_con_box" style="text-align: left;">
                <p style="line-height: 22px; color: rgb(102,102,102); font-size: 12px"><strong>退换货规则</strong><br>
<br>
梦芭莎无风险购物,我们承诺自客户收到商品之日起30天内（<span style="color: rgb(255, 0, 0);">名品特卖的商品自收到之日起7天内</span>）,如对商品有任何不满意,只要商品未经使用,配饰、标签、赠品齐全,我们将提供无条件退换货服务。<br>
以下情况不予办理退换货：<br>
1.已水洗或使用的商品；<br>
2. 缺少随商品附带的赠品、发票；<br>
3. 非商品自身质量问题的赠品；<br>
4. 非质量问题的胸垫及内裤等个人贴身卫生用品；<br>
5. 因非正常使用及保管导致出现质量问题的商品；<br>
<br>
<strong>化妆品退换货：</strong><br>
1.我们保证商品的正规进货渠道和质量，非商品质量或保质期问题（已过期或2个月即将过期）一旦签收不予退换货。如在使用过程中对商品质量表示置疑，请出具国家质量检测报告，我们会按照国家法律规定予以处理。 <br>
2.因个人喜好(气味，色泽、型号，外观)和个人肤质不同要求的退换货将无法受理。 <br>
3.如您验收商品时发现包装箱破损，且包裹内的商品存在破损、短缺、错误或表面质量问题等，请现场拒收包裹或在快递在时致电客服处理。一经签收，我们将无法鉴定原因，不予办理退换货。<br>
<br>
<span style="color: #3c3c3c"><span style="color: #ff0000">温馨提醒：为了保障您的退货准确、快速的处理，一个包裹仅限寄回一张退货服务单的商品。如您有两张订单分别办理了退货，自行寄回时请您分两个包裹寄。<br>
</span><br>
<strong>各产品退换货政策如下：</strong> </span></p>
<table cellspacing="1" cellpadding="1" border="1" style="width: 672px; height: 432px">
    <tbody>
        <tr>
            <td nowrap="nowrap" bgcolor="#cccccc">
            <p style="text-align: center">品类</p>
            </td>
            <td nowrap="nowrap" bgcolor="#cccccc">
            <p>是否可以<br>
            试穿/试用</p>
            </td>
            <td nowrap="nowrap" bgcolor="#cccccc">退换货时限</td>
            <td nowrap="nowrap" bgcolor="#cccccc" style="text-align: center">签收注意事项</td>
            <td nowrap="nowrap" bgcolor="#cccccc" style="text-align: center">退货注意事项</td>
        </tr>
        <tr>
            <td style="text-align: center">服装、文胸</td>
            <td style="text-align: center">是</td>
            <td align="center">30日内</td>
            <td rowspan="3">&nbsp;1、包装完好<br>
            &nbsp;2、与订购商品一致</td>
            <td rowspan="3">&nbsp;1、退货时请保证包装、吊牌完好<br>
            &nbsp;2、如有发票请一并退回</td>
        </tr>
        <tr>
            <td style="text-align: center">鞋</td>
            <td style="text-align: center">是</td>
            <td align="center">30日内</td>
        </tr>
        <tr>
            <td style="text-align: center">配饰</td>
            <td style="text-align: center">是</td>
            <td align="center">30日内</td>
        </tr>
        <tr>
            <td style="text-align: center">婚纱、礼服</td>
            <td style="text-align: center">是</td>
            <td align="center">2日内</td>
            <td>&nbsp;1、包装完好<br>
            &nbsp;2、与订购商品一致<br>
            &nbsp;3、商品无破损<br>
            &nbsp;4、掉钻、勾纱、污渍、礼盒有损坏</td>
            <td>&nbsp;1、退货时请保证包装、吊牌完好<br>
            &nbsp;2、如有发票请一并退回<br>
            &nbsp;3、商品无破损<br>
            &nbsp;4、无掉钻、勾纱、污渍、礼盒无损坏<br>
            &nbsp;5、如需退货在收到包裹24小时内与客服联系</td>
        </tr>
        <tr>
            <td rowspan="3" style="text-align: center">化妆品</td>
            <td style="text-align: center;" rowspan="3">否</td>
            <td style="text-align: center;" rowspan="3">30天内</td>
            <td rowspan="4">1、包装完好             &nbsp;<br>
            2、商品无破损             &nbsp;<br>
            3、商品在有效期内             &nbsp;<br>
            4、与订购商品一致</td>
            <td rowspan="3">&nbsp;1、签收后，非质量问题不予退换(化妆品无塑封裸装产品在您签收后将不再退货)<br>
            &nbsp;2、特殊问题办理退货时需提供质量问题鉴定报告</td>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
            <td nowrap="nowrap" style="text-align: center">乳贴、丝袜内裤<br>
            等个人卫生用品</td>
            <td style="text-align: center;">否</td>
            <td style="text-align: center;">不支持</td>
            <td style="text-align: center">签收后，非质量问题不予退换货</td>
        </tr>
    </tbody>
</table>
<p style="line-height: 22px; color: rgb(102,102,102); font-size: 12px"><br>
&nbsp;</p>
                <!--相关帮助-->
                <!--相关帮助结束-->
                    <!--问题解决否-->
                    <!--问题解决否结束-->
            </div>
        </div>
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
