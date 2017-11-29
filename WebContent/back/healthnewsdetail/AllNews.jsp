<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.healthnewsdetail.model.*"%>
<%@ page import="com.employee.model.*"%>

<%  
	List<HealthNewsDetailVO> list = (List<HealthNewsDetailVO>)request.getAttribute("list");
	if(list == null){
		HealthNewsDetailService healthNewsDetailSvc = new HealthNewsDetailService();
		list = healthNewsDetailSvc.getAll();
		pageContext.setAttribute("list",list);
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
	pageContext.setAttribute("sdf",sdf);
%>


<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>保健資訊管理</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.css">
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/back/css/news/news.css">

</head>

<body>

<body>
<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

        <!-- 保健消息 ========================================================================== -->
<div class="container">
<div class="right_col" role="main">
	<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">

					<div class="x_title">
						<ul class="nav navbar-right panel_toolbox">
							<div class="btn-group">
								<a href="<%=request.getContextPath()%>/back/healthnewsdetail/AllNews.jsp" class="btn btn-info" role="button"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp 全部</a>
								<a href="<%=request.getContextPath()%>/healthnewsdetail/healthnewsdetail.do?action=On_Status" class="btn btn-info" role="button"><i class="fa fa-hand-o-up" aria-hidden="true"></i>&nbsp 上架</a>
								<a href="<%=request.getContextPath()%>/healthnewsdetail/healthnewsdetail.do?action=Off_Status" class="btn btn-info" role="button"><i class="fa fa-hand-o-down" aria-hidden="true"></i>&nbsp 下架</a>
							</div>
							<a class="btn btn-success addbtn"   href="<%=request.getContextPath()%>/back/healthnewsdetail/add_news.jsp" ><i class="fa fa-plus" aria-hidden="true"></i>&nbsp新增保健資訊</a>
						</ul>
   					<div class="clearfix"></div>
					</div>
        <!-- 派車申訴 ========================================================================== -->
    <h1 class="text-center"></h1>
					<div class="x_content">
						<div class="row">
							<!-- 派車申訴 ========================================================================== -->
							<div class="panel-body">
								<table id="mytable"
									class="table table-striped table-bordered table-list results">
									<thead>
										<tr>
<!--                         <tr style= height:40px >  -->
                            <th id="allcenter" class="col-check" onclick="test()" style= width:8%>文章編號</th>
                            <th id="allcenter" class="col-text" style= width:30%>文章標題</th>
                            <th id="allcenter" class="col-text" style= width:45%>文章內容</th>
                            <th id="allcenter" class="hidden-xs" style= width:8%>修改時間</th>
                            <th id="allcenter" class="hidden-xs"style= width:6% >狀態</th>
                            <th id="allcenter" class="col-text">編輯</th>
                            <th id="allcenter" class="col-text">更多</th>
                            <th id="allcenter" class="hidden-xs">刪除</th>
                        </tr>
                         <tr class="no-result notfind" id="allcenter" >
                              <td colspan="10"><i class="fa fa-warning"></i>&nbsp找不到</td>
                            </tr>
                        </thead>

 <!-- 資料欄 ================================================================================ -->
  <%@ include file="page1.file" %>  
  			<c:forEach var="healthnewsdetailVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
   					<!--將修改的那一筆加入對比色而已-->
                        <tbody id="mytablebody" align='center' valign='middle' ${(healthnewsdetailVO.healthNo == param.healthNo) ? 'bgcolor=#FF7744':''}>
 						<c:choose>
							<c:when test="${healthnewsdetailVO.status == '下架'}">
							    <tr data-status="notyet" align="center">
							</c:when>
							<c:otherwise>
							    <tr data-status="done" align="center">
							</c:otherwise>
						</c:choose>
                            <td class="col-text" id="showNo">${healthnewsdetailVO.healthNo}</td>
                            <td class="col-text">${healthnewsdetailVO.newsTitle}</td>
                            <td class="col-text intro">${healthnewsdetailVO.newsIntro}</td>
<%--                             <td class="hidden-xs" id="rowWidth">${healthnewsdetailVO.empno}</td> --%>
<%--                             <td class="hidden-xs"><img src="<%=request.getContextPath()%>/healthnewsdetail/newsimgread.do?newsno=${healthnewsdetailVO.newsno}"style= max-width:70px;max-height:70px; ></td> --%>
							<td class="hidden-xs">${sdf.format(healthnewsdetailVO.newsDate)}</td>
                            <c:choose>
							    <c:when test="${healthnewsdetailVO.status == '上架'}">
							       <td align="center" class="col-text notyetText readstat">${healthnewsdetailVO.status}</td>
							    </c:when>
							    <c:otherwise>
							       <td class="col-text readstat">${healthnewsdetailVO.status}</td>
							    </c:otherwise>
							</c:choose>
						
                            <td class="hidden-xs">
                            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/healthnewsdetail/healthnewsdetail.do" name="form1">
                              	    <input type="submit" class="btn btn-info actionReply" value="修改">
                                	<input type="hidden" name="healthNo" value="${healthnewsdetailVO.healthNo}">
								    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
								    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
								    <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
                            </td>
                            
                            <td class="col-text" data-toggle="modal"  data-target="#moreDetail">
                                <input type="submit" class="btn btn-info clickDetail" value="詳細">
                                 <input type="hidden" name="healthNo" class="complainNoDetail" value="${healthnewsdetailVO.healthNo}">
                                 <input type="hidden" name="action"	value="getOne_For_Display"> 
                            </FORM>
                            </td>
                            <td class="hidden-xs">
	                        	<button type="submit" class="btn btn-danger edit glyphicon glyphicon-remove deleee"></button>
	                        	<input type="hidden" name="action"  value="delete">
	                        	<input type="hidden" name="healthNo" class="healthNo"  value="${healthnewsdetailVO.healthNo}">
							    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
							    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
                            </td>
                       </tr>
 </c:forEach>


 <!-- 資料欄 ================================================================================ -->


<!-- 詳細跳窗 ================================================================================ -->

<!-- line modal -->

<div class="modal fade" id="moreDetail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h3 class="modal-title detailBack" id="lineModalLabelDe"><%-- ${healthnewsdetailVO.complainNo} --%>：<%-- ${healthnewsdetailVO.complainStatus} --%></h3>
        </div>
        <div class="modal-body">
            
            <!-- content goes here -->
            <form>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-envelope fo-1x" aria-hidden="true"></i> 文章標題 : </label>
                <p id="complainIn" class="newsFti"><%-- ${healthnewsdetailVO.complainDetail} --%></p>
              </div>
               <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-envelope fo-1x" aria-hidden="true"></i> 文章內容 : </label>
                <p id="complainIn" class="newsIntro"><%-- ${healthnewsdetailVO.complainDetail} --%></p>
              </div>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-clock-o" aria-hidden="true"></i> 修改時間 : </label>
                <p id="complainIn" class="newstime"><%-- ${sdf.format(healthnewsdetailVO.detailDate)} --%></p>
              </div>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-clock-o" aria-hidden="true"></i> 員工編號 : </label>
                <p id="complainIn" class="empNoFor"><%-- ${sdf.format(healthnewsdetailVO.detailDate)} --%></p>
              </div>
              <hr>
             <%--  <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-envelope fo-1x" aria-hidden="true"></i>  文章狀態</label>
                <p id="complainIn" class="newsStatt">${healthnewsdetailVO.complainReply}</p>
              </div> --%>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-user-o" aria-hidden="true"></i> 文章照片 </label>
                <p id="complainIn"><img  class="newsPiccc" style=height:150px; ></p>
              </div>
            </form>

        </div>
        <div class="modal-footer">
            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-success" id="canelBtn" data-dismiss="modal"  role="button">確認</button>
                </div>
            </div>
        </div>
    </div>
  </div>
</div>


<!-- 詳細跳窗 ================================================================================ -->

                        </tbody>
                    </table>

                </div>
				<%@ include file="page2.file" %>
            </div>
        </div>
    </div>
</div>


		
		
		
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
</body>
<%@ include file="news.file" %>

<%@ include file="/back/production/BA104G1_footer.jsp"%>

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

    
// 提示修改成功
    $("#btnSub").on('click', function() {
    	$item = $( this );
		var seach = $item.parent().find("input.healthNo");	
console.log(seach.val());
    	
		  $.ajax({
	    		 type:"POST",  //指定http參數傳輸格式為POST 
	    		 contentType:"application/x-www-form-urlencoded;charset=utf-8",
	    		 url:"<%=request.getContextPath()%>/HealthNewsDetailServlet?action=getOne_For_Display&healthNo="+seach.val(),   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//	    		 data:text,  //要傳給目標的data
	    		 dataType: "json",
	    		 
	    		//Ajax成功後執行的function，response為回傳的值
	    		 success : function(res){
	    			 swal({
	  		    		    title: '已成功修改',
	  		    		    type:	'success',
	  		    		});
	  		    		setTimeout(function(){ 
		    				    location.reload();
		    				} ,800);
	    		 },
	    		 error : function(xhr, ajaxOptions, thrownError){
	    			 
	             }
	    	 }); 
	      });

    
// 查詢詳細資料 AJAX方法
    $(".clickDetail").on('click', function() {
    	$(".detailBack").html("保健資訊詳細內容");
	     $(".newsFti").html('');
	     $(".newsIntro").html('');
	     $(".newstime").html('');
	     $(".reptime").html('');
	     $(".empNoFor").html('');
	     $(".newsPiccc").attr({'src' : "",});
	     
	     $item = $( this );
		  var seach = $item.parent().find("input.complainNoDetail");
		  $.ajax({
	    		 type:"POST",  //指定http參數傳輸格式為POST 
	    		 contentType:"application/x-www-form-urlencoded;charset=utf-8",
	    		 url:"<%=request.getContextPath()%>/healthnewsdetail/healthnewsdetail.do?action=getOne_For_Display&healthNo="+seach.val(),   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//	    		 data:text,  //要傳給目標的data
	    		 dataType: "json",
	    		 
	    		//Ajax成功後執行的function，response為回傳的值
	    		 success : function(res){
		    	     $(".detailBack").html("保健消息 - "+ res.healthNo +" : 【 "+ res.status+ " 】");
		    	     $(".newsFti").html(res.newsTitle);
		    	     $(".newsIntro").html(res.newsIntro);
		    	     $(".newstime").html(res.newsDate);
		    	     $(".empNoFor").html(res.emp_no);
		    	     

		    	     var cover ="<%=request.getContextPath()%>/healthnewsdetail/healthimgread.do?healthNo="+ res.healthNo;
		    	     $(".newsPiccc").attr({'src' : cover,});	
	    		 },
	    		 error : function(xhr, ajaxOptions, thrownError){
	    			 
	             }
	    	 }); 
	      });
// 查詢詳細資料 AJAX方法

// 刪除
    $(".deleee").on('click', function() {
	     $item = $( this );
		 var seach = $item.parent().find("input.healthNo");	  

		  $.ajax({
	    		 type:"POST",  //指定http參數傳輸格式為POST 
	    		 contentType:"application/x-www-form-urlencoded;charset=utf-8",
	    		 url:"<%=request.getContextPath()%>/HealthNewsDetailServlet?action=delete&healthNo="+seach.val(),   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//	    		 data:text,  //要傳給目標的data
	    		 dataType: "json",
	    		 
		    		//Ajax成功後執行的function，response為回傳的值
		    		 success : function(res){
		    			 swal({
		  		    		    title: res+': 已成功刪除',
		  		    		    type:	'success',
		  		    		});
		  		    				setTimeout(function(){ 
		  		    				    location.reload();
		  		    				} ,800);
		  		    		
		    		 },
		    		 error : function(xhr, ajaxOptions, thrownError){
		    			 
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