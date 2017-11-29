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
		ExpertlistService expertlistSvc = new ExpertlistService();
		list = expertlistSvc.getAll();
	} else {
		list = (List<ExpertlistVO>) obj;
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
						<table id="table-1">
							<tr>
								<td>
									<h3>員工專長管理頁面</h3>
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
	<!--  					<form
								action="<%=request.getContextPath()%>/employee/employee.do?action=branches_query"
								method="post">
								<div class="form-group form-inline input-group">
									<input type="text" class="form-control" name="expName" value=""
										placeholder="依專長名稱查詢" /> <span class="input-group-btn">
										<button type="submit" class="btn btn-primary">查詢</button>
									</span>
								</div>
							</form>
	-->						
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
							</div>

						</div>
						<div class="col-sm-12">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>專長編號</th>
										<th>專長名稱</th>
										<th>專長描述</th>
										<th>專長定價</th>
										<th>修改</th>
									</tr>
								</thead>
								<tbody>
								
									<%@ include file="pages/page1.file"%>
									<c:forEach var="expertlistVO" items="${list}" varStatus="s"
										begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
										<form
											action="<%=request.getContextPath()%>/employee/employee.do"
											method="post">
										<input type="hidden" name="action" value="expertlist_update">
										<input type="hidden" name="expNo" value="${expertlistVO.expNo}">
										
										
										<tr align='center' valign='middle'
											${(memberVO.memNo==param.memNo) ? 'bgcolor=#CCCCFF':''}>

											<td>${expertlistVO.expNo}</td>
											<td>
											<input type="text" name="expName" value="${expertlistVO.expName}">
											</td>
											<td>
											<input type="text" name="expSpec" value="${expertlistVO.expSpec}">
											</td>
											<td>
											<input type="text" name="expPrice" value="${expertlistVO.expPrice}">
											</td>
											<td>
												<div class="btn-group">
												<button type="submit" class="btn btn-info btn-default" >
													確定
												</button>
												</div>

											</td>
										</tr>
										</form>
									</c:forEach>
								</tbody>
							</table>
								<div class="col-xs-1 col-sm-1">
								<a href="<%=request.getContextPath()%>/back/employee/addExpertlist.jsp"
									id="modifyBtn" class="btn btn-danger btn-default" role="button">新增專長</a>
							</div>
							<%@ include file="pages/page2.file"%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<%@ include file="/back/production/BA104G1_footer.jsp"%>