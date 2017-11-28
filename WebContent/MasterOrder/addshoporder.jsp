<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>

<html>
<head>
<link rel="stylesheet" href="css/addproduct.css">
<script src="js/addproduct.js"></script>
<title>新增訂單 - addshoporder.jsp</title></head>

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

<h3 align='center'>資料修改:addshoporder.jsp</h3>
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

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order.do"  align='center'>
<table border="0" align='center'>
			<tr>
				<td>會員ID：<font color=red><b>*</b></font></td>
				<td><input type="text" name="MEMNO" size="20" value="MEM0001"></td>
			</tr>
						<tr>
				<td>商品號碼：<font color=red><b>*</b></font></td>
				<td><input type="text" name="ITEMNO" size="20" value="1"></td>
			</tr>
									<tr>
				<td>購買數量：<font color=red><b>*</b></font></td>
				<td><input type="text" name="ORDERCOUNT" size="20" value="5"></td>
			</tr>
			<tr>
				<td>送貨地址：</td>
				<td><textarea rows="4" cols="35" name="ADDRESS"></textarea></td>
			</tr>
			<td>用戶人手機：</td>
			<td><input type="text" name="PHONE" size="20" value="" /></td>
			</tr>
			<tr>
				<td>會員姓名：</td>
				<td><input type="text" name="NAME" size="20" value=""></td>
				</td>
			</tr>


		</table>
<br>
<input type="hidden" name="action" value="addshoporder">
<input type="submit" value="確認訂單"></FORM>

	

</body>
</html>
