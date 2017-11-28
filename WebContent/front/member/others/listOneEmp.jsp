<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.android.member.model.*"%>
<%
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>
<html>
<head>
<title>會員資料 - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>會員資料 - ListOneEmp.jsp</h3>
		<a href="<%= request.getContextPath() %>/front/member/select_page.jsp"><img src="<%= request.getContextPath() %>/front/member/images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600'>
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
