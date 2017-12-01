<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.hcworkshifts.model.*"%>
<%@ page import="com.employee.model.*"%>
<jsp:useBean id="employeeService" scope="page" class="com.employee.model.EmployeeService" />
<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

<%
	Object obj = request.getAttribute("listHcWorks_ByCompositeQuery");
	List<HcWorkShiftsVO> listHcWorks_ByCompositeQuery = new ArrayList<HcWorkShiftsVO>();
	if (obj == null) {
		HcWorkShiftsService hcWorkShiftsService = new HcWorkShiftsService();
		listHcWorks_ByCompositeQuery = hcWorkShiftsService.getAll();
	} else {
		listHcWorks_ByCompositeQuery = (List<HcWorkShiftsVO>) obj;
	}
	pageContext.setAttribute("listHcWorks_ByCompositeQuery", listHcWorks_ByCompositeQuery);

	int num = 0;
%>


<style>
#middle {align ="center";
	
}

.hover:hover {
	background-color: #CCC;
}

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

.modal {
	text-align: center;
	padding: 0 !important;
}

.modal:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -4px;
}

.modal .modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>

<div class="right_col" role="main">
	<div class="">

		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">



						<div class="x_title">
							<div id="mytitle"
								style="padding: 10px; color: #FFFFFF; text-align: center;">


								<a class="btn btn-block btn-lg btn-primary" data-toggle="modal"
									data-target="#mymodal">
									<h1><b>長照班表管理</b>
									</h1>

								</a>

							</div>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"> <i
										class="fa fa-chevron-up"> </i>
								</a></li>

							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
<!-- 							<div class="col-xs-12 col-sm-3 "> -->
<!-- 								<form -->
<%-- 									action="<%=request.getContextPath()%>/employee/employee.do?action=getOne_For_Display" --%>
<!-- 									method="post"> -->
<!-- 									<div class="form-group form-inline input-group"> -->
<!-- 										<input type="text" class="form-control" name="empNo" -->
<!-- 											placeholder="依員工編號查詢" /> <span class="input-group-btn"> -->
<!-- 											<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>&nbsp;查詢</button> -->
<!-- 										</span> -->
<!-- 									</div> -->
<!-- 								</form> -->
<!-- 							</div> -->
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

								<div class="col-xs-1 pull-right">
									<a
										href="<%=request.getContextPath()%>/back/employee/addEmp.jsp"
										id="modifyBtn" class="btn btn-danger btn-default"
										role="button"><span class="glyphicon glyphicon-save"></span>&nbsp;新增班表</a>
								</div>
							<div class="col-sm-12">
								<table class="table  table-striped">
									<thead>
				                        <tr>
				                            <th>月份</th>
				                            <th>員工編號</th>
				                            <th>員工姓名</th>
				                            <th>總工作時段</th>
				
				                        </tr>
									</thead>
									<tbody>
										<%@ include file="pages/page1_ByCompositeQuery.file"%>
										<c:forEach var="hcWorkShiftsVO" items="${listHcWorks_ByCompositeQuery}" varStatus="s"
											begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

											<tr align='center' valign='middle' class=" hover">

						                            <td>${hcWorkShiftsVO.monthOfYear}</td>
						                            <td>${hcWorkShiftsVO.empNo}</td>
						                            <td>${employeeService.findByPrimaryKey(hcWorkShiftsVO.empNo).getEmpName()}</td>
						                            <td>${hcWorkShiftsVO.totalWorkShifts}</td>
												<td>
													<div class="btn-group">
														<a href='<%=request.getContextPath()%>/back/homeCare/Hc_show_workShift3.jsp?monthOfyear=10612&empNo=${hcWorkShiftsVO.empNo}' data-toggle="modal"
															class="btn btn-primary" role="button"> <span
															class="glyphicon glyphicon-cloud-upload"></span>&nbsp;&nbsp;修改
														</a>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<%@ include file="pages/page2_ByCompositeQuery.file"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	

	<%@ include file="/back/production/BA104G1_footer.jsp"%>
<!-- <div class="modal fade  container" id="modal-id" > -->
<!-- 	<div class="col-xs-12 col-sm-12"> -->
<!-- 	<div class="modal-dialog" style="width:1000px"> -->
<!-- 		<div class="modal-content"> -->
<!-- 			<div class="modal-header"> -->
<!-- 				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
<!-- 				<h4 class="modal-title">標題</h4> -->
<!-- 			</div> -->
<!-- 			<div class="modal-body"> -->
<%-- 					<%@ include file="/back/homeCare/Hc_show_workShift4.jsp"%> --%>
<!-- 			</div> -->
<!-- 			<div class="modal-footer"> -->
<!-- 				<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button> -->
<!-- 				<button type="button" class="btn btn-primary">Save changes</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	</div> -->
<!-- </div> -->