<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.detail.promotion.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>addpromotion.jsp</title>
</head>
<body  style="background-size: cover;">
	<h3 align="center">促銷商品新增</h3>
		<DIV>		
		<c:if test="${not empty errorMsgs}">
					<c:forEach var="message" items="${errorMsgs}">
						${message}<br>
					</c:forEach>

			</font>
		</c:if></DIV>


			<div>
				<a
					href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${proVOproject.ITEMNO}&PRO=0"><img
					class="img-responsive" img
					src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=${proVOproject.ITEMNO}"
					style="height: 188px; width: 188px; margin-right: auto; margin-left: auto;"
					title="##"></a>
			</div>

	<style type="text/css">

img {
	display: hidden height:400px;
	width: 200px;
}

input {
	zoom: 1;
	font-size: 10px;
	color: deeppink
}
td, h3 {
	zoom: 2;
	font-size: 15px;
	color: blue;
}
body > div > div > div.right_col > div > div.row > div > div > 
div.x_content > div:nth-child(1) > table > tbody > tr:nth-child(1) 
> td:nth-child(1){
WIDTH: 130PX;
}
</style>
		<table align="center">
		<tr>
			<td>
			商品介紹：
			</td>
			<td>
			<div>${proVOproject.DES}</div>
			
			</td>
			
		
		</tr>
		<tr>
			<td>促銷專案名稱：</td>

			<td><select>
					<option value="${proVOproject.ACTIVITYNAME}">${proVOproject.ACTIVITYNAME}
			</select></td>
		</tr>
		<form id="submit" action="<%=request.getContextPath()%>/pro.do"
			method=post>
			<tr>
				<td>原始價錢：<font color=red><b>*</b></font></td>
				<td>${proVOproject.PRICE}</td>
			</tr>
			<tr>
				<td>促銷價格：</td>
				<td><input type="text" style="width:60px" name="NEWPRICE" value="${proVOproject.PRICE}"></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="hidden" name="action" value="addtopromotion">
					<input type="hidden" name="DES"value="${proVOproject.DES}"> 
					<input type="hidden" name="ITEMNO"value="${proVOproject.ITEMNO}"> 
					<input type="hidden" name="PROMOTIOMNO"value="${proVOproject.PROMOTIOMNO}"> 
					<input type="hidden"name="PRICE" value="${proVOproject.PRICE}"> 
					<input class="btn btn-sm btn-info" type="submit" value="加入促銷"></form>
					<button class="btn btn-sm btn-warning" onclick="history.back()">取消</button>
					</td>
					
					
			</tr></table>
	

</body>
</html>