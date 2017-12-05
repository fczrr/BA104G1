<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.carorder.model.*"%>
<%@ page import="com.member.model.*"%>


<%
	CarOrderService carOrderSvc = new CarOrderService();
	MemberService memberSvc = new MemberService();
	List<CarOrderVO> list = carOrderSvc.getAll();
	
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>
訂單管理
</title>
<style>
	
	#user .avatar {
	    width:60px;
		}
	#user .avatar > img{
		width:50px;
		height:50px;
		border-radius:10%;
		}
	/*Card*/
	#user .panel-thumb{
	margin:5px auto;
	text-align:center;	
		}
	#user .panel-thumb .avatar-card {
	text-align:center;
	height:200px;
	margin:auto;
	overflow:hidden;
	}	
	#user .panel-thumb .avatar-card > img{
		max-width:200px;
		max-height:200px;
		}
	
	 table
	#user .panel-table{
	  animation-duration:3s;
	} 
	
	#user .panel-table .panel-body .table{
	  margin:0px;
	}
	#user .panel-table .panel-body {
	  padding:0px;
	}
	#user .panel-table .panel-body .table-bordered > thead > tr > th{
	  text-align:center;
	}
	#user .panel-table .panel-footer {
	  height:60px;
	  padding:0px;
	}
/* 下拉選單 */
	.navbar-default .navbar-nav > li > a:hover,
	.navbar-default .navbar-nav > li > a:focus
	{
	    background-color: #d1313c;
	    color:#fff;
	}
	.navbar-default .navbar-nav > .activee > a,
	.navbar-default .navbar-nav > .activee > a:hover,
	.navbar-default .navbar-nav > .activee > a:focus {
	  background-color: none;
	}
	.navbar-default .navbar-collapse,
	.navbar-default .navbar-form
	{
	    background-color: #fff;
	}
	.font-head
	{
	    font-family:"B Yekan", Tahoma;
	}
	.dropdown-large {
	  position: static !important;
	}
	.dropdown-menu-large {
	  margin-left: 80px;
	  margin-right: 80px;
	  padding: 20px 0px;
	}
	.dropdown-menu-large > li > ul {
	  padding: 0;
	  margin: 0;
	}
	.dropdown-menu-large > li > ul > li {
	  list-style: none;
	}
	.dropdown-menu-large > li > ul > li > a {
	  display: block;
	  padding: 3px 20px;
	  clear: both;
	  font-weight: normal;
	  line-height: 1.428571429;
	  color: #333333;
	  white-space: normal;
	}
	.dropdown-menu-large > li ul > li > a:hover,
	.dropdown-menu-large > li ul > li > a:focus {
	  text-decoration: none;
	  color: #262626;
	  background-color: #f5f5f5;
	}
	.dropdown-menu-large .disabled > a,
	.dropdown-menu-large .disabled > a:hover,
	.dropdown-menu-large .disabled > a:focus {
	  color: #999999;
	}
	.dropdown-menu-large .disabled > a:hover,
	.dropdown-menu-large .disabled > a:focus {
	  text-decoration: none;
	  background-color: transparent;
	  background-image: none;
	  cursor: not-allowed;
	}
	.dropdown-menu-large .dropdown-header {
	  color: #d1313c;
	  font-size: 15px;
	}
	@media (max-width: 768px) {
	  .dropdown-menu-large {
	    margin-left: 0 ;
	    margin-right: 0 ;
	  }
	  .dropdown-menu-large > li {
	    margin-bottom: 30px;
	  }
	  .dropdown-menu-large > li:last-child {
	    margin-bottom: 0;
	  }
	  .dropdown-menu-large .dropdown-header {
	    padding: 3px 15px !important;
	  }
	}
	
	.dropdown-menu-large .boldh {
	    font-weight: bolder;
	    font-style: normal;
	}
	
	.show-on-hover:hover > ul.dropdown-menu {
	    display: block;    
	}	
	/* modal的css */
	.modal-static { 
  
    top: 50% !important; 
    left: 50% !important;  
    overflow: visible !important;
    width: 1000px;
  	height: auto;
  	position: absolute;
  	margin: -150px 0 0 -300px;
	}
	
    
    
	}
	.modal-static,
	.modal-static .modal-dialog,
	.modal-static .modal-content {
	    width: 200px; 
	    height: 200px; 
	}
	.modal-static .modal-dialog,
	.modal-static .modal-content {
	    padding: 0 !important; 
	    margin: 0 !important;
	}
	.modal-static .modal-content .icon {
	}
	.modal-static, .modal-static .modal-dialog, .modal-static .modal-content {
    width: auto;
    height: auto;
	}
	
	.modal {
  
	  width: 1250px;
	  height: 300px;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  margin: -150px 0 0 -630px;

	}
	
</style>
<script src="<%=request.getContextPath()%>/back/carschedul/fullcalendar-3.7.0/lib/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.5/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/lumen/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.0/animate.min.css">
<link rel="stylesheet" href="https://daneden.github.io/animate.css/animate.min.css">

</head>
<body>

<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp" %>

       <!-- page content -->
        <div class="right_col" role="main">
          <div class="">

            <div class="page-title">
              <div class="title_left" style="background-color:#337ab7;height:100px;width:100%">
			      <h1 class="text-center" style="color:white;margin-top:30px">派車訂單管理</h1>
			</div>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
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
                   
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
<!--                         <ul class="dropdown-menu" role="menu"> -->
<!--                           <li><a href="#">Settings 1</a> -->
<!--                           </li> -->
<!--                           <li><a href="#">Settings 2</a> -->
<!--                           </li> -->
<!--                         </ul> -->
                      </li>
                      <!-- XX -->
<!--                       <li><a class="close-link"><i class="fa fa-close"></i></a> -->
                      </li>
                    </ul>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">


<!-- 訂單列表開始 -->
<div class="container" style="margin-top:20px;">
<div class="row">
<div id="user" class="col-md-12" >
  <div class="panel panel-primary panel-table animated fadeIn">
   <div class="panel-heading " style="padding:5px;">
        <div class="row">
        <div class="col col-xs-4 text-left">
        </div>
        <div class="col col-xs-4 text-center">
            <h1 class="panel-title">訂單列表</h1>
        </div>
        <div class="col col-xs-4 text-right ">
        </div>
        </div>
    </div>
   <div class="panel-body">
     <div class="tab-content">
      <div role="tabpanel" class="tab-pane active" id="list">
       <table class="table table-striped table-bordered table-list text-center">
        <thead>
         <tr>
              <th class="text-center"> 訂單編號</th>
              <th class="text-center"> 會員編號 </th>
              <th class="text-center"> 訂單日期 </th>
              <th class="text-center"> 訂單狀態 </th>
            <th><em class="fa fa-cog"></em></th>
          </tr> 
         </thead>
         <tbody>
           <%@ include file="page1.file" %> 
			<c:forEach var="carOrderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
          <tr class="" order_no ='${carOrderVO.order_no}' order_status='${carOrderVO.order_status}'>
             <td><a href="#" class=showOrderDetail data-toggle="modal" data-target="#processing-modal">${carOrderVO.order_no}</a></td>
		
			
             
             <td>${carOrderVO.mem_no}</td>
             <td>${carOrderVO.order_date}</td>
             <td>${carOrderVO.order_status}</td>
             
             <td align="center">
               <span class="dropdown  show-on-hover">
                    <a href="#" class="dropdown-toggle btn btn-primary" data-toggle="dropdown" title="Edit"><i class="fa fa-pencil"></i></a>
                     <ul class="dropdown-menu text-right" role="menu">
                        <li><a href="#" class="notConfirm">未確認</a></li>
                        <li><a href="#" class ="inService">服務中</a></li>
                        <li><a href="#" class ="completed">已完成</a></li>
                      </ul>
                 </span>
        	   <a href="#" class="btn btn-success" title="validate"><i class="fa fa-check-square">確認訂單</i></a>
        	   <button  id="delete" class="btn btn-danger " data-class="btn btn-danger" onclick=""><i class="fa fa-trash" aria-hidden="true"></i></button>
            	
             </td>
           
           </tr>
            </c:forEach>
          </tbody>
        </table>
       
      </div><!-- END id="list" -->
        
      
       
     </div><!-- END tab-content --> 
    </div>
   
   <div class="panel-footer text-center">
   		<ul class="pagination">
	 	  <li ><a href="<%=request.getRequestURI()%>?whichPage=<%=whichPage-1%>">«</a></li>
	 	    <%for (int i=1; i<=pageNumber; i++){%>
		   <li ><a href="<%=request.getRequestURI()%>?whichPage=<%=i%>"><%=i%></a></li>
           <%}%> 
		   <li ><a href="<%=request.getRequestURI()%>?whichPage=<%=whichPage+1%>">»</a></li>
         </ul>
    
   </div>
  </div>
        
      </div>

      
    </div>
  </div>



			<!-- Static Modal -->
			<div class="modal modal-static fade" id="processing-modal" role="dialog" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-body">
			            
			                <div class="text-center">
			                
			                   
			                    <div class="container">
  								<h2>訂單明細</h2>          
  						
  									<button type="button" class="close" style="float: none;" data-dismiss="modal" aria-hidden="true">×</button>
			                    	<!-- 明細清單表格 -->
			                    	<table class="table table-striped text-center">
			                    	<thead>
							         <tr>
							           	  <th class="text-center"> 明細編號</th>
							              <th class="text-center"> 明細日期 </th>
							              <th class="text-center"> 明細時段 </th>
							              <th class="text-center"> 乘客姓名 </th>
							              <th class="text-center"> 乘客電話 </th>
							              <th class="text-center"> 上車地點 </th>
							              <th class="text-center"> 目的地 </th>
							              <th class="text-center"> 搭乘車號 </th>
							              <th class="text-center"> 派車狀態 </th>
							          </tr> 
							         </thead>
							         <tbody class="dttbody">
							         	
							         </tbody>
			                 
			                    	</table>
			                    	<!-- 明細清單表格 -->
			                    
			                </div>
			                
			                
			            </div>
			        </div>
			    </div>
			</div>
			<!-- 明細modal結束 -->
			
			 <div id='calendar'></div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
        <!-- /page content -->


<%@ include file="/back/production/BA104G1_footer.jsp" %>

			  
			    
			    
			    
			    
<script>
$(document).ready(function(){

	function checkDel(order_no,order_status){
		
		swal({
			  title: '注意?',
			  text: "您確定要取消這筆訂單!",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '取消訂單!'
			}).then((result) => {
			  if (result.value) {
			    swal(
			      '訂單已取消!',
			      '這筆訂單已取消成功'
			    )
			    
			    $('.animated.fadeOutRight.delete').remove();
			    cancelOrder(order_no,order_status);
			  }else{
				$('.animated.fadeOutRight.delete').attr('class','animated fadeInLeft');
			  }
			})
	}
	
	//選擇訂單狀態
	$('.notConfirm').click(function(){
		var order_no = $(this).parent().parent().parent().parent().parent().attr('order_no')
		cancelOrder(order_no,"未確認");
		reload();
	});
	$('.inService').click(function(){
		var order_no = $(this).parent().parent().parent().parent().parent().attr('order_no')
		cancelOrder(order_no,"服務中");
		reload();
	});
	$('.completed').click(function(){
		var order_no = $(this).parent().parent().parent().parent().parent().attr('order_no')
		cancelOrder(order_no,"已完成");
		reload();
	});
	
	
	//取消訂單
	$('.btn-danger').click(function(){
		var order_no = $(this).parent().parent().attr('order_no')
		var order_status = $(this).parent().parent().attr('order_status')
		$(this).parent().parent().addClass('delete');
		filter('delete',checkDel,order_no,"取消訂單");
	 }) 
	 
	//確認訂單
	$('.btn-success').click(function(){
		var order_no = $(this).parent().parent().attr('order_no')
		cancelOrder(order_no,"已確認");
		reload()
	 }) 
	
	 function removeTr(x){		
		x.remove();
	 };
	 
	 //查找明細
	 $('.showOrderDetail').click(function(){
		 var order_no = $(this).text();
		 findList(order_no)
	 });
		
})		
	function filter($state,cb,order_no,order_status){
		var x   = document.getElementsByClassName($state);
		console.log(x);
		var btn = document.getElementById($state);
			for (i = 0; i < x.length; i++) {x[i].className = " animated fadeOutRight "+$state;
			}
			cb(order_no,order_status);	
	}
	
	//改變狀態的ajax
	function cancelOrder(order_no,order_status){
		 var SendString = {"action":"update","order_no":order_no,"order_status":order_status};
		 
		 console.log("送出資料檢查:"+SendString);
		 $.ajax({
			 type: "POST",
			 url: "<%=request.getContextPath()%>/carorder/carorder.do",
			 data: SendString,
			 dataType: "json",
			 
			 success: function (data){
				 var orderStatus = data.orderStatus;
	          console.log("改變後的訂單狀態:"+orderStatus);
	                
	         },

	       error: function(){}
	  })
	}; 
	
	//找訂單明細的ajax
	function findList(order_no){
		 var SendString = {"action":"getOne_For_Display","order_no":order_no};
		 
		 console.log("送出資料檢查:"+SendString);
		 $.ajax({
			 type: "POST",
			 url: "<%=request.getContextPath()%>/cardetail/cardetail.do",
			 data: SendString,
			 dataType: "json",
			 
			 success: function (data){
				 var orderStatus = data.cardetailList;
	          console.log("取回來的訂單明細:"+orderStatus);
	          $(".dttbody").empty();
	          for (var i = 0; i < orderStatus.length; i++) {
                  var cd = orderStatus[i];
                  var detail_no = cd.detail_no;
                  console.log("取回來的明細編號:"+detail_no);
                  var detail_date = cd.detail_date;
                  var detail_time = cd.detail_time;
                  var detail_timeString;
                  if(detail_time == "M"){
			    		 detail_timeString = "早";
			    	 }
			    	 if(detail_time == "A"){
			    		 detail_timeString = "中";
			    	 }
			    	 if(detail_time == "N"){
			    		 detail_timeString = "晚";
			    	 }
                  
                  
                  
                  var passenger_name = cd.passenger_name;
                  var passenger_phone = cd.passenger_phone;
                  var getinto_address = cd.getinto_address; 
                  var arrival_address = cd.arrival_address;
                  var vehicle_no = cd.vehicle_no;
                  var sendcar_status = cd.sendcar_status;
                  $(".dttbody").append($("<tr><td>"+detail_no+"</td><td>"+detail_date+"</td><td>"+detail_timeString+"</td><td>"+passenger_name+"</td><td>"
                		  +passenger_phone+"</td><td>"+getinto_address+"</td><td>"+arrival_address+"</td><td>"+vehicle_no+"</td><td>"+sendcar_status+"</td></tr>"))
                  
              }
	                
	         },

	       error: function(){alert("訂單狀態更改失敗!!")}
	  })
	}; 
	
	function reload(){
		window.location.reload();
	}

</script>


</body>
</html>