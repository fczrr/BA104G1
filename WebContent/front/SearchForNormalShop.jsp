<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.*"%>
<%@ page import="com.detail.promotion.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
List<ShopVO> shopVO5 = (List) request.getAttribute("shopVOlist"); //EmpServlet.java(Concroller), 存入req的empVO物件
pageContext.setAttribute("shopVO5", shopVO5);
%>
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

<!DOCTYPE html>
<html lang="">

<style type="text/css">
  
  .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
    padding: 8px;
    line-height: 1.42857143;
    vertical-align: top;
    border: 1px solid #ddd;
  }
  
body > div > table > tbody > tr:nth-child(2) > td{
      box-shadow: 0 10px 20px rgba(0, 0, 0, .2);
}

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
.btn-success:hover {
    background-color: #449d44;
    border-color: #398439;
    color: #ffe200;
}

.btn-danger {
	margin-left: 10;
	width: 100px;
}

a {
    color: #000;
    text-decoration: none;
}
.old-price{
  font-size: 1.5em;
  font-weight: 700;

}

.special-price{
  font-size: 1.9em;
  color: red;
  font-weight: 700;
}

#search{
    font-size: 16px;
    border-radius: 3px;
    font-family: Microsoft JhengHei;
    padding: 8px 16px;
    
}

</style>



<body>
<head>
  <meta charset="UTF-8">
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport">
  <title>Title Page</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"><!--[if lt IE 9]>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
  <!-- 頁面標題 ================================================== -->
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
      <h1>Welcome</h1>
    </div>
  </div>
</div>
<hr>
<!-- 大圖bannan -->




<!-- 各項button 連結請自行找 <a href= "填入自己的頁面連結 (溫腥提醒:記得用動態) "> ================== -->


<!-- 這裡是JS專區 =========================================================== -->

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>

<!-- 這裡是JS專區 =========================================================== -->

  <div class="col-xs-12 col-sm-12">
    <table class="table" " style="border:5px" id="search">
        <tr>
          <th style="background-color: #f5f5f5;border-color: #ddd;border: 3px;border: 1px solid #ddd;font-size: 24px;font-family: Microsoft JhengHei;">搜尋</th>
        </tr>

<style type="text/css">
.btn-success:hover {
	background-color: #449d44;
	border-color: #398439;
	color: #ffe200;
}
#inputforserarh{
height: 40px;border-radius: 3px;
}
#bigword{
    font-size: 25px;
    font-weight: 700;
}


</style>
	
         <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script>
        <script type="text/javascript">  
        $(document).ready(function(){  
        	console.log('in jquery1');
            $('.searchnow').on('submit',function(event){
            	console.log('in jquery2');
                event.preventDefault();
            	console.log($(this).find(".action").val());
            	console.log($(this).find(".STOCK").val());
            	console.log($(this).find(".ITEMNO").val());
          
                var STOCK = $(this).find(".STOCK").val();
                var action = $(this).find(".action").val();
                var ITEMNO = $(this).find(".ITEMNO").val();
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

				<tr>
					<td id="bigword">搜尋關鍵字: <br>
						<form action="<%=request.getContextPath()%>/shop.do" class="form-inline" method="POST">
							<div class="form-group">
								<input placeholder="您想找尋些什麼..." class="form-control input" id="inputforserarh" name="ITEMNO">
								<input type="hidden" name="action" value="getOne_For_Display_byString">
								<button class="btn btn-success btn" id="search">
									<span class="glyphicon glyphicon-search" ></span>查詢
								</button>
							</div>
						</form>
					</td>
				</tr>
				<tr>
       <td id="bigword">依照商品搜尋: <br>
       	<jsp:useBean id="empSvc" scope="page" class="com.shop.model.ShopService" />
						<form action="<%=request.getContextPath()%>/shop.do"
							class="form-inline" method="POST">
							<input type="hidden" name="action" value="getOne_For_Display2">
							<div class="form-group">
								<select name="ITEMNO" class="form-control" id="inputforserarh">
									<c:forEach var="empVO" items="${list}">
										<option value="${empVO.NAME}">${empVO.NAME}
       									  </c:forEach>   
								</select></font>
								<button class="btn btn-success btn" id="search">
									<span class="glyphicon glyphicon-search"></span>查詢
								</button>
							</div>
						</form>
      </td>
     </tr>
     	 <tr>
       <td id="bigword">
		促銷商品查詢:
		<br>
				<jsp:useBean id="proSvc2" scope="page" class="com.detail.promotion.ProService" />
				<form action="<%=request.getContextPath()%>/pro.do" class="form-inline" method="POST">
						<input type="hidden" name="action" value="getOne_For_Display2">
							<div class="form-group">
								<select  name="ITEMNO" id="inputforserarh" class="form-control">
										  <c:forEach var="proVO" items="${listforpro}" > 
         									 <option value="${proVO.SHOPNAME}">${proVO.SHOPNAME}
       									  </c:forEach>   
								</select></font>
								<button class="btn btn-success btn" id="search">
									<span class="glyphicon glyphicon-search"></span>查詢
								</button>
							</div>
						</form>
      </td>
     </tr>
    </table>
  </div>



<!-- ------------------------------ -->
  <div class="col-xs-12 col-sm-12">
    <table class="table" " style="border:5px">
        <tr>
          <th style="background-color: #f5f5f5;border-color: #ddd;border: 3px;border: 1px solid #ddd;font-size: 24px;font-family: Microsoft JhengHei;">搜尋</th>
        </tr>

<style type="text/css">
.btn-success:hover {
	background-color: #449d44;
	border-color: #398439;
	color: #ffe200;
	
}

.btn-danger{
    margin-left: 10px;
    width: 100px;
    border-radius: 4px;
    border: 1px solid;
    padding: 6px 12px;
}

.btn-success{
    width: 100px;
    border-radius: 4px;
    border: 1px solid;
    padding: 6px 12px;
}

</style>
<%@ include file="pages/listallSearchForString1.file" %> 
<c:forEach var="shopVO" items="${shopVOlist}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	 <tr>
          <td>
  <div class="row">
        <div class="col-xs-12 col-sm-3">
          <div class="picture thumbnail">
                    <a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${shopVO.ITEMNO}&PRO=0"><img class="img-responsive" img src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=${shopVO.ITEMNO}" style=" height: 188px; width: 188px;" title="${shopVO.NAME}"></a>
                  </div>
        </div>
        <div class="col-xs-12 col-sm-9">
            <div class="item-box">
              <legend class="top_padding15"></legend>
              <div class="product-item">
                <div class="white-box">
                  
                  <div class="middle-content">
                    <h2 class="product-title"><a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${shopVO.ITEMNO}&PRO=0">${shopVO.NAME}</a></h2>
                    <div class="description" style="font-size: 18px;">
                        	${shopVO.DES.substring(0,15)}...
                    </div>
                  </div>
                   <br><br>
                </div>


                <div class="add-info">
                  <div class="ash-box">
                    <div class="prices" style="float:right;">
                    	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MyShopping/cart.do" class="searchnow">
                       <span class="price special-price">$${shopVO.PRICE}
                       <input type="hidden" class="action" name="action" value="ADD">
                       <input type="hidden" class="STOCK" name="STOCK" value="1">
                       <input type="hidden" class="ITEMNO" name="ITEMNO" value="${shopVO.ITEMNO}" id="ITEMNO" >
                      </span><input class="btn btn-sm btn-success" style="background-color: green;font-size: 16px;border-radius: 3px;width: 110px;" type="submit" value="放入購物車">
                      	</FORM>
                    </div>
                  
                  </div>
                </div>
              </div>
            </div>
        </div>
</div>
          
          </td>
                </tr>
</c:forEach>
    </table>
<%@ include file="pages/listallSearchForString2.file" %> 
  </div>
  
  </script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js">
  </script>


  <!-- NavBar的CSS 專區 不能刪喔 ================================================== -->

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
            <p class="navbar-text text-center">BA104G1&nbsp ©&nbsp 2017 &nbsp&nbsp 有我罩你全家股份有限公司 </p>
        </div>
    </div>
<!-- 是footer bar 不要亂刪 感謝～～ ==================================================================== -->




<!-- 這裡是JS專區 =========================================================== -->

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>

<!-- 這裡是JS專區 =========================================================== -->
 
</body>
</html>