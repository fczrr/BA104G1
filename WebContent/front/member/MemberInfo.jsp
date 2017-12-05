<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<%@ page import="com.member.model.*"%>


<%@ include file="/front/navbar.jsp"%>

<jsp:useBean id="memberSvc" class="com.member.model.MemberService" />
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front/css/navbar/bootstrap.css"
	media="screen">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front/css/navbar/usebootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front/css/navbar/newstyle_footer.css">

<style>
#mi {
	border-bottom: 2px solid #FFFFFF;
	position: relative;
}

.features_table h1 {
	font-size: 25px !important;
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
	border-bottom: 2px solid #d4d4d4;
	text-align: center;
	padding: 16.4px 21px;
	cursor: pointer;
}

.features-table-free h1, .features-table-paid h1 {
	text-align: center;
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

#forgetPwd {
	margin-left: 10px;
}

.modal-backdrop {
	background-color: #ffffff;
}
</style>
</head>

<body>
	<div class="container ">
		<!-- ----------------------下方會員區麵包屑 ------------------------->
		<hr>
		<img alt=""
			src="<%=request.getContextPath()%>/img/member/longterm9.jpg">

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
		<!-- ----------------------下方訂單管理區選項------------------------->
		<ul class="nav nav-tabs active" id="navList">
			<li data-name="loginLogTab"><a
				href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">
					<i class="fa fa-briefcase"></i>會員基本資料管理
			</a></li>
			<li data-name="receiveLogTab"}><a
				href="<%=request.getContextPath()%>/front/member/CaredList.jsp">
					<i class="fa fa-briefcase"></i>被照顧者資料管理
			</a></li>
		</ul>
		<hr>
		<!-- ----------------------上方訂單管理區選項------------------------->

		<!--------------------------------------------------------------------------------註冊FORM------------------------------------------------------------------------------------------------------->
		<section class="features_table">


			<div class="container ">
				<div class="row">
					<div class="col-sm-2 col-2col-xs-12 no-padding"></div>

					<div class="col-sm-3 col-3 col-xs-12 no-padding">
						<div class="features-table">
							<ul>
								<h1>Features</h1>
								<li>會員姓名</li>
								<li>會員帳號</li>
								<li>會員性別</li>
								<li>會員電話</li>
								<li>會員信箱</li>
								<li>會員地址</li>

								<li>會員狀態</li>
								


							</ul>
						</div>
					</div>
					<div class="col-sm-5 col-5 col-xs-12 no-padding">
						<div class="features-table-paid">
							<ul>
								<h1>
									<b>個人資料維護</b>
								</h1>
								<li><b>${memberVO.memName}</b></li>
								<li><b>${memberVO.memId }</b></li>
								<li><b>${memberVO.memGender.equals("F") ?"女" :"男"}</b></li>
								<li><b>${memberVO.memPhone}</b></li>
								<li><b>${memberVO.memEmail}</b></li>
								<li><b>${memberVO.address}</li>

								<li><b>${memberSvc.findByPrimaryKey(memberVO.memNo).memSratus}</b></li>
								
								<li id="mi"><div class="row"><div class="col-sm-12 col-12 col-xs-12">
										<form action="<%=request.getContextPath()%>/member/member.do"
											method="post" id="contact_form" title="通過驗證後可得到加值金100點">
											<input type="hidden" name="action" value="memVerity">
											<input type="hidden" name="memNo" value=${memberVO.memNo} >
											<input id="verify" type="submit" class="btn btn-success btn-lg btn-block"
												value="前往驗證">
									
										&nbsp;&nbsp; <a href='#modal-id' data-toggle="modal"
											class="btn btn-warning btn-lg btn-block" role="button">&nbsp;&nbsp;&nbsp;修&nbsp;改&nbsp;&nbsp;&nbsp;</a>
									</div></div>
									</form></li>

							</ul>
						</div>
					</div>
				</div>

			</div>
		</section>
		<div class="col-sm-3 col-3 col-xs-12 no-padding"></div>
		<div class="container"></div>
		<br> <br>


		<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="modal-body">
						<form class="well form-horizontal"
							action="<%=request.getContextPath()%>/member/member.do?action=update"
							method="post" id="contact_form">
							<input type="hidden" name="memNo" value="${memberVO.memNo}">
							<fieldset>
								<!-- Form Name -->
								<legend>
									<center>
										<h2>
											<b>修改資料</b>
										</h2>
									</center>
								</legend>
								<br>
								<!-- Text input-->

								<div class="form-group">
									<label class="col-md-3 control-label">會員姓名</label>
									<div class="col-md-6 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input name="memName"
												placeholder="Name" class="form-control" type="text"
												value=${memberVO.memName}>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">會員性別</label>
									<div class="col-md-6 selectContainer">
										<div class="" id="buying-selling-group" data-toggle="buttons">
											<label class="btn btn-default"
												${memberVO.memGender.equals("M") ? "active" :"" }> <input
												type="radio" name="memGender" id="option1"
												autocomplete="off" value="M"> <span>男</span>
											</label> <label class="btn btn-default"
												${memberVO.memGender.equals("F") ? "active" :""  }>
												<input type="radio" name="memGender" id="option2"
												autocomplete="off" value="F"> <span>女</span>
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">輸入新密碼</label>
									<div class="col-md-6 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-chevron-right"></i></span> <input
												name="memPwd" placeholder="password" class="form-control"
												type="password">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">再次確認密碼</label>
									<div class="col-md-6 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-chevron-right"></i></span> <input
												name="memCheck" placeholder="confirm password"
												class="form-control" type="password">
										</div>
									</div>
								</div>
								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-3 control-label">會員電話</label>
									<div class="col-md-6 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-earphone"></i></span> <input
												name="memPhone" placeholder="(639)" class="form-control"
												type="text" value=${memberVO.memPhone}>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">會員信箱</label>
									<div class="col-md-6 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="memEmail" placeholder="E-Mail Address"
												class="form-control" type="email" value=${memberVO.memEmail}>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">會員地址</label>
									<div class="col-md-6 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-home"></i></span> <input name="address"
												placeholder="address" class="form-control" type="text"
												value=${memberVO.address}>
										</div>
									</div>
								</div>
								<div class="btn-group col-sm-12">
									<div class="col-xs-12 col-sm-6 col-sm-offset-4">
										<button type="button" class="btn btn-default btn-lg"
											data-dismiss="modal">關閉</button>
										<button class="btn btn-warning btn-lg" type="submit">確認修改</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>


		<%@ include file="/front/footerbar.jsp"%>
		<script>
			var yy = '${memberSvc.findByPrimaryKey(memberVO.memNo).memSratus}';

			window.onload = verify;
			function verify() {
				console
						.log('${memberSvc.findByPrimaryKey(memberVO.memNo).memSratus}');
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
</body>
</html>