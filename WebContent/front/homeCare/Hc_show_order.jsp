<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.hcorder.modal.*" %>

<jsp:useBean id="crdSvc" scope="page" class="com.thecared.model.ThecaredService"/>
<jsp:useBean id="hcOrderDetailService" scope="page" class="com.hcorder.modal.HcOrderDetailService"/>
<jsp:useBean id="expertlistService" scope="page" class="com.expertlist.model.ExpertlistService"/>
<jsp:useBean id="expertService" scope="page" class="com.expert.model.ExpertService"/>
<jsp:useBean id="employeeService" scope="page" class="com.employee.model.EmployeeService"/>






<%@ include file="/front/navbar.jsp" %>
<!DOCTYPE html>
<html lang="zh-TW">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>長照訂單</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 		<link href="css/takecare.css" rel="stylesheet"> -->
		
<!-- 			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<!-- 			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script> -->
		
		
		<style>
 		.outter{ 
 			margin-top:120px; 

 		} 
		
		
		</style>
	</head>
	<body>



<!-- 各項服務內容 ============================================================================== -->

	

	

	<div class="outter">

	<div class="container">
		<c:if test="${not empty hcOrderMasterVO.orderNo}">
		新增訂單成功${hcOrderMasterVO.orderNo}
		
		</c:if>
		
		<c:if test="${listOrds_ByCompositeQuery.size() != 0}">
			
		</c:if>
		<div class="row">
			<div class="col-xs-12 col-sm-12">	



                <table class="table table-hover">
                    <caption>名細清單</caption>
                    <thead>
                        <tr>
                            <th>名細編號</th>
                            <th>下定日期</th>
                            <th>照護對象</th>
                            <th>服務日期</th>
                            <th>服務時段</th>
                            <th>服務人員</th>
                            <th>訂單金額</th>
                            <th>訂單狀態</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="hcOrderDetailVO" items="${hcOrderDetailService.getAllByOrderNo(hcOrderMasterVO.orderNo)}">
                        <tr>
                            <td>${hcOrderDetailVO.orderDetailNo}</td>
                            <td>${hcOrderMasterVO.orderDate}</td>
                            <td>${crdSvc.getOneTHECARED(hcOrderMasterVO.caredNo).caredName}</td>
                            <td>${hcOrderDetailVO.serviceDate}</td>
                            <td>${hcOrderDetailVO.serviceTime}</td>
                            <td>${employeeService.findByPrimaryKey(hcOrderDetailVO.getEmpNo()).getEmpName()}</td>
                            <td>${expertlistService.getOneEXPLIST(expertService.getAllByEmpNo(hcOrderDetailVO.empNo).get(0).getExpNo()).getExpPrice()}</td>
                            <td>${hcOrderDetailVO.orderDetailStataus}</td>
                        </tr>
                     </c:forEach>
                     
                     	
	
<%-- 					<c:if test="${listOrds_ByCompositeQuery.size() != 0}"> --%>
<%-- 						<c:forEach var="hcOrderMasterVO" items="${listOrds_ByCompositeQuery}">						 --%>
<%-- 							<c:forEach var="hcOrderDetailVO" items="${hcOrderDetailService.getAllByOrderNo(hcOrderMasterVO.orderNo)}"> --%>
<!-- 		                        <tr> -->
<%-- 									<td>${hcOrderDetailVO.orderDetailNo}</td> --%>
<%-- 									<td>${hcOrderMasterVO.orderDate}</td> --%>
<%-- 									<td>${hcOrderMasterVO.caredNo}</td> --%>
<%-- 									<td>${hcOrderDetailVO.serviceDate}</td> --%>
<%--                             <td>${hcOrderDetailVO.serviceTime}</td> --%>
<%--                             <td>${hcOrderDetailVO.empNo}</td> --%>
<%--                             <td>${hcOrderDetailVO.empNo}</td> --%>
<%--                             <td>${hcOrderDetailVO.orderDetailStataus}</td> --%>
<!-- 		                        </tr> -->
<%-- 		                     </c:forEach> --%>
<%-- 	                     </c:forEach>						 --%>
<%-- 					</c:if> --%>

                    </tbody>
                </table>
			
			<hr>

			</div>
		</div>
	</div>
	</div>



<%@ include file="/front/footerbar.jsp" %> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
   

	</body>
</html>
