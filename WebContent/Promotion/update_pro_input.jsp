<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.detail.promotion.*"%>
<%
	ProVO proVO = (ProVO) request.getAttribute("proVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<html>
<head>

<link rel="stylesheet" href="css/CalendarStyles.css" />
<script src="js/addproduct.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/Ecalendar.jquery.min.js"></script>
<title>專案資料修改 - update_pro_input.jsp</title></head>
</head>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='500' align='center'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
	<h3 >促銷專案修改:
	</h3>
		<a href="mainforpro.jsp">回首頁</a><br>
		<a href="javascript:history.go(-1);">回上一頁</a>
		</td>
		
		
		
	</tr>
</table>

<h3 align='center'>資料修改:update_pro_input</h3>
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

	<FORM METHOD="post" ACTION="pro.do" name="form1" align='center'>
<table border="0" align='center'>
	<tr>
		<td>商品編號：<font color=red><b>*</b></font></td>
		<td><%=proVO.getITEMNO()%></td>
	</tr>
	<tr>
		<td>促銷活動名稱：</td>
		<td><input type="text" name="NAME" size="20" value="<%=proVO.getNAME()%>" /></td>
	</tr>

	<tr>
		<td>商品促銷價格：</td>
		  <td><input type="text" name="PRICE" size="20" value="<%=proVO.getPRICE()%>"></td>
		</td>
	</tr>
			<tr>
			<td>活動開始日期：</td>
			<td>	
				<div class="calendarWarp">
					<input type="text" name="BEGINDATE" size="20" value="<%=proVO.getBEGINDATE()%>" class="ECalendar" id="ECalendar_case1">
					</td>
				</div>
			</td>
			</tr>
			<td>活動結束日期：</td>
				
					<td>
					<div class="calendarWarp">
					<input type="text" name="ENDDATE" size="20" value="<%=proVO.getENDDATE()%>" class="ECalendar" id="ECalendar_case2">
					</div>
					</td>
				
			</td>

		<!--noneed-->
			<jsp:useBean id="proSvc" scope="page" class="com.detail.promotion.ProService" />
	<tr>
		<td>商品類別:<font color=red><b>*</b></font></td>
		<td><select size="1" name="CLASSNO">
			
				<option value="${proVO.PROMOTIOMNO}">${proVO.PROMOTIOMNO}
	
		</select></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="ITEMNO" value="<%=proVO.getITEMNO()%>">
<input type="hidden" name="PROMOTIOMNO" value="<%=proVO.getPROMOTIOMNO()%>">
<input type="submit" value="送出修改"></FORM>

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
