<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.newsdetail.model.*"%>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	NewsdetailService newsdetailSvc = new NewsdetailService();
	List<NewsdetailVO> list = newsdetailSvc.getNewOnAll();
	pageContext.setAttribute("list",list);
%>	
<%	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	pageContext.setAttribute("sdf",sdf);
%>



<html>
<head>
<title>最新消息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>

<%@ include file="/front/navbar.jsp" %> 



<div class="container">
  <div class="page-header" id="banner">
  <img src="<%=request.getContextPath()%>/img/index/BigImg/nav2_white.jpg" style=" max-width:-webkit-fill-available;">
  <div class="row">
<!-- 
    <div class="col-lg-6">
      <h1>Welcome</h1>
      <p class="lead">To a new bootstrap theme by UseBootstrap.</p>
    </div> -->
  </div>
</div>
</div>




	<div class="container">
    <div class="row">
        <!--  左邊導覽列 =================================================================  -->
        <div class="col-xs-12 col-sm-3 alllist">
            <p class="list-group-item newTTTTT" id="list-title">
                <img class="imglogoSm" src="<%=request.getContextPath()%>/img/index/logo/logo_white.png" style="width:40px"" style="width: 40px;"> About us
            </p>
            <a href="#" class="list-group-item">
                    <i class="fa fa-street-view" aria-hidden="true"></i>
                    &nbsp 關於我們
                </a>
            <a href="<%=request.getContextPath()%>/front/newsdetail/allNew.jsp" class="list-group-item">
                    <i class="fa fa-info" aria-hidden="true"></i>
                    &nbsp&nbsp 最新消息
                </a>
            <a href="<%=request.getContextPath()%>/front/healthnews/allNew.jsp" class="list-group-item">
                    <i class="fa fa-user-md" aria-hidden="true"></i>
                    &nbsp 保健資訊
                </a>
        </div>
        <!--  左邊導覽列 =================================================================  -->
        
        <!--  麵包屑 =================================================================  -->
        <div class="col-xs-12 col-sm-9">
            <div>
                <ol class="breadcrumb" id="breadNew">
                    <li><a href="<%=request.getContextPath()%>/index.jsp"><i class="fa fa-home" aria-hidden="true"></i>首頁</a></li>
                    <li class="active"><a href="<%=request.getContextPath()%>/front/healthnews/allNew.jsp">保健資訊</a></li>
                </ol>
            </div>
            <!--  麵包屑 =================================================================  -->
           
   
 <%@ include file="page1.file" %>  
<c:forEach var="newsdetailVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">    
           
        <div class="col-xs-10 col-sm-12" style="border: 1px solid #aaa; margin-top: 10px; margin-left:10px; margin-bottom: 20px;    width: -webkit-fill-available">
            <div class="col-xs-10 col-sm-4" style="margin-left: 0px; padding-left: 0px">
                <a><img class="" src="<%=request.getContextPath()%>/newsdetail/newsimgread.do?newsno=${newsdetailVO.newsno}" style="max-width:260px; max-height:170px; vertical-align:center" /></a>
            </div>
            <div class="col-xs-10 col-sm-6" style="margin-left: 20px">
                <h4 class="titleNews" style="margin-top: 20px">
                       ${newsdetailVO.newstitle}
                    </h4>
                <div class="newstime">
                    <p><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp${sdf.format(newsdetailVO.newsdate)}</p>
                </div>
                <div class="intro" style="padding-top:10px; padding-bottom:30px">
                    <p>${newsdetailVO.newsintro}</p>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-6 cust">
                   
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/newsdetail/newsdetail.do" name="form1" enctype="multipart/form-data">
                        <input type="hidden" name="newsno" value="${newsdetailVO.newsno}">
						<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> <!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
					 	<input type="hidden" name="whichPage"  value="<%=request.getParameter("whichPage")%>">  <!--只用於:lisAllOrder.jsp-->
				        <input type="hidden" name="action" value="getOne_For_Display_Front">
						<input type="submit" value="更多" class="btn btn-warning btn-sm"></FORM>
                    </div>
                </div>
            </div>
        </div>
      </c:forEach>
	<%@ include file="/front/newsdetail/page2.file" %>
        
        
        
        
    </div>
</div>
</div>

<%@ include file="/front/footerbar.jsp" %> 

<!-- 偷吃步 OneNews CSS -->
<%@ include file="/front/css/news/oneNewCss.file" %>
<!-- 偷吃步 OneNews CSS -->


        <script src="https://code.jquery.com/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


       
     
</body>


<script type="text/javascript">
    $(function(){
    var len = 80; // 超過50個字以"..."取代
    $(".intro").each(function(i){
        if($(this).text().length>len){
            $(this).attr("title",$(this).text());
            var text=$(this).text().substring(0,len-1)+"...";
            $(this).text(text);
        }
    });
});
</script>


</html>