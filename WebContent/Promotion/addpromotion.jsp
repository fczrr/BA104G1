<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.detail.promotion.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/CalendarStyles.css" />
<script src="<%=request.getContextPath()%>/js/addproduct.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/Ecalendar.jquery.min.js"></script>

<title>addpromotion.jsp</title>
</head>
<body background="<%=request.getContextPath()%>/images/sale.jpg" style="background-size: cover;">
	<h3 align="center">促銷專案新增</h3>


		<c:if test="${not empty errorMsgs}">
			<font color='red'>請修正以下錯誤:<br>

					<c:forEach var="message" items="${errorMsgs}">
						${message}<br>
					</c:forEach>

			</font>
		</c:if>

	<form id="submit" action="<%=request.getContextPath()%>/pro.do" method=post >
		<table align="center">

			<tr>
				<td>促銷專案名稱：</td>
				<td><input type="text" name="NAME" size="20"></td>
			</tr>
			
			<tr>
			<td>活動開始日期：</td>
			<td>	
				<div class="calendarWarp">
					<input type="text" name="BEGINDATE" size="20"  class="ECalendar" id="ECalendar_case1"></td>
				</div>
			</td>
			</tr>
			<tr>
				<td>促銷開始日期：</td>
				<td>
					<div class="calendarWarp">
						<input type="text" name="ENDDATE" size="20"  class="ECalendar" id="ECalendar_case2"></td>
				</div>
				</td>
			</tr>

			
			<tr>
			<td><input type="hidden" name="action" value="addpromotion"></td>
			<td><input type="submit" value="新增促銷專案"></td>
				<br>
			</tr>
		</table>
	</form>
	
	<div align="center" class="foot">
		<a href="Promotion/listAllPro.jsp">查詢所有促銷商品</a><br>
	</div>
	
	<script type="text/javascript">
	$(function(){
			$("#ECalendar_case1").ECalendar({
					 type:"date",
					 skin:"2",
					 offset:[0,2]
			});
			
	})
	
	$(function(){
			$("#ECalendar_case2").ECalendar({
					 type:"date",
					 skin:"2",
					 offset:[0,2]
			});
			
	})
</script>
</body>
</html>