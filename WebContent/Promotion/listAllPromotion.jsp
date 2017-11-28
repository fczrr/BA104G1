<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.detail.promotion.*"%>

<%
	ProService proSvc = new ProService();
	List<ProVO> list = proSvc.getAllPro();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>

<h3>目前頁面:listAllPromotion.jsp</h3>

</head>
<body>
	<table border='1' width='800' align='center'>
		<tr>
			<th>活動編號</th>
			<th>活動名稱</th>
			<th>活動開始日期</th>
			<th>活動結束日期</th>
		</tr>
		<c:forEach var="proVO" items="${list}">
			<tr>
				<th>${proVO.PROMOTIOMNO}</th>
				<th>${proVO.NAME}</th>
				<th>${proVO.BEGINDATE}</th>
				<th>${proVO.ENDDATE}</th>
			</tr>

	</c:forEach>
	</table>
<a href="javascript:history.go(-1);">回上一頁</a>
<br>
<a href="mainforpro.jsp">回pro首頁</a>
</body>
</html>