<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.member.model.*" %>
<%@ page import="com.hcworkshifts.model.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="crdSvc" scope="page" class="com.thecared.model.ThecaredService"/>
<jsp:useBean id="empPhSvc" scope="page" class="com.employee_photo.model.EmpPhotosService"/>
<jsp:useBean id="expertlistService" scope="page" class="com.expertlist.model.ExpertlistService"/>
<jsp:useBean id="expertService"  class="com.expert.model.ExpertService"/>
<jsp:useBean id="employeeService" scope="page" class="com.employee.model.EmployeeService"/>

<% 
request.setCharacterEncoding("UTF-8");
	
%>


<%@ include file="/front/navbar.jsp" %>

	<head>
	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>長照服務</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		
<!-- 		<!--[if lt IE 9]--> 
<!-- 			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<!-- 			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script> -->



        <style type="text/css">
            .introduction{
                background-color:rgba(255, 238, 170, 0.29);
            }
            .instruction{
                background-color:rgba(255, 238, 170, 0.29);


            }
            .instruction hr{
                border:0; 
                height:1px; 
                background-color:#d4d4d4;
                color:#d4d4d4   ;
            }
            .instruction-head{
                margin-bottom: 30px;
            }
            .instruction img{
                width: 485px;
                height:301px;
            }
            .instruction .imgblock,.instruction .text-item{
                margin-bottom: 30px;
            }
            .emplist .emp-img{
            	height:200px;
            }
            .emplist .emp-img img{
           		max-width:100%;
				max-height:100%;
				margin:auto;
				display:block;
            }
            #showfinal-emp{
            	width:250px;
            	height:200px;
            }
            
            #showfinal-emp img  {
           		max-width:100%;
				max-height:100%;
				margin:auto;
				display:block;
            }
            
            
			                                             /*置頂用*/
			#gotop {
			    position: fixed;
			    border-radius: 50px;
			    right: 20px;
			    bottom: 10px;
			    padding: 10px 16px;
			    font-size: 25px;
			    background: rgba(228, 211, 211, 0.36);
			    color: #FAFCFD;
			    cursor: pointer;
			    z-index: 1000;
			}
            
        </style>

	</head>
	<body>


<!-- 內容 ============================================================================== -->
<!--         <div class="container" style="height:55px"> </div> -->
<div id="gotop" class="papa" >˄</div>
<div class="container">
  <div class="page-header" id="banner" style="margin-bottom:0px">
  <img src="<%=request.getContextPath()%>/img/index/bannar/senior-asian-couple-walking-fix.jpg" style=" max-width:-webkit-fill-available;">
<!--   <div class="row"> -->
<!--   <hr> -->
<!--           <i>  首頁/照護服務/短期照護</i> -->
<!--   </div> -->
</div>
</div>
        <!-- 引言 --------------------------------------------------------------- -->
        <div class="container introduction">
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <div class="text-item text-center">
                        <h1>照護服務</h1>
						<p>希望有照護人員輔助生活起居與陪同就醫。或是家庭照顧者想紓解照顧壓力，需要暫時的居家喘息服務嗎?<br>
						甚至是等待外籍看護交班的空窗期，迫切需要短時間的照顧服務員、看護前來照顧嗎?<br>
						現在，只要簡單幾步就能輕鬆獲得居家照護服!!</p>
                    </div>
                </div>
            </div>

        </div>
        <!-- 服務流程 ------------------------------------------------- -->

        <div class="container instruction">
            <div class="row instruction-head">
                <div class="col-xs-12 col-sm-4">
                    <br>
                    <hr>
                </div>
                <div class="col-xs-12 col-sm-4 text-center">
                    <h2>如何獲得服務?</h2>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <br>
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-6">
                    <div class="imgblock text-center">
                        <img src="<%=request.getContextPath()%>/front/homeCare/image/loughing-elder.jpg" >
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6">
                    <div class="panel panel-success text-item">
                      <div class="panel-heading">
                        <h3 class="panel-title">填寫會員基本資料</h3>
                      </div>
                      <div class="panel-body text-center">
								<p>輕鬆簡單的付款<br>
								 只要在會員中心儲值點數，並填寫被照護人<br>
								 就可以隨時隨地享用我們的服務<br>
								 <br>
								</p>

                        <a href='<%=request.getContextPath()%>/front/member/MemberRegister.jsp' data-toggle="modal" class="btn btn-primary">還沒註冊嗎?</a>
                      </div>  
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-sm-push-6"> 
                    <div class="imgblock text-center">
                        <img src="<%=request.getContextPath()%>/front/homeCare/image/a001.jpg">
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-sm-pull-6">
                    <div class="panel panel-success text-item">
                      <div class="panel-heading">
                        <h3 class="panel-title">選擇短期服務</h3>
                      </div>
                      <div class="panel-body text-center">
                        <div class="row">
                            <div class="text-item">
                              <p>我們提供個人化的服務<br><br>
								點選下方按鈕，選擇你需要服務的日期 <br>
								再選擇你須要服務的時段<br> 
								一天有三個時段讓你彈性選擇!!</p><br>

                                
                            </div>
                            <a href='#modal-step1' data-toggle="modal" class="btn btn-primary">短期服務</a>
                            
                        </div>
                      </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-6">
                    <div class="imgblock text-center">
                        <img src="<%=request.getContextPath()%>/front/homeCare/image/a002.jpg">
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6">
                    <div class="panel panel-success text-item">
                      <div class="panel-heading">
                        <h3 class="panel-title">選擇長期服務</h3>
                      </div>
                      <div class="panel-body text-center">
                        <div class="row">
                            <div class="text-item">
                                <p>我們有非常多的照護人員<br>
								各個都是經過專業訓練並且有合格證照的 <br>
								您可以自由選擇信賴的照護員 <br>
								<br>
								P.S.長期服務將由平台自動幫你安排服務人員!</p><br>
<!--                                 <a href='#modal-step2' data-toggle="modal" class="btn btn-primary">選擇照護人員</a> -->
                                <a href='<%=request.getContextPath()%>/front/homeCare/Hc_order_long.jsp' data-toggle="modal" class="btn btn-primary">長期服務</a>
                                
                            </div>
                        </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script><!-- 甜甜的sweetalert2 -->

								<c:if test="${not empty errorMsgs}">	
										<c:forEach var="message" items="${errorMsgs}">
											<script>										
											$(function(){
												swal("錯誤訊息", '${message}');												
											});								
											</script>
										</c:forEach>	
								</c:if>
								<% request.removeAttribute("errorMsgs"); %>

        <!-- 跳窗 ------------------------------ -->
        <div class="modal fade" id="modal-step1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">選擇服務日期</h4>
                    </div>
                    
                    <form id='getAllByDateTime' action = "<%=request.getContextPath()%>/HcWorkshifts/HcWorkshiftsServlet.do" method="post">
                    
	                    <div class="modal-body">
	                        
	                        <div class="form-group has-success">
	                          <label class="control-label" for="servDate">請點選日期</label>
	                          <input type="text" value="${param.servDate}" class="form-control" id="servDate" name="servDate" aria-describedby="helpBlock2" readonly>
	                         </div>
	                        
	                         <div class="form-group has-success">
	                          <label class="control-label" for="servTime">請點選服務時段</label>
	                          <select class="form-control" id="servTime" name="servTime" aria-describedby="helpBlock2">
	                            <option value="" selected>請選擇服務時段</option>
	                          	<option value="早"> 上午(08:00~12:00)</option>
	                          	<option value="中"> 下午 (13:30~17:30)</option>
	                          	<option value="晚"> 晚上 (18:00~22:00)</option>
	                          </select>
	                          <span id="helpBlock2" class="help-block">貼心提醒:照護服務僅提供會員使用喔!<a href="<%=request.getContextPath()%>/front/member/MemberRegister.jsp">點我加入會員</a></span>
	                        </div>
	                        
	                        	                        
<!-- 	                        <div class="form-group has-success"> -->
<!-- 	                          <label class="control-label" for="location">請點選服務地區</label> -->
<!-- 	                          <select class="form-control" id="location" name="location" aria-describedby="helpBlock2"> -->
<!-- 	                            <option value="" selected>請點選服務地區</option> -->
<!-- 	                          	<option value="早"> 北區</option> -->
<!-- 	                          	<option value="中"> 中區</option> -->
<!-- 	                          	<option value="晚"> 南區</option> -->
<!-- 	                          </select> -->
<!-- 	                        </div> -->
	                        
<!-- 	                         <div class="form-group has-success"> -->
<!-- 	                          <label class="control-label" for="expNo">請選擇服務人員條件</label> -->
<!-- 	                          <select class="form-control" id="expNo" name="expNo" aria-describedby="helpBlock2"> -->
<!-- 	                            <option value="" selected>請選擇服務人員條件(非必選)</option> -->
<!-- 	                          	<option value="101"> 丙級照護員</option> -->
<!-- 	                          	<option value="102"> 乙級照護員</option> -->
<!-- 	                          	<option value="201"> 護士</option> -->
<!-- 	                          	<option value="202"> 護理師</option> -->
<!-- 	                          </select> -->
<!-- 	                        </div> -->
	                        
	                        <input type="hidden" name="action" value="getAllByDateTime">
	                        <input type="hidden" name="successView" value="/front/homeCare/Hc_show_emps.jsp">
        					<input type="hidden" name="failureV" value="/front/homeCare/Hc_order.jsp">
	                        
	                    </div>
	                    <div class="modal-footer">                      
	<!--                         <input type="submit" class="btn btn-primary" data-dismiss="modal" id="datenloc-check" value="確認"> -->
	                        <input type="submit" class="btn btn-primary"  id="datenloc-check" value="確認">
	                        
	                        
	                    </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- form -------------------------------->


        <div class="container order-list">
            <div class="row">
                <div class="col-xs-12 col-sm-4">
                    <br>
                    <hr>
                </div>
                <div class="col-xs-12 col-sm-4 text-center">
                    <h2>立即取得服務</h2>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <br>
                    <hr>
                </div>

            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-2"></div>
                <div class="col-xs-12 col-sm-8">
                    <div class="form-group">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">                      
                        <h4 class="modal-title">  </h4>
                    </div>
                    <form METHOD="post" ACTION="<%=request.getContextPath()%>/HcOrder/HcOrderController.do" class="hc_order">
	                    <div class="modal-body">	                        
	                            <div class="form-group ">
	                              <label class="control-label" for="servDate-final">服務日期</label>
	                              <input type="text" value="${param.servDate}" class="form-control" name="servDate" id="servDate-final" aria-describedby="helpBlock2" readonly>
	
	                              <label class="control-label" for="servTime-fianl">服務時段</label>
									<select id="servTime-final"  class="form-control" name="servTime"  aria-describedby="helpBlock2">
										<option value="">請選擇服務時段</option>
										<option value="早"> 上午(08:00~12:00)</option>
										<option value="中"> 下午 (13:30~17:30)</option>
										<option value="晚"> 晚上 (18:00~22:00)</option>
									</select>
	
	                              <label class="control-label" for="cared-fianl">服務對象</label>	                              
									<select size="1" class="form-control" name="caredNo"  id="caredNo-final" aria-describedby="helpBlock2">
										<option value="" selected>請選擇</option>
										<c:forEach var="crdVO" items="${crdSvc.getAllByMemNo(memberVO.getMemNo())}" > 
											<option value="${crdVO.caredNo}">${crdVO.caredName}
										</c:forEach>   
									</select>    
	
	                              <label class="control-label" for="empNo-final">照護人員</label>
	                              
	                              <div id="showfinal-emp">
	                              
	                              	<c:choose>
									    <c:when test='${not empty param.empNo && empPhSvc.getAllByEMPNO(param.empNo).size()!=0}'>
									        <img src="<%=request.getContextPath()%>/DBGifReader4?emp_photo_no=${empPhSvc.getAllByEMPNO(param.empNo).get(0).getEmpPhtoNo()}"  alt="圖片連線中1" class="input-img"> 
									    
									    </c:when>
									    
									    <c:when test='${param.empNo eq "EMP0000"}'>
									        <img src="<%=request.getContextPath()%>/front/homeCare/image/holdhand.jpg" alt="圖片連線中" class="input-img"  alt="圖片連線中" class="input-img"> 
									    
									    </c:when>
									    
									    <c:when test='${not empty param.empNo && empPhSvc.getAllByEMPNO(param.empNo).size()==0}'>
									        <img src="<%=request.getContextPath()%>/noData/noPic.jpg" alt="圖片連線中" class="input-img"  alt="圖片連線中" class="input-img"> 
									    
									    </c:when>
									    

									    <c:otherwise>
									      	  <img src="" alt="還未選擇服務人員" class="input-img">									        
									    </c:otherwise>
									</c:choose>
	                              
	                              </div>
	                              
<%-- 	                              ${param.empNo} --%>
<%-- 	                              + ${expertService.getAllByEmpNo(param.empNo).size()} --%>
<%-- 	                              ++ ${expertService.getAllByEmpNo(param.empNo).get(0).getExpNo()} --%>
	                              <span id='empName'>${employeeService.findByPrimaryKey(param.empNo).getEmpName()}</span><br>
	                            <c:choose>
	                               <c:when test='${expertService.getAllByEmpNo(param.empNo).size() != 0}'>
	                              <span id='price'>${expertlistService.getOneEXPLIST(expertService.getAllByEmpNo(param.empNo).get(0).getExpNo()).getExpPrice()}元</span>
	                               </c:when>
	                               <c:when test='${not empty param.expNo}'>
	                              <span id='price'>${expertlistService.getOneEXPLIST(param.expNo).getExpPrice()}元</span>
	                               </c:when>
	                               <c:otherwise>
	                               </c:otherwise>
	                            </c:choose>
	                              <input type="hidden" class="form-control" id="empNo-final" name="empNo" value="${param.empNo}" aria-describedby="helpBlock2">
	                              <input type="hidden" class="form-control" name="memNo" value="${memberVO.memNo}" aria-describedby="helpBlock2">
	                              <input type="hidden" class="form-control" name="price" value="" aria-describedby="helpBlock2">
	                              <input type="hidden" class="form-control" name="action" value="add_hc_order" aria-describedby="helpBlock2">
	                              <input type="hidden" class="form-control" name="expNo" value="${param.expNo}" aria-describedby="helpBlock2">	                              
	                              <input type="hidden" class="form-control" name="forwardURL" value="<%=request.getServletPath()%>" aria-describedby="helpBlock2">
		                         </div>	                        
	                    </div>
	                    <div class="modal-footer">
	                    	<span id="helpBlock2" class="help-block pull-left">還沒儲值嗎?<a href="<%=request.getContextPath()%>/front/member/BalanceInsert.jsp">點我儲值</a></span>                      
	                        <button type="submit" class="btn btn-primary" >確認送出</button>                        
	                    </div>
                    </form>
                </div>
            </div>
                    </div>  
                </div> 
                <div class="col-xs-12 col-sm-2"></div>
            </div>
        </div>



        




<%@ include file="/front/footerbar.jsp" %>        
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script src="<%=request.getContextPath()%>/front/css/homeCare/laydate/laydate.js"></script>
<script>
    laydate.render({
        elem: '#servDate' 
        ,min: 1
        ,max: '2018-12-31'
        ,showBottom: false
        ,done: function(value, date, endDate){
            $('#servDate-final').attr('value',value);
            console.log(value); 
            console.log(date); 
        }
    });
     
    laydate.render({
        elem: '#servDate-final' 
        ,min: 1
        ,max: '2017-12-31'
        ,showBottom: false
        ,done: function(value, date, endDate){
            $('#servDate').attr('value',value);
            console.log(value); 
            console.log(date); 
        }
    });
    
    //置頂用的
	$("#gotop").click(function(){
	    jQuery("html,body").animate({
	        scrollTop:0
	    },1000);
	});
	$(window).scroll(function() {
	    if ( $(this).scrollTop() > 300){
	        $('#gotop').fadeIn("fast");
	    } else {
	        $('#gotop').stop().fadeOut("fast");
	    }
	});
           
    $(function() { 
    	console.log('${param.servDate}'+'!!!');
    	console.log('${param.servTime}'+'!!!');
    	console.log('${param.caredNo}'+'!!!');
    	console.log('${param.empNo}'+'!!!');
    	console.log('${param.expNo}'+'!!!');

    	if('${param.empNo}' != ''){
    		$('html,body').animate({ scrollTop: document.body.clientHeight }, 1000);
    	}
    	
    	
    	$('#datenloc-check').on('chang', function(){
			$('#getAllByDateTime').submit();	
		});    	
		
    	$("#servTime").val("${param.servTime}");
    	$("#servTime-final").val("${param.servTime}");
    	$("#caredNo").val("${param.caredNo}");
    	$("#caredNo-final").val("${param.caredNo}");
    	$("#empNo-final").val("${param.empNo}");
    	
    	$('#caredNo').change(function(){
    		console.log($(this).find(':selected').attr('value'));
    		$('#caredNo-final').val('${param.caredNo}');

    	});
    	$('#caredNo-final').change(function(){
    		console.log($(this).find(':selected').attr('value'));
    		$('#caredNo').val($(this).find(':selected').attr('value'));  
    		
    	});
    	
    	console.log('**'+ $('#price').text());
    	$("[name=price]").attr('value', $('#price').text());
    	
    	
<%-- 			<% List<String> list = (List<String>)request.getAttribute("errorMsgs");%> --%>
//     		var toAlert = [		
<%-- 			<% if(list != null){ %> --%>
<%-- 			<% for(int i =0 ;i<list.size();i++){ %> --%>
<%--     		'<%=list.get(i)%>',  		 --%>
<%--     		<% } %> --%>
<%--     		<% }; %> --%>
//     		"."]; 	
//     		console.log(toAlert);
//     		window.alert(toAlert);
    });

// 	<c:if test="${not empty errorMsgs}">
// 			<ul>
// 			<c:forEach var="message" items="${errorMsgs}">
// 				<li style="color:red">${message}</li>
// 			</c:forEach>
// 			</ul>
// 	</c:if>
</script>



