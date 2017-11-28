<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dish.model.*"%>
<%@ page import="com.menu.model.*"%>
<%
	MenuService menuSvc = new MenuService();
	Integer smNo = (Integer) request.getAttribute("smNo");
	List<MenuVO> menuList = menuSvc.getAll(smNo);
	pageContext.setAttribute("menuList", menuList);
%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>有我罩你後端平台系統! |</title>

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
<link
	href="<%=request.getContextPath()%>/back/css/fullcalendar-scheduler/fullcalendar.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/back/css/fullcalendar-scheduler/scheduler.min.css"
	rel="stylesheet" />
<link href="https://code.jquery.com/ui/1.12.1/themes/humanity/jquery-ui.css" rel="stylesheet">
<style>
#calendar{
font-size:18px;
text-align:center;
}
.fc-title{
font-weight:bold;
font-size:20px;




}



.fc-center h2 {
	font-weight: bold;
	font-size: large;
}

#external-events {
	border-radius:15PX;
	width:200px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #F5BB00;
	text-align:center;
	margin: 0px auto;
}

#external-events h4 {
	font-size: 25px;
	color: #000000;
	margin-top: 0;
	padding-top: 1em;
}

#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
	background: #F5BB00;
}

#external-events .fc-event.ui-draggable.ui-draggable-handle {
	font-size: 30px;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 25px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	float: left;
	width: 900px;
}
</style>

</head>

<body class="nav-md">

	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-home"></i>
							<span>有我罩你!</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img
								src="<%=request.getContextPath()%>/back/gentelella-master/build/images/rammu.jpg"
								alt="圖片仔入中" class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>歡迎,</span>
							<h2>總經理好</h2>
						</div>
						<div class="clearfix"></div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>General</h3>
							<ul class="nav side-menu">


								<li><a><i class="fa fa-home"></i> 首頁 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="#">Dashboard</a></li>
										<li><a href="#">Dashboard2</a></li>
										<li><a href="#">Dashboard3</a></li>
									</ul></li>

								<li><a><i class="fa fa-home"></i> 員工管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a
											href="<%=request.getContextPath()%>/back/employee/listOneEmployee.jsp">個人資料維護</a></li>
										<li><a
											href="<%=request.getContextPath()%>/back/employee/listAllEmployee.jsp">員工資料管理</a></li>
									</ul></li>
								<li><a><i class="fa fa-home"></i>會員管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a
											href="<%=request.getContextPath()%>/back/member/listAllMember1.jsp">會員資料管理</a></li>
										<li><a href="#">點數管理</a></li>
									</ul></li>
								<li><a><i class="fa fa-home"></i> 派車管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="#">Dashboard</a></li>
										<li><a href="#">Dashboard2</a></li>
										<li><a href="#">Dashboard3</a></li>
									</ul></li>
								<!--  送餐管理   start -->
								<li><a><i class="fa fa-home"></i> 送餐管理 <span
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
										<li><a href="#">套餐管裡<span class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a
													href="<%=request.getContextPath()%>/back/setMeal/listAllSetMeal.jsp">查詢/修改套餐</a></li>
												<li><a
													href="<%=request.getContextPath()%>/back/SetMeal/addSetMeal2.jsp">新增套餐</a></li>
											</ul></li>
									</ul></li>
								<!--  送餐管理   end  -->
								<li><a><i class="fa fa-home"></i> 長照管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="#">Dashboard</a></li>
										<li><a href="#">Dashboard2</a></li>
										<li><a href="#">Dashboard3</a></li>
									</ul></li>

								<li><a><i class="fa fa-home"></i> 商城管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="#">Dashboard</a></li>
										<li><a href="#">Dashboard2</a></li>
										<li><a href="#">Dashboard3</a></li>
									</ul></li>

							</ul>
						</div>



						<div class="menu_section">
							<h3>Live On</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-bug"></i> 申訴管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="e_commerce.html">E-commerce</a></li>
										<li><a href="projects.html">Projects</a></li>
										<li><a href="project_detail.html">Project Detail</a></li>
										<li><a href="contacts.html">Contacts</a></li>
										<li><a href="profile.html">Profile</a></li>
									</ul></li>

								<li><a><i class="fa fa-bug"></i> 點數管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="e_commerce.html">E-commerce</a></li>
										<li><a href="projects.html">Projects</a></li>
										<li><a href="project_detail.html">Project Detail</a></li>
										<li><a href="contacts.html">Contacts</a></li>
										<li><a href="profile.html">Profile</a></li>
									</ul></li>

								<li><a><i class="fa fa-bug"></i> 佈告欄管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="e_commerce.html">E-commerce</a></li>
										<li><a href="projects.html">Projects</a></li>
										<li><a href="project_detail.html">Project Detail</a></li>
										<li><a href="contacts.html">Contacts</a></li>
										<li><a href="profile.html">Profile</a></li>
									</ul></li>

								<li><a><i class="fa fa-bug"></i> 線上客服管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="e_commerce.html">E-commerce</a></li>
										<li><a href="projects.html">Projects</a></li>
										<li><a href="project_detail.html">Project Detail</a></li>
										<li><a href="contacts.html">Contacts</a></li>
										<li><a href="profile.html">Profile</a></li>
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
								aria-expanded="false"> <img src="images/img.jpg" alt="">John
									Doe <span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> Profile</a></li>
									<li><a href="javascript:;"> <span
											class="badge bg-red pull-right">50%</span> <span>Settings</span>
									</a></li>
									<li><a href="javascript:;">Help</a></li>
									<li><a href="login.html"><i
											class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul></li>

							<li role="presentation" class="dropdown"><a
								href="javascript:;" class="dropdown-toggle info-number"
								data-toggle="dropdown" aria-expanded="false"> <i
									class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span>
							</a>
								<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
									role="menu">
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li>
										<div class="text-center">
											<a> <strong>See All Alerts</strong> <i
												class="fa fa-angle-right"></i>
											</a>
										</div>
									</li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
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
									<h2>Plain Page</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Settings 1</a></li>
												<li><a href="#">Settings 2</a></li>
											</ul></li>
										<!-- XX -->
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>

									<div class="clearfix"></div>
								</div>
								<jsp:useBean id="dishSvc" scope="page"
									class="com.dish.model.DishService" />
								<div class="x_content">
									<div id='wrap'>

										<div class="row">
											<div class="col-sm-3">
												<div id='external-events'>
													<h4>菜色</h4>
													<div class="panel-group" id="accordion">
														<div class="panel panel-primary">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a data-toggle="collapse" data-parent="#accordion"
																		href="#collapse1">米食</a>
																</h4>
															</div>
															<div id="collapse1" class="panel-collapse collapse ">
																<div class="panel-body">
																	<c:forEach var="dishVO"
																		items="${dishSvc.getByType('米食')}">
																		<div class='fc-event'>${dishVO.dishName}</div>
																	</c:forEach>
																</div>
															</div>
														</div>
														<div class="panel panel-success">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a data-toggle="collapse" data-parent="#accordion"
																		href="#collapse2">主食</a>
																</h4>
															</div>
															<div id="collapse2" class="panel-collapse collapse">
																<div class="panel-body">
																	<c:forEach var="dishVO"
																		items="${dishSvc.getByType('主食')}">
																		<div class='fc-event'>${dishVO.dishName}</div>
																	</c:forEach>
																</div>
															</div>
														</div>
														<div class="panel panel-info">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a data-toggle="collapse" data-parent="#accordion"
																		href="#collapse3"> 湯品</a>
																</h4>
															</div>
															<div id="collapse3" class="panel-collapse collapse">
																<div class="panel-body">
																	<c:forEach var="dishVO"
																		items="${dishSvc.getByType('湯品')}">
																		<div class='fc-event'>${dishVO.dishName}</div>
																	</c:forEach>
																</div>
															</div>
														</div>
														<div class="panel panel-warning">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a data-toggle="collapse" data-parent="#accordion"
																		href="#collapse4"> 蔬食</a>
																</h4>
															</div>
															<div id="collapse4" class="panel-collapse collapse">
																<div class="panel-body">
																	<c:forEach var="dishVO"
																		items="${dishSvc.getByType('蔬食')}">
																		<div class='fc-event'>${dishVO.dishName}</div>
																	</c:forEach>
																</div>
															</div>
														</div>
														<div class="panel panel-danger">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a data-toggle="collapse" data-parent="#accordion"
																		href="#collapse5"> 甜品</a>
																</h4>
															</div>
															<div id="collapse5" class="panel-collapse collapse">
																<div class="panel-body">
																	<c:forEach var="dishVO"
																		items="${dishSvc.getByType('甜品')}">
																		<div class='fc-event'>${dishVO.dishName}</div>
																	</c:forEach>
																</div>
															</div>
														</div>
														<div class="panel panel-default">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a data-toggle="collapse" data-parent="#accordion"
																		href="#collapse6"> 飲品</a>
																</h4>
															</div>
															<div id="collapse6" class="panel-collapse collapse">
																<div class="panel-body">
																	<c:forEach var="dishVO"
																		items="${dishSvc.getByType('飲品')}">
																		<div class='fc-event'>${dishVO.dishName}</div>
																	</c:forEach>
																</div>
															</div>
														</div>
													</div>
												</div>
												<span></span>
												<div id="event-delete" class="col-sm-12"
													style="margin-top: 20px">
													<img
														src="<%=request.getContextPath()%>/back/image/setMeal/trashCan.jpg"
														height="200" width="200">
												</div>
											</div>
											<div class="col-sm-9">
												<h1 class="text-center">${smName}</h1>
												<br>
												<div id='calendar' class="col-sm-12"></div>
												<div style="margin-top:10px;margin-left:50%" class="col-sm-12" >
													<form id="form1" method="post"
														action="<%=request.getContextPath()%>/Menu.do">
														<input type="hidden" name="action" value="insertMenu">
														<input type="hidden" name="test"> 
														<input type="hidden" name="smNo" value="${smNo}">
														<button id="myBtn" type="button" class="btn btn-primary btn-lg">save</button>
													</form>
												</div>
											</div>

										</div>
										<div style='clear: both'></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- /page content -->


		<footer>
			<div class="pull-right">
				有我照你股份有限公司 <a href="https://colorlib.com">Colorlib</a>
			</div>
			<div class="clearfix"></div>
		</footer>



	</div>





	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/back/gentelella-master/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath()%>/back/gentelella-master/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="<%=request.getContextPath()%>/back/gentelella-master/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="<%=request.getContextPath()%>/back/gentelella-master/vendors/nprogress/nprogress.js"></script>

	<!-- Custom Theme Scripts -->
	<script
		src="<%=request.getContextPath()%>/back/gentelella-master/build/js/custom.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/back/js/fullcalendar-scheduler/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/back/js/fullcalendar-scheduler/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/back/js/fullcalendar-scheduler/jquery-ui.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/back/js/fullcalendar-scheduler/fullcalendar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/back/js/fullcalendar-scheduler/scheduler.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/back/js/fullcalendar-scheduler/zh-tw.js"></script>
	<script>
	$(function() { // document ready
    
		/* initialize the external events
		-----------------------------------------------------------------*/
       
		$('#external-events .fc-event').each(function() {

			// store data so the calendar knows to render an event upon drop
			$(this).data('event', {
				title : $.trim($(this).text()), // use the element's text as the event title
				stick : true, // maintain when user navigates (see docs on the renderEvent method)
			    color:'#3688D'

			});

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex : 999,
				revert : true, // will cause the event to go back to its
				revertDuration : 0
			//  original position after the drag
			});

		});

		/* initialize the calendar
		-----------------------------------------------------------------*/

		$('#calendar')
				.fullCalendar(
						{
							schedulerLicenseKey : 'CC-Attribution-NonCommercial-NoDerivatives',
					        themeSystem:'jquery-ui',
							locale : 'zh-tw',
							editable : true,
							droppable : true,
							aspectRatio : 1.5,
							firstDay:1,
							header : {
								left : '',
								center : 'title',
								right : 'today prev,next'
							},
							defaultView : 'timelineWeek',
							views : {
								timelineWeek : {
									slotDuration : {
										days : 1
									},

								}
							},
							
							slotLabelFormat : [ 'ddd M/D',

							],
							dragRevertDuration:0,
							contentHeight: "auto",
							eventDurationEditable : false,
							resourceAreaWidth : 100,
 							resourceLabelText : '餐點時段',
							resources : [ {
								id : '早餐',
								title : '早餐'
							}, {
								id : '中餐',
								title : '中餐'
							}, {
								id : '晚餐',
								title : '晚餐'
							}, ],

							events:[
								<%for (int i = 0; i < menuList.size(); i++) {%>
		                         {
								id:'<%=i%>',
								resourceId:'<%=menuList.get(i).getMealTime()%>',
								start:'<%=menuList.get(i).getMenuDate()%>',
								title:'<%=menuList.get(i).getDishName()%>',
								editable:false,
								color:'red',
								className:"myClass"
		                         },
								<%}%>
							], 
						    	
							drop : function(date, jsEvent, ui, resourceId,resourceId) {
						

								// is the "remove after drop" checkbox checked?
								if ($('#drop-remove').is(':checked')) {
									// if so, remove the element from the "Draggable Events" list
									$(this).remove();
								}
							},
							eventReceive : function(event) { // called when a proper external event is dropped
							    console.log('eventReceive', event);
							
							},
							eventDrop : function(event) { // called when an event (already on the calendar) is moved

								console.log('eventDrop', event);
							},
							eventDragStop: function(event, jsEvent) {

							    var trashEl = $('#event-delete');
							    var ofs = trashEl.offset();

							    var x1 = ofs.left;
							    var x2 = ofs.left + trashEl.outerWidth(true);
							    var y1 = ofs.top;
							    var y2 = ofs.top + trashEl.outerHeight(true);
							    if (jsEvent.pageX >= x1 && jsEvent.pageX<= x2 &&
							            jsEvent.pageY >= y1 && jsEvent.pageY <= y2) {
							        
							            $('#calendar').fullCalendar('removeEvents', event._id);
							        }

								
				                
								
// 							   
							}				
						});
		
		
		
		
		
		
		
		
		
		
		
		
		var objArray=[];
		
		
		$("#myBtn").click(function(){
			
			var events = $('#calendar').fullCalendar('clientEvents');
			//var events2= $('#calendar').fullCalendar('getResourceEvents','早餐');
			//console.log(events);
			//console.log(events2);
			$.each( events, function( key, value ) {
				var aaa = {
						date:null,
						time:null,
						dish:null
					};
					aaa.date = moment(value.start).format('YYYY-MM-DD');
					aaa.time = value.resourceId;
					aaa.dish = value.title;
				  objArray.push(aaa);
				  console.log(aaa);
				  console.log(objArray);

// 				  console.log(value.resourceId);
// 				  console.log(value.title);
// 				  console.log(moment(value.start).format('YYYY-MM-DD'));
				});
			
		     console.log(JSON.stringify(objArray));
		     console.log(typeof JSON.stringify(objArray) );
		     var jsonStr=JSON.stringify(objArray);
		    console.log(jsonStr);
		    $("input[name=test]").val(jsonStr);
		    console.log($("input[name=test]").val());
		    $("#form1").submit();
		});
		
		
		
		
		
	});
	
</script>
</body>
</html>
