<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.employee.model.*"%>
<%@ page import="com.expertlist.model.*"%>

<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>
<%
	Object obj = request.getAttribute("list");
	List<ExpertlistVO> list = new ArrayList<ExpertlistVO>();
	if (obj == null) {
		ExpertlistService expertlistSvc2 = new ExpertlistService();
		list = expertlistSvc.getAll();
	} else {
		list = (List<ExpertlistVO>) obj;
	}
	pageContext.setAttribute("list", list);

	int num = 0;
%>


<style>
#middle {align ="center";
	
}

.hover:hover {
	background-color: #CCC;
}

.bigtoopp {
	margin-top: 100px;
	margin-bottom: 100px;
}

.tapone {
	width: 150px;
}

.newttap {
	margin-top: 100px;
	margin-bottom: 80px;
}

.btn-group .btn {
	transition: background-color .3s ease;
}

.panel-table .panel-body {
	padding: 0;
}

.table>thead>tr>th {
	border-bottom: none;
}

.panel-footer, .panel-table .panel-body .table-bordered {
	border-style: none;
	margin: 0;
}

.panel-table .panel-body .table-bordered>thead>tr>th:first-of-type {
	text-align: center;
	width: 50px;
}

.panel-table .panel-body .table-bordered>thead>tr>th.col-tools {
	text-align: center;
	width: 120px;
}

.panel-table .panel-body .table-bordered>thead>tr>th:last-of-type,
	.panel-table .panel-body .table-bordered>tbody>tr>td:last-of-type {
	border-right: 0;
}

.panel-table .panel-body .table-bordered>thead>tr>th:first-of-type,
	.panel-table .panel-body .table-bordered>tbody>tr>td:first-of-type {
	border-left: 0;
}

.panel-table .panel-body .table-bordered>tbody>tr:first-of-type>td {
	border-bottom: 0;
}

.panel-table .panel-body .table-bordered>thead>tr:first-of-type>th {
	border-top: 0;
}

.pagination>li>a, .pagination>li>span {
	border-radius: 50% !important;
	margin: 0 5px;
}

.panel-footer {
	border-style: 1px;
}

.pagination {
	margin: 0;
}

#mytablebody tr:hover {
	background-color: #caced1;
}

.center {
	margin-top: 50px;
}

.modal-header {
	padding-bottom: 5px;
}

.modal-footer {
	padding: 0;
}

.modal-footer .btn-group button {
	height: 40px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border: none;
	border-right: 1px solid #ddd;
}

.modal-footer .btn-group:last-child>button {
	border-right: 0;
}

#img {
	width: 50%;
}

.notyetText {
	color: #bc2a01;
}

#clickdetail {
	/*color: #1675f9;*/
	border-radius: 50%;
	/*    width: 30px;
    height: 30px;*/
}

#allcenter {
	text-align: center;
}

/* 回覆申訴詳細內容 modal */
#complainTi {
	font-size: 1.3em;
	border-bottom: 0.5px solid #c1c1c1;
}

#complainIn {
	padding-left: 30px;
	padding-top: 3px;
	color: #68696b;
}

#lineModalLabel {
	text-align: center;
}

#rowWidth {
	/*white-space:nowrap; */
	width: 20em; //
	你可以指定希望的寬度 overflow: hidden;
	text-overflow: ellipsis;
	/*line-height:0.5em;*/
	/*display: -webkit-box;*/
	-webkit-line-clamp: 2;
	/*-webkit-box-orient: vertical;*/
}

.forTitle {
	font-size: 1.7em;
}

.serchwidth {
	width: 300px;
	margin-top: 2px;
}

.pull-right {
	float: right;
}

.results tr[visible='false'], .no-result {
	display: none;
}

.results tr[visible='true'] {
	display: table-row;
}

.notfind {
	background-color: #d6effc;
	font-size: 1.5em;
	color: black;
}

#newCI {
	heigh: 32px;
	width: 32px;
}

th {
	
}
</style>

<div class="right_col" role="main">
	<div class="container">

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
										width="70px";>&nbsp;員工專長&nbsp;<b>管理頁面</b>
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
						<div class="col-xs-12 col-sm-3 "></div>
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
						<div class="container">
							<div class="row">
								<div class="col-sm-12">
									<!-- 							<table id="mytable" class="table table-striped table-bordered table-list results"> -->
									<table class="table table-hover" style="font-size: 1.5em">
										<thead>
											<tr>
												<th width="7%">專長編號</th>
												<th width="15%">專長名稱</th>
												<th width="40%">專長描述</th>
												<th width="10%">專長定價</th>
												<th width="10%">修改</th>
											</tr>
										</thead>
										<tbody>

											<%@ include file="pages/page1.file"%>
											<c:forEach var="expertlistVO" items="${list}" varStatus="s"
												begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
												<form
													action="<%=request.getContextPath()%>/employee/employee.do"
													method="post">
													<input type="hidden" name="action"
														value="expertlist_update"> <input type="hidden"
														name="expNo" value="${expertlistVO.expNo}">


													<tr align='left' valign='middle'>

														<td><span class="glyphicon glyphicon-menu-right"></span>${expertlistVO.expNo}</td>
														<td class="hover"><input type="text" name="expName"
															style="width: 100%; height: 50px"
															value="${expertlistVO.expName}"></td>
														<td class="hover"><textarea
																style="width: 100%; height: 50px" name="expSpec">${expertlistVO.expSpec}</textarea></td>
														<td class="hover"><input type="text" name="expPrice"
															style="width: 100%; height: 50px"
															value="${expertlistVO.expPrice}"></td>
														<td>
															<div class="btn-group">
																<button type="submit" class="btn btn-info"
																	style="height: 50px; width: 146px; background-color: steelblue">
																	<span class="glyphicon glyphicon-cloud-upload"></span>&nbsp;&nbsp;確定
																</button>
															</div>

														</td>
													</tr>
												</form>
											</c:forEach>
										</tbody>
									</table>
									<div class="col-xs-1 col-sm-1">


										<a
											href="<%=request.getContextPath()%>/back/employee/addExpertlist.jsp"
											id="modifyBtn" class="btn btn-success btn-default"
											role="button"><span class="glyphicon glyphicon-save"></span>&nbsp;新增專長</a>
									</div>
									<%@ include file="pages/page2.file"%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<%@ include file="/back/production/BA104G1_footer.jsp"%>