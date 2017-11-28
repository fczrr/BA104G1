<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.android.member.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	MemberService memSvc = new MemberService();
	List<MemberVO> list = memSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>所有員工資料 - listAllEmp.jsp</title>
</head>
<body bgcolor='white'>
	<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
	<table border='1' cellpadding='5' cellspacing='0' width='800'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
				<h3>所有員工資料 - ListAllEmp.jsp</h3> <a href="<%= request.getContextPath() %>/front/member/select_page.jsp"><img
					src="<%= request.getContextPath() %>/front/member/others/images/back1.gif" width="100" height="32" border="0">回首頁</a>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>

	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>會員編號</th>
			<th>會員姓名</th>
			<th>會員電話</th>
			<th>會員性別</th>
			<th>會員Email</th>
			<th>會員地址</th>
			<th>會員點數</th>
			<th>會員帳號</th>
			<th>會員密碼</th>
			<th>會員狀態</th>
			<th>會員上次IP</th>
			<th>會員最後登入時間</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
			<tr align='center' valign='middle'>
				<td>${memberVO.memNo}</td>
				<td>${memberVO.memName}</td>
				<td>${memberVO.memPhone}</td>
				<td>${memberVO.memGender}</td>
				<td>${memberVO.memEmail}</td>
				<td>${memberVO.address}</td>
				<td>${memberVO.point}</td>
				<td>${memberVO.memId}</td>
				<td>${memberVO.memPwd}</td>
				<td>${memberVO.memSratus}</td>
				<td>${memberVO.chkIp}</td>
				<td>${memberVO.memLoginTime}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/member/MemberServlet">
						<input type="submit" value="修改"> 
						<input type="hidden"
							name="memNo" value="${memberVO.memNo}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/member/MemberServlet">
						<input type="submit" value="刪除"> <input type="hidden"
							name="memNo" value="${memberVO.memNo}"> <input type="hidden"
							name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>
</body>
</html>
