<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.android.member.model.*"%>
<%
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>
<html>
<head>
<title>�|����� - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�|����� - ListOneEmp.jsp</h3>
		<a href="<%= request.getContextPath() %>/front/member/select_page.jsp"><img src="<%= request.getContextPath() %>/front/member/images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>�|���s��</th>
		<th>�|���m�W</th>
		<th>�|���q��</th>
		<th>�|���ʧO</th>
		<th>�|��Email</th>
		<th>�|���a�}</th>
		<th>�|���I��</th>
		<th>�|���b��</th>
		<th>�|���K�X</th>
		<th>�|�����A</th>
		<th>�|���W��IP</th>
		<th>�|���̫�n�J�ɶ�</th>
	</tr>
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
	</tr>
</table>

</body>
</html>
