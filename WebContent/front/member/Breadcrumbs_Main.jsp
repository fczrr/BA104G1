<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>



<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/usebootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/navbar/newstyle_footer.css">
  <!-- NavBar的CSS 專區 不能刪喔 ================================================== -->
    

  </head>
  <body>
  
					<nav aria-label="breadcrumb" role="navigation">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item">
					    <a href="<%=request.getContextPath()%>/index.jsp">首頁</a></li>
					    <li class="breadcrumb-item">
					    <a href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">會員資料管理</a></li>
					    <li class="breadcrumb-item">
					    <a href="<%=request.getContextPath()%>/front/member/MyWallet.jsp">我的錢包</a></li>
					    <li class="breadcrumb-item active" aria-current="page">
					    <a href="<%=request.getContextPath()%>/front/member/MemberHcOrder.jsp">訂單管理</a></li>
					  </ol>
					</nav>



<!-- 這裡是JS專區 =========================================================== -->

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>

<!-- 這裡是JS專區 =========================================================== -->

</body>
</html>



    
