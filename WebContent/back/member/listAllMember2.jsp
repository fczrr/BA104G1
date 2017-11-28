<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>

<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>
<% List<MemberVO> list = (List<MemberVO>) request.getAttribute("list");
   String param = (String) request.getAttribute("param");
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
									<h3>會員管理頁面</h3>
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
						<div class="col-xs-12 col-sm-3 ">                      <!--     查詢'sFORM      -->
							<form action="<%=request.getContextPath()%>/member/member.do" method="post" id="myform">
								<div class="form-group form-inline input-group">
									<input type="text" class="form-control" name="memNo" placeholder="依會員帳號查詢" />
									<span class="input-group-addon btn btn-default" id="tosubmit" > 
									<i class="fa fa-search"></i>										
									</span>
									<input type="hidden" name="action" value="findOneByMemNo" />
									<input type="hidden" name="failureV" value="/back/member/listAllMember2.jsp" />
									<input type="hidden" name="successView" value="/back/member/listAllMember2.jsp" />
								</div>
							</form>

						</div>
						<div class="col-xs-12 col-sm-12">
							<ul class="nav nav-tabs" id="navList">
								<li data-name="loginLogTab"   class="active">
									<a href="<%=request.getContextPath() %>/member/member.do?action=queryStatus&status=getAll"><i class="fa fa-user"></i>列出全部</a>
								</li>
								<li data-name="receiveLogTab" class="">
									<a  href="<%=request.getContextPath() %>/member/member.do?action=queryStatus&status=verification">
									<i class="fa fa-briefcase"></i>正常狀態</a>
								</li>
								<li data-name="socketInputTab" class="">
									<a href="<%=request.getContextPath()%>/member/member.do?action=queryStatus&status=unverified">
									<i class="fa fa-briefcase"></i>未驗證</a>
									</li>
								<li data-name="socketOutputTab" class="">
									<a href="<%=request.getContextPath()%>/member/member.do?action=queryStatus&status=suspension">
									<i class="fa fa-briefcase"></i>停權狀態</a>
								</li>
							</ul>
						</div>
						<div class="col-sm-12">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>會員編號</th>
										<th>會員姓名</th>
										<th>會員性別</th>
										<th>會員信箱</th>
										<th>會員電話</th>
										<th>會員點數</th>
										<th>會員狀態</th>
										<th>最後登入</th>
										<th>功能</th>
									</tr>
								</thead>
								<tbody>
									<%@ include file="pages/page1.file"%>
									
									<c:forEach var="memberVO" items="${list}"
										begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
										<tr align='center' valign='middle'
											${(memberVO.memNo==param.memNo) ? 'bgcolor=#CCCCFF':''}>

											<td>${memberVO.memNo}</td>
											<td>${memberVO.memName}</td>
											<td>${memberVO.memGender.equals("M") ?"男" :"女"}</td>
											<td>${memberVO.memEmail}</td>
											<td>${memberVO.memPhone}</td>
											<td>${memberVO.point}</td>
											<td>${memberVO.memSratus}</td>
											<td>${memberVO.memLoginTime}</td>
											<td>
												<div class="btn-group">
													<a href="#" class="btn btn-info btn-default" role="button">修改</a>
													<a href="#" class="btn btn-default" role="button">按鈕2</a>
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



<%@ include file="/back/production/BA104G1_footer.jsp"%>
<!-- <script src="https://code.jquery.com/jquery.js"></script> -->

<script>


	$( document ).ready(function(){
			alert('YYYYYY');
		$( "#tosubmit" ).click(function() {
			alert('YYYYYY');
			  $( "#myform" ).submit();
			});
		
	});


</script>