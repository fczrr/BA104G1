<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.member.model.*"%>
<%-- 此頁練習採用 Script 的寫法取值 --%>

<%-- 取出 Concroller EmpServlet.java已存入request的EmpVO物件--%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>


<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>
	<b><font color=red>此頁練習採用 Script 的寫法取值:</font></b>
	<table border='1' cellpadding='5' cellspacing='0' width='800'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
				<h3>員工資料 - ListOneEmp.jsp</h3> <a
				href="<%=request.getContextPath()%>/back/member/select_page.jsp"><img
					src="<%= request.getContextPath() %>/back/image//member/back1.gif" width="100" height="32" border="0">回首頁</a>
			</td>
		</tr>
	</table>

	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>會員編號</th>
			<th>會員姓名</th>
			<th>會員電話</th>
			<th>會員性別</th>
			<th>會員信箱</th>
			<th>會員地址</th>
			<th>會員點數</th>
			<th>會員狀態</th>
			<th>最後登入</th>
			<th>修改</th>
		</tr>
		<tr align='center' valign='middle'>
			<td>${memberVO.memNo}</td>
			<td>${memberVO.memName}</td>
			<td>${memberVO.memPhone}</td>
			<td>${memberVO.memGender.equals("M") ?"男" :"女"}</td>
			<td>${memberVO.memEmail}</td>
			<td>${memberVO.address}</td>
			<td>${memberVO.point}</td>
			<td>${memberVO.memSratus}</td>
			<td>${memberVO.memLoginTime}</td>

			<td>
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/member/member.do">
					<input type="submit" value="修改"> 
					<input type="hidden" name="memNo"      value="${memberVO.memNo}"> 
					<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
					<!--送出本網頁的路徑給Controller-->
					<input type="hidden" name="action"     value="getOne_For_Update">
				</FORM>
			</td>
		</tr>
	</table>

</body>
</html>
