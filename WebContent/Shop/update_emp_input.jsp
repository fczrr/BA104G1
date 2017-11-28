<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>
<%
	ShopVO shopVO = (ShopVO) request.getAttribute("shopVO"); //EmpServlet.java (Concroller), 存入req的shopVO物件 (包括幫忙取出的shopVO, 也包括輸入資料錯誤時的shopVO物件)
%>
<html>
<head>
<link rel="stylesheet" href="css/addproduct.css">
<script src="js/addproduct.js"></script>
<title>員工資料修改 - update_emp_input.jsp</title></head>

<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='500' align='center'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
	<h3 >商城商品修改:</h3>
		<a href="mainpage.jsp">回首頁</a><br>
		<a href="javascript:history.go(-1);">回上一頁</a>
		</td>
		
		
		
	</tr>
</table>

<h3 align='center'>資料修改:update_emp_input.jsp</h3>
	<table align='center'>
		<c:if test="${not empty errorMsgs}">
			<tr align='center'>
				<td><font color='red'>請修正以下錯誤:
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li></td>
			</tr>
			</c:forEach>
			</ul>
			</font>
		</c:if>
	</table>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pro.do" name="form1" align='center'>
<table border="0" align='center'>
	<tr>
		<td>商品編號：<font color=red><b>*</b></font></td>
		<td><%=shopVO.getITEMNO()%></td>
	</tr>
	<tr>
		<td>商品名稱：</td>
		<td><input type="text" name="NAME" size="20" value="<%=shopVO.getNAME()%>" /></td>
	</tr>
	<tr>
		<td>庫存數量：</td>
		<td><input type="text" name="STOCK" size="20"	value="<%=shopVO.getSTOCK()%>" /></td>
	</tr>
	<tr>
		<td>商品價格：</td>
		  <td><input type="text" name="PRICE" size="20" value="<%=shopVO.getPRICE()%>"></td>
		</td>
	</tr>
	<tr>
		<td>商品描述：</td>
		<td><input type="text" name="DES" size="20" value="<%=shopVO.getDES()%>"></td>
	</tr>
<!--noneed-->
<jsp:useBean id="empSvc" scope="page" class="com.shop.model.ShopService" />
	<tr>
		<td>商品類別:<font color=red><b>*</b></font></td>
		<td><select size="1" name="CLASSNO">
			
				<option value="${shopVO.CLASSNO}">${shopVO.CLASSNO}
	
		</select></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="ITEMNO" value="<%=shopVO.getITEMNO()%>">
<input type="submit" value="送出修改"></FORM>

	

</body>
</html>
