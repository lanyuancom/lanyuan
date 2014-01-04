<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
		<c:forEach var="top" items="${brandList}">
		<c:if test="${top.parentId eq 0}">
		<table width="180" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td style="background-image: url('images/zuo.png'); color: white; font-weight: 800;padding-left: 40px;"
					height="30">${top.productBrandName}
				</td>
			</tr>
			<tr>
				<td
					style="background-image: url('images/zuobg.jpg'); background-repeat: repeat-y;">
					<table width="180" border="0" cellpadding="0" cellspacing="0" >
						<tr>
						<c:forEach items="${brandList }" var="key" varStatus="status">
						<c:if test="${top.productBrandId eq key.parentId}">
						<c:if test="${status.index%3==0}">
						<tr>
						</c:if>
							<td height="30"align="center" width="59"class='shou'>
								<A href="productBrandList.html?productBrandId=${key.productBrandId }">
								${key.productBrandName }
								</A>
							</td>
						<c:if test="${status.index%3==2}">
						<tr>
						</c:if>
						</c:if>
						</c:forEach>
						</tr>
					</table>
					<img alt="" src="images/bg00.gif" width="180" height="3">
				</td>
			</tr>
		</table>
		</c:if>
		</c:forEach>