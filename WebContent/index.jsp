<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML>  
<html class="no-js" lang="de"> 
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="keywords" content="">

    <title>有我罩你</title>

    <!-- index CSS  =================================== -->
    <link href="<%=request.getContextPath()%>/front/css/index/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <link href="<%=request.getContextPath()%>/front/css/index/bootsnav.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front/css/index/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front/css/index/newstyle.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front/css/index/service.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front/css/index/normalize.css"  rel="stylesheet" type="text/css" />
    <link href='http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css' rel='stylesheet prefetch' >
    <link href="<%=request.getContextPath()%>/front/css/index/htmleaf-demo.css" rel="stylesheet" type="text/css" >
    <!-- index CSS  =================================== -->


<style type="text/css">
.aboutUs_img{
	background: url(<%=request.getContextPath()%>/img/index/BigImg/bannerAbout.jpg) no-repeat center center scroll;

}
</style>
<%@ include file="/front/css/navbar/navCss.file" %>

</head>
<body>     


        
 <!-- NavBar =========================================================================== -->
 
<%@ include file="/front/navbar.jsp" %>

<!-- <nav class="navbar navbar-default navbar-fixed-top newnavbartoppp" role="navigation"> -->
<!--     <div class="container-fliud"> -->
<!--         <div class="navbar-header"> -->
<!--             <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"> -->
<!--             </button> -->
<%--             <a class="navbar-brand" href="#"><img src="<%=request.getContextPath()%>/img/index/logo/logo_white.png" style="width:40px"" style="width: 40px;"></a> --%>
<!--         </div> -->
        
<!--         手機隱藏選單區 -->
<!--         <div class="collapse navbar-collapse navbar-ex1-collapse" id="navbarTopColor"> -->
        
        
        
<!--   <!--  開始放鏈結區 ======================================================================== --> -->
<!--             <ul class="nav navbar-nav navnavnav"> -->
<!--                 <li><a href="#">關於我們</a></li> -->
<!--                 <li class="dropdown newdropdown"> -->
<!--                     <a href="#" class="dropdown-toggle newtoggle" data-toggle="dropdown">最新消息 <b class="caret"></b></a> -->
<!--                     <ul class="dropdown-menu dropdownNew"> -->
<%--                         <li><a href="<%=request.getContextPath()%>/front/newsdetail/allNew.jsp">最新消息</a></li> --%>
<%--                         <li><a href="<%=request.getContextPath()%>/front/healthnews/allNew.jsp">保健資訊</a></li> --%>
<!--                     </ul> -->
<!--                 </li> -->
<!--                 <li class="dropdown newdropdown"> -->
<!--                     <a href="#" class="dropdown-toggle newtoggle" data-toggle="dropdown">照護服務 <b class="caret"></b></a> -->
<!--                     <ul class="dropdown-menu dropdownNew"> -->
<%--                         <li><a href="<%=request.getContextPath()%>/front/homeCare/Hc_order.jsp">短期照護服務</a></li> --%>
<%--                         <li><a href="<%=request.getContextPath()%>/front/homeCare/Hc_order_long.jsp">長期照護服務</a></li> --%>
<!--                         <li><a href="#">Q&A</a></li> -->
<!--                     </ul> -->
<!--                 </li> -->
<!--                 <li><a href="#">派車服務</a></li> -->
<%--                 <li><a href="<%= request.getContextPath()%>/front/mealService/MealIndex.jsp">送餐服務</a></li> --%>
<!--                 <li><a href="#">商城</a></li> -->
<!--                 <li><a href="#"  class="aboutUs">聯絡我們</a></li> -->
<!--             </ul> -->
        
        
        
<!--             右選單 -->
<!--             <ul class="nav navbar-nav navbar-right"> -->
<%--             <c:if test="${memberVO!=null}"> --%>
<%--                 <li><a href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">${memberVO.memName} 您好</a></li> --%>
<%--             </c:if>    --%>
            
<%--             <c:choose> --%>
<%-- 				<c:when test="${memberVO==null}"> --%>
<!-- 					<li> -->
<%-- 					<a href="<%=request.getContextPath()%>/front/Login.jsp">登入  / 註冊</a> --%>
<!-- 					</li> -->
<%-- 				</c:when> --%>
<%-- 				<c:when test="${memberVO!=null}"> --%>
<!-- 					<li> -->
<%-- 					<a href="<%=request.getContextPath()%>/member/member.do?action=logout">登出</a> --%>
<!-- 					</li> -->
<%-- 				</c:when> --%>
<%-- 			</c:choose>  --%>

<!--                 <li class="dropdown"> -->
<!--                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">會員中心 <b class="caret"></b></a> -->
<!--                     <ul class="dropdown-menu dropdownNew"> -->
<%--                         <li><a href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">會員資料管理</a></li> --%>
<%--                         <li><a href="<%=request.getContextPath()%>/front/member/MyWallet.jsp">我的錢包</a></li> --%>
<%--                         <li><a href="<%=request.getContextPath()%>/front/member/MemberHcOrder.jsp">訂單管理</a></li> --%>
                        
<!--                     </ul> -->
<!--                 </li> -->
<!--             </ul> -->
            
<!--  開始放鏈結區 ======================================================================== -->


        </div>
        <!-- 手機隱藏選單區結束 -->
    </div>
</nav>








<!--  首頁旋轉木馬=========================================================================== -->


<div id="carousel-id" class="carousel slide" data-ride="carousel">
    <!-- 幻燈片小圓點區 -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-id" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-id" data-slide-to="1" class=""></li>
        <li data-target="#carousel-id" data-slide-to="2" class=""></li>
        <li data-target="#carousel-id" data-slide-to="3" class=""></li>
    </ol>
    <!-- 幻燈片主圖區 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="<%=request.getContextPath()%>/img/index/bannar/home-care-services.jpg" id="couImg"  alt="">
            <div class="container">
                <div class="carousel-caption">
                    <h1 class="h1_index_1">當為家人而奔波 感到心力交錯</h1>
                    <p class="h2_index_1">有我罩你提供三大服務 照顧您全家</p>
                    <p><a class="btn btn-lg btn-primary btn_index_1" href="<%=request.getContextPath()%>/front/Login.jsp" role="button">加入會員</a></p>
                </div>
            </div>
        </div>
        <div class="item" id="foodCarousel">
            <img src="<%=request.getContextPath()%>/img/index/bannar/Food_Family.jpg" id="couImg"  alt="">
            <div class="container">
                <div class="carousel-caption" id="couText">
                    <h1 class="h1_index_2">鮮烹熱送好暖心</h1>
                    <p class="h2_index_2">利用天然食材組合搭配，形成風味絕佳餐點，調養保障健康</p>
                    <p><a class="btn btn-lg btn-danger" href="<%= request.getContextPath()%>/front/mealService/MealIndex.jsp" role="button">詳細內容</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="<%=request.getContextPath()%>/img/index/bannar/asian-american.jpg" id="couImg"  alt="">
            <div class="container">
                <div class="carousel-caption">
                    <h1 class="h1_index">生活用品一次搞定</h1>
                    <p class="h2_index">專人專員貼心及時送到您手上</p>
                    <p><a class="btn btn-lg btn-primary" href="<%=request.getContextPath()%>/front/shopindex.jsp" role="button">詳細內容</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="<%=request.getContextPath()%>/img/index/bannar/wheelchair.jpg" id="couImg"  alt="">
            <div class="container">
                <div class="carousel-caption" id="fourTit">
                    <h1 class="h1_index_3">長期回診 醫院家裡兩邊跑</h1>
                    <p class="h2_index_3">有我罩你 提供天天定時接送服務</p>
                    <p><a class="btn btn-lg btn-warning" href="<%=request.getContextPath()%>/front/carorder/CarOrder.jsp" role="button">詳細內容</a></p>
                </div>
            </div>
        </div>

    </div>
    <!-- 上下頁控制區 -->
    <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left fa fa-chevron-left"></span></a>
    <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right fa fa-chevron-right"></span></a>
</div>


<!--  首頁旋轉木馬=========================================================================== -->











<!--  四大服務================================================================================= -->


<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12">

      <h1 class="service_top">服務項目</h1>
      <div class="service_title">提供三大服務及便利商城 </div>
    </div>
        </div>
    </div>

<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12"></div>
    </div>
    <div class="row topService">
<ul class="cbp-ig-grid">
    <li class="spaceForService">
        <a href="<%=request.getContextPath()%>/front/homeCare/Hc_order.jsp">
            <span class="cbp-ig-icon"><img src="<%=request.getContextPath()%>/img/index/share/09_white.png"></span>
            <h3 class="cbp-ig-title">長照服務</h3>
            <span class="cbp-ig-category">Long Term Care</span>
        </a>
    </li>
    <li class="spaceForService">
        <a href="<%=request.getContextPath()%>/front/carorder/CarOrder.jsp">
            <span class="cbp-ig-icon"><img src="<%=request.getContextPath()%>/img/index/share/06_white.png"></span>
            <h3 class="cbp-ig-title">派車服務</h3>
            <span class="cbp-ig-category">Car</span>
        </a>
    </li>
    <li class="spaceForService">
        <a href="<%= request.getContextPath()%>/front/mealService/MealIndex.jsp">
            <span class="cbp-ig-icon"><img src="<%=request.getContextPath()%>/img/index/share/02_white.png"></span>
            <h3 class="cbp-ig-title">送餐服務</h3>
            <span class="cbp-ig-category">Meal</span>
        </a>
    </li>
    <li class="spaceForService">
        <a href="<%=request.getContextPath()%>/front/shopindex.jsp">
            <span class="cbp-ig-icon"><img src="<%=request.getContextPath()%>/img/index/share/07_white.png"></span>
            <h3 class="cbp-ig-title">商&nbsp&nbsp城</h3>
            <span class="cbp-ig-category">Shopping</span>
        </a>
    </li>
</ul>
</div>
</div>

<!--  四大服務=========================================================================== -->



<!--  關於我們=========================================================================== -->

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-12">
            <div class="aboutUs_img">
                <div class="row">
                <div class="col-xs-12 col-sm-4">
             <div class="aboutUs_Title">
              <p class="Us_ti"><b>關於我們</b></p>
              <p class="Us_index">有我罩你專業團隊以長者為中心，提供一站式資源，提供高品質銀髮居家照顧服務，包括一般生活陪伴、健康促進、失智症照顧、癌症照顧、安寧照顧、術後照顧及陪同就醫等...</p>
              <p><a class="btn btn-danger btn-lg" href="#" role="button">詳細內容</a></p>
              </div>
            </div>
            </div>
        </div>
    </div>
</div>
</div>

<!--  關於我們=========================================================================== -->








<!--  熱門商品=========================================================================== -->


<div class="container-fluid">
     <div class="row">
        <div class="col-xs-12 col-sm-12">
      <h1 class="pro_top">熱門商品</h1>
    </div>
        </div>
    <div class="row" id="prodet_img">
        <div class="col-xs-12 col-sm-2">

        <article class="card">
            <header class="card__thumb">
                <a href="http://localhost:8081/BA104G11_1128/shop.do?action=checkone&ITEMNO=1&PRO=0"><img src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=1"/></a>
            </header>

            <div class="card__body">
                <div class="card__category"><a href="#">特價商品</a></div>
                <h2 class="card__title"><a href="http://localhost:8081/BA104G11_1128/shop.do?action=checkone&ITEMNO=1&PRO=0">【Daiwa】日本製通用輔助筷</a></h2>
                <div class="card__subtitle">長輩年紀漸長，手指力量退化，或者因為中風...</div>
                <p class="card__description"><a id="des_pri">$499元</a><br>強力特價</p>
                <p class="delet_pri">原價 ＄1000</p>   
            </div>

        </article>
    </div>
    <div class="col-xs-12 col-sm-2">
        <article class="card">
            <header class="card__thumb">
                <a href="http://localhost:8081/BA104G11_1128/shop.do?action=checkone&ITEMNO=9&PRO=1"><img src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=9"/></a>
            </header>

            <div class="card__body">
                <div class="card__category"><a href="#">特價商品</a></div>
                <h2 class="card__title"><a href="http://localhost:8081/BA104G11_1128/shop.do?action=checkone&ITEMNO=9&PRO=1">樂齡室內福祉拖鞋</a></h2>
                <div class="card__subtitle">一般室內平底拖鞋由於整個鞋底機觸地面，容易造...</div>
                <p class="card__description"><a id="des_pri">$100元</a><br>強力特價</p>
                <p class="delet_pri">原價 ＄1000</p>   
            </div>

        </article>
        </div>
        <div class="col-xs-12 col-sm-2">
        <article class="card">
            <header class="card__thumb">
                <a href="http://localhost:8081/BA104G11_1128/shop.do?action=checkone&ITEMNO=13&PRO=0"><img src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=13"/></a>
            </header>

           <div class="card__body">
                <div class="card__category"><a href="#">特價商品</a></div>
                <h2 class="card__title"><a href="http://localhost:8081/BA104G11_1128/shop.do?action=checkone&ITEMNO=13&PRO=0">【Famica】睡眠專用床護欄</a></h2>
                <div class="card__subtitle">有些銀髮長者由於各種因素，從床上起身或躺下時...</div>
                <p class="card__description"><a id="des_pri">$100元</a><br>強力特價</p>
                <p class="delet_pri">原價 ＄1000</p>   
            </div>

        </article>
        </div>
        <div class="col-xs-12 col-sm-2">
        <article class="card">
            <header class="card__thumb">
                <a href="http://localhost:8081/BA104G11_1128/shop.do?action=checkone&ITEMNO=19&PRO=0"><img src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=19"/></a>
            </header>

           <div class="card__body">
                <div class="card__category"><a href="#">特價商品</a></div>
                <h2 class="card__title"><a href="http://localhost:8081/BA104G11_1128/shop.do?action=checkone&ITEMNO=19&PRO=0">相片輔記助聽電話</a></h2>
                <div class="card__subtitle">電話聽不清楚嗎? 怕記不住電話嗎? 按鍵太小看不清嗎?..</div>
                <p class="card__description"><a id="des_pri">$100元</a><br>強力特價</p>
                <p class="delet_pri">原價 ＄1000</p>   
            </div>

        </article>
        </div>
    </div>
    
    </div>
</div>

<!--  熱門商品 ====================================================================== -->




<!--  聯絡我們 ====================================================================== -->

<a id="con"></a>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-5">
            <img src="<%=request.getContextPath()%>/img/index/BigImg/custom.png" id="count_img">
        </div>
        <div class="col-xs-12 col-sm-6" id="content_form">
            <div class="form-group">
                <div class="form_main">
                <h1 class="count_top">聯絡我們</h1>
                <h4 class="heading"><strong>Quick </strong> Contact <span></span></h4>
                <div class="form">
<!--                 <form action="contact_send_mail.php" method="post" id="contactFrm" name="contactFrm"> -->
                    <input type="text" required="" placeholder="請輸入姓名" value="" name="name" class="txt">
                    <input type="text" required="" placeholder="請輸入電話" value="" name="mob" class="txt">
                    <input type="text" required="" placeholder="請輸入E-mail" value="" name="email" class="txt">
                    
                     <textarea placeholder="請輸入內容" name="mess" type="text" class="txt_3"></textarea>
                     <input type="submit" value="submit" name="submit" class="txt2 btn-block" >
                </form>
            </div>
            </div>
            </div>
        </div>
    </div>
</div>


<!--  聯絡我們 ====================================================================== -->







<!--  footer ========================================================================= -->

<!--  footer連結 ====================================================================== -->
 <div class="footer" id="footer">
        <div class="container">
            <div id="footer_lab"></div>
            <div class="row" id="footer_tit">
                <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3> 團隊介紹 </h3>
                    <ul>
                        <li> <a href="#"> 關於我們 </a> </li>
                       <li> <a href="<%=request.getContextPath()%>/front/newsdetail/allNew.jsp"> 最新消息 </a> </li>
                        <li> <a href="<%=request.getContextPath()%>/front/healthnews/allNew.jsp"> 保健資訊 </a> </li>
                    </ul>
                </div>
                <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3> 居家照護 </h3>
                    <ul>
                        <li> <a href="<%=request.getContextPath()%>/front/homeCare/Hc_order.jsp"> 長照服務 </a> </li>
                        <li> <a href="<%=request.getContextPath()%>/front/carorder/CarOrder.jsp"> 派車服務 </a> </li>
                        <li> <a href="<%= request.getContextPath()%>/front/mealService/MealIndex.jsp"> 送餐服務 </a> </li>
                    </ul>
                </div>
                <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3> 會員中心 </h3>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">會員資料管理</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/member/MyWallet.jsp">我的錢包</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/member/MemberHcOrder.jsp">訂單管理</a></li>
                    </ul>
                </div>
                 <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3> 聯絡我們 </h3>
                    <ul>
                        <li> <a href="#" class="aboutUs"> 意見回饋 </a> </li>
                    </ul>
                </div>
                <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3 id="footer_img"><img src="https://api.fnkr.net/testimg/150x150/00CED1/FFF/?text=img+placeholder"></h3>
                </div>
            
            </div>
            <!--/.row--> 
        </div>
        <!--/.container-->
    </div>
    
	<!--  footer連結 ====================================================================== -->



<footer>
        <div class="container-fluid" id="footer_footer">
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <p>BA104G1&nbsp©&nbsp2017 有我罩你</p>
                </div>
            </div>
        </div>
</footer>


<!--  footer ====================================================================== -->



    
	<!-- START JAVASCRIPT -->
<!--     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<%--     <script src="<%=request.getContextPath()%>/front/js/index/bootstrap.min.js"></script> --%>
    
    <!-- Bootsnavs --> 
    <script src="<%=request.getContextPath()%>/front/js/index/bootsnav.js"></script>
	<!-- START JAVASCRIPT -->
</body>
<!-- <script src="https://code.jquery.com/jquery.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


<script>
$(document).ready(function () {
	$(".btnTomail").on('click', function () {
		swal({
		  	title: '成功送出',
		  	type:	'success',
		  	timer: 4500
		}).then(
		  	function (dismiss) {
		  		if (dismiss === 'timer') {
		  		   console.log('I was closed by the timer')
		  		  }
		  		}
			)
		});
	});
</script>
</html>
