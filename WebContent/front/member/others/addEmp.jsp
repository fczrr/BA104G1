<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.android.member.model.*"%>
<%
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<title>���u��Ʒs�W - addEmp.jsp</title></head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front/css/member/calendar.css">
<script language="JavaScript" src="<%=request.getContextPath() %>/front/js/member/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���u��Ʒs�W - addEmp.jsp</h3>
		</td>
		<td>
		   <a href="<%=request.getContextPath()%>/front/member/select_page.jsp"><img src="<%= request.getContextPath() %>/front/image/member/tomcat.gif" width="100" height="100" border="1">�^����</a>
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

<FORM METHOD="post" ACTION="<%= request.getContextPath() %>/member/MemberServlet" name="form1">
<table border="0">

	<tr>
		<td>�|���m�W:</td>
		<td><input type="TEXT" name="memName" size="45" 
			value="<%= (memberVO==null)? "�d�ç�" : memberVO.getMemName()%>" /></td>
	</tr>
	<tr>
		<td>�b��:</td>
		<td><input type="TEXT" name="memId" size="45"
			value="<%= (memberVO==null)? "10000" : memberVO.getMemId()%>" /></td>
	</tr>
	<tr>
		<td>�K�X:</td>
		<td><input type="TEXT" name="memPwd" size="45"
			value="<%= (memberVO==null)? "100" : memberVO.getMemPwd()%>" /></td>
	</tr>
	<tr>
		<td>Email:</td>
		<td><input type="TEXT" name="memEmail" size="45"
			value="<%= (memberVO==null)? "@gmail.com" : memberVO.getMemEmail()%>" /></td>
	</tr>
	<tr>
		<td>Phone:</td>
		<td><input type="TEXT" name="memPhone" size="45"
			value="<%= (memberVO==null)? "0977777777" : memberVO.getMemPhone()%>" /></td>
	</tr>
	
	<tr>
		<td>�ʧO:</td>
		<td>�k<input type="radio" name="memGender" value="�k" >�k<input type="radio" name="memGender" value="�k"></td>
	</tr>
	<tr>
		<td>�a�}:</td>
		<td><input type="TEXT" name="address" size="45"
			value="<%= (memberVO==null)? "������999��" : memberVO.getAddress()%>" /></td>
	</tr>

	


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>

</html>
