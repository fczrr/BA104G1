<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<%@ page import="com.member.model.*"%>
<%@ page import="com.balance.model.*"%>
<%@ include file="/front/navbar.jsp"%>

<jsp:useBean id="memberSvc" class="com.member.model.MemberService" />
<jsp:useBean id="balanceSvc" scope="page"
	class="com.balance.model.BalanceService" />


<!DOCTYPE html>
<html lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front/css/navbar/bootstrap.css"
	media="screen">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front/css/navbar/usebootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front/css/navbar/newstyle_footer.css">

<style type="text/css">
#money.style {
	color: #FFA500";
}

.hover:hover {
	background-color: #CCC;
}
</style>
</head>

<body>



	<div class="container-fluid">
		<div class="container">
			<div class="row">
				<hr>
				<img alt=""
					src="<%=request.getContextPath()%>/img/member/longterm6.jpg">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/index.jsp">首頁</a></li>
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">會員資料管理</a></li>
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/front/member/MyWallet.jsp">我的錢包</a></li>
					<li class="breadcrumb-item active" aria-current="page"><a
						href="<%=request.getContextPath()%>/front/member/MemberHcOrder.jsp">訂單管理</a></li>
				</ol>
				<div style="background-color: #E0E0E0;" class="col-xs-12 col-sm-4">

					<div>
						<h1>
							<b>${memberVO.memName}</b>，您好
						</h1>
						<br>最近登入時間：&nbsp;${memberSvc.findByPrimaryKey(memberVO.memNo).memLoginTime2}
						<br> <br>
						帳戶名：${memberVO.memId}，(帳戶狀態：${memberSvc.findByPrimaryKey(memberVO.memNo).memSratus})<br>
						<form action="<%=request.getContextPath()%>/member/member.do"
							method="post" id="contact_form" title="通過驗證後可得到加值金100點">
							<input type="hidden" name="action" value="memVerity"> <input
								type="hidden" name="memNo" value=${memberVO.memNo} > <input
								id="verify" type="submit" class="btn btn-info" value="前往驗證">
						</form>



						<hr>


						<div>
							<form method="post"
								action="<%=request.getContextPath()%>/member/member.do">
								帳戶點數餘額：
								<h3>

									<b id="money">${memberSvc.findByPrimaryKey(memberVO.memNo).point}
									</b>
								</h3>
								<input type="submit" value="立刻加值" class="btn btn-success">
								<input type="hidden" name="memNo" value="${memberVO.memNo}">
								<input type="hidden" name="myurl"
									value="<%=request.getServletPath()%>"> <input
									type="hidden" name="action" value="tranfer">
							</form>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-8">


					<center>
						<h3>
							儲值記錄&nbsp;<img alt="" width="40px"
								src="<%=request.getContextPath()%>/img/index/logo/logo.png">
						</h3>
					</center>
					<table class="table table-hover">
						<tr>
							<th>儲值明細編號</th>
							<th>儲值金額</th>
							<th>日期時間</th>
							<th>付款方式</th>

						</tr>
						<c:forEach var="balanceVO"
							items='${balanceSvc.getBalanceByMemNo(memberVO.memNo)}'>
							<tr id=" hover">
								<td>${balanceVO.topupNo}</td>
								<td>${balanceVO.topupValue}</td>
								<td>${balanceVO.topupTime}</td>
								<td>${balanceVO.topupWay}</td>
							</tr>
						</c:forEach>
						<tr>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 	<button id="xx" onclick="this.style.display='none';"> -->
	<!-- 		<div class="col-xs-12 col-sm-6"> -->
	<!-- 			<div class="btn"> -->
	<!-- 				<span>magic</span> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</button> -->
</body>
<%@ include file="/front/footerbar.jsp"%>
<script>
	var yy = '${memberSvc.findByPrimaryKey(memberVO.memNo).memSratus}';

	window.onload = verify;
	function verify() {
		console.log('${memberSvc.findByPrimaryKey(memberVO.memNo).memSratus}');
		if (yy == "已驗證") {

			document.getElementById('verify').style.display = "none";

		}
	}
</script>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
</html>