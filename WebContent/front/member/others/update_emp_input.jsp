<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.android.member.model.*,java.text.*,java.util.Date"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<html>
<head>
<title>���u��ƭק� - update_emp_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front/css/member/calendar.css">
<script language="JavaScript" src="<%=request.getContextPath() %>/front/js/member/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���u��ƭק� - update_emp_input.jsp</h3>
		<a href="select_page.jsp"><img src="<%= request.getContextPath() %>/front/member/images/back1.gif" width="100" height="32" border="0">�^����</a></td>
	</tr>
</table>

<h3>��ƭק�:</h3>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="<%= request.getContextPath() %>/member/MemberServlet" name="form1">
<table border="0">
	<tr>
		<td>���u�s��:<font color=red><b>*</b></font></td>
		<td>${memberVO.memNo}</td>
	</tr>
	<tr>
		<td>�|���m�W:</td>
		<td><input type="TEXT" name="memName" size="45" value="${memberVO.memName}" /></td>
	</tr>
	<tr>
		<td>Email:</td>
		<td><input type="TEXT" name="memEmail" size="45" value="${memberVO.memEmail}" /></td>
	</tr>
	
	<tr>
		<td>�|���b��:</td>
		<td><input type="TEXT" name="memId" size="45"	value="${memberVO.memId}" /></td>
	</tr>
	<tr>
		<td>�|���K�X:</td>
		<td><input type="TEXT" name="memPwd" size="45" value="${memberVO.memPwd}" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memNo" value="${memberVO.memNo}">
<input type="submit" value="�e�X�ק�"></FORM>

</body>
</html>
