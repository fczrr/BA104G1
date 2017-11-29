<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.balance.model.*"%>

<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

<jsp:useBean id="balanceSvc2" scope="page" class="com.balance.model.BalanceService" />
<%
	Object obj = request.getAttribute("list");
	Object obj2=request.getAttribute("memNo");

	Object obj3=request.getAttribute("topupNo");

	request.getAttribute("status");
	request.getAttribute("topupWay");
	request.getAttribute("topupValue");
	request.getAttribute("topupTime");
	
String memNo=obj2.toString();
	System.out.println("get_memNo="+memNo);

	
	List<BalanceVO> list = new ArrayList<BalanceVO>();
	
	int num = 0;


	
	BalanceVO balanceVO = null;
	if(request.getAttribute("balanceVO")!=null){
		balanceVO=(BalanceVO)request.getAttribute("balanceVO");
	}else{
		balanceVO=(BalanceVO)session.getAttribute("balanceVO");

	}
	System.out.println("get_balanceVO="+balanceVO);
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
									<h3>會員加值狀態管理頁面</h3>
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
								action="<%=request.getContextPath()%>/member/member.do?action=queryBalanceByMemNo"
								method="post">
								<div class="form-group form-inline input-group">
									<input type="hidden" class="form-control" name="action" value="queryBalanceByMemNo"  />
									<input type="text" class="form-control" name="memNo" value="" placeholder="依會員編號查詢" />
									 <span class="input-group-btn">
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
		
						<div class="col-sm-12">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>加值單號</th>
										<th>會員編號</th>
										<th>加值點數</th>
										<th>加值方式</th>
										<th>加值狀態</th>
										<th>加值日期</th>
										<th>異常加註</th>
									</tr>
								</thead>
								<tbody>
									<%@ include file="pages/page1.file"%>
									<c:forEach var="balanceVO" items="${list}"
										begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
										<form
											action="<%=request.getContextPath()%>/member/member.do"
											method="post">
										<input type="hidden" name="action" value="changeBalanceStatus">
										<input type="hidden" name="topupNo" value="${balanceVO.topupNo}">
										
										<tr align='center' valign='middle' >
											<td>${balanceVO.topupNo}</td>
											<td>${balanceVO.memNo}</td>
											<td>${balanceVO.topupValue}</td>
											<td>${balanceVO.topupWay}</td>
											<td><select name="status"
												class="form-control selectpicker">
												<option value="ok" ${balanceVO.status.equals("ok") ?"selected" :""}>ok</option>
												<option value="fail" ${balanceVO.status.equals("fail") ?"selected" :""}>fail</option>
											</select></td>
											
											<td>${balanceVO.topupTime}</td>
											<td>
												<button type="submit" class="btn btn-info btn-default" >
													修改
												</button>
											</td>
										</tr>
										</form>
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



<%@ include file="/back/production/BA104G1_footer.jsp"%>