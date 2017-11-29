<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<%@ page import="com.member.model.*"%>
<%@ page import="com.balance.model.*"%>
<%@ include file="/front/navbar.jsp"%>
<%@ include file="/front/member/Breadcrumbs_Main.jsp"%>

<jsp:useBean id="memberSvc" class="com.member.model.MemberService" />
<jsp:useBean id="balanceSvc" scope="page" class="com.balance.model.BalanceService" />


<!DOCTYPE html>
<html lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
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
					<div class="container">
					<div>Hello,${memberVO.memName}，帳戶名：${memberVO.memId}，(帳戶狀態：${memberSvc.findByPrimaryKey(memberVO.memNo).memSratus}) 
					</div>
					<div>請前往您的信箱，收取認證信，並在下方輸入信件中的認證碼</div>
				
					<div></div>
					<div></div>
					</div>
					
					<div>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" >
					     <input type="hidden" name="action" value="confirmCode">
					     <input type="hidden" name="memNo" value="${memberVO.memNo}">
					     <input type="text" name="memCodeInput"  placeholder="請輸入驗證碼"    value="">
					     <input type="submit" value="確認驗證碼" class=" btn-success"> 
					     </FORM>					
					</div>
					<hr>
					
					</div>
					

			</div>
	</body>		
<%@ include file="/front/footerbar.jsp"%>

			<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
			<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
			<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
</html>