<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang=""> 
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>送餐服務主頁</title>
      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ include file="/front/css/navbar/navCss.file" %>
<!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/front/css/mealService/mealIndex.css">
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

		<div class="container center-block">
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

				<!-- 右邊顯示 -->

				<div class="col-xs-12 col-sm-10">
					<div class="container c1">
						<div class="row">
							<div class="col-xs-12 col-sm-6 block_1-1 col-fixed">
								<h3>
									我們是餐桌上 <br> 的營養飲食管家
								</h3>
								<p>
									創辦人過去長照個案中，深切感受到病人及病人家屬各項居家照護的不便，希望大家都能「過好生活、好好吃飯、體驗美好事物」，願望渺小卻很真實。開創提供長照病人全方位調配營養餐服務，以安心、同理心為出發點、並以醫護專業為後盾，致力提供
									對長照病人營養餐點外送服務。</p>
							</div>
							<div class="col-xs-12 col-sm-6 block_1-2 col-fixed">
								<h3>
									讓人更健康 <br> 生活更美好 <br> 是我們存在的價值
								</h3>
								<p>透過全方位的守護健康，讓人快樂的追求人生夢想，享受生命的美好！</p>
							</div>
						</div>


						<div class="row">
							<div class="col-xs-12 col-sm-6 block_2-1 col-fixed ">
								<img
									src="<%=request.getContextPath()%>/img/mealService/sample.jpg">
							</div>

							<div class="col-xs-12 col-sm-6 block_2-2 col-fixed">
								<h3>服務內容</h3>
								<p>
									每餐營養師設計餐點含有 <br> 元氣米食、健康主食、滋養湯品、季節食蔬、養身飲品、甜品各一份 <br>
									<br> 可透過病人身體狀況,選擇適合的套餐 <br> 另外也會因當令食材、產地氣候、彈性調整內容
								</p>
							</div>
						</div>

						<!-- 套餐連結 -->
						<div class="container CNTR3">
							<div class="row">
								<div class="col-xs-12 col-sm-3 ">
									<div class="item"
										onclick="location.href='<%=request.getContextPath()%>/front/mealService/mealIntroA.jsp'">
										<img
											src="<%=request.getContextPath()%>/DBGifReaderForSetMeal?picNo=1&smNo=10"
											height="200" width="200">
										<h2>活力養身餐</h2>
										<p>適合一般病人</p>
									</div>
								</div>
								<div class="col-xs-12 col-sm-3">
									<div class="item"
										onclick="location.href='<%=request.getContextPath()%>/front/mealService/mealIntroB.jsp'">
										<img
											src="<%=request.getContextPath()%>/DBGifReaderForSetMeal?picNo=1&smNo=20"
											height="200" width="200">
										<h2>疾病健康餐</h2>
										<p>適合有慢性疾病病人</p>
									</div>
								</div>
								<div class="col-xs-12 col-sm-3">
									<div class="item"
										onclick="location.href='<%=request.getContextPath()%>/front/mealService/mealIntroC.jsp'">
										<img
											src="<%=request.getContextPath()%>/DBGifReaderForSetMeal?picNo=1&smNo=30"
											height="100" width="100">
										<h2>術後調理餐</h2>
										<p>適合術後病人</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 是footer bar 不要亂刪 感謝～～ ==================================================================== -->
		<footer>
              <div class="newnavbart">
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

</html>