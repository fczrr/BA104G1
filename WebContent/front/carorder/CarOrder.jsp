<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cartype.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.*"%>



<html>
<head>




<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front/carorder/bootstrap-3.3.7/dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front/carorder/MDP/jquery-ui.multidatespicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/carorder/carorder.css">



<jsp:useBean id="cartypeSvc" scope="page" class="com.cartype.model.CarTypeService" />

<style>
.wizard .tab-pane {
    position: relative;
    padding-top: 50px;
    height:50%;
}

a.car {
    position: relative;
    display: block;
    padding: 10px 15px;
}

.bbb {
    display: table-cell;
    width: 1%;
    float: none;
}

.nav-pills > li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus {
    color: #fff;
    background-color: rgb(253, 182, 3);
}
.ui-datepicker {
    width: 30em;
    padding: .2em .2em 0;
    display: none;
    height: 25em;
}

.ui-datepicker td span, .ui-datepicker td a {
    display: block;
    padding: 0.8em;
    text-align: right;
    text-decoration: none;
}

.ui-datepicker table {
    width: 100%;
    font-size: .9em;
    border-collapse: collapse;
    margin: 0 0 .4em;
    height: 90%;
}

.ui-datepicker table {
    width: 100%;
    font-size: 1.2em;
    border-collapse: collapse;
    margin: 0 0 .4em;
}

.div_table-cell{
width:450px; 
height:500px;
display:table-cell; 
text-align:center; 
vertical-align:middle;
border:solid 2px #fff;
}

/* IE6 hack */.div_table-cell span{
height:100%; 
display:inline-block;
}

/* 讓table-cell下的所有元素都居中 */.div_table-cell *{ vertical-align:middle;}

.ui-datepicker .ui-datepicker-calendar .ui-state-highlight a {
    background: #ffc229 none;
    color: white;
}

.ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight {
    border: 1px solid #749eda;
    background: #4f43ec4f;
    }
    
tr:nth-child(even) {
    background-color: #ffffff;
}
.glyphicon-pencil:before {
    content: "\270f";
    position: relative;
    top: 18px;
    background-color: white;
    width: 500px;
}

.glyphicon-ok:before {
    content: "\270f";
    position: relative;
    top: 18px;
    background-color: white;
    width: 500px;
}



.caricon {
    position: relative;
    top: 13px;
    display: inline-block;
    font-family: 'Glyphicons Halflings';
    font-style: normal;
    font-weight: 400;
    line-height: 1;
    width: 40;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}



</style>
<title>有我罩你-派車服務申請</title>
</head>
<body bgcolor='white'>

<%@ include file="/front/navbar.jsp" %> 
	<!-- =================================訂車流程TABS開始================================= -->
	<div class="container">
		<div class="row">
			<section>
				<div class="wizard">
					<div class="wizard-inner">
						<div class="connecting-line"></div>
						<ul class="nav nav-tabs" role="tablist">

							<li role="presentation" id="presentation1"><a href="#step1"
								data-toggle="tab" aria-controls="step1" role="tab"
								title="步驟一 :選擇服務車型"> <span class="round-tab"> <!-- <i
										class="glyphicon glyphicon-pencil"></i> -->
										<img class="caricon" src="<%=request.getContextPath()%>/front/image/carorder/caricon.svg">
								</span>
							</a></li>

							<li role="presentation" class="disabled"><a href="#step2"
								data-toggle="tab" aria-controls="step2" role="tab"
								title="步驟二 :選擇服務日期與時段"> <span class="round-tab"> <i
										class="glyphicon glyphicon-pencil"></i>
								</span>
							</a></li>
							<li role="presentation" class="disabled"><a href="#step3"
								data-toggle="tab" aria-controls="step3" role="tab"
								title="步驟三 :選擇往來地點"> <span class="round-tab"> <i
										class="glyphicon glyphicon-pencil"></i>
								</span>
							</a></li>

							<li role="presentation" class="disabled"><a href="#complete"
								data-toggle="tab" aria-controls="complete" role="tab"
								title="完成訂單"> <span class="round-tab"> <i
										class="glyphicon glyphicon-ok"></i>
								</span>
							</a></li>
						</ul>
					</div>

					
						<div class="tab-content">
							<div class="tab-pane active" role="tabpanel" id="step1">
								<h3>Step 1</h3>
								<p>選擇您想搭乘的服務車型:</p>
								<!-- =================================動態展示車型選單================================= -->
								<div class="container">
									<div id="myCarousel" class="carousel slide"
										data-ride="carousel" data-interval="false">

										<!-- Wrapper for slides -->
										<div class="carousel-inner">

											<div class="item active">
												<img src="<%=request.getContextPath()%>/front/image/carorder/main.png">
													<div class="carousel-caption">
														<h3><b>選擇您想要的車型</b></h3>
														<p>下方按鈕選擇您想搭乘的服務車型</p>
													</div>
											</div>


											<c:forEach var="cartypeVO" items="${cartypeSvc.all}">

												<div class="item">
													<img class="aaa"
														src="<%=request.getContextPath()%>/cartype/DBG.do?cartypeno=${cartypeVO.cartypeno}">
													<div class="carousel-caption">
														<h3>
															<b>${cartypeVO.cartypename}</b>
														</h3>
														<p>
															<b>${cartypeVO.description}</b>
														</p>
														
														<h3>
															<b>${cartypeVO.rentalrates}新台幣/1小時</b>
														</h3>
													</div>
												</div>
												<!-- End Item -->
											</c:forEach>

										</div>
										<!-- End Carousel Inner -->
										<div class="ulbtn">
										<ul class="nav nav-pills nav-justified">
											<c:forEach var="cartypeVO" items="${cartypeSvc.all}"
												varStatus="i">
												<li class="bbb ulbtn" data-target="#myCarousel"
													data-slide-to="${i.count}"><!-- <label for="ulbtn"> --><a class="car ulbtn" href="#">${cartypeVO.cartypename}</a><!-- </label> -->
												</li>
											</c:forEach>

										</ul>
										</div>
									</div>
									<!-- End Carousel -->
								</div>

								<input type="hidden" class="inputcarname" name="cartypename"
									value="現在選擇的車型">
								<!-- =================================動態展示車型選單================================= -->
								<br>
								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-primary next-step" id="savebtn">下一步>選擇日期與時段</button></li>
								</ul>
							</div>
							<div class="tab-pane" role="tabpanel" id="step2">
								<h3>Step 2</h3>
								<p>選擇您需要服務的日期與時段:</p><br>
								<!-- =================================日期選擇器================================= -->
									<div class="row">
									    <div class="col-md-6">
									    	選擇服務時段:
										<div class="radio daypart">
  										<label><input type="radio" name="optradio" value="0" text="M">早上(8~12)</label>
										</div>
										<div class="radio daypart">
										  <label><input type="radio" name="optradio" value="1" text="A">下午(1~5)</label>
										</div>
										<div class="radio daypart">
										  <label><input type="radio" name="optradio" value="2" text="N">晚上(6~10)</label>
										</div>
										<div class="radio daypart">
										  <label><input type="radio" name="optradio" value="3" text="O">全天</label>
										</div> 
										
										<br><br>
										選擇服務日期:
										<div class= "addDatePick">
										
										<div id= "chooseDate"></div>
										</div>
									    </div> <!-- 6 -->
									    
									    <div class="col-md-6">
									    <img src="<%=request.getContextPath()%>/front/image/carorder/calendar-series.jpg"> 
									    </div> <!-- 6 -->
									</div>
									
									
							
								<!-- =================================日期選擇器結束================================= -->
								
								
								<br><br><br>
								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-default prev-step">回到上一步</button></li>
									<li><button type="button"
											class="btn btn-primary next-step">下一步>選擇接送地點</button></li>
								</ul>
							</div>
							<div class="tab-pane" role="tabpanel" id="step3">
								<h3>Step 3</h3>
								<p>選擇您的上車地點與目的地:</p>
								
								<!-- =================================地址選擇================================= -->
	
										<!-- <div id="twzipcode">
									    </div>
									    <div id="twzipcode2">
									    </div> -->
									    
									    
									<div class="row">
									    <div class="col-md-6">
									    <div class="div_table-cell">
										    <div class="my-selector-c">
										    	<b>出發點</b>
												  <div>
												    <select class="county"></select>
												  </div>
												  <div>
												    <select class="district"></select>
												  </div>
							                      <div>
							                      	<input type="text" name="address" id="address">
							                      </div>	
							                 </div>     
							                 <div class="float-right">
							                 <img src ="<%=request.getContextPath()%>/front/image/carorder/10573164a60cb01.jpg" width="30">
							                 </div>
							                    <div class="my-selector-b">
							                    	<b>目的地</b>
							                      <div>
												    <select class="county2" id ="county2"></select>
												  </div>
												  <div>
												    <select class="district2" id = "district2"></select>
												  </div>
							                      <div>
							                      	<input type="text" name="address2" id="address2">
							                      </div>		
												</div>
										</div>
									</div>
										<div class="col-md-6">
										    <img class="loctionPic" height="583" src = "<%=request.getContextPath()%>/front/image/carorder/news_map_North.jpg">
										</div>
									</div>
									    
									    
									    
									    
									     
								<!-- =================================地址選擇=================================a -->
								
								
								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-default prev-step">上一步</button></li>
									<!-- <li><button type="button"
											class="btn btn-default next-step">跳過</button></li> -->
									<li><button type="button"
											class="btn btn-primary btn-info-full next-step last-step">下一步</button></li>
								</ul>
							</div>
							<!-- =================================表單資料轉送區=================================== -->
							<div class="tab-pane" role="tabpanel" id="complete">
								<h3 style="color:#D68B00">恭喜!</h3>
								<p>您已經完成了訂車流程，請確認下方訂單資訊無誤後送出訂單，</p>
									<p>如有任何疑問請撥打以下客服專線。</p>
									<h2>0979-498988</h2>
									
									
									
									
									<table class = "table" id="showFormMsg">
									<thead class="thead-light">
									<tr><th>車型</th><th>日期</th><th>時段</th><th>申請會員</th><th>會員電話</th><th>接送地點</th><th>目的地</th><th>總價(點數)</th></tr>
									</thead>
									<tr><td id="inputmsg1"></td><td id="inputmsg2"></td><td id="inputmsg3"></td><td id="inputmsg7"><td id="inputmsg8"><td id="inputmsg4"></td><td id="inputmsg5"></td><td id="inputmsg6"></td></tr>
									</table>
									
									
									
									
									<form role="form" action="<%=request.getContextPath()%>/cardetail/cardetail.do" method="post">
											
										    <input type="hidden" name="passenger_name" 	id="passenger_name" value="${memberVO.memName}">  
										    <input type="hidden" name="passenger_phone" 	id="passenger_phone"  value="${memberVO.memPhone}">
										    <input type="hidden" name="memNO" 	id="memNO"  value="${memberVO.memNo}">
										    <input type="hidden" name="sendcar_status" 	id="sendcar_status" value="A" >
							
										   
										   
										  
									<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-default prev-step">上一步</button></li>	
									<li><button type="button"
											class="btn btn-warning btn-lg btn-info-full submit-form">確認送出訂單</button></li>
									</ul>
								</form>
							</div>
							<div class="clearfix"></div>
						</div>
					
				</div>
			</section>
		</div>
	</div>

							<!-- =================================訂車流程TABS結束================================= -->
				
						
						    <!-- =================================表單資料轉送區=================================== -->
						    <%@ include file="/front/footerbar.jsp" %> 
	 	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="<%=request.getContextPath()%>/front/carorder/MDP/jquery-ui.multidatespicker.js"></script><!-- 複數日期選擇器 -->
		<%-- <script src="<%=request.getContextPath()%>/front/jquery-twzipcode-master/jquery.twzipcode.js"></script> <!-- 台灣地址選擇器 --> --%>
		<script src="<%=request.getContextPath()%>/front/js/carorder/tw-city-selector.min.js"></script>
		<script src="<%=request.getContextPath()%>/front/js/carorder/bootstrap.js"></script><!-- bootstrap3.7 -->
		<script src="<%=request.getContextPath()%>/front/js/carorder/carorder.js"></script><!--自定義js-->
		<script src="<%=request.getContextPath()%>/front/js/carorder/carousel.js"></script><!-- carousel -->
		<script src="<%=request.getContextPath()%>/front/js/carorder/datepicker-zh-TW.js"></script><!-- 繁體中文 -->
		
						     
						     <script type="text/javascript">
									     
									    	$(document).ready(function(){
									    	
									    	 new TwCitySelector({
									    		    el: ".my-selector-c",
									    		    elCounty: ".county", // 在 el 裡查找 dom
									    		    elDistrict: ".district", // 在 el 裡查找 dom
									    		  });
									    	 
									    	  new TwCitySelector({
									    		    el: ".my-selector-b",
									    		    elCounty: ".county2", // 在 el 裡查找 dom
									    		    elDistrict: ".district2", // 在 el 裡查找 dom
									    		  }); 
									    	var  cartypename;
									    	var detailDateSize;
									    	var detail_time;
									    	$('.next-step').click(
													function() {
														$("#inputmsg1").html($('li.active>a').text());
														$("#inputmsg2").html($('#chooseDate').val());
														
														
														
														
														$("input[name='optradio']").change(function(){
															var detail_timeString;
															
															 detail_time = $("input[name='optradio']:checked").attr("text");
														     
													    	 if(detail_time == "M"){
													    		 detail_timeString = "早";
													    	 }
													    	 if(detail_time == "A"){
													    		 detail_timeString = "中";
													    	 }
													    	 if(detail_time == "N"){
													    		 detail_timeString = "晚";
													    	 }
															$("#inputmsg3").html(detail_timeString);
														});
														var adsTxt1 =$('.county').val();
														var adsTxt2 =$('.district').val();
														var adsTxt3 =$('#address').val();
														$("#inputmsg4").html(adsTxt1 + adsTxt2+ adsTxt3);
														var arrTxt1 = $('#county2').val();
														var arrTxt2 = $('#district2').val();
														var arrTxt3 = $('#address2').val();
														$("#inputmsg5").html(arrTxt1+ arrTxt2 + arrTxt3);
														$("#inputmsg7").html($('#passenger_name').val());
														$("#inputmsg8").html($('#passenger_phone').val());
														 
														 memNO = $('#memNO').val();
														 passenger_name = $('#passenger_name').val();
														 passenger_phone = $('#passenger_phone').val();
														 cartypename = $('li.active>a').text().trim();
														 detail_date = $('#chooseDate').val();
														 detail_date = detail_date.replace(/\s+/g, "");
														 var detailDateEntry = detail_date.split(',');
														 detailDateSize =detailDateEntry.length;
													     detail_time_no =$("input[name='optradio']:checked").val();
													    
													     county = $('.county').val();
													     district = $('.district').val();
													     address = $('#address').val();
													     arrival_address = $("#inputmsg5").html();	
													     
													});
									    	var defrayPoint;
									    	<jsp:useBean id="carTypeSvc" scope="page" class="com.cartype.model.CarTypeService" />
									    	$('.last-step').click(
													function() {
														<% for(CarTypeVO carTypeVO : carTypeSvc.getAll()){
															String cartypeName = carTypeVO.getCartypename();
										          			Integer defrayPoint = carTypeVO.getRentalrates(); %>
										            		
										          			if(cartypename == '<%=cartypeName%>' ){//js的code
										          				defrayPoint =  <%=defrayPoint%>*detailDateSize;
										            		}
										            		
										            	<%}%>
										            	console.log("租賃車型為:"+cartypename+"，訂了:"+detailDateSize+"天，總共:"+defrayPoint+"點");
														$("#inputmsg6").html(defrayPoint+"點");
													});
											
									    	$('.submit-form').click(function() {
									    		
											    console.log("cartypename:"+cartypename+"; detail_date:"+detail_date+";detail_time_no:"+detail_time_no+"; detail_time:"+detail_time+";county:"+county+"; district:"+district+";address:"+address+";arrival_address:"+arrival_address);
									    		$.ajax({
													 type: "POST",
													 url: "<%=request.getContextPath()%>/cardetail/cardetail.do",
													 data: creatQueryString2(cartypename,detail_date,detail_time_no,detail_time,county,district,address,arrival_address,defrayPoint),
													 /* dataType: "json", */
													 
													 success: function (data){
														 swal({
															  position: 'center',
															  type: 'success',
															  title: '您的訂單已經成立',
															  showConfirmButton: false,
															  timer: 3500
															});
												     },
										            error: function(){alert("失敗")}
										        })
									    		
									    	});
									    	
									    	function creatQueryString2(cartypename,detail_date,detail_time_no,detail_time,county,district,address,arrival_address,defrayPoint){
									    		
												var queryString= {"action":"insert", "cartypename":cartypename, "detail_date":detail_date, "detail_time_no":detail_time_no, "detail_time":detail_time, "county":county, "district":district,"address":address , "arrival_address":arrival_address,"defrayPoint":defrayPoint ,"passenger_name":passenger_name,"memNO":memNO,"passenger_phone":passenger_phone,"sendcar_status":"未出車"};
												console.log(queryString);
												return queryString;
										
							    	 		};
									    	
									    	
									    	
											/* 固定step */
											
											$(".ulbtn").mouseover(function(){
													$("#presentation1").addClass("active");
												});	
												
												$(".ulbtn").mouseleave(function(){
													$("#presentation1").addClass("active");
												});	
												
												/* var formCheck = "ok";
										    	var formCheckVal = $("#formCheck").val();
										    	console.log(formCheckVal);
												if(formCheck == formCheckVal){
												swal({
													  position: 'center',
													  type: 'success',
													  title: '您的訂單已經成立',
													  showConfirmButton: false,
													  timer: 3500
													});
												} */
									
												
											/* AJAX日期處理 */
												var datelist = [];
												var datelist2 = []; 
												
												 $("input[name='optradio']").change(function(){
													 var cartypename =  $('li.active>a').text();
													 var cartypeName = cartypename.trim();
														
													 	$.ajax({
															 type: "POST",
															 url: "<%=request.getContextPath()%>/cardetail/cardetail.do",
															 data: creatQueryString($(this).val(), cartypeName),
															 dataType: "json",
															 
															 success: function (data){
																
																 $("#chooseDate").remove();
																 datelist = data.dayStatusList;
																 console.log("list:"+datelist);
															
																 dateList2Add();
																 
																 $(".addDatePick").append("<input id='chooseDate'>");
													
																	$('#chooseDate').multiDatesPicker({
															    		/* maxPicks: 1, */
															    		dateFormat: "yy-m-d",
															    		minDate: 0,
															    		stepMonths: 0,
															    		addDisabledDates: datelist2
															    		
																	});//多選日期
																	 console.log("datelist2:"+datelist2);
																	datelist2 =[];
														     },
												            error: function(){alert("暫時不提供此時段派車服務")}
												        })
													})
													
													function dateList2Add(){
										    		 var date = new Date();
												    	 for(i=0;i<datelist.length;i++){
												    		 datelist2[i] = date.setDate(datelist[i]);
												    	 } 
												    	 console.log("轉換過的鎖定日期陣列:"+datelist2)
												    	if(datelist2.length !== 0){
												    		console.log("鎖定日期成功")
												    	 return  datelist2;
												    	}else{
												    		console.log("找不到鎖定日期")
												    		datelist2 = 0;
												    	}
											    	 	};
													/* function dateList2Clear(){
														datelist2 =[];
														
													
													}; */
													function creatQueryString(detail_time_no, cartypename){
														console.log("detail_time_no:"+detail_time_no+"; cartypename:"+cartypename);
														var queryString= {"action":"getDisableDates", "detail_time_no":detail_time_no, "cartypename":cartypename};
														return queryString;
												
									    	 		};
									    	 		
									    	 		
									    	<!--地址處理-->		
									    	 var cityArr1 = ["臺北市", "基隆市", "新北市","桃園市","新竹市","新竹縣"];
									    	 var cityArr2 = ["苗栗縣","臺中市","彰化縣","南投縣","雲林縣"];
									    	 var cityArr3 = ["嘉義市","嘉義縣","臺南市","高雄市","屏東縣"];
									    	 
									    	 var loctionString = null;
									    	 var loctionNo = null;
									    	 $('.county').change(function(){
									    		
									    		<%--  $('.loctionPic').attr("src","<%=request.getContextPath()%>/front/image/news_map_empty.jpg") --%>
											    	
									    		 var selectCity = $('.county').val();
									    		 console.log("城市 :"+ $('.county').val());
									    	 
									    	 	for(i = 0 ; i < 6 ;i++){
										    	  
										    	  if(selectCity == cityArr1[i]){
										    		  loctionString = "北"
										    			  loctionNo = "10"
										    		$('.loctionPic').attr("src","<%=request.getContextPath()%>/front/image/carorder/news_map_North.jpg")
										    	  }	
										    	  else if(selectCity == cityArr2[i]){
										    		  loctionString = "中"
										    			  loctionNo = "30"
										    	   $('.loctionPic').attr("src","<%=request.getContextPath()%>/front/image/carorder/news_map_West.jpg")
										    	  }	
										    	  else if(selectCity == cityArr3[i]){
										    		  loctionString = "南"
										    			  loctionNo = "50"
										    	   $('.loctionPic').attr("src","<%=request.getContextPath()%>/front/image/carorder/news_map_South.jpg")
										    	  }
										    	}
									    	 	 $('.loctionPic').hide();
									    	 	 $('.loctionPic').fadeIn(1000);
										    	console.log("loctionString :"+ loctionString);
										    	console.log("loctionNo:"+ loctionNo);
										    	
									    	 });
									    	});
									    </script>
									    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script><!-- 甜甜的sweetalert2 -->
						    
							<!-- <button type="button" class="btn btn-primary" id="testbtn">測試用按鈕</button> -->
							
</body>
</html>