<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.employee.model.*"%>
<%@ page import="com.employee_photo.model.*"%>

<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

<%
	EmployeeVO empVO = null;
	if (request.getAttribute("empVO") != null) {
		empVO = (EmployeeVO) request.getAttribute("empVO");
	} else {
		empVO = (EmployeeVO) session.getAttribute("empVO");
	}
	String branch = empVO.getEmpBranches();
	if (branch.equals("10")) {
		branch = "台北分部";
	} else if (branch.equals("20")) {
		branch = "桃園分部";
	} else if (branch.equals("30")) {
		branch = "台中分部";
	} else if (branch.equals("40")) {
		branch = "台南分部";
	} else {
		branch = "高雄分部";
	}
%>


<style>
table#table-1 {
	width: 930px;
	background-color: #DADFDF;
	margin-top: 5px;
	margin-bottom: 10px;
	height: 80px;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}

.table>thead>tr>th {
	text-align: center;
}

.table>tbody>tr>td {
	text-align: center;
}

#modifyBtn {
	margin-Top: 10px;
}

#forgetPwd {
	margin-left: 10px;
}
</style>



<div class="right_col" role="main">
	<div class="">
		<div class="page-title">

			<div class="title_right">
				<div
					class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
					<!--                   <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div> -->
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<div id="mytitle"
							style="padding: 10px; color: #FFFFFF; text-align: center;">


							<a class="btn btn-block btn-lg btn-primary" data-toggle="modal"
								data-target="#mymodal">
								<h1>
									<img alt=""
										src="<%=request.getContextPath()%>/img/index/logo/logo_white.png"
										width="70px";>&nbsp;個人資料維護&nbsp;<b>頁面</b>
										

								</h1>

							</a>

						</div>


						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"> <i
									class="fa fa-chevron-up"> </i>
							</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">
									<i class="fa fa-wrench"></i>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Settings 1</a></li>
									<li><a href="#">Settings 2</a></li>
								</ul></li>
							<!-- XX -->
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">

						<div class="container text-center">
							<!--------------------------------------------------------------------------------註冊FORM------------------------------------------------------------------------------------------------------->
							<form class="well form-horizontal"
								action="<%=request.getContextPath()%>/employee/employee.do?action=register"
								method="post" id="contact_form">
								<fieldset>
									<!-- Form Name -->
									<legend> </legend>
									<br>
									<!-- Text input-->

									<div class="form-group container">
										<div class="col-xs-12 col-sm-12">
											<div class="col-xs-12 col-sm-4 col-sm-offset-4">
												<img
													src="<%=request.getContextPath()%>/DBGifReader4?emp_photo_no=${empPhSvc.getAllByEMPNO(empVO.getEmpNo()).get(0).getEmpPhtoNo()}"
																												
												
<%-- 												${memberSvc.findByPrimaryKey(memberVO.memNo).memLoginTime} --%>
<%-- 													src="<%=request.getContextPath() %>/DBGifReader4?emp_photo_no='EPH0002'" --%>
<%-- 													src="<%=request.getContextPath() %>/DBGifReader4?action=getPhotoByEmpNO&empNo=${empVO.empNo}" --%>
													class="img-responsive">
											</div>
										</div>
									</div>



									<div class="form-group">
										<label class="col-md-4 control-label">員工姓名</label>
										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b>${empVO.empName}</b></span>

											</div>
										</div>
									</div>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label">員工帳號</label>
										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b>${empVO.empId}</b></span>

											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label">員工性別</label>

										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b>${empVO.empGender.equals("F") ?"女" :"男"}</b></span>
											</div>

										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label">員工電話</label>

										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b>${empVO.empPhone}</b></span>
											</div>

										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label">員工信箱</label>

										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b>${empVO.empEmail}</b></span>
											</div>

										</div>
									</div>

									<div class="form-group">
										<label class="col-md-4 control-label">員工部門</label>

										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b>${empVO.empDep}</b></span>
											</div>

										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label">部門據點</label>

										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b><%=branch%></b></span>
											</div>

										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label">員工職稱</label>

										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b>${empVO.empTitle}</b></span>
											</div>

										</div>
									</div>
									<!-- Text input-->

									<div class="form-group">
										<label class="col-md-4 control-label">就職日期</label>

										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b>${empVO.onBoardDate}</b></span>
											</div>

										</div>
									</div>

									<div class="form-group">
										<label class="col-md-4 control-label">管理權限</label>

										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b>${empVO.authorityNo}</b></span>
											</div>
										</div>
									</div>


									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label">員工狀態</label>

										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b>${empVO.empStatus}</b></span>
											</div>

										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label">最後更新</label>

										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><b><fmt:formatDate
														value="${empVO.empUpdateTime}"
														pattern="yyyy-MM-dd HH:mm:ss" /></b></span>
											</div>

										</div>
									</div>
									<div class="form-group">
										<div class="btn-group">
											<a href='#modal-id' data-toggle="modal"
												class="btn btn-warning" role="button">修改</a> <a
												href='<%=request.getContextPath()%>/employee/employee.do?action=forgetPwd&empNo=${empVO.empNo}'
												id="forgetPwd" data-toggle="modal" class="btn btn-danger"
												role="button" onclick="showMessage()">忘記密碼?</a>
										</div>
									</div>
								</fieldset>
							</form>
							<div id="sentPassword"></div>
							<!--------------------------------------------------------------------------------註冊FORM------------------------------------------------------------------------------------------------------->

						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
</div>

 


<div class="modal fade" id="modal-id">
	<div class="modal-dialog">
		<div class="modal-content">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<div class="modal-body">
				<form class="well form-horizontal"
					action="<%=request.getContextPath()%>/employee/employee.do?action=modifySelf"
					method="post" id="contact_form" enctype="multipart/form-data">
					<input type="hidden" name="empNo" value="${empVO.empNo}">
					<fieldset>
						<!-- Form Name -->
						<legend>
							<center>
								<h2>
									<b>修改員工資料</b>
								</h2>
							</center>
						</legend>
						<br>
						<!-- Text input-->
						<div class="form-group">
							<div class="col-md-4 inputGroupContainer col-md-offset-3">

							</div>
							<div class="col-md-4 inputGroupContainer col-md-offset-3">
								<input type="file" id="input1" name="empPhoto" value="選擇檔案"
									onChange="setImage(this);">
							</div>
						</div>


						<div class="form-group">
							<label class="col-md-3 control-label">員工姓名</label>
							<div class="col-md-6 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input name="empName"
										placeholder="Name" class="form-control" type="text"
										value=${empVO.empName}>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">員工性別</label>
							<div class="col-md-6 selectContainer">
								<div class="" id="buying-selling-group" data-toggle="buttons">
									<label class="btn btn-default"
										${empVO.empGender.equals("M") ? "active" :"" }> <input
										type="radio" name="empGender" id="option1" autocomplete="off"
										value="M"> <span>男</span>
									</label> <label class="btn btn-default"
										${empVO.empGender.equals("F") ? "active" :""  }> <input
										type="radio" name="empGender" id="option2" autocomplete="off"
										value="F"> <span>女</span>
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">員工帳號</label>
							<div class="col-md-6 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input name="empId"
										placeholder="Account" class="form-control" type="text"
										value=${empVO.empId}>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">輸入新密碼</label>
							<div class="col-md-6 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-chevron-right"></i></span> <input
										name="empPwd" placeholder="password" class="form-control"
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
										name="empCheck" placeholder="confirm password"
										class="form-control" type="password">
								</div>
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label">員工電話</label>
							<div class="col-md-6 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-earphone"></i></span> <input
										name="empPhone" placeholder="(639)" class="form-control"
										type="text" value=${empVO.empPhone}>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">員工EMail</label>
							<div class="col-md-6 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-envelope"></i></span> <input
										name="empEmail" placeholder="E-Mail Address"
										class="form-control" type="email" value=${empVO.empEmail}>
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
<script>
	function $id(idx) {
		return document.getElementById(idx);
	}

	function setImage(controller) {
		console.log(controller.id);
		var imgId = controller.id.replace(/input/, "img");
		console.log(imgId);
		var file = controller.files[0];
		console.log(controller.files.length);

		var reader = new FileReader();
		reader.readAsDataURL(controller.files[0]);

		reader.addEventListener("load", function() {
			$id(imgId).src = reader.result;
		}, false);
	}
	function showMessage() {
		document.getElementById("forgetPwd").innerHTML = '傳送中...';
		document.getElementById("sentPassword").innerHTML = '密碼已發送至註冊信箱，請前往信箱查收密碼';
	}
</script>
<%@ include file="/back/production/BA104G1_footer.jsp"%>



