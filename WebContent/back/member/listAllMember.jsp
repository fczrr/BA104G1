<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	MemberService memberSvc = new MemberService();
	List<MemberVO> list = memberSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<%-- <jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>

<html>
<head>
<title>所有員工資料 - listAllEmp.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有會員資料 - ListAllMember.jsp</h3>
		<a href="<%=request.getContextPath()%>/back/member/select_page.jsp"><img src="<%=request.getContextPath()%>/back/image/member/back1.gif" width="100" height="32" border="0">回首頁</a>
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
		<th>會員信箱</th>
		<th>會員地址</th>
		<th>會員點數</th>
		<th>會員狀態</th>
		<th>最後登入</th>
		<th>修改</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(memberVO.memNo==param.memNo) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
			<td>${memberVO.memNo}</td>
			<td>${memberVO.memName}</td>
			<td>${memberVO.memPhone}</td>
			<td>${memberVO.memGender.equals("M") ?"男" :"女"}</td>
			<td>${memberVO.memEmail}</td>
			<td>${memberVO.address}</td>
			<td>${memberVO.point}</td>
			<td>${memberVO.memSratus}</td>
			<td>${memberVO.memLoginTime}</td>				
<%-- 			<td><c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%--                     <c:if test="${empVO.deptno==deptVO.deptno}"> --%>
<%-- 	                    ${deptVO.deptno}【${deptVO.dname} - ${deptVO.loc}】 --%>
<%--                     </c:if> --%>
<%--                 </c:forEach> --%>
<!-- 			</td> -->
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="memNo" value="${memberVO.memNo}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>