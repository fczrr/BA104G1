<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.hcworkshifts.model.*"%>
<%@ page import="com.employee.model.*"%>
<jsp:useBean id="employeeService" scope="page" class="com.employee.model.EmployeeService" />
<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

<%
	
	Object obj = request.getAttribute("listHcWorks_ByCompositeQuery");
	List<HcWorkShiftsVO> listHcWorks_ByCompositeQuery = new ArrayList<HcWorkShiftsVO>();
	if (obj == null) {
		HcWorkShiftsService hcWorkShiftsService = new HcWorkShiftsService();
		listHcWorks_ByCompositeQuery = hcWorkShiftsService.getAll();
	} else {
		listHcWorks_ByCompositeQuery = (List<HcWorkShiftsVO>) obj;
	}
	request.setAttribute("listHcWorks_ByCompositeQuery", listHcWorks_ByCompositeQuery);

	int num = 0;
%>

<head>

<title>短期照護服務</title>

<style>
#middle {align ="center";
	
}

.hover:hover {
	background-color: #CCC;
}

table#table-1 {
	width: 930px;
	background-color: #DADFDF;
	margin-top: 5px;
	margin-bottom: 10px;
	height: 80px;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}

.table>thead>tr>th {
	text-align: center;
}

.table>tbody>tr>td {
	text-align: center;
}

#modifyBtn {
	margin-Top: 10px;
}

.modal {
	text-align: center;
	padding: 0 !important;
}

.modal:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -4px;
}

.modal .modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>
</head>

<div class="right_col" role="main">
	<div class="">

		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">



						<div class="x_title">
							<div id="mytitle"
								style="padding: 10px; color: #FFFFFF; text-align: center;">


								<a class="btn btn-block btn-lg btn-primary" data-toggle="modal"
									data-target="#mymodal">
									<h1><b>長照班表管理</b>
									</h1>

								</a>

							</div>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"> <i
										class="fa fa-chevron-up"> </i>
								</a></li>

							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
	<div class="row">
<!-- 	   <hr>	 -->
	   <div class="col-xs-12 col-sm-12">
<!-- 	     <h4 style="color:#428fdc">查詢:</h4> -->

	   <form class="form-inline"  id='listHcWorks_ByCompositeQuery' action = "<%=request.getContextPath()%>/HcWorkshifts/HcWorkshiftsServlet.do" method="post">
        
        <div class="myform-row">

	         <div class="form-group ">
	          <label class="control-label" for="monthOfYear">請點選月份</label>
	           <input type="text" value="${param.monthOfYear}" class="form-control" id="monthOfYear" name="monthOfYear" aria-describedby="helpBlock2" style="border-radius:5px;" readonly>
	         </div>        
	     <a class="btn btn-info" id="addCondition">加入查詢條件</a>

        	 <div class="form-group form-group1" style="display:none;">
	          <label class="control-label" for="empNo">以編號搜尋</label>
	           <input type="text" value="${param.empNo}" class="form-control" id="empNo" name="empNo" aria-describedby="helpBlock2" placeholder="輸入編號" style="border-radius:5px;">
	         </div>
	         
	         <div class="form-group form-group2" style="display:none;">
	          <label class="control-label" for="empName">以姓名搜尋</label>
	           <input type="text" value="${param.empName}" class="form-control" id="empName" name="empName" aria-describedby="helpBlock2" placeholder="輸入姓名" style="border-radius:5px;">
	         </div>
        	                        
	         <div class="form-group form-group3" style="display:none;">
	          <label class="control-label" for="expNo">以專長搜尋</label>
	          <select class="form-control" id="expNo" name="expNo" aria-describedby="helpBlock2" style="border-radius:5px;" >
	            <option value="" selected>請選擇專長</option>
	          	<option value="101"> 丙級照護員</option>
	          	<option value="102"> 乙級照護員</option>
	          	<option value="201"> 護士</option>
	          	<option value="202"> 護理師</option>
	          </select>
	        </div>        

		    <div class="form-group form-group4" style="display:none;">
		    	 <label class="control-label" for="totalWorkShifts">以工作時段搜尋</label>		    	         
			   <select class="form-control" size="1" name="totalWorkShifts" id="totalWorkShifts" aria-describedby="helpBlock2" style="border-radius:5px;">
		          <option value="" selected>請選擇</option>
		          <option value="0-10">0~10</option>
		          <option value="10-20">10~20</option>
		          <option value="20-30">20~30</option>
		          <option value="30-40">30~40</option>
		          <option value="40-50">40~50</option>
		          <option value="50-93">50-93</option> 
		       </select>
	       </div>
		         

	        
       </div>
        <br>
       <div class="myform-row">
       	     <a class="btn btn-warning" id="addCondition2">特定日期查詢</a>       
<!-- 	        <h4 style="color:#428fdc">查詢當日有空的人:</h4> -->

	         <div class="form-group form-group5" style="display:none;">
	          <label class="control-label" for="servDate">請點選日期</label>
	           <input type="text" value="${param.servDate}" class="form-control" id="servDate" name="servDate" aria-describedby="helpBlock2" style="border-radius:5px;" readonly>
	         </div>        
	         <div class="form-group form-group6" style="display:none;">
	          <label class="control-label" for="servTime">請點選服務時段</label>
	          <select class="form-control" id="servTime" name="servTime" aria-describedby="helpBlock2" style="border-radius:5px;">
	            <option value="" selected>請選擇服務時段</option>
	          	<option value="早"> 上午(08:00~12:00)</option>
	          	<option value="中"> 下午 (13:30~17:30)</option>
	          	<option value="晚"> 晚上 (18:00~22:00)</option>
	          </select>
	        </div>
	         <div class="form-group pull-right">       
	        <input type="submit" class="btn btn-success" value="查詢" style="border-radius:5px;">
	         </div>
	        
	        <input type="hidden" name="action" value="listHcWorks_ByCompositeQuery">
<!-- 	        <input type="hidden" name="shiftNumber" value="00"> -->
	        <input type="hidden" name="successView" value="/back/homeCare/Hc_show_workShift_search.jsp">
	        <input type="hidden" name="failureV" value="/back/homeCare/Hc_show_workShift_search.jsp">
	

       </div>
       <hr>

              
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

								<a href='#modal-id' data-toggle="modal" class="btn btn-primary">跳出視窗</a>
								
								<div class="col-xs-1 pull-right">
									<a
										href="#modal-id" data-toggle="modal"
										id="insterbtn" class="btn btn-danger btn-default"
										role="button"><span class="glyphicon glyphicon-save"></span>&nbsp;新增班表</a>
								</div>
							<div class="col-sm-12">
								<table class="table  table-striped">
									<thead>
				                        <tr>
				                            <th>月份</th>
				                            <th>員工編號</th>
				                            <th>員工姓名</th>
				                            <th>總工作時段</th>
				
				                        </tr>
									</thead>
									<tbody>
										<%@ include file="pages/page1_ByCompositeQuery.file"%>
										<c:forEach var="hcWorkShiftsVO" items="${listHcWorks_ByCompositeQuery}" varStatus="s"
											begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

											<tr align='center' valign='middle' class=" hover">

						                            <td>${hcWorkShiftsVO.monthOfYear}</td>
						                            <td>${hcWorkShiftsVO.empNo}</td>
						                            <td>${employeeService.findByPrimaryKey(hcWorkShiftsVO.empNo).getEmpName()}</td>
						                            <td>${hcWorkShiftsVO.totalWorkShifts}</td>
												<td>
													<div class="btn-group">
														<a href='<%=request.getContextPath()%>/back/homeCare/Hc_show_workShift_one.jsp?monthOfyear=${hcWorkShiftsVO.monthOfYear}&empNo=${hcWorkShiftsVO.empNo}' data-toggle="modal"
															class="btn btn-primary" role="button"> <span
															class="glyphicon glyphicon-cloud-upload"></span>&nbsp;&nbsp;修改
														</a>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<%@ include file="pages/page2_ByCompositeQuery.file"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	

	<%@ include file="/back/production/BA104G1_footer.jsp"%>
	
	
<div class="modal fade  container" id="modal-id" >
	<div class="col-xs-12 col-sm-12">
	<div class="modal-dialog" >
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">新增班表</h4>
			</div>
                    <form id='getAllByDateTime' action = "<%=request.getContextPath()%>/HcWorkshifts/HcWorkshiftsServlet.do" method="post">
                    
	                    <div class="modal-body">
     
	                        <div class="form-group has-primary">
	                          <label class="control-label" for="monthOfYear">請點選月份</label>
	                          <input type="text" value="${param.monthOfYear}" class="form-control" id="monthOfYear2" name="monthOfYear" aria-describedby="helpBlock2" style="border-radius:5px;" readonly>
	                         </div>
	                        <div class="form-group has-primary">
	                          <label class="control-label" for="empNo">輸入員工編號</label>
	                          <input type="text" value="" class="form-control" id="empNo" name="empNo" aria-describedby="helpBlock2" style="border-radius:5px;">
	                         </div>
	                        

	        <input type="hidden" name="action" value="insterHC_work">
	        <input type="hidden" name="successView" value="/back/homeCare/Hc_show_workShift_search.jsp">
	        <input type="hidden" name="failureV" value="/back/homeCare/Hc_show_workShift_search.jsp">
	                        
	                    </div>
	                    <div class="modal-footer">                      
	<!--                         <input type="submit" class="btn btn-primary" data-dismiss="modal" id="datenloc-check" value="確認"> -->
	                        <input type="submit" class="btn btn-primary"  id="datenloc-check" value="確認">
	                        
	                        
	                    </div>
                    </form
		</div>
	</div>
	</div>
</div>

		<script src="<%=request.getContextPath()%>/front/homeCare/laydate/laydate.js"></script> 
		
		<script>
	    laydate.render({
	        elem: '#monthOfYear' 
	        ,format: 'yyyyMM'
	        ,type: 'month'

	    });
	    
	    laydate.render({
	        elem: '#monthOfYear2' 
	        ,format: 'yyyyMM'
	        ,type: 'month'

	    });
	    

		
		$(function(){
			$('#addCondition').click(function(){
				$('.form-group1').toggle();
				$('.form-group2').toggle();
				$('.form-group3').toggle();
				$('.form-group4').toggle();
			});
			
			$('#addCondition2').click(function(){
				$('.form-group5').toggle();
				$('.form-group6').toggle();

			});			

		});

	    </script>