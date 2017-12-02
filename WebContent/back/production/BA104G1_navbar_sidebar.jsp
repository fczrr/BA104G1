<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 放假 會員 -->
<%@ page import="com.employee.model.*"%>

<jsp:useBean id="crdSvc" class="com.thecared.model.ThecaredService" />
<jsp:useBean id="empPhSvc"
	class="com.employee_photo.model.EmpPhotosService" />
<jsp:useBean id="expertSvc" class="com.expert.model.ExpertService" />
<jsp:useBean id="expertlistSvc"
	class="com.expertlist.model.ExpertlistService" />
<jsp:useBean id="employeeSvc" scope="page"
	class="com.employee.model.EmployeeService" />





<!DOCTYPE html>





<html lang="zh-TW">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>有我罩你後端平台系統!</title>

<!-- Bootstrap -->
<link
	href="<%=request.getContextPath()%>/back/gentelella-master/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="<%=request.getContextPath()%>/back/gentelella-master/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="<%=request.getContextPath()%>/back/gentelella-master/vendors/nprogress/nprogress.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link
	href="<%=request.getContextPath()%>/back/gentelella-master/build/css/custom.min.css"
	rel="stylesheet">


</head>

<body class="nav-md">

	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a
							href="<%=request.getContextPath()%>/back/production/BA104G1_index.jsp"
							class="site_title"><i class="fa fa-home"></i> <span>有我罩你</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info       頭像↓ -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<c:choose>
								<c:when
									test="${empPhSvc.getAllByEMPNO(employeeVO.empNo).size()!= 0}">
									<img style="width: 60px; height: 50px"
										src="<%=request.getContextPath()%>/DBGifReader4?emp_photo_no=${empPhSvc.getAllByEMPNO(employeeVO.getEmpNo()).get(0).getEmpPhtoNo()}"
										alt="圖片載入中" class="img-circle profile_img">
								</c:when>
								<c:otherwise>
									<img style="width: 60px; height: 50px"
										src="<%=request.getContextPath()%>/noData/noPic.jpg"
										alt="圖片連線中" class="img-circle profile_img">
								</c:otherwise>
							</c:choose>

						</div>
						<div class="profile_info">
							<span>歡迎,</span>
							<h2>${employeeVO.empName}</h2>
						</div>
						<div class="clearfix"></div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>主要功能</h3>
							<ul class="nav side-menu">


								<!-- 								<li><a><i class="fa fa-home"></i> 首頁 </a> -->
								<!-- 									<ul class="nav child_menu"> -->
								<!-- 										<li><a -->
								<%-- 											href="<%=request.getContextPath()%>/back/production/BA104G1_index.jsp">首頁</a></li> --%>
								<!-- 										<li><a -->
								<%-- 											href="<%=request.getContextPath()%>/back/employee/listOneEmployee.jsp">個人資料</a></li> --%>

								<!-- 										<li><a href="#">個人班表</a></li> -->
								<!-- 									</ul></li> -->

								<li><a><i class="fa fa-home"></i>員工管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a
											href="<%=request.getContextPath()%>/back/employee/listAllEmployee.jsp">員工資料管理</a></li>
										<li><a
											href="<%=request.getContextPath()%>/back/employee/listAllBranches.jsp">員工據點管理</a></li>
										<li><a
											href="<%=request.getContextPath()%>/back/employee/listAllExpertlist.jsp">員工專長管理</a></li>
									</ul></li>
								<li><a><i class="fa fa-home"></i>會員管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a
											href="<%=request.getContextPath()%>/back/member/listAllMember1.jsp">會員資料管理</a></li>
									</ul></li>

								<li><a><i class="fa fa-automobile"></i> 派車管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
									<li><a href="<%=request.getContextPath()%>/back/carorder/listAllCarOrder.jsp">訂單管理</a></li>
									<li>
										<a href="#">派車班表<span class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a href="<%=request.getContextPath()%>/back/carschedul/CarShiftTableEmp.jsp">查看班表</a></li>
												<li><a href="<%=request.getContextPath()%>/back/carschedul/CarShiftTable.jsp">班表管理</a></li>
											</ul>
									</li>
										
										<li><a href="<%=request.getContextPath()%>/back/cartype/main.jsp">車型管理</a></li>
									</ul>
								</li>  

								<li><a><i class="fa fa-cutlery"></i> 送餐管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a
											href="<%=request.getContextPath()%>/back/mealOrder/listAllMealOrder.jsp">訂單管理</a></li>
										<li><a href="#">菜色管理<span class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a
													href="<%=request.getContextPath()%>/back/dish/listAllDish.jsp">查詢/修改菜色</a></li>
												<li><a
													href="<%=request.getContextPath()%>/back/dish/addDish.jsp">新增菜色</a></li>
											</ul></li>
										<li><a
											href="<%=request.getContextPath()%>/back/setMeal/listAllSetMeal.jsp">套餐管裡</a>
										</li>
									</ul></li>

								<li><a><i class="fa fa-users"></i> 長照管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a
											href="<%=request.getContextPath()%>/back/homeCare/Hc_order_shearch.jsp">訂單管理</a></li>
										<li><a href="<%=request.getContextPath()%>/HcWorkshifts/HcWorkshiftsServlet.do?action=listHcWorks_ByCompositeQuery&successView=/back/homeCare/Hc_show_workShift2.jsp&failureV=/back/homeCare/Hc_show_workShift2.jsp">班表管理</a></li>
									</ul></li>

								<li><a><i class="fa fa-shopping-cart"></i> 商城管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a
											href="<%=request.getContextPath()%>/back/production/BA104G1_back_ShopMaster.jsp">訂單管理</a></li>
										<li><a
											href="<%=request.getContextPath()%>/back/production/BA104G1_back_ShopADD.jsp">新增商品</a></li>
										<li><a
											href="<%=request.getContextPath()%>/back/production/BA104G1_back_ShopSearch.jsp">瀏覽商品</a></li>
										<li><a
											href="<%=request.getContextPath()%>/back/production/BA104G1_back_ShopProSearch.jsp">促銷商品</a></li>
									</ul></li>

							</ul>
						</div>



						<div class="menu_section">
							<h3>其他功能</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-bug"></i> 申訴管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a
											href="<%=request.getContextPath()%>/back/complain/listHCCom.jsp">長照申訴管理</a></li>
										<li><a
											href="<%=request.getContextPath()%>/back/complain/listCarCom.jsp">派車申訴管理</a></li>
										<li><a
											href="<%=request.getContextPath()%>/back/complain/listMealCom.jsp">送餐申訴管理</a></li>
										<li><a
											href="<%=request.getContextPath()%>/back/complain/listShopCom.jsp">商城申訴管理</a></li>
									</ul></li>

								<li><a><i class="fa fa-cc-visa"></i> 點數管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a
											href="<%=request.getContextPath()%>/back/member/listAllBalance.jsp">加值列表</a></li>
									</ul></li>

								<li><a><i class="fa fa-columns"></i> 佈告欄管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a
											href="<%=request.getContextPath()%>/back/newsdetail/AllNews.jsp">最新消息管理</a></li>
										<li><a
											href="<%=request.getContextPath()%>/back/healthnewsdetail/AllNews.jsp">保健資訊管理</a></li>
									</ul></li>

								<li><a href="<%=request.getContextPath()%>/front/message/msgFor_Mem1000.jsp"><i class="fa fa-quote-right"></i> 線上客服管理
								<span class="label label-danger" id="notifly" style="display:none">0</span> <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
									
									</ul></li>

							</ul>
						</div>

					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<!--             <div class="sidebar-footer hidden-small"> -->
					<!--               <a data-toggle="tooltip" data-placement="top" title="Settings"> -->
					<!--                 <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> -->
					<!--               </a> -->
					<!--               <a data-toggle="tooltip" data-placement="top" title="FullScreen"> -->
					<!--                 <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span> -->
					<!--               </a> -->
					<!--               <a data-toggle="tooltip" data-placement="top" title="Lock"> -->
					<!--                 <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span> -->
					<!--               </a> -->
					<!--               <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html"> -->
					<!--                 <span class="glyphicon glyphicon-off" aria-hidden="true"></span> -->
					<!--               </a> -->
					<!--             </div> -->
					<!-- /menu footer buttons -->
				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="nav toggle">
							<a id="menu_toggle"><i class="fa fa-bars"></i></a>
						</div>

						<ul class="nav navbar-nav navbar-right">
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <%--                     <img src="<%=request.getContextPath() %>/back/production/images/img.jpg" alt="">John Doe --%>

									<c:choose>
										<c:when
											test="${empPhSvc.getAllByEMPNO(employeeVO.empNo).size()!= 0}">
											<img style="width: 40px; height: 40px"
												src="<%=request.getContextPath()%>/DBGifReader4?emp_photo_no=${empPhSvc.getAllByEMPNO(employeeVO.getEmpNo()).get(0).getEmpPhtoNo()}"
												alt="圖片載入中">
										</c:when>
										<c:otherwise>
											<img style="width: 40px; height: 40px"
												src="<%=request.getContextPath()%>/noData/noPic.jpg"
												alt="圖片連線中">
										</c:otherwise>
									</c:choose> ${employeeVO.empName} <span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right wrap">
									<li><a
										href="<%=request.getContextPath()%>/back/employee/listOneEmployee.jsp">
											個人基本資料</a></li>
									<!--                     <li> -->
									<!--                       <a href="javascript:;"> -->
									<!--                         <span class="badge bg-red pull-right">50%</span> -->
									<!--                         <span>Settings</span> -->
									<!--                       </a> -->
									<!--                     </li> -->
									<!--                     <li><a href="javascript:;">Help</a></li> -->
									<li><a href="login.html"><i
											class="fa fa-sign-out pull-right"></i>登入</a></li>
									<!-- 									<i class="fa fa-sign-out pull-right"> -->
									<li>
										<form
											action="<%=request.getContextPath()%>/employee/employee.do"
											method="post">

											<input type="hidden" name="action" value="logout">
											<button>
												員工登出<span class="fa fa-sign-out pull-right"></span>
											</button>


										</form>
									</li>
								</ul></li>

							<!-- 							<li role="presentation" class="dropdown"><a -->
							<!-- 								href="javascript:;" class="dropdown-toggle info-number" -->
							<!-- 								data-toggle="dropdown" aria-expanded="false"> <i -->
							<!-- 									class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span> -->
							<!-- 							</a> -->
							<!-- 								<ul id="menu1" class="dropdown-menu list-unstyled msg_list" -->
							<!-- 									role="menu"> -->
							<!-- 									<li><a> <span class="image"><img -->
							<%-- 												src="<%=request.getContextPath()%>/back/production/images/img.jpg" --%>
							<!-- 												alt="Profile Image" /></span> <span> <span>John -->
							<!-- 													Smith</span> <span class="time">3 mins ago</span> -->
							<!-- 										</span> <span class="message"> Film festivals used to be -->
							<!-- 												do-or-die moments for movie makers. They were where... </span> -->
							<!-- 									</a></li> -->
							<!--                     <li> -->
							<!--                       <a> -->
							<!--                         <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span> -->
							<!--                         <span> -->
							<!--                           <span>John Smith</span> -->
							<!--                           <span class="time">3 mins ago</span> -->
							<!--                         </span> -->
							<!--                         <span class="message"> -->
							<!--                           Film festivals used to be do-or-die moments for movie makers. They were where... -->
							<!--                         </span> -->
							<!--                       </a> -->
							<!--                     </li> -->
							<!--                     <li> -->
							<!--                       <a> -->
							<!--                         <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span> -->
							<!--                         <span> -->
							<!--                           <span>John Smith</span> -->
							<!--                           <span class="time">3 mins ago</span> -->
							<!--                         </span> -->
							<!--                         <span class="message"> -->
							<!--                           Film festivals used to be do-or-die moments for movie makers. They were where... -->
							<!--                         </span> -->
							<!--                       </a> -->
							<!--                     </li> -->
							<!--                     <li> -->
							<!--                       <a> -->
							<!--                         <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span> -->
							<!--                         <span> -->
							<!--                           <span>John Smith</span> -->
							<!--                           <span class="time">3 mins ago</span> -->
							<!--                         </span> -->
							<!--                         <span class="message"> -->
							<!--                           Film festivals used to be do-or-die moments for movie makers. They were where... -->
							<!--                         </span> -->
							<!--                       </a> -->
							<!--                     </li> -->
							<!-- 									<li> -->
							<!-- 										<div class="text-center"> -->
							<!-- 											<a> <strong>See All Alerts</strong> <i -->
							<!-- 												class="fa fa-angle-right"></i> -->
							<!-- 											</a> -->
							<!-- 										</div> -->
							<!-- 									</li> -->
							<!-- 								</ul></li> -->
						</ul>
					</nav>
				</div>
			</div>   
			<!-- /top navigation -->

			<!-- page content -->


			<!-- /page content -->









			<!--         footer content -->
			<!--         <footer> -->
			<!--           <div class="pull-right"> -->
			<!--             有我照你股份有限公司 <a href="https://colorlib.com">Colorlib</a> -->
			<!--           </div> -->
			<!--           <div class="clearfix"></div> -->
			<!--         </footer> -->
			<!--         /footer content -->








			<!--     jQuery -->
			<!--     <script src="../vendors/jquery/dist/jquery.min.js"></script> -->
			<!--     Bootstrap -->
			<!--     <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script> -->
			<!--     FastClick -->
			<!--     <script src="../vendors/fastclick/lib/fastclick.js"></script> -->
			<!--     NProgress -->
			<!--     <script src="../vendors/nprogress/nprogress.js"></script> -->

			<!--     Custom Theme Scripts -->
			<!--     <script src="../build/js/custom.min.js"></script> -->