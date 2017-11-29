<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<title>���u��Ʒs�W - addEmp.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�|����Ʒs�W - addMember.jsp</h3>
		</td>
		<td>
		   <a href="<%=request.getContextPath()%>/back/member/select_page.jsp"><img src="<%=request.getContextPath()%>/back/images/member/tomcat.gif" width="100" height="100" border="1">�^����</a>
	    </td>
	</tr>
</table>

<h3>��ƭ��u:</h3>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" name="form1">
<table border="0">

	<tr>
		<td>�|���m�W:</td>
		<td><input type="TEXT" name="memName" size="45"
		value="<%=  (memberVO==null) ?" " :memberVO.getMemName() %>"/></td>
	</tr>
	<tr>
		<td>�|���b��:</td>
		<td><input type="TEXT" name="memId" size="45"
			value="<%=  (memberVO==null) ?" " :memberVO.getMemId()%>" /></td>
	</tr>
	<tr>
		<td>�|���K�X:</td>
		<td><input type="TEXT" name="memPwd" size="45"
			value="<%=  (memberVO==null) ?" " :memberVO.getMemPwd()%>" /></td>
	</tr>
	<tr>
		<td>�|���q��:</td>
		<td><input type="TEXT" name="memPhone" size="45"
			value="<%=  (memberVO==null) ?" " :memberVO.getMemPhone()%>" /></td>
	</tr>
	<tr>
		<td>�|���ʧO:</td>
		<td><input type="TEXT" name="memGender" size="45"
			value="<%=  (memberVO==null) ?" " :memberVO.getMemGender()%>" /></td>
	</tr>
	<tr>
		<td>�|���H�c:</td>
		<td><input type="TEXT" name="memEmail" size="45"
			value="<%=  (memberVO==null) ?" " :memberVO.getMemEmail()%>" /></td>
	</tr>
	<tr>
		<td>�|���a�}:</td>
		<td><input type="TEXT" name="address" size="45"
			value="<%=  (memberVO==null) ?" " :memberVO.getAddress()%>" /></td>
	</tr>
	

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>

</html>
