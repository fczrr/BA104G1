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

	int num = 0;
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
.modal{
	text-align: center;
	padding: 0!important;
}
.modal:before{
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -4px;
}
.modal .modal-dialog{
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>

<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>首頁</h3>
			</div>
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
						<table id="table-1">
							<tr>
								<td>
									<h3>員工管理頁面</h3>
								</td>
							</tr>
						</table>
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
						<div class="col-xs-12 col-sm-3 ">
							<form
								action="<%=request.getContextPath()%>/employee/employee.do?action=getOne_For_Display"
								method="post">
								<div class="form-group form-inline input-group">
									<input type="text" class="form-control" name="empNo"
										placeholder="依員工編號查詢" /> <span class="input-group-btn">
										<button type="submit" class="btn btn-primary">查詢</button>
									</span>
								</div>
							</form>
						</div>
						<div class="col-xs-12 col-sm-3">
							<c:if test="${not empty errorMsgs}">
								<font color='red'>請修正以下錯誤:
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li>${message}</li>
										</c:forEach>
									</ul>
								</font>
							</c:if>
						</div>
						<div class="col-xs-12 col-sm-12">
							<div class="col-xs-11 col-sm-11">
								<ul class="nav nav-tabs" id="navList">
									<li data-name="loginLogTab"
										class=${empDep.equals("getAll") ?"active" :"" }><a
										href="<%=request.getContextPath()%>/employee/employee.do?action=queryDep&empDep=getAll">
											<i class="fa fa-user"></i>列出全部
									</a></li>
									<li data-name="receiveLogTab"
										class=${empDep.equals("hc") ?"active" :"" }><a
										href="<%=request.getContextPath()%>/employee/employee.do?action=queryDep&empDep=hc">
											<i class="fa fa-briefcase"></i>長照部門
									</a></li>
									<li data-name="socketInputTab"
										class=${empDep.equals("car") ?"active" :"" }><a
										href="<%=request.getContextPath()%>/employee/employee.do?action=queryDep&empDep=car">
											<i class="fa fa-briefcase"></i>派車部門
									</a></li>
									<li data-name="socketOutputTab"
										class=${empDep.equals("meal") ?"active" :"" }><a
										href="<%=request.getContextPath()%>/employee/employee.do?action=queryDep&empDep=meal">
											<i class="fa fa-briefcase"></i>送餐部門
									</a></li>
								</ul>
							</div>
							<div class="col-xs-1 col-sm-1">
								<a href="<%=request.getContextPath()%>/back/employee/addEmp.jsp"
									id="modifyBtn" class="btn btn-danger btn-default" role="button">新增員工</a>
							</div>
						</div>
						<div class="col-sm-12">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>員工編號</th>
										<th>員工姓名</th>
										<th>員工部門</th>
										<th>員工職別</th>
										<th>員工性別</th>
										<th>員工信箱</th>
										<th>員工電話</th>
										<th>員工狀態</th>
										<th>就職日期</th>
										<th>最後更新</th>
										<th>功能</th>
									</tr>
								</thead>
								<tbody>
									<%@ include file="pages/page1.file"%>
									<c:forEach var="empVO" items="${list}" varStatus="s"
										begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

										<tr align='center' valign='middle'
											${(memberVO.memNo==param.memNo) ? 'bgcolor=#CCCCFF':''}>

											<td>${empVO.empNo}</td>
											<td>${empVO.empName}</td>
											<td>${empVO.empDep}</td>
											<td>${empVO.empTitle}</td>
											<td>${empVO.empGender.equals("M") ?"男" :"女"}</td>
											<td>${empVO.empEmail}</td>
											<td>${empVO.empPhone}</td>
											<td>${empVO.empStatus.toLowerCase().equals("on") ?"就職中":"離職"}</td>
											<td>${empVO.onBoardDate}</td>
											<td>${empVO.empUpdateTime}</td>
											<td>
												<div class="btn-group">
													<a href='#modal-id${s.index}' data-toggle="modal"
														class="btn btn-info btn-default" role="button">修改</a>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<%@ include file="pages/page2.file"%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:forEach var="empVO" items="${list}" varStatus="s"
	begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<div class="modal fade" id="modal-id${s.index}">
		<div class="modal-dialog">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<div class="modal-body">
					<form class="well form-horizontal" action="<%=request.getContextPath()%>/employee/employee.do?action=modifyManager"
						method="post" id="contact_form">
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
								<label class="col-md-4 control-label">員工姓名</label>
								<div class="col-md-4 inputGroupContainer">
									<div class="input-group form-inline">
										<span class="input-group h5"><b>${empVO.empName}</b></span>
									</div>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label">員工性別</label>
								<div class="col-md-4 selectContainer">
									<div class="buying-selling-group " id="buying-selling-group"
										data-toggle="buttons">
										<span class="input-group h5"><b>${empVO.empGender.equals("M") ?"男" :"女"}</b></span>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-4 control-label">員工部門</label>
								<div class="col-md-4 selectContainer">
									<div class="input-group">
										<select name="empDep" class="form-control selectpicker">
											<option value="長照" ${empVO.empDep.equals("長照") ?"selected" :"" }>長照部門</option>
											<option value="派車" ${empVO.empDep.equals("派車") ?"selected" :"" }>派車部門</option>
											<option value="送餐" ${empVO.empDep.equals("送餐") ?"selected" :"" }>送餐部門</option>
											<option value="後勤" ${empVO.empDep.equals("後勤") ?"selected" :"" }>後勤部門</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">部門據點</label>
								<div class="col-md-4 selectContainer">
									<div class="input-group">
										<select name="empBranches" class="form-control selectpicker">
											<option value="10" ${empVO.empBranches.equals("10") ?"selected" :"" }>台北分部</option>
											<option value="20" ${empVO.empBranches.equals("20") ?"selected" :"" }>桃園分部</option>
											<option value="30" ${empVO.empBranches.equals("30") ?"selected" :"" }>台中分部</option>
											<option value="40" ${empVO.empBranches.equals("40") ?"selected" :"" }>台南分部</option>
											<option value="50" ${empVO.empBranches.equals("50") ?"selected" :"" }>高雄分部</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">員工職位</label>
								<div class="col-md-4 selectContainer">
									<div class="input-group">
										<select name="empTitle" class="form-control selectpicker">
											<option value="總經理" ${empVO.empTitle.equals("總經理") ?"selected" :"" }>總經理</option>
											<option value="分部經理" ${empVO.empTitle.equals("分部經理") ?"selected" :"" }>分部經理</option>
											<option value="專員" ${empVO.empTitle.equals("專員") ?"selected" :"" }>分部專員</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">員工權限</label>
								<div class="col-md-4 selectContainer">
									<div class="input-group">
										<select name="authorityNo" class="form-control selectpicker">
											<option value="總經理" ${empVO.authorityNo.equals("總經理") ?"selected" :"" } >總經理</option>
											<option value="部門經理" ${empVO.authorityNo.equals("部門經理") ?"selected" :"" } >部門經理</option>
											<option value="管理員" ${empVO.authorityNo.equals("管理員") ?"selected" :"" } >管理員</option>
											<option value="派車人員" ${empVO.authorityNo.equals("派車人員") ?"selected" :"" } >派車人員</option>
											<option value="長照人員" ${empVO.authorityNo.equals("長照人員") ?"selected" :"" } >長照人員</option>
											<option value="送餐人員" ${empVO.authorityNo.equals("送餐人員") ?"selected" :"" } >送餐人員</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">員工權限</label>
								<div class="col-md-4 selectContainer">
									<div class="input-group">
										<select name="empStatus" class="form-control selectpicker">
											<option value="on" ${empVO.empStatus.toLowerCase().equals("on") ?"selected":""}>就職中</option>
											<option value="off" ${empVO.empStatus.toLowerCase().equals("on") ?"" :"selected"}>離職</option>
										</select>
									</div>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label">員工帳號</label>
								<div class="col-md-4 inputGroupContainer">
									<div class="input-group">
										<span class="input-group h5"><b>${empVO.empId}</b></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">員工EMail</label>
								<div class="col-md-4 inputGroupContainer">
									<div class="input-group">
										<span class="input-group h5"><b>${empVO.empEmail}</b></span>
									</div>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label">員工電話</label>
								<div class="col-md-4 inputGroupContainer">
									<div class="input-group">
										<span class="input-group h5"><b>${empVO.empPhone}</b></span>
									</div>
								</div>
							</div>
							<div class="btn-group col-sm-12 col-sm-offset-6">
								<div class="col-xs-12 col-sm-6 col-sm-offset-1">
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
</c:forEach>


<%@ include file="/back/production/BA104G1_footer.jsp"%>