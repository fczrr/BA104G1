<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*, com.detail.cart.CartVO ,com.detail.promotion.*"%>

<%
ShopVO shopVO = (ShopVO) request.getAttribute("shopVO");
ProVO proVO = (ProVO) request.getAttribute("proVO");

//此段複寫equals 去比較itemno
ShopService shopSvc = new ShopService();
List<ShopVO> list = shopSvc.getAll();


ProService proSvc = new ProService();
List<ProVO> list2 = proSvc.getAllProNow();
List listforpro=list2;
pageContext.setAttribute("listforpro", list2);

//	list.remove(list2);
List<ShopVO> list3 = new ArrayList<ShopVO>();
for(ShopVO vo:list){
	Boolean tag = false;
	for(ProVO vo2:list2){
		if(vo.equals(vo2)){
			tag = true;
		}
	}
	if(!tag){
		list3.add(vo);
	}
}
pageContext.setAttribute("list", list3); // forEach EL用
list = list3;// include page1.file JSP用



%>

<html lang="">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 此行為顯示IE相容性版本 -->
<meta name="viewport"
  content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<link rel="shortcut icon" href="imgs/Houselogo1.png" />
<title>有你真好-商品頁面</title>

<!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/bootstrap.css" media="screen">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/usebootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/newstyle_footer.css">
  <!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
<!-- <link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
  <!-- 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script>
        <script type="text/javascript">  
   
        
        $(document).ready(function(){ 
        
        	
        	console.log('in jquery1');
            $('form').on('submit',function(event){
                event.preventDefault();
                console.log('form')
            	console.log($(this).children().eq(0).val());


                var STOCK = $(this).children().eq(0).val();
                var action = $('#action').val();
                var ITEMNO = $('#ITEMNO').val();
                console.log('STOCK :'+STOCK+' ,ITEMNO :'+ITEMNO+' ,action :'+action);

                     $.ajax({  
                        type: "POST",  
                        url: "cart.do",  
                        data: {"STOCK" : STOCK,"action" : action,"ITEMNO" : ITEMNO},  
                        success: function(msg){
                        	swal({
                        		  title: '',
                        		  text: "已成功加入購物車。",
                        		  type: 'success',
//                         		  timer: 5000,
                        		  showCancelButton: true,
                                  confirmButtonColor: "#8fdd54",
                                  cancelButtonColor: "#DD6B55",
                        		  confirmButtonText: '前往購物車',
                        		  cancelButtonText: '  OK  ',
                        		  confirmButtonClass: 'btn btn-success',
                        		  cancelButtonClass: 'btn btn-danger',
                        		  buttonsStyling: false
                        		}).then(function () {
                        			console.log('按下左邊');
                        			 window.location.href ='<%=request.getContextPath()%>/MasterOrder/Cart.jsp';
                        		}, function (dismiss) {
                        		  // dismiss can be 'cancel', 'overlay',
                        		  // 'close', and 'timer'
                        		  if (dismiss === 'cancel') {
                        			  console.log('按下右邊');
                        		  }
                        		})
                     		$('.swal2-cancel').css('height', '34px').css('margin-left', '10px').css('width','100px').css('padding','6px 12px').css('border-radius','4px');
                     		$('.swal2-confirm').css('height', '34px').css('margin-left', '10px').css('width','100px').css('padding','6px 12px').css('border-radius','4px').css('background-color','#5cb85c');
    
//                        	sweetAlert("", "已成功加入購物車。","success");
//                         	$('#myModal').modal();
                        }  
                    });   
               
                

            });  
        });  
      </script>  
      
      

      
      
<style type="text/css">

/*強迫限制大小*/
.limited {
  width: 64.3em;
}
/*跳窗套件控制*/
.btn-danger {
	margin-left: 10;
	width: 100px;
}

/*水平置中*/
.vertical-horizontal::before {
  content: '';
  width: 0;
  height: 100%;
  display: inline-block;
  position: relative;
  vertical-align: middle;
  background: #f00;
}

/*hr美化*/
hr {
  height: 2px;
  background-color: #555;
  margin-top: 20px;
  margin-bottom: 20px;
  width: 100%;
}
/*強迫不換行*/
.sameRow {
  display: inline
}
/*預約看屋按鈕*/
.check_btn {
  width: 100%;
  background-color: #0678c2;
  color: white;
  box-shadow: 2px 2px 2px gray;
}
/*收藏房屋按鈕*/
.follow_btn {
  width: 100%;
  background-color: #F6BF02;
  color: white;
  box-shadow: 2px 2px 2px gray;
}
/*主區塊*/
.main_block {
  background: #eeeeee;
  border: solid 1px #dddddd;
}
/*主區塊圖片*/
.main_img {
  min-width: 600px;
  max-width: 600px;
  min-height: 400px;
  max-height: 400px;
}

.main_img img {
  min-width: 600px;
  max-width: 600px;
  min-height: 400px;
  max-height: 400px;
}

/*主區塊標題*/
.info_title {
  margin-top: 0;
  font-size: 2em;
  font-weight: bold;
  font-family: Microsoft JhengHei;
}
/*主區塊價錢*/
.price_highlight {
  color: red;
  font-size: 2em;
  font-weight: bold
}
/*主區塊小字區塊*/

/*主區塊的小字區塊的小字*/
.main_block_detail div {
  font-family: Microsoft JhengHei;
  font-size: 1.2em
}
/*細節表單*/
.detail-total-form {
  /*border: solid 1px #dddddd;*/
  background: #ffffff;
}
/*細節表單每個td標籤*/
.detail-total-form td {
  height: 3.5em
}


.detail-total-form td li {
  line-height: 1.5em
}
/*細節表單每個td標籤都垂直置中*/
.detail-total-form td::before {
  content: '';
  width: 0;
  height: 100%;
  display: inline-block;
  position: relative;
  vertical-align: middle;
  background: #f00;
}
/*主區塊外的標題*/
.form_title {
  font-weight: bold;
  font-size: 1.5em;
  color: #f37748;
}
/*廣告CSS*/
#abgne_float_ad {
  display: none;
  position: absolute;
}

#abgne_float_ad img {
  border: none;
}

.ad_btn {
  width: 100px;
  height: 60px;
}
/*廣告CSS結束*/
#map {
  height: 400px;
  width: 100%;
}
/*一欄推薦物件*/
.rec_item {
  background-color: white
}

.rec_item * {
  color: black
}
/*推薦物件的圖片*/
.rechouse_Img {
  width: 100%;
  height: 210px
}
/*推薦物件的標題*/
.rec_price h4 {
  color: red;
}

.mb10 {
  margin-bottom: 20px
}

.w80 {
  width: 80%;
}

.pd20 {
  padding: 20px;
}

div.backgroundpng {
  position: fixed;
  top: 0;
  z-index: -15;
}

.backgroundpng img {
  width: 115%;
  opacity: 0.9;
}

body {
  font-family: Arial, Verdana, Helvetica, "LiHei Pro Medium", 微軟正黑體,
    sans-serif;
}

.special-price {
	font-size: 1.3em;
	color: red;
}

.price.old-price {
	text-decoration: line-through;
}

.navbar {
/*   background-color: #ffffff; */
  margin-bottom: 0;
  border-radius: 0;

}

.navshadow {
  box-shadow: 0px 2px 1px #bdbdbd;
}

.activebar>li>a {
  background-color: #ffffff;
  font-size: 22px;
  padding-top: 30px;
  padding-bottom: 0px;
  height: 80px;
}

.logina>li>a {
  background-color: #ffffff;
  padding-top: 2em;
  padding-bottom: 0px;
  height: 80px;
}

.title-carousel-control {

    padding: 10px;
    border-radius: 0;
    text-decoration: none;
    color: #333;
}

.backgroundpng {
  position: fixed;
  top: 0;
  z-index: -15;
}

.backgroundpng img {
  width: 115%;
  opacity: 0.9;
}

.form-control {
  height: 38.4px;
  border-radius: 0px;
}

.searchbar {
  position: absolute;
  top: 21em;
}

.search-filter {
  height: 38.4px;
  text-align: center;
  border: none;
  font-size: 20px;
}

.search-form-btn {
  color: #fff;
  background: #231f20;
  border: none;
  height: 38.4px;
  border-radius: 0 3px 3px 0;
  width: calc(60px);
}

.navbar-brand {
  z-index: 20;
}

.navbar-brand img {
  background-color: #FFF;
  border-radius: 15px;
}

.tooltip-inner {
  font-size: 22px;
  background-color: #fff;
  border-radius: 0px;
}

.btn-success:hover {
    background-color: #449d44;
    border-color: #398439;
    color: #ffe200;
}

.input-group-btn:last-child>.btn, .input-group-btn:last-child>.btn-group
  {
  padding-top: 0.7em;
}

a {
  color: #00ADEE;
}

a:hover {
  text-decoration-line: none;
}

a:active {
  　text-decoration-line: none;
}

a:visited {
  text-decoration-line: none;
}

footer {
  font-weight: 700;
  background-color: white;
  position: absolute;
  width: 100%;
  padding: 25px;
  padding-top: 4em;
}

.copyri {
  margin-top: 3em;
}

nav * {
  font-weight: bold;
}

.unlimited {
  width: 69%;
}

.mid-content-title {
  font-size: 18px;
  margin: 0;
  background: -webkit-gradient(linear, left top, left bottom, from(#f9ca52),
    to(#ed3123));
  background: -moz-linear-gradient(top, #f9ca52, #ed3123);
  margin: 15px 0;
  color: #fff;
  padding: 8px 12px;
}

.breadcrumb {
  font-size: 18px;
  margin: 0;
  background: -webkit-gradient(linear, left top, left bottom, from(#f9ca52),
    to(#ed3123));
  background: -moz-linear-gradient(top, #f9ca52, #ed3123);
  margin: 15px 0;
  color: #fff;
  padding: 8px 12px;

}
.shopname{
color: #333;
    border: solid 1px #dddddd;
    background-color: #f5f5f5;
    border-color: #ddd; 
    border-top-left-radius: 5px; 
    border-top-right-radius: 5px;  
    border-bottom: 1px solid transparent;
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-bottom-width: 1px;
    border-bottom-style: solid;

}

.shopname2{
      font-family: Microsoft JhengHei;
      margin: 0;
      font-weight: 600;
      font-size: 24px;
}


.pull-text-center:hover {
	background-color: #ffffe0
}

.offer.offer-default.silde-show-offer.pull-text-center {
	height: 420px;
}

.offer-default {
	border-color: #999;
	padding: 10px;
}

.offer {
	background: #fff;
	border: 1px solid rgba(221, 221, 221, 0.45);
	box-shadow: 0 10px 20px rgba(0, 0, 0, .2);
	margin: 15px 0;
	overflow: hidden;
}

.pull-text-center {
	text-align: center;
}

.product-title {
	font-size: 20px;
	font-weight: 600;
	line-height: 20px;
}

</style>
</head>
<body>
  <div class="backgroundpng">
    <img class="backgroundpng" src="<%=request.getContextPath()%>/images/tooopen.jpg">
  </div>

  <div style="height: 50px"></div>


  

  <!-- 麵包屑 -->


  <div class="limited container ">

    <div class="col-xs-12 col-sm-3"></div>
    <div class="row">
    <ol class="breadcrumb">
      <li><a href="<%=request.getContextPath()%>/front/shopindex.jsp" style="color:#fff;"><strong>首頁</strong></a></li>
      <li><a href="<%=request.getContextPath()%>/front/shopindex.jsp" style="color:#fff;"><strong>${(proVO.NAME!=null)?proVO.NAME:'商品區'}</strong></a></li>
      <li class="active" style="color:#fff;"><strong>${((shopVO.NAME)==null)?proVO.SHOPNAME:shopVO.NAME}</strong></li>
    </ol>
    </div>
    <div class="col-xs-12 col-sm-9"></div>
<div class="col-xs-12 col-sm-3"></div>
    <div class="row shopname" >
      <div class="shopname2">
  <h3 style="margin: auto;">${shopVO.NAME}</h3>
    </div>
  </div>
   </div>

  <!-- 主區塊 -->
  <div class="limited container main_block">
    <div class="row" style="background: white;">
      <!-- 主區塊左側 -->
      <div class="col-xs-12 col-sm-6">
        <div style="padding: 15px; ">
        <td width="200"><img src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=${((shopVO.ITEMNO)==null)?proVO.ITEMNO:shopVO.ITEMNO}" height="350px" width="100%">
          </div>

      </div>
      <!-- 左側區塊結束 -->
      <!-- 主區塊右側 -->

      <div class="col-xs-12 col-sm-6">
        <div class="col-sx-12 col-sm-12"
        style="border: 1px solid #eee; height: 400px;margin-top: 10px;
    margin-bottom: 15px;">
          <!-- 標題 -->

          <!-- 地區+編號+價錢 -->
          <div class="row info_title">


          
          <!-- 主要區塊的細節們 -->
          <table class="table table-hover">
        <thead>
        <tr>商品資訊</tr>
        </thead>
        <tbody>
          <tr style="font-size: 19px;">
            <td>${((shopVO.DES)==null)?proVO.DES:shopVO.DES}</td>
          </tr>


        </tbody>
      </table>
      </div>
          <div class="row main_block_detail" style="margin-left:0px;margin-bottom: 25px;">
            <div>網路會員價:
            <span style="color: #B80709; font-size:35px;font-weight: 700;">$${((shopVO.PRICE)==null)?proVO.PRICE:shopVO.PRICE}</span>
            </div>
          </div>
  
          <div class="row">

              <div class="col-xs-12 col-sm-4" style="font-size: 25px;">購買數量:</div>
              <div class="col-xs-12 col-sm-2">
              <FORM METHOD="post">
                <input  type="number" value="1" id="STOCK" style="text-align:center;border-radius:4px;width:50px;height: 34px;border: 1px solid">
              </div>
              <div class="col-xs-12 col-sm-4">
                <input type="hidden" name="action" value="${(isPro==1)?'ADD2':'ADD'}" id="action" ">
                <input type="hidden" name="ITEMNO" value="${((shopVO.ITEMNO)==null)?proVO.ITEMNO:shopVO.ITEMNO}" id="ITEMNO" ">
                <input type="submit" id="forcatch" class="btn btn-sm btn-success"  value="放入購物車"  style="font-family: Microsoft JhengHei;border-radius: 3px;background-color: green;font-size: 16px;">
    			</FORM>
              </div>

          </div>

        </div>
      </div>
      <!-- 主區塊右側結束 -->
    </div>
    <!-- 主區塊第一列結束 -->
  </div>
  <!-- 主區塊結束 -->

  <!-- 分隔線 -->
  <div class="limited container">
    <div class="row">
      <hr>
    </div>
  </div>



  <!-- 詳細資訊表單開始 -->
  <div class="limited container detail-total-form">
    <!-- 詳細資訊表格左邊 -->
    <!-- 其中一欄資訊表格開始 -->
    <div style="height:185px;">
      <h3 class="form_title">注意事項:</h3>
      <table class="table">

        <thead>
        </thead>
        <tbody>
          
          <tr>
					<td style="font-weight: 700;color: #993300;font-size: medium;font-family: 新細明體;">
					經銷商/代理商/進口商：有你真好事業股份有限公司<br>
					 免付費服務專線：0800-090-000<br>
					如有大額採購或經銷需求，請來電洽詢，將有業務人員與您聯絡。
					<br></td>
					</tr>


        </tbody>
      </table>

    </div>
   </div>
   
       <title >有我罩你</title>
  <!-- 頁面標題 ================================================== -->
    
    <meta name="viewport" content="width=device-width, initial-scale=1">

  
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="bootstrap/html5shiv.js"></script>
      <script src="bootstrap/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>
  

<!-- image資料夾 - share裡有 一些小圖示可使用 (都是.png檔//是透明底圖//) -->

<!-- 大家的各自頁面拜託記得要加上註解 這樣之後整合 會比較好找到 -->
<!-- 各自 CSS & JS 資料夾記得取名歸類  -->

<!-- 專題加油～～～～～  -->



<!-- 是Navbar 不要亂刪 感謝～～ ==================================================================== -->

<div class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
            
<!-- logo 區 稍後會補上 ================================================== -->
    <a href="#" class="navbar-brand" style="color: black;">
      <img src="" >有我罩你
    </a>
<!-- logo 區 稍後會補上 ================================================== -->

      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>


    <div class="navbar-collapse collapse" id="navbar-main">
              

    		 
  <!-- 各項button 連結請自行找 <a href= "填入自己的頁面連結 (溫腥提醒:記得用動態) "> ================== -->

      <ul class="nav navbar-nav">
                
        <!-- 關於我們 ================================================== -->
        <li>
          <a href="#">關於我們</a>
        </li>
  <!-- 關於我們 ================================================== -->


  <!-- 最新消息 ================================================== -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes">最新消息 <span class="caret"></span></a>
          <ul class="dropdown-menu" aria-labelledby="themes">
            <li><a href="#">最新消息</a></li>
            <li><a href="#">保健資訊</a></li>
          </ul>
        </li>
  <!-- 最新消息 ================================================== -->



  <!-- 長照服務 ================================================== -->
        <li>
          <a href="#">長照服務</a>
        </li>
  <!-- 長照服務 ================================================== -->

  <!-- 派車服務 ================================================== -->
        <li>
          <a href="#">派車服務</a>
        </li>
  <!-- 派車服務 ================================================== -->


  <!-- 送餐服務 ================================================== -->
        <li>
          <a href="#">送餐服務</a>
        </li>
  <!-- 送餐服務 ================================================== -->


  <!-- 商城服務 ================================================== -->
        <li>
          <a href="<%=request.getContextPath()%>/front/shopindex.jsp">商&nbsp&nbsp&nbsp&nbsp城</a>
        </li>
  <!-- 商城服務 ================================================== -->


  <!-- 聯絡我們 ================================================== -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes">聯絡我們 <span class="caret"></span></a>
          <ul class="dropdown-menu" aria-labelledby="themes">
            <li><a href="#">線上客服</a></li>
            <li><a href="#">意見回饋</a></li>
          </ul>
        </li>
  <!-- 聯絡我們 ================================================== -->


      </ul>
      		  
      <ul class="nav navbar-nav navbar-right">


  <!-- 會員專區 ================================================== -->
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes">會員專區 <span class="caret"></span></a>
        <ul class="dropdown-menu" aria-labelledby="themes">
          <li><a href="#">會員資料管理</a></li>
          <li><a href="#">我的錢包</a></li>
          <li><a href="#">訂單管理</a></li>
          <li><a href="#">我的最愛</a></li>
        </ul>
      </li>
  <!-- 會員專區 ================================================== -->


  <!-- 登入 / 註冊 ================================================== -->
      <li><a href="#">登入 / 註冊 </a></li>
  <!-- 登入 / 註冊 ================================================== -->

      </ul>
    		  
    </div>
  </div>
</div>




<!-- 大圖bannan -->
<div class="container">
  <div class="page-header" id="banner">
  <div class="row">
    <div class="col-lg-6">
  
    </div>
  </div>
</div>
<hr>
<!-- 大圖bannan -->




<!-- 各項button 連結請自行找 <a href= "填入自己的頁面連結 (溫腥提醒:記得用動態) "> ================== -->


<!-- 這裡是JS專區 =========================================================== -->

<!-- <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script> -->
<%-- <script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script> --%>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>

<!-- 這裡是JS專區 =========================================================== -->

</body>
   
<!--    ---------------------------------- -->

<div class="container">
<div class="col-xs-12 col-sm-1"></div>
<div class="col-xs-12 col-sm-10" style="width:100%;">
	<div class="title mid-content-title">
            <strong>現正促銷</strong>
                    <span class="pull-right">
                    <a class="title-carousel-control" href="#carousel-recently-generic" data-slide="prev">
                        <i class="fa fa-angle-left">◀</i>
                    </a>
                    <a class="title-carousel-control" href="#carousel-recently-generic" data-slide="next">
                        <i class="fa fa-angle-right">▶</i>
                    </a>
                </span>
                  </div>
             <div id="carousel-recently-generic" class="carousel slide recently-added-products-page" data-ride="carousel">
             
            <div class="carousel-inner">

<%
	for (int i=0;i<listforpro.size();i++) {
		
		if(i==0||i%4==0){
			%>
			
				<div class="item <%=(i==0)?"active":""%>" >
					<div class="col-lg-3 col-md-3 col-sm-6 col-md-12">
                            <div class="offer offer-default silde-show-offer pull-text-center">
                               <div class="detail">
								<div class="picture thumbnail" title="<%=((ProVO)(listforpro.get(i))).getSHOPNAME()%>">
									<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>&PRO=1" title="<%=((ProVO)(listforpro.get(i))).getSHOPNAME()%>"><img class="img-responsive"
										img src="DBPicReader?ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>" height="180px"
										width="180px">
									</a>
								</div>
								<div class="middle-content">
									<h2 class="product-title">
										<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>&PRO=1"> <%=((ProVO)(listforpro.get(i))).getSHOPNAME()%></a>
									</h2>
									<div class="description"><%=((ProVO)(listforpro.get(i))).getDES().substring(0,15)%>...</div>
								</div>
							</div>
							<div class="add-info">
								<div class="ash-box">
								<div class="prices">
								<span class="price old-price">原價$<%=((ProVO)(listforpro.get(i))).getOLDPRICE()%></span> <span
											class="price special-price">特價$<%=((ProVO)(listforpro.get(i))).getPRICE()%></span>
									</div>
									<div class="buttons">
									<FORM METHOD="post" ACTION="cart.do" id="btnSubmit">
									<select name="STOCK" id="STOCK">
									<c:forEach var="quantity" begin="1" end="<%=((ProVO)(listforpro.get(i))).getQuantity()%>" step="1">
												<option value="${quantity}">${quantity}
											</c:forEach> </select>
											<input type="hidden" name="action" value="ADD2" id="action">
										<input type="hidden" id="ITEMNO" name="ITEMNO" value="<%=((ProVO)(listforpro.get(i))).getITEMNO()%>" id="ITEMNO" > 
										<input type="submit" class="btn btn-sm btn-success" value="放入購物車" style="background-color: green;font-size: 16px;     padding: 5px 10px;    font-family: Microsoft JhengHei;border-radius: 3px;" >
										</FORM>
										</div>
									</div>
								</div>
							</div>
                         </div>

		<%
	}else if(i!=1||i%4!=0){
	%>
					<div class="col-lg-3 col-md-3 col-sm-6 col-md-12">
                            <div class="offer offer-default silde-show-offer pull-text-center">
                               <div class="detail">
								<div class="picture thumbnail" title="<%=((ProVO)(listforpro.get(i))).getSHOPNAME()%>">
									<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>&PRO=1" title="<%=((ProVO)(listforpro.get(i))).getSHOPNAME()%>"> <img class="img-responsive"
										img src="DBPicReader?ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>" height="180px"
										width="180px">
									</a>
								</div>
								<div class="middle-content">
									<h2 class="product-title">
										<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>&PRO=1"> <%=((ProVO)(listforpro.get(i))).getSHOPNAME()%></a>
									</h2>
									<div class="description"><%=((ProVO)(listforpro.get(i))).getDES().substring(0,15)%>...</div>
								</div>
							</div>
							<div class="add-info">
								<div class="ash-box">
								<div class="prices">
								<span class="price old-price">原價$<%=((ProVO)(listforpro.get(i))).getOLDPRICE()%></span> <span
											class="price special-price">特價$<%=((ProVO)(listforpro.get(i))).getPRICE()%></span>
									</div>
									<div class="buttons">
									<FORM METHOD="post" ACTION="cart.do" id="btnSubmit">
									<select name="STOCK" id="STOCK">
									<c:forEach var="quantity" begin="1" end="<%=((ProVO)(listforpro.get(i))).getQuantity()%>" step="1">
												<option value="${quantity}">${quantity}
											</c:forEach> </select>
											<input type="hidden" name="action" value="ADD2" id="ADD2">
										<input type="hidden" id="ITEMNO" name="ITEMNO" value="<%=((ProVO)(listforpro.get(i))).getITEMNO()%>" id="ITEMNO" > 
										<input type="submit" class="btn btn-sm btn-success" value="放入購物車" style="background-color: green;font-size: 16px;    padding: 5px 10px;    font-family: Microsoft JhengHei;border-radius: 3px;" >
										</FORM>
										</div>
									</div>
								</div>
							</div>
                         </div>
	
	<%if(i==3||i%4==3){ %>
				</div>
			<%
			}
			%>
	<%
			} 
		}
	%>

				
			</div>
		</div>
	</div>
</div>
</div>


  <!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/usebootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/newstyle_footer.css">
  <!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="bootstrap/html5shiv.js"></script>
      <script src="bootstrap/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>
  

<!-- image資料夾 - share裡有 一些小圖示可使用 (都是.png檔//是透明底圖//) -->

<!-- 大家的各自頁面拜託記得要加上註解 這樣之後整合 會比較好找到 -->
<!-- 各自 CSS & JS 資料夾記得取名歸類  -->

<!-- 專題加油～～～～～  -->



<!-- 是footer bar 不要亂刪 感謝～～ ==================================================================== -->
<div class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
            <p class="navbar-text text-center" 　>BA104G1&nbsp ©&nbsp 2017 &nbsp&nbsp 有我罩你全家股份有限公司 </p>
        </div>
    </div>
<!-- 是footer bar 不要亂刪 感謝～～ ==================================================================== -->




<!-- 這裡是JS專區 =========================================================== -->
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
<script>
</script>	
<style type="text/css">
	
.swal2-cancel {
    margin-left: 10;
    width: 100px;
}
	
</style>



</body>
</html>