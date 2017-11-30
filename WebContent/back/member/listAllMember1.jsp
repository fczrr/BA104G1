<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>

<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

<%
	Object obj = request.getAttribute("list");
	List<MemberVO> list = new ArrayList<MemberVO>();
	if (obj == null) {
		MemberService memberSvc = new MemberService();
		list = memberSvc.getAll();
	} else {
		list = (List<MemberVO>) obj;
	}

	pageContext.setAttribute("list", list);
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
						<div class="row">
							<div id="mytitle"
								style="padding: 10px; color: #FFFFFF; text-align: center;">


								<a class="btn btn-block btn-lg btn-primary" data-toggle="modal"
									data-target="#mymodal">
									<h1>
										<img alt=""
											src="<%=request.getContextPath()%>/img/index/logo/logo_white.png"
											width="70px";> 會員列表&nbsp;<b>管理頁面</b>
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
							<div class="col-xs-12 col-sm-3 ">
								<form
									action="<%=request.getContextPath()%>/member/member.do?action=getOne_For_Display"
									method="post">
									<div class="form-group form-inline input-group">
										<input type="text" class="form-control" name="memId"
											placeholder="依會員帳號查詢" /> <span class="input-group-btn">
											<button type="submit" class="btn btn-danger">查詢</button>
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
								<ul class="nav nav-tabs" id="navList">
									<li data-name="loginLogTab"
										class=${status.equals("getAll") ?"active" :"" }><a
										href="<%=request.getContextPath()%>/member/member.do?action=queryStatus&status=getAll">
											<i class="fa fa-user"></i>列出全部
									</a></li>
									<li data-name="receiveLogTab"
										class=${status.equals("verification") ?"active" :"" }><a
										href="<%=request.getContextPath()%>/member/member.do?action=queryStatus&status=verification">
											<i class="fa fa-briefcase"></i>正常狀態
									</a></li>
									<li data-name="socketInputTab"
										class=${status.equals("unverified") ?"active" :"" }><a
										href="<%=request.getContextPath()%>/member/member.do?action=queryStatus&status=unverified">
											<i class="fa fa-briefcase"></i>未驗證
									</a></li>
									<li data-name="socketOutputTab"
										class=${status.equals("suspension") ?"active" :"" }><a
										href="<%=request.getContextPath()%>/member/member.do?action=queryStatus&status=suspension">
											<i class="fa fa-briefcase"></i>停權狀態
									</a></li>
								</ul>
							</div>
							<div class="col-sm-12">
								<form
									action="<%=request.getContextPath()%>/member/member.do?action=updateFromBack"
									method="post">
									<table class="table  ">
										<thead>
											<tr>
												<th>會員編號</th>
												<th>會員姓名</th>
												<th>會員帳號</th>
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

												<input type="hidden" name="memNo" value=${memberVO.memNo} >
												<tr class="hover" align='center' valign='middle'>

													<td>${memberVO.memNo}</td>
													<td>${memberVO.memName}</td>
													<td>${memberVO.memId}</td>
													<td>${memberVO.memGender.equals("M") ?"男" :"女"}</td>
													<td>${memberVO.memEmail}</td>
													<td>${memberVO.memPhone}</td>
													<td>${memberVO.point}</td>
													<td>
														<div class="form-group">
															<label class="col-md-4 control-label"></label>
															<div class="col-md-6 col-sm-12 selectContainer">
																<div class="input-group">
																	<select name="memSratus"
																		class="form-control selectpicker">
																		<option value="已驗證"
																			${memberVO.memSratus.equals("已驗證") ?"selected" :""}>正常狀態</option>
																		<option value="未驗證"
																			${memberVO.memSratus.equals("未驗證") ?"selected" :""}>未驗證</option>
																		<option value="已停權"
																			${memberVO.memSratus.equals("已停權") ?"selected" :""}>已停權</option>
																	</select>
																</div>
															</div>
														</div>
													</td>
													<td>${memberVO.memLoginTime}</td>
													<td>


														<div class="btn-group">
															<button type="submit" class="btn btn-info"
																style="height: 40px; width: 146px; background-color: steelblue">
																<span class="glyphicon glyphicon-cloud-upload"></span>&nbsp;&nbsp;修改
															</button>
														</div>
													</td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</form>
								<%@ include file="pages/page2.file"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="/back/production/BA104G1_footer.jsp"%>