<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.setmeal.model.*"%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>訂購餐點Q&A</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ include file="/front/css/navbar/navCss.file" %>
<!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
<!--[if lt IE 9]>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body>
	<<div class="container" style="margin-bottom:4em">
	<nav class="navbar navbar-default navbar-fixed-top newnavbartoppp" role="navigation">
    <div class="container-fliud">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            </button>
            <a class="navbar-brand" href="#"><img class="logoImgNav" src="<%=request.getContextPath()%>/img/index/logo/logo_white.png" style="width:50px"" style="width: 40px;"></a>
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
                        <li><a href="<%=request.getContextPath()%>/front/homeCare/Hc_order.jsp">短期照護服務</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/homeCare/Hc_order_long.jsp">長期照護服務</a></li>
                        <li><a href="#">Q&A</a></li>
                    </ul>
                </li>
                <li><a href="#">派車服務</a></li>
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
                        <li><a href="#">我的最愛</a></li>
                    </ul>
                </li>
            </ul>
            
<!--  開始放鏈結區 ======================================================================== -->


        </div>
        <!-- 手機隱藏選單區結束 -->
    </div>
</nav>
</div>

		<div class="container" style="padding-bottom:440px">
			<div class="row">
				<!-- 	我是sidebar -->
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
				<!-- sidebar結束 -->
				<!-- 我是內容區 -->
				<div class="col-xs-12 col-sm-10">
					<h1 class="text-center">訂餐Q&A</h1>
					<div class="panel-group" id="accordion2" role="tablist"
						aria-multiselectable="true">
						<!-- 區塊1 -->
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="panel1" onclick="">
								<h4 class="panel-title">
									<a href="#aaa" data-parent="#accordion2" data-toggle="collapse"
										role="button" aria-expanded="false" aria-controls="aaa">
										訂餐說明 </a>
								</h4>
							</div>
							<div id="aaa" class="panel-collapse collapse" role="tabpanel"
								aria-labelledby="panel1">
								<div class="panel-body">
									<p>
										<span style="color: #333333;">【線上訂購】</span><br> ① 完成線上訂購<br>
										② 客服人員將在24小時內主動與您聯繫後出餐<br> ③ 指定地點等待美味餐點(住家或醫院)<br> ④
										收到餐點若發現有瑕疵狀況，請儘速與本公司聯繫並請低溫保存
									</p>
								</div>
							</div>
						</div>
						<!-- 區塊2 -->
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="panel2">
								<h4 class="panel-title">
									<a href="#bbb" data-parent="#accordion2" data-toggle="collapse"
										role="button" class="collapsed" aria-expanded="false"
										aria-controls="bbb"> 配送區域 </a>
								</h4>
							</div>
							<div id="bbb" class="panel-collapse collapse" role="tabpanel"
								aria-labelledby="panel2">
								<div class="panel-body">
									<p>大台北地區</p>
								</div>
							</div>
						</div>
						<!-- 區塊3 -->
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="panel3">
								<h4 class="panel-title">
									<a href="#ccc" data-parent="#accordion2" data-toggle="collapse"
										role="button" class="collapsed" aria-expanded="false"
										aria-controls="ccc"> 配送時間 </a>
								</h4>
							</div>
							<div id="ccc" class="panel-collapse collapse" role="tabpanel"
								aria-labelledby="panel3">
								<div class="panel-body"><p>早餐:07:00~09:30<br>午餐 10:30~12:30<br>晚餐 16:30~18:30</p></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 	內容區結束 -->
			</div>
		</div>

	<!-- 是footer bar 不要亂刪 感謝～～ ==================================================================== -->
	
	   <footer>
              <div class="newnavbart container-fluid" style=" bottom:0;position: relative;">
               <p class="">BA104G1&nbsp ©&nbsp 2017 &nbsp&nbsp 有我罩你全家股份有限公司 </p>
             </div>
        </footer>
	<!-- 是footer bar 不要亂刪 感謝～～ ==================================================================== -->
	<!-- 這裡是JS專區 =========================================================== -->
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
	<!-- 這裡是JS專區 =========================================================== -->

</body>
<%-- <jsp:include page="/front/footerbar.jsp" /> --%>
</html>