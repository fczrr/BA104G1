<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.healthnewsdetail.model.*"%>

<%
  HealthNewsDetailVO healthNewsDetailVO = (HealthNewsDetailVO) request.getAttribute("healthNewsDetailVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>保健消息新增</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.css">
<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/back/css/news/add_update_news.css">
<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/back/css/news/news.css">





</head>
<body>
<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>


<div class="container">
<div class="right_col" role="main">
	<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">

					<div class="x_title">
						
   					<div class="clearfix"></div>
					</div>
					
<h1 class="text-center"></h1>
<div class="x_content">
<div class="row">


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/healthnewsdetail/healthnewsdetail.do" name="form1" enctype="multipart/form-data">
<div class="container">
    <div class="row">
        <div class="col-md-12 ">
            <div class="panel panel-default panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-8">
                            <h3 class="panel-title forTitle"><i class="fa fa-heart" aria-hidden="true"></i></i>&nbsp保健消息管理</h3>
                        </div>
                        <div class="col col-xs-4 text-right">
                            <a type="submit" class="btn btn-primary"  href="<%=request.getContextPath()%>/back/healthnewsdetail/AllNews.jsp">回文章列表</a>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <table id="mytable" class="table table-striped table-bordered table-list results">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 bigText">
                                <h3>【 新增 】保健消息</h3>
                            </div>
                        </div>
                        <!-- 資料欄 ================================================================================ -->
                        <!-- Email input-->
                        <div class="form-group newform">
                            <label class="col-md-12 control-label newsBig"><i class="fa fa-rss" aria-hidden="true"></i> 文章標題：</label>
                            <div class="col-md-12">
                                <textarea class="form-control" id="newstitle" name="newsTitle" placeholder="請輸入文章標題" rows="2">${newsdetailVO.newstitle == null ? '' : healthNewsDetaliVO.newstitle}</textarea>
                            </div>
                        </div>
                        <!-- Message body -->
                        <div class="form-group newform">
                            <label class="col-md-12 control-label newsBig"><i class="fa fa-newspaper-o" aria-hidden="true"></i> 文章內容：</label>
                            <div class="col-md-12">
                                <textarea class="form-control" id="newsintro" name="newsIntro" placeholder="請輸入文章內容" rows="7">${healthNewsDetaliVO.newsintro == null ? '' : healthNewsDetaliVO.newsintro}</textarea>
                            </div>
                        </div>
                        <div class="form-group newform" id="forstat">
                            <label class="col-md-2 control-label newsBig"><i class="fa fa-location-arrow" aria-hidden="true"></i> 文章狀態：</label>
                            <div class="col-md-10 checkin">
                                <input type="radio" id="onstat" class="onStat" name="status" value="上架" checked /> 上架&nbsp&nbsp
                                <input type="radio" id="offStat" class="offStat" name="status" value="下架" /> 下架
                            </div>
                        </div>
                        <div class="form-group newform">
                            <label class="col-md-12 control-label newsBig pictop"><i class="fa fa-picture-o" aria-hidden="true"></i> 圖片：</label>
                            <div class="col-md-12">
                                <input type="file" name="coverpic" id="uploadImage" accept="image/*" multiple>
                                <div class="col-md-12">
                                    <p><img id="img" class="forUpnewsPiccc"  style=width:30%;></p>
                                </div>
                            </div>
                        </div>
                        <!-- Form actions -->
                        <div class="form-group newform">
                            <div class="col-md-12">
                                <button type="submit" id="btnadd" class="btn btn-primary btn-block btnCu"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 新增送出</button>
                                <input type="hidden" name="action" value="insert">
								<input type="hidden" name="emp_no" value="${employeeVO.empNo}">
								<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> <!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
								<input type="hidden" name="whichPage"  value="<%=request.getParameter("whichPage")%>">  <!--只用於:istAllNews.jsp-->
                            </div>
                        </div>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<br>


</FORM>

<%@ include file="/back/production/BA104G1_footer.jsp"%>
</body>

 <script src="https://code.jquery.com/jquery.js"></script>
 <script src="<%=request.getContextPath()%>/back/js/newsdetail/healthnews.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    


</html>

<script type="text/javascript">
$(document).ready(function () {
//文章新增成功    
 $("#btnadd").on('click', function() {
 	$item = $( this );
		var seach = $item.parent().find("input.healthNo");	
console.log(seach.val());

		  $.ajax({
	    		 type:"POST",  //指定http參數傳輸格式為POST 
	    		 contentType:"application/x-www-form-urlencoded;charset=utf-8",
	    		 url:"<%=request.getContextPath()%>/HealthNewsDetailServlet?action=getOne_For_Display&healthNo=HD0001",   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//	    		 data:text,  //要傳給目標的data
	    		 dataType: "json",
	    		 
	    		//Ajax成功後執行的function，response為回傳的值
	    		 success : function(res){
	     console.log(res.newsno);			 
	    			 swal({
	  		    		    title: '已成功新增',
	  		    		    type:	'success',
	  		    		}),
	  		  			setTimeout(function(){ 
	    				    location.reload();
	    				} ,800);	
	    		 },
	    		 error : function(xhr, ajaxOptions, thrownError){
	    			
	             }
	    	 }); 
	      });
}
</script>

