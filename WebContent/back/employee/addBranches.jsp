<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.employee.model.*"%>
<%@ page import="com.branches.model.*"%>

<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

<%
	Object obj = request.getAttribute("list");
	List<BranchesVO> list = new ArrayList<BranchesVO>();
	if (obj == null) {
		BranchesService brcSvc = new BranchesService();
		list = brcSvc.getAll();
	} else {
		list = (List<BranchesVO>) obj;
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
						<img
							src="<%=request.getContextPath()%>/back/image/empolyee/horizonBar.jpg"
							class="img-responsive">

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
								action="<%=request.getContextPath()%>/employee/employee.do"
								method="post" id="contact_form">
								<input type="hidden" name="action" value="branches_insert">
								<fieldset>
									<!-- Form Name -->
									<legend>
										<center>
											<h2>
												<b>新增據點</b>
											</h2>
										</center>
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
										<label class="col-md-4 control-label">據點編號</label>
										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-eye-open"></i></span>
													 <input name="empBranches"  value="" class="form-control" type="text">
											</div>
										</div>
									</div>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label">據點名稱</label>
										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-home"></i></span> 
													<input name="brcName" value="" class="form-control" type="text">
											</div>
										</div>
									</div>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label">據點經度</label>
										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-map-marker"></i></span> 
													<input name="brcLon"
													placeholder="如:25.04644" value="" class="form-control" type="text">
											</div>
										</div>
									</div>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label">據點緯度</label>
										<div class="col-md-4 inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-map-marker"></i></span> 
													<input name="brcLat"
													placeholder="如:121.51768" value="" class="form-control" type="text">
											</div>
										</div>
									</div>

									<!-------------------------------------------------------------------------------- 神奇小按鈕 ------------------------------------------------------------------------------------------------------->
									<div class="form-group">
										<label class="col-sm-1 col-sm-offset-3"></label>
										<div class="col-md-4">
											<button type="submit" class="btn btn-default">
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
											</button>
										</div>
									</div>
								</fieldset>
							</form>
							<!--------------------------------------------------------------------------------註冊FORM------------------------------------------------------------------------------------------------------->


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



