<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.thecared.model.*"%>

<%@ include file="/front/navbar.jsp"%>

<jsp:useBean id="caredSvc" class="com.thecared.model.ThecaredService" />
<%
	String caredNo = request.getParameter("caredNo");

// 	ThecaredService caredSVC=(ThecaredService)
	ThecaredVO thecaredVO = caredSvc.getOneTHECARED(caredNo);
	pageContext.setAttribute("thecaredVO", thecaredVO);
%>


<jsp:useBean id="memberSvc" class="com.member.model.MemberService" />



<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<style>

#forgetPwd{
	margin-left:10px;
}

.modal-backdrop{
	background-color:#ffffff;
}

</style>
</head>

<body>
	<div class="container text-center">
		<!--------------------------------------------------------------------------------註冊FORM------------------------------------------------------------------------------------------------------->
		
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" name="form1">
<table class="table">
	<tr>
		<td>被照顧者編號:</td>
		<td>${thecaredVO.caredNo}</td>
	</tr>
	<tr>
		<td>被照顧者姓名:</td>
		<td><input type="TEXT" name="caredName" value="${thecaredVO.caredName}" /></td>
	</tr>
	<tr>
		<td>被照顧者體重:</td>
		<td><input type="TEXT" name="caredWeight" 	value="${thecaredVO.caredWeight}" /></td>
	</tr>
	<tr>
		<td>被照顧者地址:</td>
		<td><input type="TEXT" name="caredAddress"  value="${thecaredVO.caredAddress}" /></td>
	</tr>
	<tr>
		<td>被照顧者電話:</td>
		<td><input type="TEXT" name="caredPhone"  value="${thecaredVO.caredPhone}" /></td>
	</tr>
	<tr>
		<td>認知功能狀態:</td>
		<td><input type="TEXT" name="conStatus"  value="${thecaredVO.conStatus}" /></td>
	</tr>
	<tr>
		<td>認知功能狀態:</td>
		<td><input type="TEXT" name="bioStatus"  value="${thecaredVO.bioStatus}" /></td>
	</tr>



</table>
<br>
<input type="hidden" name="action" value="cared_update">
<input type="hidden" name="caredNo" value="<%=thecaredVO.getCaredNo()%>">
<input type="submit" value="送出修改">
</FORM>


	</div>
	
	
	
	
	

	

<%@ include file="/front/footerbar.jsp"%>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
</body>
</html>