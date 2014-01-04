<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>保障中心</title>
    <%@include file="/web/shopping/shophead.jsp"%>	
<!--<base href="http://www.315online.com.cn/">--><base href=".">
<link href="${pageContext.servletContext.contextPath }/web/shopping/00_files/common_law.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/web/shopping/00_files/simple_law.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/web/shopping/00_files/tablecloth.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
#apDiv1 {
position:absolute;
left:270px;
top:524px;
width:74px;
height:22px;
z-index:1;
}
-->
</style>
	</head>
		<!-- 头部 -->
		<%@include file="/web/shopping/shopTop.jsp"%>
<center>
<div class="rz_shuoming mt_5 w_1004" style="background:#086D2E url(images/uservolid_bg.jpg) repeat-y;overflow:hidden;width: 930px;">
<div class="f_l" style="clear:left;"><img src="${pageContext.servletContext.contextPath }/web/shopping/00_files/rzsm_1.gif" alt="" width="263" height="230"></div>
   <!--  <div class="rz_smr f_l w_667 h_400"> -->
    <div class="rz_smr f_l w_667">
    	<span class="f_l" style="clear:both"><img src="${pageContext.servletContext.contextPath }/web/shopping/00_files/rzsm_2.gif" alt=""></span>
   <div><img src="${pageContext.servletContext.contextPath }/web/shopping/00_files/rzsm_4.gif">
        ●如何看出此页面的真假?
        <img src="${pageContext.servletContext.contextPath }/web/shopping/00_files/rzsm_5.gif"></div>
    </div>
    <div class="rz_smfooter w_1001 h_62">
    	
    </div>
</div>  
    <!--关于保障中心 承诺开始-->
    <div class="rz_main2 w_1004 mt_5" style="width: 930px;">
    	<div class="about_bz w_227 h_288 b_b_1 f_l">
        <h1><img src="${pageContext.servletContext.contextPath }/web/shopping/00_files/abt_tt.gif" alt=""></h1>
        <div class="about_bzct w_202 h_229 b_c_1">
网上交易保障中心 是我国第一家全面保障网上交易的第三方服务平台， 它整合与网上交易有关的各个领域最权威的专业机构资源，形成从法律咨询、信用、安全、增值服务等各个角度强力支持电子商务的优势格局，化解交易者面临的各类风险和难题，使交易者得以安心专注于交易行为本身，实现“零风险”的网上交易。 
        </div>
    </div>
    
    <div class="chengnuo w_764 h_288 b_b_1 f_l ml_5" style="width: 693px;">
    <table>
    <tr>
    <td>
        <h1 class="f_l"><img src="${pageContext.servletContext.contextPath }/web/shopping/00_files/chengnuo_tt.gif" alt=""></h1>
      </td>
    </tr>
    <tr>
    <td> <div class="chengnuo_ct w_736 h_229 b_c_1" style="width: 690px;">
1、诚信守法经营，尊重知识产权，保护消费者合法权益；<br>
2、公平竞争，逐步完善和自觉维护良好的商业规则，建立诚信信息的公示和互动机制；<br>
3、网站客服邮箱7*24小时、网站人工客服及即时通讯在线客服至少5*8小时接受消费者投诉；网站工作时间的客户投诉响应时间不超过2小时、网站非工作时间的客户投诉响应时间不超过24小时；<br>
4、在网站首页显著位置设置投诉受理标识和“网上交易保障中心”标识；指定专人负责协调解决“网上交易保障中心”转来的客户投诉及相关事务；<br>
5、通过工商企业信息系统披露网站的经营主体的身份信息，便于消费者实时、在线查询，主动防范交易风险；<br>
6、注重保护用户隐私权和网站信息安全，鼓励使用电子签名等技术手段保障交易安全； <br>
7、诚信披露信息，规范营销推广行为，营造网上交易和谐环境。 
        </div>
        </td>
    </tr>
    </table>
    </div>
    <!--关于保障中心 承诺结束-->
</div>
<!--认证说明结束-->
<!--底部开始-->
<!--底部结束-->
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
