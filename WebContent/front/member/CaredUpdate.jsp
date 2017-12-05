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
#forgetPwd {
	margin-left: 10px;
}

.modal-backdrop {
	background-color: #ffffff;
}

.features_table h1 {
	font-size: 25px !important;
}

li {
	style: height: 54px;
}

li {
	list-style: none;
}

h1 {
	font-size: 21px !important;
}

.features-table li {
	background: #da9748 none repeat scroll 0 0;
	border-bottom: 2px solid #e5a253;
	color: #f1f1f1;
	font-size: 16px;
	padding: 15px 24px;
}

.features-table li:hover {
	background: #e5a253;
	cursor: pointer;
	-webkit-transition: all .35s;
	-moz-transition: all .35s;
	transition: all .35s;
}

.features-table-free li, .features-table-paid li {
	background: #efefef none repeat scroll 0 0;
	border-bottom: 2px solid #FFFFFF;
	text-align: left;
	padding: 13px 10px ;
	cursor: pointer;
}

.features-table-free h1, .features-table-paid h1 {
	text-align: center;
}

.features-table-free li:hover, .features-table-paid li:hover {
	background: #dedede none repeat scroll 0 0;
	-webkit-transition: all .35s;
	-moz-transition: all .35s;
	transition: all .35s;
}

.features_table h1 {
	font-size: 23px !important;
}

.features-table h1, .features-table-free h1, .features-table-paid h1 {
	background: #6b6b6b none repeat scroll 0 0;
	color: #fff;
	font-weight: 600;
	margin: 0;
	padding: 19px 21px;
	text-transform: uppercase;
}

.features-table h1 {
	border-top-left-radius: 20px;
	text-align: center;
}

.features-table-paid h1 {
	border-top-right-radius: 20px;
}

.features-table-free li {
	border-right: 2px solid #d4d4d4;
}

.fa.fa-check {
	color: #2cc14f;
}

.fa.fa-times {
	color: #BA5340;
}

.fa {
	font-size: 30px;
}

.no-padding {
	padding: 0;
}

ul {
	padding: 0;
}

body {
	counter-reset: section; /* Set the section counter to 0 */
}

.features-table li::before {
	counter-increment: section; /* Increment the section counter*/
	content: "" counter(section) ": "; /* Display the counter */
}
</style>
</head>

<body>
	<div class="container">
		<div class="row">
			<!-- ----------------------下方會員區麵包屑 ------------------------->
			<hr>
			<img alt=""
				src="<%=request.getContextPath()%>/img/member/longterm8.jpg">

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
			<!-- ----------------------上方會員區麵包屑 ------------------------->
			<div class="container text-center">
				<!--------------------------------------------------------------------------------註冊FORM------------------------------------------------------------------------------------------------------->
				<section class="features_table">


					<div class="container ">
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-3 col-3 col-xs-12 no-padding">

								<div class="features-table">
									<ul>
										<h1>Features</h1>
										<li>被照顧者編號:</li>
										<li>被照顧者姓名:</li>
										<li>被照顧者體重(公斤)</li>
										<li>被照顧者地址</li>
										<li>被照顧者電話</li>
										<li>認知功能狀態</li>
										<li>生理功能狀態</li>


									</ul>
								</div>
							</div>
							<div class="col-sm-3 col-3 col-xs-12 no-padding">
								<div class="features-table-paid">
									<form method="post"
										action="<%=request.getContextPath()%>/member/member.do"
										name="form1">
										<ul>
											<h1>
												<b>修改被照顧者</b>
											</h1>
											<li>${thecaredVO.caredNo}</li>
											<li>${thecaredVO.caredName}</li>

											<li><input type="text" class="form-control"
												id="caredWeight" name="caredWeight"
												value="${thecaredVO.caredWeight}"></li>
											<li><input type="text" class="form-control"
												id="caredAddress" name="caredAddress"
												value="${thecaredVO.caredAddress}"></li>

											<li><input type="text" class="form-control"
												id="caredPhone" name="caredPhone"
												value="${thecaredVO.caredPhone}"></li>
											<li><select id="conStatus" name="conStatus">
													<option value="${thecaredVO.bioStatus}">${thecaredVO.conStatus}</option>
													<option value="正常">正常</option>
													<option value="輕度(健忘)">輕度(健忘)</option>
													<option value="中度失智">中度失智</option>
													<option value="重度失智">重度失智</option>
											</select></li>
											<li><select id="bioStatus" name="bioStatus">
													<option value="${thecaredVO.bioStatus}">${thecaredVO.bioStatus}</option>
													<option value="完全獨立">完全獨立</option>
													<option value="輕度依賴">輕度依賴</option>
													<option value="中度依賴">中度依賴</option>
													<option value="嚴重依賴">嚴重依賴</option>
													<option value="完全依賴">完全依賴</option>
											</select></li>
											<li id="mi"><input type="hidden" name="action"
												value="cared_update"> <input type="hidden"
												name="caredNo" value="<%=thecaredVO.getCaredNo()%>"><input
												type="hidden" name="caredName"
												value="<%=thecaredVO.getCaredName()%>"> <input
												type="submit" class="btn btn-warning btn-lg" value="送出修改"></li>

										</ul>
									</form>
								</div>


							</div>
							<div class="col-sm-4"></div>
						</div>
					</div>
				</section>



			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
</body>

<%@ include file="/front/footerbar.jsp"%>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
</html>