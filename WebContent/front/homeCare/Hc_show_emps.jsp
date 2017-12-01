<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.member.model.*" %>

<jsp:useBean id="crdSvc"  class="com.thecared.model.ThecaredService"/>
<jsp:useBean id="empPhSvc"  class="com.employee_photo.model.EmpPhotosService"/>
<jsp:useBean id="employeeService"  class="com.employee.model.EmployeeService"/>
<jsp:useBean id="expertService"  class="com.expert.model.ExpertService"/>
<jsp:useBean id="expertlistService"  class="com.expertlist.model.ExpertlistService"/>


<jsp:useBean id="hcOrderDetailService" scope="page" class="com.hcorder.modal.HcOrderDetailService"/>


<!-- 不可快取 -->
<% response.setDateHeader("Expires",0); %>
<!-- 放入假的會員 -->
<% MemberService memSvc = new MemberService();
   MemberVO memVO = (MemberVO)memSvc.findByPrimaryKey("MEM0002");
   session.setAttribute("memVO",memVO);
%>

<%@ include file="/front/navbar.jsp" %>
<!DOCTYPE html>
<html lang="zh-TW">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>長照訂單</title>
<!-- 		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- 		<link href="css/takecare.css" rel="stylesheet"> -->
		
<!-- 			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<!-- 			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script> -->
		
	</head>
	
		<style type="text/css">
		
 #login {
    padding-top: 50px
}
#login .form-wrap {
    width: 60%;
    margin: 0 auto;
}
#login h1 {
    color: #1fa67b;
    font-size: 18px;
    text-align: center;
    font-weight: bold;
    padding-bottom: 20px;
}
#login .form-group {
    margin-bottom: 25px;
}
#login .checkbox {
    margin-bottom: 20px;
    position: relative;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    -o-user-select: none;
    user-select: none;
}
#login .checkbox.show:before {
    content: '\e013';
    color: #1fa67b;
    font-size: 17px;
    margin: 1px 0 0 3px;
    position: absolute;
    pointer-events: none;
    font-family: 'Glyphicons Halflings';
}
#login .checkbox .character-checkbox {
    width: 25px;
    height: 25px;
    cursor: pointer;
    border-radius: 3px;
    border: 1px solid #ccc;
    vertical-align: middle;
    display: inline-block;
}
#login .checkbox .label {
    color: #6d6d6d;
    font-size: 13px;
    font-weight: normal;
}
#login .btn.btn-custom {
    font-size: 14px;
  margin-bottom: 20px;
}
#login .forget {
    font-size: 13px;
  text-align: center;
  display: block;
}

.myform-row{
 margin-top:10px;
}

/*    --------------------------------------------------
  :: Inputs & Buttons
  -------------------------------------------------- */
.form-control {
    color: #212121;
}
.btn-custom {
    color: #fff;
  background-color: #1fa67b;
}
.btn-custom:hover,
.btn-custom:focus {
    color: #fff;
}

/*    --------------------------------------------------
    :: Footer
  -------------------------------------------------- */
#footer {
    color: #6d6d6d;
    font-size: 12px;
    text-align: center;
}
#footer p {
    margin-bottom: 0;
}
#footer a {
    color: inherit;
}
	/*    --------------------------------------------------
    :: login end
  -------------------------------------------------- */	
		


/*empblock*/
.outerpadding{
    padding:10% 0%;}
.boximg{
	position:relative;
	overflow:hidden;
	}
	
.boximg img{
		transition:all ease-in 500ms;
		border:1px solid #fff;
	}	
.boximg img:hover{
	transform:scale(1.3,1.3);
	cursor:pointer;
	
	}	
	
.boximg:hover{
	border:1px solid #fff;
	}	
	
.date{
	 left: 0;
    position: absolute;
    top: 15px;
	padding:5px;
	background-color:teal;
	opacity:0;
	transition:all ease-in 300ms;
	
	}	
	
.likebut{
	background: none repeat scroll 0 0 teal;
    height: 25px;
    padding: 7px;
    position: absolute;
    right: 5px;
    top: 130px;
    width: 25px;
	opacity:0.4;
	transition:all ease-in 300ms;
	}
	
	
.boximg:hover .date{
	opacity:1;
	
	}	
.boximg:hover .likebut{
	opacity:1;
	
}
/*empblock*/

.empblock{
	height:450px;
}

a.thumbnail{
	border:0px;
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
.hc_order .modal-footer{
   border-top:0px;
}
		</style>
	<body>




<!-- 各項服務內容 ============================================================================== -->

<div class="container">
  <div class="row">
    <div class="col-xs-12 col-sm-12">
    
    
    
    <div class="container">



    </div>
    
    
<section id="login">
    <div class="container">
      <div class="row">
          <div class="col-xs-12">
              <div class="form-wrap">
                <h1>選擇照護人員</h1>
                    
                        <div class="form-group">
                          	<label class="sr-only" for="caredNo">照護對象</label>
							<select size="1" class="form-control" name="caredNo" id="caredNo">
								<option value="" selected>請選擇照護對象</option>
								<c:forEach var="crdVO" items="${crdSvc.getAllByMemNo('MEM0002')}" > 
									<option value="${crdVO.caredNo}">${crdVO.caredName}
								</c:forEach>   
							</select>  
                        </div>
                        
                        
                        
                        <div class="form-group">
                            <label for="key" class="sr-only">選擇照護人員</label>
                        	<input type="text"  class="form-control" id="empName-final" name="empName" aria-describedby="helpBlock2" placeholder="請選擇下方照護人員" readonly>
                        </div>
					<form METHOD = "post" action="<%=request.getContextPath()%>/front/homeCare/Hc_order.jsp" id="login-form">
                        <input type="submit" id="btn-login" class="btn btn-custom btn-lg btn-block" value="確定">
                        <input type="hidden" name="servDate" value="${param.servDate}">
                        <input type="hidden" name="servTime" value="${param.servTime}">
                        <input type="hidden" name="caredNo" value="${param.caredNo}">
                        <input type="hidden" name="empNo" value="${param.empNo}">
                    </form>
                    
                    <hr>
              </div>
        </div> <!--/.col-xs-12-->
      </div> <!--/.row-->
    </div> <!--/.container-->
</section>
    
    
    
                     
<c:if test='${hcWorkShiftsVOList}== null || ${hcWorkShiftsVOList}.equals("")'>還沒選擇日期喔!</c:if> 



	</div>
	</div>
	
	
	<div class="row">
<!-- 	   <hr>	 -->
	   <div class="col-xs-12 col-sm-12">
	     <h4 style="color:#1fa67b">重新查詢:</h4>
	   <form class="form-inline"  id='listHcWorks_ByCompositeQuery' action = "<%=request.getContextPath()%>/HcWorkshifts/HcWorkshiftsServlet.do" method="post">
        <div class="myform-row">
         
	         <div class="form-group ">
	          <label class="control-label" for="servDate">請點選日期</label>
	           <input type="text" value="${param.servDate}" class="form-control" id="servDate" name="servDate" aria-describedby="helpBlock2" readonly>
	         </div>        
	         <div class="form-group ">
	          <label class="control-label" for="servTime">請點選服務時段</label>
	          <select class="form-control" id="servTime" name="servTime" aria-describedby="helpBlock2">
	            <option value="" selected>請選擇服務時段</option>
	          	<option value="早"> 上午(08:00~12:00)</option>
	          	<option value="中"> 下午 (13:30~17:30)</option>
	          	<option value="晚"> 晚上 (18:00~22:00)</option>
	          </select>
	        </div>
        
        	                        
	         <div class="form-group ">
	          <label class="control-label" for="expNo">請選擇服務人員條件</label>
	          <select class="form-control" id="expNo" name="expNo" aria-describedby="helpBlock2">
	            <option value="" selected>請選擇服務人員條件(非必選)</option>
	          	<option value="101"> 丙級照護員</option>
	          	<option value="102"> 乙級照護員</option>
	          	<option value="201"> 護士</option>
	          	<option value="202"> 護理師</option>
	          </select>
	        </div>
       </div>
        
       <div class="myform-row">
	        
	       <div class="form-group ">
	          <label class="control-label" for="empName">搜尋服務人員姓名</label>
	           <input type="text" value="" class="form-control" id="empName" name="empName" aria-describedby="helpBlock2" placeholder="輸入關鍵字(非必要)">
	         </div>
	        
	        
	        <input type="hidden" name="action" value="listHcWorks_ByCompositeQuery">
	        <input type="hidden" name="shiftNumber" value="00">
	        <input type="hidden" name="successView" value="/front/homeCare/Hc_show_emps.jsp">
	        <input type="hidden" name="failureV" value="/front/homeCare/Hc_show_emps.jsp">
	
	         <div class="form-group pull-right">       
	        <input type="submit" class="btn btn-default" value="重新查詢">
	         </div>
       </div>
       <hr>
<!--         <div class="form-group "> -->
<!--           <label class="control-label" for="location">請點選服務地區</label> -->
<!--           <select class="form-control" id="location" name="location" aria-describedby="helpBlock2"> -->
<!--             <option value="" selected>請點選服務地區</option> -->
<!--           	<option value="早"> 北區</option> -->
<!--           	<option value="中"> 中區</option> -->
<!--           	<option value="晚"> 南區</option> -->
<!--           </select> -->
<!--         </div> -->
              
      </form>    
<!--       錯誤訊息 -->
			<c:if test="${not empty errorMsgs}">
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color:red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
	   </div>
	</div>
	
	
	 <div class="row">
	   <div class="col-xs-12 col-sm-12">

            
			<div class="col-xs-12 col-sm-4 empblock">
				<a href="javascript:produceEmp()" class="thumbnail emplist" id="emp-btn" aria-describedby="helpBlock2">
		     	<div class="panel">
			        <div class="panel-heading" style="background-color:teal;color:#e6bd36;border-radius: 10px 10px 0px 0px;"><strong>自動選擇服務人員</strong></div>
			        <div class="panel-body" style="background-color:#fff;color:#333; box-shadow:0 -12px 13px teal inset;border-radius: 0px 0px 10px 10px;">
			        
			        <div class="boximg">
			         <img src="<%=request.getContextPath()%>/front/homeCare/image/holdhand.jpg" alt="圖片載入中" class="img-responsive">
			         <span class="label label-danger date"></span>
			         </div>        
			  		 <br>
			        <p class="pull-left">-由我們幫你找最優秀的照護人員<br><br><br>		
			        </p>		     
                     <span class="badge pull-right" style="background-color:#ffd340; font-size:20px;">選擇我</span>
				    </div>
			     </div>
			    </a>
			</div>
           

					
					
            		<c:forEach var="hcWorkShiftsVO" items="${hcWorkShiftsVOList}" varStatus="s" > 
							<div class="col-xs-12 col-sm-4 empblock" >
                                <a href="javascript:produceEmp${s.index}()" class="thumbnail emplist" id="emp-btn${s.index}" aria-describedby="helpBlock2">
                                <div class="panel">
                                	        <div class="panel-heading" style="background-color:teal;color:#e6bd36;border-radius: 10px 10px 0px 0px;"><strong>${employeeService.findByPrimaryKey(hcWorkShiftsVO.getEmpNo()).getEmpName()}</strong></div>
									        <div class="panel-body" style="background-color:#fff;color:#333; box-shadow:0 -12px 13px teal inset;border-radius: 0px 0px 10px 10px;">
									        
									        <div class="boximg">
												<c:choose>
												    <c:when test="${empPhSvc.getAllByEMPNO(hcWorkShiftsVO.empNo).size()!= 0}">
												    <div class="emp-img">
												        <img src="<%=request.getContextPath()%>/DBGifReader4?emp_photo_no=${empPhSvc.getAllByEMPNO(hcWorkShiftsVO.getEmpNo()).get(0).getEmpPhtoNo()}"  alt="圖片連線中" class="img-responsive"> 
												    </div>
												    </c:when>
			
												    <c:otherwise>
												    	<div class="emp-img">
												        <img src="<%=request.getContextPath()%>/noData/noPic.jpg" alt="圖片連線中" class="chose-img${s.index}">
												        </div>
												    </c:otherwise>
												</c:choose>
												<span class="label label-danger date">${param.servDate}</span>
											 </div>
											    <br>
									        <p >專長<br></p>
									
									        
									     <ul>
                                        <c:forEach items='${expertService.getAllByEmpNo(hcWorkShiftsVO.getEmpNo())}' var='experVO'>
                                        	<li>${expertlistService.getOneEXPLIST(experVO.getExpNo()).getExpName()}</li>
                                        </c:forEach>
                                        </ul>
                                        <span>${expertlistService.getOneEXPLIST(expertService.getAllByEmpNo(hcWorkShiftsVO.getEmpNo()).get(0).getExpNo()).getExpPrice()}元</span>
                                        <span class="badge pull-right" style="background-color:#ffd340; font-size:20px;">選擇我</span>
									        
							      </div>
							     </div>                                    
                                </a>
                                <script>
                                	function produceEmp${s.index}(){
                                		console.log('${hcWorkShiftsVO.getEmpNo()}');                                		
                                		$("[name='empNo']").val('${hcWorkShiftsVO.getEmpNo()}');
                                		$("#empName-final").val('${employeeService.findByPrimaryKey(hcWorkShiftsVO.getEmpNo()).getEmpName()}');
                                	};
                                </script> 
                            </div>
					</c:forEach>
<!-- 							須加入無人員處理 -->

  
  
      </div>
 </div>
</div>
<!-- <div class="container outerpadding"> -->
<!-- <div class="row"> -->

<!--   <div class="col-lg-3"> -->
<!--      <div class="panel"> -->
<!--         <div class="panel-heading" style="background-color:teal;color:#fff;"><strong>Lorem Ipsum</strong></div> -->
<!--         <div class="panel-body" style="background-color:#000;color:#fff; box-shadow:0 -12px 13px teal inset;"> -->
        
<!--         <div class="boximg"> -->
<!--          <img src="http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_52c470899a2e1_1.JPG" class="img-responsive"> -->
<!--          <span class="label label-danger date">25 December 2015</span> -->
<!--          <span class="likebut glyphicon glyphicon-tag"></span> -->
<!--          </div> -->
         
         
<!--    <br> -->
<!--         <p class="pull-left">Lorem ipsum Lorem ipsum<br> -->

<!--         </p> -->
     
<!--         <span class="badge pull-right" style="background-color:teal">25</span> -->
<!--       </div> -->
<!--      </div> -->
     
<!--   </div> -->
<!--   <div class="col-lg-3"> -->
<!--      <div class="panel"> -->
<!--         <div class="panel-heading" style="background-color:teal;color:#fff;"><strong>Lorem Ipsum</strong></div> -->
<!--         <div class="panel-body" style="background-color:#000;color:#fff; box-shadow:0 -12px 13px teal inset;"> -->
        
<!--         <div class="boximg"> -->
<!--          <img src="http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_52c470899a2e1_1.JPG" class="img-responsive"> -->
<!--          <span class="label label-danger date">25 December 2015</span> -->
<!--          <span class="likebut glyphicon glyphicon-tag"></span> -->
<!--          </div> -->
         
         
<!--    <br> -->
<!--         <p class="pull-left">Lorem ipsum Lorem ipsum<br> -->
<!--            <span class="glyphicon glyphicon-star" style="font-size:18px;"></span> -->
<!--             <span class="glyphicon glyphicon-star" style="font-size:18px;"></span> -->
<!--              <span class="glyphicon glyphicon-star" style="font-size:18px;"></span> -->
<!--               <span class="glyphicon glyphicon-star" style="font-size:18px;"></span> -->
<!--                <span class="glyphicon glyphicon-star-empty" style="font-size:18px;"></span> -->
<!--         </p> -->
     
<!--         <span class="badge pull-right" style="background-color:teal">25</span> -->
<!--       </div> -->
<!--      </div> -->
<!--   </div> -->
<!--   <div class="col-lg-3"> -->
<!--      <div class="panel"> -->
<!--         <div class="panel-heading" style="background-color:teal;color:#fff;"><strong>Lorem Ipsum</strong></div> -->
<!--         <div class="panel-body" style="background-color:#000;color:#fff; box-shadow:0 -12px 13px teal inset;"> -->
        
<!--         <div class="boximg"> -->
<!--          <img src="http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_52c470899a2e1_1.JPG" class="img-responsive"> -->
<!--          <span class="label label-danger date">25 December 2015</span> -->
<!--          <span class="likebut glyphicon glyphicon-tag"></span> -->
<!--          </div> -->
         
         
<!--    <br> -->
<!--         <p class="pull-left">Lorem ipsum Lorem ipsum<br> -->
<!--            <span class="glyphicon glyphicon-star" style="font-size:18px;"></span> -->
<!--             <span class="glyphicon glyphicon-star" style="font-size:18px;"></span> -->
<!--              <span class="glyphicon glyphicon-star" style="font-size:18px;"></span> -->
<!--               <span class="glyphicon glyphicon-star" style="font-size:18px;"></span> -->
<!--                <span class="glyphicon glyphicon-star-empty" style="font-size:18px;"></span> -->
<!--         </p> -->
     
<!--         <span class="badge pull-right" style="background-color:teal">25</span> -->
<!--       </div> -->
<!--      </div> -->
<!--   </div> -->
<!--   <div class="col-lg-3"> -->
<!--      <div class="panel"> -->
<!--         <div class="panel-heading" style="background-color:teal;color:#fff;"><strong>Lorem Ipsum</strong></div> -->
<!--         <div class="panel-body" style="background-color:#000;color:#fff; box-shadow:0 -12px 13px teal inset;"> -->
        
<!--         <div class="boximg"> -->
<!--          <img src="http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_52c470899a2e1_1.JPG" class="img-responsive"> -->
<!--          <span class="label label-danger date">25 December 2015</span> -->
<!--          <span class="likebut glyphicon glyphicon-tag"></span> -->
<!--          </div> -->
         
         
<!--    <br> -->
<!--         <p class="pull-left">Lorem ipsum Lorem ipsum<br> -->

<!--         </p> -->
     
<!--         <span class="badge pull-right" style="background-color:teal">25</span> -->
<!--       </div> -->
<!--      </div> -->
<!--   </div> -->
<!--  </div> -->

<!-- </div> -->

		
		
		<%@ include file="/front/footerbar.jsp" %>  
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/front/homeCare/laydate/laydate.js"></script> 
		
		<script>
	    laydate.render({
	        elem: '#servDate' 
	        ,min: '0'
	        ,max: '2018-12-31'
	        ,done: function(value, date, endDate){
	            $('#servDate-final').attr('value',value);
	            console.log(value); 
	            console.log(date); 
	        }
	    });
		

			$(function() { 
				$("#caredNo").val("${param.caredNo}");
				
				$('#caredNo').change(function(){
					console.log($(this).find(':selected').attr('value'));
					$("[name='caredNo']").val($(this).find(':selected').attr('value'));
				
				});
				
		    	$("#servTime").val("${param.servTime}");
		    	$("#caredNo").val("${param.caredNo}");
		    	$("#empNo").val("${param.empNo}");
		    	$("#expNo").val("${param.expNo}");

				
			});
			
			
			

			
        	function produceEmp(){
	     		$("[name='empNo']").val('EMP0000');
	     		$('#empName-final').val('自動選人');
	     		
     		};
		</script>
	</body>
</html>