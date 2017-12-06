<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.hcworkshifts.model.*"%>
<%@ page import="com.employee.model.*"%>
<jsp:useBean id="employeeService" scope="page" class="com.employee.model.EmployeeService" />
<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

<%
	EmployeeVO empVO = (EmployeeVO)session.getAttribute("empVO");
	Object obj = request.getAttribute("listHcWorks_ByCompositeQuery");
	List<HcWorkShiftsVO> listHcWorks_ByCompositeQuery = new ArrayList<HcWorkShiftsVO>();
	if (obj == null) {
		HcWorkShiftsService hcWorkShiftsService = new HcWorkShiftsService();
		listHcWorks_ByCompositeQuery = hcWorkShiftsService.getAllByEmpNo(empVO.getEmpNo());
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
									<h1><b>個人班表查詢</b>
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
	           <input type="hidden" value="${empVO.empNo}" class="form-control" id="empNo" name="empNo" aria-describedby="helpBlock2" placeholder="輸入編號" style="border-radius:5px;">
	                 
			<div class="form-group ">       
	        <input type="submit" class="btn btn-success" value="查詢GO!" style="border-radius:5px;">
	         </div>
		         

	        
       </div>
        <br>
       <div class="myform-row">


	         <br>
	        
	        <input type="hidden" name="action" value="listHcWorks_ByCompositeQuery">
<!-- 	        <input type="hidden" name="shiftNumber" value="00"> -->
	        <input type="hidden" name="successView" value="/back/homeCare/Hc_show_workShift_search_self.jsp">
	        <input type="hidden" name="failureV" value="/back/homeCare/Hc_show_workShift_search_self.jsp">
	

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
														<a href='<%=request.getContextPath()%>/back/homeCare/Hc_show_workShift_one_self.jsp?monthOfyear=${hcWorkShiftsVO.monthOfYear}&empNo=${hcWorkShiftsVO.empNo}' data-toggle="modal"
															class="btn btn-primary" role="button"> <span
															class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;查看班表
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
// 				$('.form-group1').toggle();
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