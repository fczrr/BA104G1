<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*, com.detail.cart.CartVO ,com.detail.promotion.*"%>

<%
//此段複寫equals 去比較itemno
    ShopService shopSvc = new ShopService();
    List<ShopVO> list = shopSvc.getAll();

    
	ProService proSvc = new ProService();
	List<ProVO> list2 = proSvc.getAllProNow();
    List listforpro=list2;
    pageContext.setAttribute("listforpro", list2);
    
// 	list.remove(list2);
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


<title>Insert title here</title>
</head>
<body>
   <title>有我罩你</title>
  <!-- 頁面標題 ================================================== -->
    
    <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/bootstrap.css" media="screen">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/usebootstrap.css">
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



<!-- 是Navbar 不要亂刪 感謝～～ ==================================================================== -->

<div class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
            
<!-- logo 區 稍後會補上 ================================================== -->
    <a href="#" class="navbar-brand">
      <img src="">有我罩你
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
            <li><a href="#" style="padding: 12px 15px;">最新消息</a></li>
            <li><a href="#" style="padding: 12px 15px;">保健資訊</a></li>
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
            <li><a href="#" style="padding: 12px 15px;">線上客服</a></li>
            <li><a href="#" style="padding: 12px 15px;">意見回饋</a></li>
          </ul>
        </li>
  <!-- 聯絡我們 ================================================== -->
<!--         <li> -->
<%--           <a href="<%=request.getContextPath()%>/front/shopindex.jsp"> --%>
<%--           <img src="<%=request.getContextPath()%>/images/cart.png" style="width: 20px;height: 20px;"> --%>
<!--           		<span class="badge">N</span>購&nbsp&nbsp物&nbsp&nbsp車</a> -->
<!--         </li> -->

      </ul>
      		  
      <ul class="nav navbar-nav navbar-right">


  <!-- 會員專區 ================================================== -->
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes">會員專區 <span class="caret"></span></a>
        <ul class="dropdown-menu" aria-labelledby="themes">
          <li><a href="#" style="padding: 12px 15px;">會員資料管理</a></li>
          <li><a href="#" style="padding: 12px 15px;">我的錢包</a></li>
          <li><a href="#" style="padding: 12px 15px;">訂單管理</a></li>
          <li><a href="#" style="padding: 12px 15px;">我的最愛</a></li>
        </ul>
      </li>
					<!-- 會員專區 ================================================== -->
					<c:if test="${memberVO!=null}">
						<li>${memberVO.memName}你好</li>
					</c:if>
					<!-- 登入 / 註冊 ================================================== -->

				
					<c:choose>
						<c:when test="${memberVO==null}">
							<li><a href="<%=request.getContextPath()%>/front/Login.jsp">登入
									/ 註冊</a></li>
						</c:when>
						<c:when test="${memberVO!=null}">
							<li><a
								href="<%=request.getContextPath()%>/member/member.do?action=logout">登出</a></li>
						</c:when>
					</c:choose>
      </ul>
    		  
    </div>
  </div>
</div>


<!-- 各項button 連結請自行找 <a href= "填入自己的頁面連結 (溫腥提醒:記得用動態) "> ================== -->


<!-- 這裡是JS專區 =========================================================== -->

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>

<!-- 這裡是JS專區 =========================================================== -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">

/*.shoprow {
	background-color: #FFD78C;
	text-align: center;
}

.bigshoprow {
	background-color: #DEFFFF;
	padding: 20px;
}*/
/* .detail img{width: 180px; 
 	height: 180px; }*/
 	
.btn-success:hover {
    background-color: #449d44;
    border-color: #398439;
    color: #ffe200;
}
.btn-success {
    color: #fff;
    background-color: green;
    border-color: #4cae4c;
    font-size: 20px;
    padding: 4px 10px;
    line-height: 1.5;
    border-radius: 3px;
    font-family: Microsoft JhengHei;
    border: 1px solid ;
    margin-bottom: 10px;
}

.special-price {
	font-size: 1.3em;
	color: red;
}

.prices {
	font-weight: 700;
}

.product-title {
	font-size: 20px;
	font-weight: 600;
	line-height: 20px;
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

.offer.offer-default.silde-show-offer.pull-text-center {
	height: 420px;
}

.price.old-price {
	text-decoration: line-through;
}

.btn-danger {
	margin-left: 10;
	width: 100px;
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
.title-carousel-control {

    padding: 10px;
    border-radius: 0;
    text-decoration: none;
    color: #333;
}

/*	.description{
		font-style: bold;
	}
	*/
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script>
        <script type="text/javascript">  
        $(document).ready(function(){  
        	console.log('in jquery1');
            $('form').on('submit',function(event){
                event.preventDefault();
            	console.log($(this).children().eq(2).val());
                var STOCK = $(this).children().eq(0).val();
                var action = $(this).children().eq(1).val(); 
                var ITEMNO = $(this).children().eq(2).val(); 
                console.log('STOCK :'+STOCK+' ,ITEMNO :'+ITEMNO+' ,action :'+action);

                     $.ajax({  
                        type: "POST",  
                        url: "<%=request.getContextPath()%>/cart.do",  
                        data: {"STOCK" : STOCK,"action" : action,"ITEMNO" : ITEMNO},  
                        success: function(msg){
                        	swal({
                        		  title: '',
                        		  text: "已成功加入購物車。",
                        		  type: 'success',
                        		  timer: 5000,
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
                     
//                        	sweetAlert("", "已成功加入購物車。","success");
//                         	$('#myModal').modal();
                        }  
                    });   
               
                

            });  
        });  
      </script>  


<!--   <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalforShopCart">Open Modal</button> -->
<style type="text/css">
#MyBlog{
    position: fixed;  /*固定在網頁上不隨卷軸移動，若要隨卷軸移動用absolute*/
    top: 50%;  /*設置垂直位置*/
    right: -20px;  /*設置水平位置，依所放的內容多寡需要自行手動調整*/
    background: #ffffff;  /*背景顏色*/
    padding: 10px 20px;
    border-radius: 10px;  /*圓角*/
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
}
#MyBlog:hover{  /*當滑鼠移至此區塊時，伸縮區塊*/
    right: -10px;
}
#MyBlog #title{
    padding-right: 5px;  /*讓標題與連結中間有空隙*/
}

</style>



    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-12">
       
          <img src="<%=request.getContextPath()%>/front/image/share/014.png" height="70%" width="100%">
        </div>
      </div>
    </div>
    

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-9">
				
			</div>
			<div class="col-xs-12 col-sm-3">
	
		<div class="input-group">
	  <input type="text" name="ITEMNO" class="form-control" style="border-radius: 5px;" placeholder="您想找什麼...">
	  <input type="hidden" name="action" value="getOne_For_Display_byString">
	  
	  <span class="input-group-btn">
	    <button class="btn btn-info btn btn-warning " style="border-radius: 5px;" type="button" onclick="javascript:location.href='<%=request.getContextPath()%>/front/Search.jsp'"><span class="glyphicon glyphicon-search">
	    </span>搜尋</button>
	  </span>
	</div>

			</div>
		</div>
	</div>

  <!-- Modal -->
  <div class="modal fade" id="myModalforShopCart" role="dialog">
    <div class="modal-dialog" style="width:1200px;">
    
      Modal content
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">購物車內容</h4>
        </div>
        <div class="modal-body">
          <%@ include file="/MasterOrder/pages/Cartinclude.jsp" %>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<style type="text/css">
.btn-success:hover {
background-color: #449d44;
border-color: #398439;
color: #ffe200;
}
</style>
		
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	<h4 align="center"><img src="<%=request.getContextPath()%>/images/greenpick.png" height="72px" width="72px">已成功添加到購物車！！</h4>
      </div>
      <div class="modal-footer">
      <button onclick="location.href ='<%=request.getContextPath()%>/MasterOrder/Cart.jsp';" type="button" class="btn btn-info btn-lg left" data-dismiss="modal">前往購物車</button>
        <button type="button" class="btn btn-info btn-lg" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>



<div class="col-xs-12 col-sm-2"></div>
<div class="col-xs-12 col-sm-8">
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
								<div class="picture thumbnail" title="我是商品名稱你好阿">
									<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>&PRO=1" title="<%=((ProVO)(listforpro.get(i))).getSHOPNAME()%>" title="<%=((ProVO)(listforpro.get(i))).getSHOPNAME()%>"> <img class="img-responsive"
										img src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>" height="180px"
										width="180px">
									</a>
								</div>
								<div class="middle-content">
									<h2 class="product-title">
										<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>&PRO=1" title="<%=((ProVO)(listforpro.get(i))).getSHOPNAME()%>"> <%=((ProVO)(listforpro.get(i))).getSHOPNAME()%></a>
									</h2>
									<div class="description"><%=((ProVO)(listforpro.get(i))).getDES().substring(0,15)%>...</div>
								</div>
							</div>
							<div class="add-info">
								<div class="ash-box">
								<div class="prices">
								<span class="price old-price" >原價$<%=((ProVO)(listforpro.get(i))).getOLDPRICE()%></span> <span
											class="price special-price">特價$<%=((ProVO)(listforpro.get(i))).getPRICE()%></span>
									</div>
									<div class="buttons">
									<FORM METHOD="post" ACTION="cart.do">
									<select name="STOCK" id="STOCK">
									<c:forEach var="quantity" begin="1" end="<%=((ProVO)(listforpro.get(i))).getQuantity()%>" step="1">
												<option value="${quantity}">${quantity}
											</c:forEach> </select>
											<input type="hidden" name="action" value="ADD2" id="ADD2">
										<input type="hidden" name="ITEMNO" value="<%=((ProVO)(listforpro.get(i))).getITEMNO()%>" id="ITEMNO" > 
										<input type="submit" class="btn btn-sm btn-success" style="background-color: green;font-size: 16px;" value="放入購物車" >
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
								<div class="picture thumbnail" title="我是商品名稱你好阿">
									<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>&PRO=1" title="<%=((ProVO)(listforpro.get(i))).getSHOPNAME()%>" title="<%=((ProVO)(listforpro.get(i))).getSHOPNAME()%>"> <img class="img-responsive"
										img src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>" height="180px"
										width="180px">
									</a>
								</div>
								<div class="middle-content">
									<h2 class="product-title">
										<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=<%=((ProVO)(listforpro.get(i))).getITEMNO()%>&PRO=1" title="<%=((ProVO)(listforpro.get(i))).getSHOPNAME()%>"> <%=((ProVO)(listforpro.get(i))).getSHOPNAME()%></a>
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
									<FORM METHOD="post" ACTION="cart.do">
									<select name="STOCK" id="STOCK">
									<c:forEach var="quantity" begin="1" end="<%=((ProVO)(listforpro.get(i))).getQuantity()%>" step="1">
												<option value="${quantity}">${quantity}
											</c:forEach> </select>
											<input type="hidden" name="action" value="ADD2" id="ADD2">
										<input type="hidden" name="ITEMNO" value="<%=((ProVO)(listforpro.get(i))).getITEMNO()%>" id="ITEMNO" > 
										<input type="submit" class="btn btn-sm btn-success" style="background-color: green;font-size: 16px;" value="放入購物車" >
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


<div class="col-xs-12 col-sm-12">

<div id="MyBlog">
	 <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#myModalforShopCart">
	 <img src="<%=request.getContextPath()%>/img/cart.png" style="width: 50px;height: 50px;">
	 </button>

</div>

<div class="col-xs-12 col-sm-2">
</div>
<div class="col-xs-12 col-sm-8">
<div class="title mid-content-title">
            <strong>熱門推薦</strong>
        </div>
	<div class="bigshoprow">
		<div class="container shoprow">
			<div class="row">
				<c:forEach var="shopVO" items="${list}">
					<div class="col-xs-12 col-sm-3 eachshop">
						<div class="offer offer-default silde-show-offer pull-text-center">
							<div class="detail">
								<div class="picture thumbnail" title="${shopVO.NAME}">
									<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${shopVO.ITEMNO}&PRO=0" title="${shopVO.NAME}"> <img class="img-responsive"
										img src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=${shopVO.ITEMNO}" height="180px"
										width="180px">
									</a>
								</div>
								<div class="middle-content">
									<h2 class="product-title">
										<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${shopVO.ITEMNO}&PRO=0"> ${shopVO.NAME}</a>
									</h2>
									<div class="description">${shopVO.DES.substring(0,15)}...</div>
								</div>
							</div>
							<div class="add-info">
								<div class="ash-box">
									<div class="prices">
										<span class="price special-price">$${shopVO.PRICE}</span>
									</div>

									<div class="buttons">

									<FORM METHOD="post" >
											<select name="STOCK" id="STOCK">
											<c:forEach var="STOCK" begin="1" end="${shopVO.STOCK}"
												step="1">
												<option value="${STOCK}">${STOCK}
											</c:forEach> </select>
									<input type="hidden" name="action" value="ADD" ">
									<input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}" >
									<input type="submit" style="background-color: green;font-size: 16px;" class="btn btn-sm btn-success" value="放入購物車">
										</FORM>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
 </div>


<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12">
			
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

  

<!-- image資料夾 - share裡有 一些小圖示可使用 (都是.png檔//是透明底圖//) -->

<!-- 大家的各自頁面拜託記得要加上註解 這樣之後整合 會比較好找到 -->
<!-- 各自 CSS & JS 資料夾記得取名歸類  -->

<!-- 專題加油～～～～～  -->



<!-- 是footer bar 不要亂刪 感謝～～ ==================================================================== -->
<div class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
            <p class="navbar-text text-center">BA104G1&nbsp ©&nbsp 2017 &nbsp&nbsp 有我罩你全家股份有限公司 </p>
        </div>
    </div>
<!-- 是footer bar 不要亂刪 感謝～～ ==================================================================== -->




<!-- 這裡是JS專區 =========================================================== -->

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>

<!-- 這裡是JS專區 =========================================================== -->


</html>