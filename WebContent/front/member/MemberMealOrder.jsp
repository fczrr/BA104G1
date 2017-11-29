<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%@ include file="/front/navbar.jsp"%>

<jsp:useBean id="MealOrderSvc"
	class="com.mealorder.model.MealOrderService" />
<jsp:useBean id="MealDetailSvc"
	class="com.mealorderdetail.model.MealOrderDetailService" />
<jsp:useBean id="SetMealSvc"
	class="com.setmeal.model.SetMealService" />
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
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.css">
	
<%@ include file="/front/css/complain/com.file"%>

</head>

<body>
	
	<!-- 大圖bannan -->
	<div class="container">
		<div class="row">
			<div class="page-header" id="banner">
				<div class="row">
					<div class="col-lg-6">
						<h1>Welcome</h1>
						<p class="lead">To a new bootstrap theme by UseBootstrap.</p>
					</div>
				</div>
			</div>
			<hr>
			<!-- 大圖bannan -->
			<div class="container-fluid">
				<div class="row">
					<ol class="breadcrumb">
						<li><a href="#">首頁</a></li>

						<li>會員專區</li>

						<li class="active">訂單管理</li>
					</ol>
					<ul class="nav nav-tabs" id="navList">
						<li data-name="loginLogTab"><a
							href="<%=request.getContextPath()%>/front/member/MemberHcOrder.jsp">
								<i class="fa fa-user"></i>長照訂單
						</a></li>
						<li data-name="receiveLogTab"}><a
							href="<%=request.getContextPath()%>/front/member/MemberCarOrder.jsp">
								<i class="fa fa-briefcase"></i>派車訂單
						</a></li>
						<li data-name="socketInputTab" class="active"><a
							href="<%=request.getContextPath()%>/front/member/MemberMealOrder.jsp">
								<i class="fa fa-briefcase"></i>派餐訂單
						</a></li>
						<li data-name="socketOutputTab"><a
							href="<%=request.getContextPath()%>/front/member/MemberHcOrder.jsp">
								<i class="fa fa-briefcase"></i>儲值紀錄
						</a></li>
					</ul>

					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">
									<div class="col-xs-12 col-sm-2">訂單編號</div>
									<div class="col-xs-12 col-sm-2">訂購日期</div>
									<div class="col-xs-12 col-sm-2">訂購人姓名</div>
									<div class="col-xs-12 col-sm-2">訂購人電話</div>
									<div class="col-xs-12 col-sm-2">訂購人地址</div>
									<div class="col-xs-12 col-sm-2">訂單狀態</div>
									<div class="col-xs-12 col-sm-2">申訴</div>
								</th>
							</tr>
						</thead>
						<tbody>





							<tr>
								<td>


									<div class="panel-group" id="accordion2" role="tablist"
										aria-multiselectable="true">
										<!-- 區塊1 -->
										<c:forEach var="mealOrder"
											items="${MealOrderSvc.getByMember(memberVO.memNo)}"
											varStatus="s">
											<div class="panel panel-default">
												<div class="panel-heading" role="tab" id="panel${s.index}">
													<h4 class="panel-title text-center">
														<div class="row">
															<div class="col-xs-12 col-sm-2">
																<a href="#aaa${s.index}" data-parent="#accordion2"
																	data-toggle="collapse" role="button"
																	aria-expanded="true" aria-controls="aaa">
																	${mealOrder.moNo} </a>
															</div>

															<div class="col-xs-12 col-sm-2 newsTime'">
																<fmt:formatDate value="${mealOrder.moDate}" />
															</div>
															<div class="col-xs-12 col-sm-2">${mealOrder.rcptName}</div>
															<div class="col-xs-12 col-sm-2">${mealOrder.rcptPhone}</div>
															<div class="col-xs-12 col-sm-2">${mealOrder.rcptAdd}</div>
															<div class="col-xs-12 col-sm-2">${mealOrder.moStatus}</div>
											<!-- 歐歐加的申訴新增button========================================-->
															<%@ include file="/front/complain/MealBtn.file"%>
											<!-- 歐歐加的申訴新增button========================================-->
														</div>
													</h4>
												</div>
												<div id="aaa${s.index}" class="panel-collapse collapse"
													role="tabpanel" aria-labelledby="panel${s.index}">
											
													<div class="panel-body">
														<table class="table table-hover text-center">
															<thead>
																<tr>
																	<th class="text-center">明細編號</th>
																	<th class="text-center">送達日期</th>
																	<th class="text-center">送達時段</th>
																	<th class="text-center">訂購餐點</th>
																	<th class="text-center">訂購數量</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="mealDetail"
																	items="${MealDetailSvc.getByOrderNo(mealOrder.moNo)}">

																	<tr>
																		<td>${mealDetail.moDetailNo}</td>
																		<td>${mealDetail.deliveryDate}</td>
																		<td>${mealDetail.mealTime}</td>
																		<td>${SetMealSvc.getOneSetMeal(mealDetail.smNo).smName}</td>
																		<td>${mealDetail.orderQty}</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>


								</td>
							</tr>

						</tbody>
					</table>


				</div>
			</div>
			</div>
			</div>
			
			
			<!--  新增申訴用的 ========-->
<%@ include file="/front/complain/AllCom.jsp"%>
<%@ include file="/front/complain/MealCom.file"%>
<!--  新增申訴用的 ========-->
			<div class="navbar navbar-default navbar-fixed-bottom">
				<div class="container">
					<p class="navbar-text text-center">BA104G1&nbsp ©&nbsp 2017
						&nbsp&nbsp 有我罩你全家股份有限公司</p>
				</div>
			</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script> 		
	<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.min.js"></script>


</body>




</html>