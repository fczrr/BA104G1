<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.newsdetail.model.*"%>

<%
NewsdetailVO newsdetailVO = (NewsdetailVO) request.getAttribute("newsdetailVO"); // 存入req的newsdetailVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>最新消息新增</title>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/newsdetail/newsdetail.do" name="form1" enctype="multipart/form-data">
<div class="container">
    <div class="row">
        <div class="col-md-12 ">
            <div class="panel panel-default panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-8">
                            <h3 class="panel-title forTitle"><i class="fa fa-bookmark-o" aria-hidden="true"></i>&nbsp最新消息管理</h3>
                        </div>
                        <div class="col col-xs-4 text-right">
                            <a type="submit" class="btn btn-primary"  href="<%=request.getContextPath()%>/back/newsdetail/AllNews.jsp">回文章列表</a>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <table id="mytable" class="table table-striped table-bordered table-list results">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 bigText">
                                <h3>【 新增 】最新消息</h3>
                            </div>
                        </div>
                        <!-- 資料欄 ================================================================================ -->
                        <!-- Email input-->
                        <div class="form-group newform">
                            <label class="col-md-12 control-label newsBig"><i class="fa fa-rss" aria-hidden="true"></i> 文章標題：</label>
                            <div class="col-md-12">
                                <textarea class="form-control" id="newstitle" name="newstitle" placeholder="請輸入文章標題" rows="2">${newsdetailVO.newstitle == null ? '' : newsdetailVO.newstitle}</textarea>
                            </div>
                        </div>
                        <!-- Message body -->
                        <div class="form-group newform">
                            <label class="col-md-12 control-label newsBig"><i class="fa fa-newspaper-o" aria-hidden="true"></i> 文章內容：</label>
                            <div class="col-md-12">
                                <textarea class="form-control" id="newsintro" name="newsintro" placeholder="請輸入文章內容" rows="7">${newsdetailVO.newsintro == null ? '' : newsdetailVO.newsintro}</textarea>
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
								<input type="hidden" name="empno" value="${employeeVO.empNo}">
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

 <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(document).ready(function () {

    $('.btn-filter').on('click', function () {
        var $target = $(this).data('target');
        if ($target != 'all') {
            $('.table tbody tr').css('display', 'none');
            $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
        } else {
            $('.table tbody tr').css('display', 'none').fadeIn('slow');
        }
    });

    $('#checkall').on('click', function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
  
// 文章新增成功    
    $("#btnadd").on('click', function() {
    	$item = $( this );

		  $.ajax({
	    		 type:"POST",  //指定http參數傳輸格式為POST 
	    		 contentType:"application/x-www-form-urlencoded;charset=utf-8",
	    		 url:"<%=request.getContextPath()%>/NewsdetailServlet?action=getOne_For_Display&newsno=ND0001",   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//	    		 data:text,  //要傳給目標的data
	    		 dataType: "json",
	    		 
	    		//Ajax成功後執行的function，response為回傳的值
	    		 success : function(res){
	     console.log(res.newsno);			 
	    			 swal({
	  		    		    title: '已成功新增',
	  		    		    type:	'success',
	  		    		});
	    			 setTimeout(function(){ 
	    				 location.replace("<%=request.getContextPath()%>/back/newsdetail/AllNews.jsp");
	    				} ,300);
	  		    		
	    		 },
	    		 error : function(xhr, ajaxOptions, thrownError){
	    			 if($("#newstitle").val() === ''){
	    					$("#newstitle").val().focus();
	    				};
	    				if($("#newsintro").val() === ''){
	    					$("#newsintro").val().focus();
	    				};
	    				
	             }
	    	 }); 
	      });



// 換圖預覽
    $("#uploadImage").change(function(){
    	$('#img').attr('src' , '');
	    readImage( this );   
	});
    
    
    function readImage(input) {
      if ( input.files && input.files[0] ) {
        var size = Math.round(input.files[0].size / 1024 / 1024);
        if (size > 3) {
            alert('图片大小不得超过3M,請重新上傳');
            input.files.remove();
        } else{
	        var FR= new FileReader();
	        FR.onload = function(e) {
		          //e.target.result = base64 format picture
		          $('#img').attr( "src", e.target.result );
		          convertImgDataToBlob(e.target.result);
	        };       
	      };
        FR.readAsDataURL( input.files[0] );
      };
    };
    
    
//    $('#img').click(function(){
//        $(this).toggleClass('min');
//        $(this).toggleClass('max');
//        });




      $(".search").keyup(function () {
        var searchTerm = $(".search").val();
        var listItem = $('.results tbody').children('tr');
        var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
        
      $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
            return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
        }
      });
        
      $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
        $(this).attr('visible','false');
      });

      $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
        $(this).attr('visible','true');
      });

      var jobCount = $('.results tbody tr[visible="true"]').length;
        $('.counter').text(jobCount + ' item');

      if(jobCount == '0') {$('.no-result').show();}
        else {$('.no-result').hide();}
    
      });  

    	
    var len = 50; // 超過50個字以"..."取代
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