<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<%@ page import="com.member.model.*"%>
<%@ page import="com.balance.model.*"%>
<%@ include file="/front/navbar.jsp"%>
<%@ include file="/front/member/Breadcrumbs_Main.jsp"%>

<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
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

<!-- ----------------------下方訂單管理區選項------------------------->					
					<ul class="nav nav-tabs" id="navList">
						<li data-name="loginLogTab" ><a
							href="<%=request.getContextPath()%>/front/member/MemberHcOrder.jsp">
								<i class="fa fa-briefcase"></i>長照訂單
						</a></li>
						<li data-name="receiveLogTab"}><a
							href="<%=request.getContextPath()%>/front/member/MemberCarOrder.jsp">
								<i class="fa fa-briefcase"></i>派車訂單
						</a></li>
						<li data-name="socketInputTab"><a
							href="<%=request.getContextPath()%>/front/member/MemberMealOrder.jsp">
								<i class="fa fa-briefcase"></i>派餐訂單
						</a></li>
						<li data-name="socketOutputTab"><a
							href="<%=request.getContextPath()%>/front/member/MemberShopOrder.jsp">
								<i class="fa fa-briefcase"></i>商城訂單
						</a></li>
						<li data-name="socketOutputTab" class="active"><a
							href="<%=request.getContextPath()%>/front/member/BalanceList.jsp">
								<i class="fa fa-briefcase"></i>儲值紀錄
						</a></li>				
					</ul>
<!-- ----------------------上方訂單管理區選項------------------------->	
					
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
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front/member/BalanceInsert.jsp" >
							     <input type="submit" value="加值" class=" btn-success"> 
							     <input type="hidden" name="memNo"      value="${memberVO.memNo}">
							     </FORM>
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