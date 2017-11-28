<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>

<%@ include file="/front/navbar.jsp"%>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
 
 
 
<head>
</head>
<body>
	<div class="container-fluid">
		<div class="col-xs-12 col-sm-8 col-sm-offset-2">
			<form class="well form-horizontal"
				action="<%=request.getContextPath()%>/member/member.do?action=insert"
				method="post" id="contact_form">
				<fieldset>
					<!-- Form Name -->
					<legend>
						<center>
							<h2>
								<b>有我罩你會員註冊</b>
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
									placeholder="Name" class="form-control" type="text" id="Username" value="">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">會員帳號</label>
						<div class="col-md-6 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-edit"></i></span> <input name="memId"
									placeholder="account" class="form-control" type="text" id="Userid" value="">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">會員密碼</label>
						<div class="col-md-6 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-edit"></i></span> <input name="memPwd"
									placeholder="password" class="form-control" type="password" id="Userpassword1" value="">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">再次確認密碼</label>
						<div class="col-md-6 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-edit"></i></span> <input name="memPWD"
									placeholder="enter passwork again" class="form-control" type="password" id="Userpassword2" value="">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">會員性別</label>
						<div class="col-md-6  selectContainer">
							<div class="buying-selling-group" id="buying-selling-group"
								data-toggle="buttons" id="Usergender" value="">
								<label class="col-sm-offset-1 btn btn-default buying-selling">
									<input type="radio" name="memGender" id="option1"
									autocomplete="off" value="M"> <span class="radio-dot"></span>
									<span class="buying-selling-word">男</span>
								</label> 
								<label class="btn btn-default buying-selling "> <input
									type="radio" name="memGender" id="option2" autocomplete="off"
									value="F"> <span class="radio-dot"></span> <span
									class="buying-selling-word">女</span>
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">會員電話</label>
						<div class="col-md-6 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-earphone"></i></span> <input
									name="memPhone" placeholder="0912345678" class="form-control"
									type="text" id="Userphone" value="">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3  control-label">會員EMail</label>
						<div class="col-md-6 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-envelope"></i></span> <input
									name="memEmail" placeholder="E-Mail Address"
									class="form-control" type="email" id="Useremail" value="">
							</div>
						</div>
					</div>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-3 control-label">會員地址</label>
						<div class="col-md-6 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-home"></i></span> <input
									name="address" placeholder="Address"
									class="form-control" type="text" id="Useraddress" value="">
							</div>
						</div>
					</div>

<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 col-sm-4 col-sm-offset-1 control-label"></label>
						<div class="col-md-4">
							<button type="submit" class="btn btn-warning" onclick="showMessage()">
								SUBMIT <span class="glyphicon glyphicon-send"></span>
							</button>
						</div>
					</div>
				</fieldset>
			</form>
			
			
		</div>
		
		

	
	</div>		
	<div id="sentMessage">
	</div>		
	<script type="text/JavaScript">
		function myFunction1() {
		    document.getElementById("Username").value = "張懸";
		    document.getElementById("Userid").value = "green";
		    document.getElementById("Userpassword1").value = "0000";
		    document.getElementById("Userpassword2").value = "0000";
		    document.getElementById("Userphone").value = "0987000123";
		    document.getElementById("Useremail").value = "seekastyle@gmail.com";
		    document.getElementById("Useraddress").value = "桃園市中壢區中大路300號";
		}
		function showMessage(){
			document.getElementById("sentMessage").innerHTML='資料傳送中...請稍待';
		}
		
	</script>

<%@ include file="/front/footerbar.jsp"%>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
</body>
</html>