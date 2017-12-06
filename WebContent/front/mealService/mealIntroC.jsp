<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.setmeal.model.*"%>
<%@ page import="com.menu.model.*"%>
<%
	SetMealService setMealSvc = new SetMealService();
	SetMealVO setMealVO = setMealSvc.getOneSetMeal(30);
	pageContext.setAttribute("setMealVO", setMealVO);
%>
<%
	MenuService menuSvc = new MenuService();
	List<MenuVO> menuList = menuSvc.getAll(30);
	pageContext.setAttribute("menuList", menuList);
%>
<jsp:useBean id="dishSvc" scope="page" class="com.dish.model.DishService"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<!-- 頁面標題 ================================================== -->
<title>有我罩你</title>
<!-- 頁面標題 ================================================== -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ include file="/front/css/navbar/navCss.file" %>
<!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
<!-- 本頁的CSS區 -->
<link
	href="<%=request.getContextPath()%>/front/css/fullcalendar-scheduler/fullcalendar.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/front/css/fullcalendar-scheduler/scheduler.min.css"
	rel="stylesheet">
<link
	href="https://code.jquery.com/ui/1.12.1/themes/humanity/jquery-ui.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.slider-container {
	position: relative;
	display: block;
}

.slider-container .slider .content img {
	width: 100%;
	height: 300px;
}

.slider-container .slider-controls a {
	position: absolute;
	top: 45%;
	z-index: 100;
	color: #333333;
}

.slider-container .slider-controls a.slider-left {
	left: -25px;
}

.slider-container .slider-controls a.slider-right {
	right: -25px;
}

.thumbnail-slider-container {
	margin-top: 5px;
}

.thumbnail-slider .content {
	padding: 5px;
}

.thumbnail-slider .owl-item.active.center {
	border: 3px solid #333333;
}

#calendar {
	float: right;
	width: 900px;
}
#mealTable th{
   color:#FFD700;
   font-size:18px;
 
 }
 
#mealTable td{
   color:#FFFFFF;
  font-size:16px;
}

</style>
<!-- 本頁的CSS區 -->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="bootstrap/html5shiv.js"></script>
      <script src="bootstrap/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div class="container" style="margin-bottom:4em">
	<%@ include file="/front/message/msgFor_Mem999.jsp" %>
<nav class="navbar navbar-default navbar-fixed-top newnavbartoppp" role="navigation">
    <div class="container-fliud">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            </button>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp"><img class="logoImgNav" src="<%=request.getContextPath()%>/img/index/logo/logo_white.png" style="width:50px"" style="width: 40px;"></a>
        </div>
        
        <!-- 手機隱藏選單區 -->
        <div class="collapse navbar-collapse navbar-ex1-collapse" id="navbarTopColor">
        
        
        
  <!--  開始放鏈結區 ======================================================================== -->
            <ul class="nav navbar-nav navnavnav">
                <li><a href="#">關於我們</a></li>
                <li class="dropdown newdropdown">
                    <a href="#" class="dropdown-toggle newtoggle" data-toggle="dropdown">最新消息 <b class="caret"></b></a>
                    <ul class="dropdown-menu dropdownNew">
                        <li><a href="<%=request.getContextPath()%>/front/newsdetail/allNew.jsp">最新消息</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/healthnews/allNew.jsp">保健資訊</a></li>
                    </ul>
                </li>
                </li>
                <li class="dropdown newdropdown">
                    <a href="#" class="dropdown-toggle newtoggle" data-toggle="dropdown">照護服務 <b class="caret"></b></a>
                    <ul class="dropdown-menu dropdownNew">
                        <li><a href="<%=request.getContextPath()%>/front/homeCare/Hc_show_emps.jsp">短期照護服務</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/homeCare/Hc_order_long.jsp">長期照護服務</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/homeCare/Hc_order.jsp">照護服務說明</a></li>
                    </ul>
                </li>
                <li><a href="<%= request.getContextPath()%>/front/carorder/CarOrder.jsp">派車服務</a></li>
                <li><a href="<%= request.getContextPath()%>/front/mealService/MealIndex.jsp">送餐服務</a></li>
                <li><a href="<%=request.getContextPath()%>/front/shopindex.jsp">商城</a></li>
                <li><a href="#">聯絡我們</a></li>
            </ul>
        
        
        
            <!-- 右選單 -->
            <ul class="nav navbar-nav navbar-right">
                <ul class="nav navbar-nav navbar-right">
            <c:if test="${memberVO!=null}">
                <li><a href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">${memberVO.memName} 您好</a></li>
            </c:if>   
            
            <c:choose>
				<c:when test="${memberVO==null}">
					<li>
					<a href="<%=request.getContextPath()%>/front/Login.jsp">登入  / 註冊</a>
					</li>
				</c:when>
				<c:when test="${memberVO!=null}">
					<li>
					<a href="<%=request.getContextPath()%>/member/member.do?action=logout">登出</a>
					</li>
				</c:when>
			</c:choose> 
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">會員中心 <b class="caret"></b></a>
                     <ul class="dropdown-menu dropdownNew">
                        <li><a href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">會員資料管理</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/member/MyWallet.jsp">我的錢包</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/member/MemberHcOrder.jsp">訂單管理</a></li>
                        
                    </ul>
                </li>
            </ul>
            
<!--  開始放鏈結區 ======================================================================== -->


        </div>
        <!-- 手機隱藏選單區結束 -->
    </div>
</nav>
</div>
		<div class="container">
			<div class="row">
				<!--  --------側邊導覽---------- -->
				<div class="col-xs-12 col-sm-2">
					<div class="panel-group">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<a
									href="<%=request.getContextPath()%>/front/mealService/MealIndex.jsp"
									style="color: white">送餐服務</a>
							</div>
							<div class="panel-body">
								<a href="#collapseOne" data-toggle="collapse"
									data-parent="#accordion">餐點介紹</a>
								<div id="collapseOne" class="panel panel-collapse collapse in">
									<div class=" panel-body" style="padding: 0px">
										<div style="margin: 10px">
											<a
												href="<%=request.getContextPath()%>/front/mealService/mealIntroA.jsp">活力養身餐</a>
										</div>
										<div style="margin: 10px">
											<a
												href="<%=request.getContextPath()%>/front/mealService/mealIntroB.jsp">疾病健康餐</a>
										</div>
										<div style="margin: 10px">
											<a
												href="<%=request.getContextPath()%>/front/mealService/mealIntroC.jsp">術後調理餐</a>
										</div>
									</div>
								</div>
							</div>
							<div class="panel-body">
								<a
									href="<%=request.getContextPath()%>/front/mealService/ChooseMeal.jsp">訂購餐點</a>
							</div>
							<div class="panel-body">
								<a
									href="<%=request.getContextPath()%>/front/mealService/OrderQ&A.jsp">訂購須知</a>
							</div>
						</div>
					</div>
				</div>
				<!-- --------右邊顯示 -->
				<div class="col-xs-12 col-sm-10">
					<h2>術後調理餐</h2>
					<div class="row">
						<div class="col-xs-12 col-sm-6" style="background-color:#FAF0E6;height:300px"s>
							<p>${setMealVO.smIntro}</p>
						</div>
						<div class="col-xs-12 col-sm-6">
							<div class="col-sm-12">

								<div class="slider-container">
									<!--Main Slider Start-->
									<div id="slider" class="slider owl-carousel">
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C01.jpg"
													class="img-responsive">
											</div>
										</div>
										<!--Repeat the below item to add more items in slider-->
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C02.jpg"
													class="img-responsive">
											</div>
										</div>
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C03.jpg"
													class="img-responsive">
											</div>
										</div>
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C04.jpg"
													class="img-responsive">
											</div>
										</div>
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C05.jpg"
													class="img-responsive">
											</div>
										</div>
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C06.jpg"
													class="img-responsive">
											</div>
										</div>
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C07.jpg"
													class="img-responsive">
											</div>
										</div>
									</div>
									<!--Main Slider End-->

									<!--Navigation Links For the Main Items-->
									<div class="slider-controls">
										<a class="slider-left" href="javascript:;"><span><i
												class="fa fa-2x fa-chevron-left"></i></span></a> <a
											class="slider-right" href="javascript:;"><span><i
												class="fa fa-2x fa-chevron-right"></i></span></a>
									</div>
								</div>
							</div>
							<div class="col-sm-12">

								<!--Thumbnail slider container-->
								<div class="thumbnail-slider-container">
									<!--Thumbnail Slider Start-->
									<div id="thumbnailSlider" class="thumbnail-slider owl-carousel">
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C01.jpg"
													class="img-responsive">
											</div>
										</div>
										<!--Repeat the below item to add more items in slider(Here add the items same as in main slider items)-->
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C02.jpg"
													class="img-responsive">
											</div>
										</div>
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C03.jpg"
													class="img-responsive">
											</div>
										</div>
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C04.jpg"
													class="img-responsive">
											</div>
										</div>
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C05.jpg"
													class="img-responsive">
											</div>
										</div>
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C06.jpg"
													class="img-responsive">
											</div>
										</div>
										<div class="item">
											<div class="content">
												<img
													src="<%=request.getContextPath()%>/front/image/mealService/mealIntroC/C07.jpg"
													class="img-responsive">
											</div>
										</div>
									</div>
									<!--Thumbnail Slider End-->
								</div>
							</div>

						</div>


					</div>


					<br>
					<h3>菜色內容</h3>
					<table class="table table-bordered" style="background-color:#F08080" id="mealTable">
						<tr>
							<th>元氣米食</th>
							<td>蓮子飯、茶油飯、香菇什錦拌飯、紫地瓜飯、糙米飯、虱目魚飯、桂圓飯、牛蒡香菇飯、紅糟飯、堅果枸杞飯..等等</td>
						</tr>
						<tr>
							<th>季節食蔬</th>
							<td>蠔油芥蘭、金針菇油菜	、鮮菇菜豆、枸杞水蓮、麻油龍鬚菜、丁香青江菜、蒜香菠菜、紅鳳菜、蟲草花A菜..等等</td>
						</tr>
						<tr>
							<th>健康主食</th>
							<td>蜜桃雞、粉蒸軟骨、香煎黃魚、南瓜雞丁、紅麴燒雞、清蒸三角魚、彩椒干貝、紅燒豬腳、銀芽雞柳..等等</td>
						</tr>
						<tr>
							<th>滋養湯品</th>
							<td>竹笙排骨湯、牛蒡排骨、花生豬腳湯、薑絲魚湯、燒酒雞湯、八珍排骨、十全雞湯、麻油雞湯、九尾排骨湯..等等</td>
						</tr>
						<tr>
							<th>養身飲品</th>
							<td>元氣茶、美人泉、止渴飲、滋生飲、紅棗茶、枸杞茶、麥冬茶、決明子茶、西洋參茶、龍眼茶、人參茶、胖大海..等等</td>
						</tr>
						<tr>
							<th>美味甜品</th>
							<td>紅豆蓮子甜湯、紫米山藥甜湯、桂圓糯米甜湯、銀耳紅棗甜湯、黑糖老薑地瓜、燕麥芝麻糊甜湯、花生湯..等等</td>
						</tr>
					</table>
					<h3>一週膳食範例</h3>
					<div id='calendar'></div>
					<div style='clear: both'></div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div id="eventContent" title="Event Details" style="display:none;">
    <img id="dishImg">
    <br><br>
    <p id="dishIntro"></p>
    </div>
	
	
	
	
	    <footer>
              <div class="newnavbart" style="position: relative;margin-top:10px">
               <p class="">BA104G1&nbsp ©&nbsp 2017 &nbsp&nbsp 有我罩你全家股份有限公司 </p>
             </div>
        </footer>
	<!-- 各項button 連結請自行找 <a href= "填入自己的頁面連結 (溫腥提醒:記得用動態) "> ================== -->


	<!-- 這裡是JS專區 =========================================================== -->

	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>

	<!-- 這裡是JS專區 =========================================================== -->
	<script
		src="<%=request.getContextPath()%>/front/js/fullcalendar-scheduler/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front/js/fullcalendar-scheduler/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front/js/fullcalendar-scheduler/jquery-ui.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front/js/fullcalendar-scheduler/fullcalendar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front/js/fullcalendar-scheduler/scheduler.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front/js/fullcalendar-scheduler/zh-tw.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>


	<script>

	$(function() { // document ready

		$('#calendar').fullCalendar({
			schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
			themeSystem:'jquery-ui',
 			contentHeight: "auto",
			locale : 'zh-tw',
			firstDay:1,
			aspectRatio : 1.85,
			header : {
				left : '',
				center : 'title',
				right : ''
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
			// top level of text
			],

			eventDurationEditable : false,
			resourceAreaWidth : 100,
			resourceLabelText : '餐點時段',
			resources : [ {
				id : '早餐',
				title : '早餐',
			}, {
				id : '中餐',
				title : '中餐',
			}, {
				id : '晚餐',
				title : '晚餐',
			} ],
			events:[
				<%for (int i = 0; i < menuList.size(); i++) {%>
                 {
				id:'<%=i%>',
				resourceId:'<%=menuList.get(i).getMealTime()%>',
				start:'<%=menuList.get(i).getMenuDate()%>',
				title:'<%=menuList.get(i).getDishName()%>',
				description:'<%= dishSvc.getIntroByName(menuList.get(i).getDishName()) %>'
                 },
				<%}%>
			],
			eventClick:function(event){
				$("#dishImg").attr('src','<%= request.getContextPath()%>/DBGifReaderForDishByName?dishName='+event.title);
				$("#dishIntro").text(event.description);
				$("#eventContent").dialog({ modal: true, title: event.title, height: "auto", width:"25%", buttons: {
			          Close: function() {
			            $( this ).dialog( "close" );
			          }
			        }});
				
				
			}
			
		});
	
	});
</script>
	<script>
			$(document).ready(function () {
		// reference for main items
		var slider = $('#slider');
		// reference for thumbnail items
		var thumbnailSlider = $('#thumbnailSlider');
		//transition time in ms
		var duration = 500;
		// carousel function for main slider
		slider.owlCarousel({
		loop:false,
		nav:false,
		items:1
		}).on('changed.owl.carousel', function (e) {
		//On change of main item to trigger thumbnail item
		thumbnailSlider.trigger('to.owl.carousel', [e.item.index, duration, true]);
		});
		// carousel function for thumbnail slider
		thumbnailSlider.owlCarousel({
		loop:false,
		center:false, //to display the thumbnail item in center
		nav:false,
		responsive:{
		0:{
		items:3
		},
		600:{
		items:4
		},
		1000:{
		items:6
		}
		}
		}).on('click', '.owl-item', function () {
		// On click of thumbnail items to trigger same main item
		slider.trigger('to.owl.carousel', [$(this).index(), duration, true]);
		}).on('changed.owl.carousel', function (e) {
		// On change of thumbnail item to trigger main item
		slider.trigger('to.owl.carousel', [e.item.index, duration, true]);
		});
		//These two are navigation for main items
		$('.slider-right').click(function() {
		slider.trigger('next.owl.carousel');
		});
		$('.slider-left').click(function() {
		slider.trigger('prev.owl.carousel');
		});
		});
		</script>
</body>
</html>
