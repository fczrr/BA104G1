<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<%@ page import="com.member.model.*"%>
<%@ page import="com.balance.model.*"%>
<%@ include file="/front/navbar.jsp"%>
<%@ include file="/front/member/Breadcrumbs_Main.jsp"%>

<jsp:useBean id="memberSvc" class="com.member.model.MemberService" />
<jsp:useBean id="balanceSvc" scope="page" class="com.balance.model.BalanceService" />


<!DOCTYPE html>
<html lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/bootstrap.css" media="screen">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/usebootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/newstyle_footer.css">
<style type="text/css">
</style>
</head>

<body>


	
					<div class="container-fluid">
					<div class="container">
					<div>Hello,${memberVO.memName}<br>


					帳戶名：${memberVO.memId}，(帳戶狀態：${memberSvc.findByPrimaryKey(memberVO.memNo).memSratus}) ，最近登入時間${memberSvc.findByPrimaryKey(memberVO.memNo).memLoginTime}
		<form action="<%=request.getContextPath()%>/member/member.do"
				method="post" id="contact_form" title="申請驗證後可享有更多特權">
				<input type="hidden" name="action" value="memVerity">
				<input type="hidden" name="memNo" value=${memberVO.memNo} >
				<input type="submit" class=" btn-info" value="前往驗證">
		</form>
					
					<br></div>
					<div></div>
					<div></div>
					
					<div></div>
					<hr>
					<div>帳戶點數餘額：${memberSvc.findByPrimaryKey(memberVO.memNo).point}<br><br></div>
					
					<div>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front/member/BalanceInsert.jsp" >
					     <input type="submit" value="信用卡加值" class=" btn-success"> 
					     <input type="hidden" name="memNo"      value="${memberVO.memNo}">
					     </FORM>					
					</div>
					<hr>
					
					</div>
					
				<div class="row">
					<table class="table table-hover">
							<tr>
								<th>儲值明細編號</th>
								<th>儲值金額</th>
								<th>日期時間</th>
								<th>付款方式</th>

							</tr>
						<c:forEach var="balanceVO"  items='${balanceSvc.getBalanceByMemNo(memberVO.memNo)}' >
							<tr>		
								<td>${balanceVO.topupNo}</td>		
								<td>${balanceVO.topupValue}</td>
								<td>${balanceVO.topupTime}</td>		
								<td>${balanceVO.topupWay}</td>
							</tr>
						</c:forEach>
							<tr>
							<td>
	
							</td>
							</tr>
					</table>
				</div>
			</div>
	</body>		
<%@ include file="/front/footerbar.jsp"%>

			<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
</html>