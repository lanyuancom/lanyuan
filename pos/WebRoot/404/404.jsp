<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE> 出错信息提示</TITLE>
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<STYLE type=text/css>
.BODY {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体
}
P {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体
}
TD {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体
}
TH {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体
}
BODY {
	SCROLLBAR-FACE-COLOR: #eeeeee;  SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #dee3e7; SCROLLBAR-3DLIGHT-COLOR: #d1d7dc; SCROLLBAR-ARROW-COLOR: #000000; SCROLLBAR-TRACK-COLOR: #ededed; SCROLLBAR-DARKSHADOW-COLOR: #808080; BACKGROUND-COLOR: #ffffff
}
INPUT {
	BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 1px; PADDING-LEFT: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #c0c0c0; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0c0c0; PADDING-BOTTOM: 1px; CURSOR: hand; COLOR: #000000; BORDER-TOP-COLOR: #c0c0c0; PADDING-TOP: 1px; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体; HEIGHT: 18px; BACKGROUND-COLOR: #ffffff; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0c0c0
}
TEXTAREA {
	BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #c0c0c0; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0c0c0; CURSOR: hand; COLOR: #000000; BORDER-TOP-COLOR: #c0c0c0; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体; BACKGROUND-COLOR: #ffffff; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0c0c0
}
SELECT {
	BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #c0c0c0; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0c0c0; CURSOR: hand; COLOR: #000000; BORDER-TOP-COLOR: #c0c0c0; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体; BACKGROUND-COLOR: #ffffff; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0c0c0
}
.bg {
	BACKGROUND-COLOR: #ffffff
}
.bg_td {
	BACKGROUND-COLOR: #f7f7f7
}
.bg_tds {
	BACKGROUND-COLOR: #eeeeee
}
.bg_table {
	BACKGROUND-COLOR: #ffffff
}
.bg_frame {
	BACKGROUND-COLOR: #00659c
}
.tablew {
	WIDTH: 98%
}
.table {
	BORDER-RIGHT: 1px; BORDER-TOP: 1px; BORDER-LEFT: 1px; WIDTH: 98%; BORDER-BOTTOM: 1px; BACKGROUND-COLOR: #ffffff
}
.tims {
	FONT-SIZE: 7pt; COLOR: #808080; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
.htd {
	LINE-HEIGHT: 150%
}
.btd {
	FONT-WEIGHT: bold
}
.bw {
	WORD-WRAP: break-word
}
.tf {
	TABLE-LAYOUT: fixed
}
.gray {
	COLOR: #808080
}
.red {
	COLOR: #ff0000
}
.red2 {
	COLOR: #cc3300
}
.blue {
	COLOR: #0066cc
}
.ftd {
	COLOR: #ffffff
}
.fbg {
	COLOR: #ffffff
}
.div_alt {
	BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: black 1px solid; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; MARGIN-LEFT: 18px; BORDER-LEFT: black 1px solid; WIDTH: 240px; COLOR: #000000; PADDING-TOP: 2px; BORDER-BOTTOM: black 1px solid; BACKGROUND-COLOR: #ffffe1
}
A {
	COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #ff0000; TEXT-DECORATION: underline
}
A.h_menu {
	COLOR: #333333; TEXT-DECORATION: none
}
A.h_menu:hover {
	COLOR: #ff0000; TEXT-DECORATION: underline
}
</STYLE>

<META content="MSHTML 6.00.2900.2180" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0><A name=top></A>
<CENTER>
<DIV id=page>
<TABLE cellSpacing=0 cellPadding=0 width=980 align=center border=0>
  <TBODY>
  <TR>
    <TD align=middle>&nbsp;</TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="80%" border=0>
  <TBODY>
  <TR>
    <TD><IMG src="${pageContext.servletContext.contextPath }/404/1.gif" width="17" height="18"></TD>
    <TD width="100%" 
    background="${pageContext.servletContext.contextPath }/404/3.gif"></TD>
    <TD><IMG 
src="${pageContext.servletContext.contextPath }/404/2.gif" width="17" height="18"></TD>
  </TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="80%" border=0>
  <TBODY>
  <TR>
    <TD width=7 
background="${pageContext.servletContext.contextPath }/404/left.gif"></TD>
    <TD class=bg align=middle width=*>
      <TABLE cellSpacing=0 cellPadding=0 width="98%" align=center border=0>
        <TBODY>
        <TR>
          <TD align=left width="80%" 
            height=30>&nbsp;您现在位于：&nbsp;http://<script Language="JavaScript">
<!--
        url = location.hostname;
        document.write(url);
//-->
</script><script Language="JavaScript">
<!--
        url = location.pathname;
        document.write(url);
//-->
</script></TD>
          <TD align=right width="20%">
           </TD></TR></TBODY></TABLE></TD>
    <TD width=7 
    background="${pageContext.servletContext.contextPath }/404/right.gif"></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="80%" border=0>
  <TBODY>
  <TR>
    <TD width=7 
background="${pageContext.servletContext.contextPath }/404/left.gif"></TD>
    <TD class=bg align=middle width=*>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD class=bg_1 align=middle height=300>
            <TABLE cellSpacing=0 cellPadding=0 width=590 border=0>
              <TBODY>
              <TR>
                <TD align=right><IMG 
                  src="${pageContext.servletContext.contextPath }/404/center_error.gif" width="450" height="32" 
                  border=0></TD>
              </TR>
              <TR>
                <TD align=middle height=380>
                  <TABLE cellSpacing=0 cellPadding=0 width=534 border=0>
                    <TBODY>
                    <TR>
                      <TD colSpan=3><IMG height=42 
                        src="${pageContext.servletContext.contextPath }/404/error_r1_c1.gif" 
                        width=534 border=0></TD>
                      <TD></TD></TR>
                    <TR>
                      <TD rowSpan=2><IMG height=239 
                        src="${pageContext.servletContext.contextPath }/404/error_r2_c1.gif" 
                        width=43 border=0></TD>
                      <TD class=htd align=middle width=479 bgColor=#f7f7f7 
                      height=228>
                        <P><FONT 
                        class=red size="5"><b>您的访问的页面可能被删除或不存在。</b></FONT><BR><BR><font color="blue" size="3">你的IP已经记录，请勿进行非法操作！！</font><BR><BR><BR>
                        <P>蓝缘欢迎你.........</P></TD>
                      <TD rowSpan=2><IMG height=239 
                        src="${pageContext.servletContext.contextPath }/404/error_r2_c3.gif" 
                        width=12 border=0></TD>
                      <TD></TD></TR>
                    <TR>
                      <TD><IMG height=11 
                        src="${pageContext.servletContext.contextPath }/404/error_r3_c2.gif" 
                        width=479 border=0></TD>
                      <TD></TD></TR></TBODY></TABLE><BR></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
    <TD width=7 
    background="${pageContext.servletContext.contextPath }/404/right.gif"></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="80%" border=0>
  <TBODY>
  <TR>
    <TD class=bg align=middle width=*>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD><IMG src="${pageContext.servletContext.contextPath }/404/4.gif" width="17" height="18"></TD>
          <TD width="100%" 
          background="${pageContext.servletContext.contextPath }/404/6.gif"></TD>
          <TD><IMG 
        src="${pageContext.servletContext.contextPath }/404/5.gif" width="17" height="18"></TD>
        </TR></TBODY></TABLE><BR>
      <DIV></DIV></TD></TR></TBODY></TABLE>
<CENTER></CENTER></DIV></CENTER></BODY></HTML>
