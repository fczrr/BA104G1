<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<%@ page import="com.member.model.*"%>
<%@ page import="com.thecared.model.*"%>

<%@ include file="/front/navbar.jsp"%>

<% ThecaredService thecaredSvc = new ThecaredService();
%>

<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="theCaredSvc" scope="page" class="com.thecared.model.ThecaredService" />


<!DOCTYPE html>
<html lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/bootstrap.css" media="screen">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/usebootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/newstyle_footer.css">
<style type="text/css">
</style>
</head>

<body>
			<div class="container-fluid">
<!-- ----------------------下方會員區麵包屑 ------------------------->	
					<nav aria-label="breadcrumb" role="navigation">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item">
					    <a href="<%=request.getContextPath()%>/index.jsp">首頁</a></li>
					    <li class="breadcrumb-item">
					    <a href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">會員管理</a></li>
					    <li class="breadcrumb-item active" aria-current="page">
					    <a href="<%=request.getContextPath()%>/front/member/MemberHcOrder.jsp">訂單管理</li>
					  </ol>
					</nav>
<!-- ----------------------上方會員區麵包屑 ------------------------->
<!-- ----------------------下方訂單管理區選項------------------------->					
					<ul class="nav nav-tabs" id="navList">
						<li data-name="loginLogTab" >
						<a href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">
						<i class="fa fa-briefcase"></i>會員基本資料管理 
						</a></li>
						<li data-name="receiveLogTab"}>
						<a href="<%=request.getContextPath()%>/front/member/CaredList.jsp">
						<i class="fa fa-briefcase active"></i>被照顧者資料管理
						</a></li>				
					</ul>
<!-- ----------------------上方訂單管理區選項------------------------->								

					
							<div class="row">	
					<table class="table table-hover">
							<tr>
								<th>被照顧者編號</th>
								<th>被照顧者姓名</th>
								<th>被照顧者性別</th>
								<th>會員對其稱呼</th>
								<th>被照顧者身高</th>
								<th>被照顧者體重</th>
								<th>被照顧者地址</th>
								<th>被照顧者電話</th>
								<th>認知功能狀態</th>
								<th>生理功能狀態</th>
								<th></th>
								<th></th>
							</tr>
							
						<c:forEach var="thecaredVO"  items='${theCaredSvc.getAllByMemNo(memberVO.memNo)}' >
					
							<tr>		
								<td>${thecaredVO.caredNo}</td>	
								<td>${thecaredVO.caredName}</td>
								<td>${thecaredVO.caredGender}</td>
								<td>${thecaredVO.kinship}</td>
								<td>${thecaredVO.caredHeight}</td>
								<td>${thecaredVO.caredWeight}</td>
								<td>${thecaredVO.caredAddress}</td>
								<td>${thecaredVO.caredPhone}</td>
								<td>${thecaredVO.conStatus}</td>
								<td>${thecaredVO.bioStatus}</td>
								<td>			  
									<FORM METHOD="post" 
									ACTION="<%=request.getContextPath()%>/front/member/CaredUpdate.jsp" >
								     <input type="submit" value="修改"  class=" btn-warning"> 
								     <input type="hidden" name="caredNo"      value="${thecaredVO.caredNo}">
								     
								     </FORM>
			     				</td>
							   
								<td>

								</td>
							</tr>
						</c:forEach>
							<tr>
							<td>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front/member/CaredInsert.jsp" >
							     <input type="submit" value="新增被照顧者" class=" btn-success"> 
							     <input type="hidden" name="memNo"      value="${memberVO.memNo}">
							     </FORM>
							</td>
							</tr>
					</table>
				</div>
			</div>
	</body>		
<%@ include file="/front/footerbar.jsp"%>

			<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
</html>