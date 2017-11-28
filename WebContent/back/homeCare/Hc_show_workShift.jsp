<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.hcorder.modal.*" %>
<%@ page import="com.hcworkshifts.model.*" %>






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
		
	</head>
	<body>



<!-- 各項服務內容 ============================================================================== -->

	

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12">	



                <table class="table table-hover">
                    <caption>長期照護 班表清單</caption>
                    <thead>
                        <tr>
                            <th>月份</th>
                            <th>員工編號</th>
                            <th>員工姓名</th>
                            <th>總工作時段</th>

                        </tr>
                    </thead>
                    <tbody>
                    <c:if  test='${not empty hcWorkShiftsVO.getEmpNo()}'>
                        <tr>
                            <td>${hcWorkShiftsVO.monthOfYear}</td>
                            <td>${hcWorkShiftsVO.empNo}</td>
                            <td>${hcWorkShiftsVO.empNo}</td>
                            <td>${hcWorkShiftsVO.totalWorkShifts}</td>
                            <td>${hcWorkShiftsVO.workShiftStatus}</td>
 
                        </tr>
                     </c:if>
	
					<c:forEach var="hcWorkShiftsVO" items="${listHcWorks_ByCompositeQuery}">						
                        <tr>
                            <td>${hcWorkShiftsVO.monthOfYear}</td>
                            <td>${hcWorkShiftsVO.empNo}</td>
                            <td>${hcWorkShiftsVO.empNo}</td>
                            <td>${hcWorkShiftsVO.totalWorkShifts}</td>
                            <td>${hcWorkShiftsVO.workShiftStatus}</td>
 
                        </tr>
                     </c:forEach>						

                    </tbody>
                </table>

			</div>
		</div>
	</div>



<%@ include file="/front/footerbar.jsp" %> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
   

	</body>
</html>
