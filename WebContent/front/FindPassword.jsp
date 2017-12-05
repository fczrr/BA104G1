<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">

<title>Title Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front/css/member/login.css">
<script src="https://code.jquery.com/jquery.js"></script>
<%@ include file="/front/navbar.jsp"%>

<style>
body {
	background: url('<%=request.getContextPath()%>/img/index/BigImg/bg.jpg')
		fixed;
	background-size: cover;
	padding: 0;
	margin: 0;
}
</style>
</head>
<body>


	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
	<div class="container">
		<div class="row">
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="col-xs-12 col-sm-8">

				<div id="login-overlay" class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								<h1 class="title">
									<img alt="" width="70px"
										src="<%=request.getContextPath()%>/img/index/logo/logo.png">有我罩你 幫您找回密碼
								</h1>
							</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-xs-6">
									<div class="well">

										<form action="<%=request.getContextPath()%>/member/member.do"
											method="post" id="loginForm" novalidate="novalidate">
											<input type="hidden" name="action" value="forgetPwd">


											<div class="form-group">
												<label for="Username" class="control-label">請輸入會員帳號</label> <input
													type="text" class="form-control" id="Username" name="memId"
													value="" /> <span class="help-block"></span>
											</div>

											<div id="loginErrorMsg" class="alert alert-error hide">Wrong
												username og password</div>


											<button type="submit" value="Submit"
												class="btn btn-warning btn-block">
												<span>找回密碼</span>
											</button>



										</form>
										<br> <a
											href='<%=request.getContextPath()%>/front/Login.jsp'
											class="btn btn-success " role="button"
											onclick="showMessage()">返回登入頁面</a>
									</div>
								</div>
								<div class="col-xs-6">
									<p class="lead">
										<span class="text-success">免費</span>註冊會員
									</p>
									<ul class="list-unstyled" style="line-height: 2">
										<li><span class="fa fa-check text-success"></span>
											四大服務：長照、派車、送餐、商城</li>
										<li><span class="fa fa-check text-success"></span>
											雲端生活：手機APP同步連線</li>
										<li><span class="fa fa-check text-success"></span> 掌握您的需求</li>
										<li><span class="fa fa-check text-success"></span> 快速下單</li>
										<li><span class="fa fa-check text-success"></span> 驗證信箱就送<i
											style="color: red;">100點紅包</i><small>&nbsp;(新會員專屬活動)</small></li>

									</ul>
									<p>

										<button value="註冊" class="btn btn-danger btn-block"
											onclick="location.href='<%=request.getContextPath()%>/front/MemberRegister.jsp'">
											<span>註冊</span>
										</button>
									</p>
									<button onclick="myFunction1()">
										<div class="btn btn-xs btn-block">
											<span>MEM1</span>
										</div>
									</button>
									<button onclick="myFunction2()">
										<div class="btn btn-xs btn-block">
											<span>MEM2</span>
										</div>
									</button>
									<button onclick="myFunction3()">
										<div class="btn btn-xs btn-block">
											<span>MEM3</span>
										</div>
									</button>
									<button onclick="myFunction4()">
										<div class="btn btn-xs btn-block">
											<span>新人</span>
										</div>
									</button>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>











		</div>
	</div>

	<%@ include file="/front/footerbar.jsp"%>

	<script type="text/JavaScript">
		function myFunction1() {
			document.getElementById("Username").value = "mem01";
			document.getElementById("Password").value = "pw0000";
		}

		function myFunction2() {
			document.getElementById("Username").value = "mem02";
			document.getElementById("Password").value = "pw0000";
		}

		function myFunction3() {
			document.getElementById("Username").value = "mem03";
			document.getElementById("Password").value = "pw0000";
		}
		function myFunction4() {
			document.getElementById("Username").value = "green";
			document.getElementById("Password").value = "0000";
		}
	</script>

</body>
</html>