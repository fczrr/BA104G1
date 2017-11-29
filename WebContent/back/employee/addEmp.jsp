<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.employee.model.*"%>

<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

<%
	Object obj = request.getAttribute("list");
	List<EmployeeVO> list = new ArrayList<EmployeeVO>();
	if (obj == null) {
		EmployeeService empSvc = new EmployeeService();
		list = empSvc.getAll();
	} else {
		list = (List<EmployeeVO>) obj;
	}
	pageContext.setAttribute("list", list);
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

<!--
--------------------------------
-->
#success_message {
	display: none;
}

.buying-selling.active {
	background: #7BB712;
}

.buying-selling {
	width: 130px;
	padding: 10px;
	position: relative;
}

.buying-selling.active .buying-selling-word {
	color: #fff;
}

.buying-selling.active .radio-dot:after {
	background: #426C2A;
}

.buying-selling.active .radio-dot:before {
	background: #fff;
	border-color: #699D17;
}

.buying-selling:hover .radio-dot:before {
	border-color: #adadad;
}

.buying-selling.active:hover .radio-dot:before {
	border-color: #699D17;
}

.buying-selling.active .radio-dot:after {
	background: #426C2A;
}

.buying-selling:hover .radio-dot:after {
	background: #e6e6e6;
}

.buying-selling.active:hover .radio-dot:after {
	background: #426C2A;
}

@media ( max-width : 400px) {
	.mobile-br {
		display: none;
	}
	.buying-selling {
		width: 49%;
		padding: 10px;
		position: relative;
	}
}
<!--
--------------------------------
-->
</style>

<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div id="mytitle"
				style="background-color: #40b2cd; padding: 10px; color: #FFFFFF; text-align: center;">
				<h1>
					員工註冊&nbsp;<b>頁面</b>
				</h1>
			</div>
			<div class="title_right">
				<div
					class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">


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

						<div class="container">
							<!--------------------------------------------------------------------------------註冊FORM------------------------------------------------------------------------------------------------------->
							<form class="well form-horizontal"
								action="<%=request.getContextPath()%>/employee/employee.do?action=register"
								method="post" id="contact_form">
								<fieldset>
									<!-- Form Name -->
									<legend>
		
										<c:if test="${not empty errorMsgs}">
											<font color='red'>請修正以下錯誤: <c:forEach var="message"
													items="${errorMsgs}">
											${message}
										</c:forEach>
											</font>
										</c:if>
									</legend>
									<br>

									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label">員工姓名</label>
										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> <input name="empName" placeholder="Name" id="empName"
													value="" class="form-control" type="text">
											</div>
										</div>
									</div>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label">員工性別</label>
										<div class="col-md-4 selectContainer">
											<div class="buying-selling-group" id="buying-selling-group"
												data-toggle="buttons">
												<label class="btn btn-default buying-selling"> <input
													type="radio" name="empGender" id="option1"
													autocomplete="off" value="M"> <span
													class="radio-dot"></span> <span class="buying-selling-word">男</span>
												</label> <label class="btn btn-default buying-selling"> <input
													type="radio" name="empGender" id="option2"
													autocomplete="off" value="F"> <span
													class="radio-dot"></span> <span class="buying-selling-word">女</span>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label">員工部門</label>
										<div class="col-md-4 selectContainer">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-list"></i>
												</span> <select name="empDep" class="form-control selectpicker">
													<option value="">選擇部門</option>
													<option value="長照">長照部門</option>
													<option value="派車">派車部門</option>
													<option value="送餐">送餐部門</option>
													<option value="商城">商城部門</option>
													<option value="客服">客服部門</option>
													<option value="總部">總部部門</option>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label">部門據點</label>
										<div class="col-md-4 selectContainer">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-list"></i>
												</span> <select name="empBranches"
													class="form-control selectpicker">
													<option value="">選擇據點</option>
													<option value="10">台北分部</option>
													<option value="20">桃園分部</option>
													<option value="30">台中分部</option>
													<option value="40">台南分部</option>
													<option value="50">高雄分部</option>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label">員工職位</label>
										<div class="col-md-4 selectContainer">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-list"></i>
												</span> <select name="empTitle" class="form-control selectpicker">
													<option value="">選擇職位</option>
													<option value="總經理">總經理</option>
													<option value="經理">經理</option>
													<option value="專員">專員</option>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label">員工權限</label>
										<div class="col-md-4 selectContainer">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-list"></i>
												</span> <select name="authorityNo"
													class="form-control selectpicker">
													<option value="管理員">管理員</option>
													<option value="長照人員">長照人員</option>
													<option value="派車人員">派車人員</option>
													<option value="送餐人員">送餐人員</option>
													<option value="客服人員">客服人員</option>
												</select>
											</div>
										</div>
									</div>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label">員工帳號</label>
										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> <input name="empId" placeholder="Account" id="empId"
													value="" class="form-control" type="text">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label">員工EMail</label>
										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-envelope"></i>
												</span> <input name="empEmail" placeholder="E-Mail Address"
													id="empMail" value="" class="form-control" type="email">
											</div>
										</div>
									</div>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label">員工電話</label>
										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-earphone"></i>
												</span> <input name="empPhone" placeholder="0911000123"
													class="form-control" id="empPhone" value="" type="text">
											</div>
										</div>
									</div>


									<!-------------------------------------------------------------------------------- 神奇小按鈕 ------------------------------------------------------------------------------------------------------->
									<!-- Button -->
									<div class="form-group">
										<label class="col-md-4 col-sm-3 col-sm-offset-1 control-label"></label>
										<div class="col-md-4">
											<br>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											<button type="submit" class="btn btn-warning">
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSUBMIT <span
													class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

											
										</div>
									</div>
								</fieldset>
							</form>
							<!--------------------------------------------------------------------------------註冊FORM------------------------------------------------------------------------------------------------------->


						</div>
					</div>
					</button>
					<button onclick="addEmp()">
						<div class="col-xs-12 col-sm-6">
							<div class="btn">
								<span>magic</span>
							</div>
						</div>
					</button>



				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>

<script type="text/JavaScript">
	function addEmp() {
		document.getElementById("empName").value = "王小明";
		document.getElementById("empId").value = "ming.w";
		document.getElementById("empMail").value = "seekastyle@gmail.com";
		document.getElementById("empPhone").value = "0912000123";
	}
</script>

<%@ include file="/back/production/BA104G1_footer.jsp"%>



