<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>


<%@ include file="/front/navbar.jsp"%>
<%@ include file="/front/member/Breadcrumbs_Main.jsp"%>

<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/bootstrap.css" media="screen">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/usebootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/newstyle_footer.css">

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
	<div class="container ">

<!-- ----------------------下方訂單管理區選項------------------------->					
					<ul class="nav nav-tabs active" id="navList">
						<li data-name="loginLogTab" >
						<a href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">
						<i class="fa fa-briefcase"></i>會員基本資料管理 
						</a></li>
						<li data-name="receiveLogTab"}>
						<a href="<%=request.getContextPath()%>/front/member/CaredList.jsp">
						<i class="fa fa-briefcase"></i>被照顧者資料管理
						</a></li>				
					</ul>
<!-- ----------------------上方訂單管理區選項------------------------->	

		<!--------------------------------------------------------------------------------註冊FORM------------------------------------------------------------------------------------------------------->
		
		
		<form class="well form-horizontal"
			action="<%=request.getContextPath()%>/employee/employee.do?action=register"
			method="post" id="contact_form">
			<fieldset>
				<!-- Form Name -->
				<legend>
					<center>
						
							<b>個人資料維護</b>
					</center>	
						<div>

						</div>
					

				</legend>
				<br>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">會員姓名</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><b>${memberVO.memName}</b></span>

						</div>
					</div>
				</div>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">會員帳號</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><b>${memberVO.memId }</b></span>

						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">會員性別</label>

					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><b>${memberVO.memGender.equals("F") ?"女" :"男"}</b></span>
						</div>

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">會員電話</label>

					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><b>${memberVO.memPhone}</b></span>
						</div>

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">會員信箱</label>

					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><b>${memberVO.memEmail}</b></span>
						</div>

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">會員地址</label>

					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><b>${memberVO.address}</b></span>
						</div>

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">會員狀態</label>

					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><b>${memberVO.memSratus}</b></span>
						
						</div>

					</div>
				</div>
				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">最後登入時間</label>

					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><b>${memberVO.memLoginTime}</b></span>
						</div>

					</div>
				</div>

				<div class="form-group">
					<div class="btn-group">
						<a href='#modal-id' data-toggle="modal" class="btn btn-warning"
							role="button">修改</a> 
					</div>
					
				</div>
			</fieldset>
		</form>

		<form action="<%=request.getContextPath()%>/member/member.do"
				method="post" id="contact_form" title="申請驗證後可享有更多特權">
				<input type="hidden" name="action" value="memVerity">
				<input type="hidden" name="memNo" value=${memberVO.memNo} >
				<input type="submit" class=" btn-info" value="前往驗證">
		</form>
	
		
		<br><br><br><br><br>
	</div>
	
	
	
	
	
<div class="modal fade" id="modal-id">
	<div class="modal-dialog">
		<div class="modal-content">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<div class="modal-body">
				<form class="well form-horizontal"
					action="<%=request.getContextPath()%>/member/member.do?action=update"
					method="post" id="contact_form" >
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
										type="radio" name="memGender" id="option1" autocomplete="off"
										value="M"> <span>男</span>
									</label> <label class="btn btn-default"
										${memberVO.memGender.equals("F") ? "active" :""  }> <input
										type="radio" name="memGender" id="option2" autocomplete="off"
										value="F"> <span>女</span>
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
										class="glyphicon glyphicon-home"></i></span> <input
										name="address" placeholder="address" class="form-control"
										type="text" value=${memberVO.address}>
								</div>
							</div>
						</div>
						<div class="btn-group col-sm-12">
							<div class="col-xs-12 col-sm-6 col-sm-offset-4">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">關閉</button>
								<button class="btn btn-primary" type="submit">確認修改</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>
	

<%@ include file="/front/footerbar.jsp"%>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
</body>
</html>