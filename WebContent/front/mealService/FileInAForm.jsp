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
<title>訂購送餐</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">



<!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="/front/css/navbar/navCss.file" %>
<!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front/css/mealService/jquery-ui.multidatespicker.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front/css/mealService/mealOrder.css">
<!--[if lt IE 9]>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
						<![endif]-->
</head>
<body>
	<div class="container" style="margin-bottom:4em">
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
		<div class="container">
			<div class="row">
				<!-- 我是sidebar -->
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
				<!-- 我是sidebar結束 -->
				<!-- 我是右邊內容 -->
				<div class="col-xs-12 col-sm-10">
					<div class="wizard">
						<div class="wizard-inner">
							<div class="connecting-line"></div>
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="disabled"><a
									aria-controls="step1" role="tab" title="Step 1"> <span
										class="round-tab"> <i
											class="glyphicon glyphicon-shopping-cart"></i>
									</span>
								</a></li>
								<li role="presentation" class="active"><a
									aria-controls="step2" role="tab" title="Step 2"> <span
										class="round-tab"> <i
											class="glyphicon glyphicon-pencil"></i>
									</span>
								</a></li>
								<li role="presentation" class="disabled"><a
									aria-controls="complete" role="tab" title="Complete"> <span
										class="round-tab"> <i class="glyphicon glyphicon-ok"></i>
									</span>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-12" style="font-size:16px">
						<h2>訂單總計</h2>
						<table class="table table-hover">
							<thead>
								<tr style="background-color:#F5BB00">
									<th>訂購天數</th>
									<th>訂購餐數</th>
									<th>早餐</th>
									<th>午餐</th>
									<th>晚餐</th>
									<th>總計</th>
									<th>金額</th>
									<th>錢包點數餘額</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th><font color="#FF0000">${days}</font>天</th>
									<th><font color="#FF0000">${totalMeals}</font>餐</th>
									<th><font color="#FF0000">${totalBreakfast}</font>餐</th>
									<th><font color="#FF0000">${totalLunch}</font>餐</th>
									<th><font color="#FF0000">${totalDinner}</font>餐</th>
									<th>$<font color="#FF0000">${smPrice}</font>(每餐) X <font color="#FF0000">${totalMeals}</font>(餐數) = $<font color="#FF0000">${totalPrice}</font></th>
									<th>$<font color="#FF0000">${totalPrice}</font></th>
									<th>$<font color="#FF0000">${memberVO.point}</font></th>
								</tr>
							</tbody>
						</table>
					</div>	
					<div class="col-sm-12">
							<h2>訂購人資訊</h2>
							<div class="form-group">
								<label>訂購人</label>
								<p>${memberVO.memName}</p>
							</div>
							<div class="form-group">
								<label>訂購人地址</label>
								<p>${memberVO.address}</p>
							</div>
							<div class="form-group">
								<label>訂購人電話</label>
								<p>${memberVO.memPhone}</p>
							</div>
						</div>
						<div class="col-sm-12">
							<h2>收件人資訊</h2>
							<form action="<%=request.getContextPath()%>/MealOrder.do"
								method="post">
								<div class="form-group">
									<label for="rcptName">收件人</label> <input type="text"
										name="rcptName" id="rcptName" class="form-control">
								</div>
								<div class="form-group">
									<label for="rcptAdd">收件人地址</label> <input type="text"
										name="rcptAdd" id="rcptAdd" class="form-control">
								</div>
								<div class="form-group">
									<label for="rcptPhone">收件人電話</label> <input type="text"
										name="rcptPhone" id="rcptPhone" class="form-control">
								</div>
								<div class="form-group">
									<input type="hidden" name="smNo" value="${param.smNo}">
									<input type="hidden" name="orderQty" value="${param.orderQty}">
									<input type="hidden" name="totalPrice" value="${totalPrice}">
									<input type="hidden" name="dates" value="${dates}">
									<input type="hidden" name="action" value="insert">
									<a href="<%= request.getContextPath()%>/front/mealService/ChooseMeal.jsp" class="btn btn-primary" role="button">選擇日期</a>
									<button type="submit" class="btn btn-success pull-right">送出訂單</button>
								</div>
								
								
							</form>
							
						</div>
						
					</div>
				</div>
				<!-- 	我是右邊內容結束	 -->
			</div>
		</div>
	<!-- 是footer bar 不要亂刪 感謝～～ ==================================================================== -->
	
	    <footer>
              <div class="newnavbart" style="position: relative;margin-top:10px">
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
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

</body>

</html>