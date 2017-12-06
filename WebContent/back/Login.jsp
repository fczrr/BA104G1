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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/member/login.js"></script>
<style type="text/css">
body {
	padding-top: 120px;
	padding-bottom: 40px;
	background-color: #eee;
}

.btn {
	outline: 0;
	border: none;
	border-top: none;
	border-bottom: none;
	border-left: none;
	border-right: none;
	box-shadow: inset 2px -3px rgba(0, 0, 0, 0.15);
}

.btn:focus {
	outline: 0;
	-webkit-outline: 0;
	-moz-outline: 0;
}

.fullscreen_bg {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-size: cover;
	background-position: 50% 50%;
	background-image: url('http://i.imgur.com/h26izWg.jpg');
	background-repeat: repeat;
}

.form-signin {
	max-width: 280px;
	padding: 15px;
	margin: 0 auto;
	margin-top: 50px;
}

.form-signin .form-signin-heading, .form-signin {
	margin-bottom: 10px;
}

.form-signin .form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: none;
	border-left-style: solid;
	border-color: #000;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-color: rgb(0, 0, 0);
	border-top: 1px solid rgba(0, 0, 0, 0.08);
}

.form-signin-heading {
	color: #fff;
	text-align: center;
	text-shadow: 0 2px 2px rgba(0, 0, 0, 0.5);
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

	<div id="fullscreen_bg" class="fullscreen_bg">

		<div class="container">
			<div class="row">
				<form class="form-signin"
					action="<%=request.getContextPath()%>/employee/employee.do"
					method="post">
					<h1 class="form-signin-heading text-muted">
						<img alt="" width="50px"
							src="<%=request.getContextPath()%>/img/index/logo/logo_white.png">員工系統
					</h1>
					<input type="hidden" name="action" value="login">
					<div class="input-container">
						<label for="Username"></label> <input type="text" id="Username"
							name="empId" required="required" class="form-control"
							placeholder="員工帳號" />

						<div class="bar"></div>
					</div>
					<div class="input-container">
						<label for="Password"></label> <input type="password"
							id="Password" name="empPwd" class="form-control"
							placeholder="員工密碼" required="required" />
						<div class="bar"></div>
					</div>
					<button type="submit" value="Submit" onclick="showMessage()"
						class="btn btn-lg btn-primary btn-block">
						<span id="login">登入</span>
					</button>
					<br>
					<div class="footer">
						<a href='<%=request.getContextPath()%>/back/ForgetPassword.jsp'
							class="btn btn-danger" role="button" onclick="showMessage()">忘記密碼?</a>
					</div>
				</form>

			</div>
		</div>
		<div class="container" align="center">
			<button class="btn" onclick="myFunction1()">管理部</button>
			<button class="btn" onclick="myFunction2()">長照部</button>
			<button class="btn" onclick="myFunction3()">派車部</button>
			<button class="btn" onclick="myFunction5()">送餐部</button>
			<button class="btn" onclick="myFunction6()">商城部</button>
			<button class="btn" onclick="myFunction7()">派車經理</button>
			
			<button class="btn" onclick="myFunction4()">新人</button>

		</div>
	</div>



	<script type="text/JavaScript">
		function myFunction1() {
			document.getElementById("Username").value = "admin00";
			document.getElementById("Password").value = "pw0000";
		}

		function myFunction2() {
			document.getElementById("Username").value = "a002";
			document.getElementById("Password").value = "pw0000";
		}

		function myFunction3() {
			document.getElementById("Username").value = "b001";
			document.getElementById("Password").value = "pw0000";
		}

		function myFunction4() {
			document.getElementById("Username").value = "ming.w";

		}

		function myFunction5() {
			document.getElementById("Username").value = "c01";
			document.getElementById("Password").value = "pw0000";
		}
		function myFunction6() {
			document.getElementById("Username").value = "d01";
			document.getElementById("Password").value = "pw0000";
		}
		
		function myFunction7() {
			document.getElementById("Username").value = "b20";
			document.getElementById("Password").value = "pw0000";
		}
		
		
		function showMessage() {
			document.getElementById("login").innerHTML = '資料庫連線中...';

		}
	</script>

</body>
</html>