<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Title Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html {
  height: 100%;
}
body {
  min-height: 100%;
  display: grid;
  grid-template-rows: 1fr auto;
}
.footer {
  grid-row-start: 2;
  grid-row-end: 3;
}
</style>
<%@ include file="/front/css/navbar/navCss.file" %>
</head>

<body>

<%@ include file="/front/message/msgFor_Mem999.jsp" %>
<nav class="navbar navbar-default navbar-fixed-top newnavbartoppp" role="navigation">
    <div class="container-fliud">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            </button>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp"><img class="logoImgNav" src="<%=request.getContextPath()%>/img/index/logo/logo_white.png" style="width:50px"" style="width: 40px;"></a>
        </div>
        
        <!-- 手機隱藏選單區 -->
        <div class="collapse navbar-collapse navbar-ex1-collapse" id="navbarTopColor">
        
        
        
  <!--  開始放鏈結區 ======================================================================== -->
            <ul class="nav navbar-nav navnavnav">
                <li><a href="#">關於我們</a></li>
                <li class="dropdown newdropdown">
                    <a href="#" class="dropdown-toggle newtoggle" data-toggle="dropdown">最新消息 <b class="caret"></b></a>
                    <ul class="dropdown-menu dropdownNew">
                        <li><a href="<%=request.getContextPath()%>/front/newsdetail/allNew.jsp">最新消息</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/healthnews/allNew.jsp">保健資訊</a></li>
                    </ul>
                </li>
                </li>
                <li class="dropdown newdropdown">
                    <a href="#" class="dropdown-toggle newtoggle" data-toggle="dropdown">照護服務 <b class="caret"></b></a>
                    <ul class="dropdown-menu dropdownNew">
                        <li><a href="<%=request.getContextPath()%>/front/homeCare/Hc_order.jsp">短期照護服務</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/homeCare/Hc_order_long.jsp">長期照護服務</a></li>
                        <li><a href="#">Q&A</a></li>
                    </ul>
                </li>
                <li><a href="<%= request.getContextPath()%>/front/carorder/CarOrder.jsp">派車服務</a></li>
                <li><a href="<%= request.getContextPath()%>/front/mealService/MealIndex.jsp">送餐服務</a></li>
                <li><a href="<%=request.getContextPath()%>/front/shopindex.jsp">商城</a></li>
                <li><a href="#">聯絡我們</a></li>
            </ul>
        
        
        
            <!-- 右選單 -->
            <ul class="nav navbar-nav navbar-right">
                <ul class="nav navbar-nav navbar-right">
            <c:if test="${memberVO!=null}">
                <li><a href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">${memberVO.memName} 您好</a></li>
            </c:if>   
            
            <c:choose>
				<c:when test="${memberVO==null}">
					<li>
					<a href="<%=request.getContextPath()%>/front/Login.jsp">登入  / 註冊</a>
					</li>
				</c:when>
				<c:when test="${memberVO!=null}">
					<li>
					<a href="<%=request.getContextPath()%>/member/member.do?action=logout">登出</a>
					</li>
				</c:when>
			</c:choose> 
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">會員中心 <b class="caret"></b></a>
                     <ul class="dropdown-menu dropdownNew">
                        <li><a href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">會員資料管理</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/member/MyWallet.jsp">我的錢包</a></li>
                        <li><a href="<%=request.getContextPath()%>/front/member/MemberHcOrder.jsp">訂單管理</a></li>
                        
                    </ul>
                </li>
            </ul>
            
<!--  開始放鏈結區 ======================================================================== -->


        </div>
        <!-- 手機隱藏選單區結束 -->
    </div>
</nav>






<!--         <script src="https://code.jquery.com/jquery.js"></script> -->
<!--         <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
</body>
</html>
