<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mealcomplain.model.*"%>
<%@ page import="com.employee.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>


<%  List<MealComplainVO> list = (List<MealComplainVO>) request.getAttribute("list");
	if (list == null) {	
	MealComplainService mealComplainSvc = new MealComplainService();
	list = mealComplainSvc.getAll();
	pageContext.setAttribute("list",list);
	}
%>


<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
	pageContext.setAttribute("sdf",sdf);
%>




<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>送餐申訴</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.css">
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/back/css/complain/com.css">

</head>
<body>
<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

<div class="container">
<div class="right_col" role="main">
		<div class="col-md-12">
				<div id="mytitle"
					style="padding: 10px; color: #FFFFFF; text-align: center;">


					<a class="btn btn-block btn-lg btn-primary" data-toggle="modal"
						data-target="#mymodal">
						<h1>
							<i class="fa fa-cutlery" aria-hidden="true"></i> 派餐申訴&nbsp;<b>管理頁面</b>
						</h1>

					</a>

				</div>
				<div class="tab-content ">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs custom-tab">
					<li class="tapone"><a href="<%=request.getContextPath()%>/back/complain/listHCCom.jsp"><i class="fa fa-user-md" aria-hidden="true"></i>&nbsp長照申訴</a></li>
					<li class="tapone"><a href="<%=request.getContextPath()%>/back/complain/listCarCom.jsp"><i class="fa fa-car" aria-hidden="true"></i>&nbsp派車申訴</a></li>
					<li class="tapone active"><a href="<%=request.getContextPath()%>/back/complain/listMealCom.jsp"><i class="fa fa-cutlery" aria-hidden="true"></i>&nbsp送餐申訴</a></li>
					<li class="tapone"><a href="<%=request.getContextPath()%>/back/complain/listShopCom.jsp"><i class="fa fa-shopping-bag" aria-hidden="true"></i>&nbsp商城申訴</a></li>
				</ul>
			</div>
		</div>
	<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">

					<div class="x_title">
						<ul class="nav navbar-right panel_toolbox">
							<div class="btn-group">
								<a href="<%=request.getContextPath()%>/back/complain/listMealCom.jsp" class="btn btn-info" role="button">全部申訴</a>
								<a href="<%=request.getContextPath()%>/hccomplain/hccomplain.do?action=Off_Status" class="btn btn-danger" role="button">未處理</a>
								<a href="<%=request.getContextPath()%>/hccomplain/hccomplain.do?action=On_Status" class="btn btn-info" role="button">已完成</a>
							</div>
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
											<th id="allcenter" class="col-check" onclick="test()" style="width: 8%">申訴編號</th>
											<th id="allcenter" class="col-text" style="width: 14%">訂單編號</th>
											<th id="allcenter" class="col-text" style="width: 12%">申訴會員</th>
											<th id="allcenter" class="hidden-xs" style="width: 30%">申訴內容</th>
											<th id="allcenter" class="hidden-xs" style="width: 15%">申訴時間</th>
											<th id="allcenter" class="col-text" style="width: 12%">狀態</th>
											<th id="allcenter" class="hidden-xs">回覆</th>
											<th id="allcenter" class="col-text">更多</th>
										</tr>
									</thead>
 <!-- 資料欄 ================================================================================ -->
<%@ include file="page1.file" %>  
  			<c:forEach var="mealComplainVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
   					<!--將修改的那一筆加入對比色而已-->
                        <tbody id="mytablebody" ${(mealComplainVO.complainNo == param.complainNo) ? 'text-primary':''} valign='middle'>

 						<c:choose>
							<c:when test="${mealComplainVO.complainStatus == '未處理'}">
							    <tr data-status="notyet" align="center">
							</c:when>
							<c:otherwise>
							    <tr data-status="done" align="center">
							</c:otherwise>
						</c:choose>
                            <td class="col-text" id="showNo" class="MONO">${mealComplainVO.complainNo}</td>
                            <td class="col-text">${mealComplainVO.mo_no}</td>
                            <td class="col-text">John Doe</td>
                            <td class="hidden-xs" id="rowWidth">${mealComplainVO.complainDetail}</td>
                            <td class="hidden-xs">${sdf.format(mealComplainVO.detailDate)}</td>
                            <c:choose>
							    <c:when test="${mealComplainVO.complainStatus == '未處理'}">
							       <td align="center" class="col-text notyetText readstat">${mealComplainVO.complainStatus}</td>
							    </c:when>
							    <c:otherwise>
							       <td class="col-text readstat">${mealComplainVO.complainStatus}</td>
							    </c:otherwise>
							</c:choose>
						
                            <td class="hidden-xs" data-toggle="modal"  data-target="#ansower">
                                <a class="btn btn-info actionReply">
                                	<input type="hidden" name="complainNo" class="complainNoDetail serchNo" disabled="disabled" value="${mealComplainVO.complainNo}">
                                	<input type="hidden" name="action"	value="getOne_For_Updat_meal"> 
                                	<span class="glyphicon glyphicon-pencil"></span>
                                </a>
                            </td>
                            <td class="col-text" data-toggle="modal"  data-target="#moreDetail">
                                <a class="btn btn-default clickDetail">
                                <i class="fa fa-chevron-down"></i>
                                 <input type="hidden" name="complainNo" class="complainNoDetail" value="${mealComplainVO.complainNo}">
                                 <input type="hidden" name="action"	value="getOne_For_Display"> 
                                </a>
                            </td>
                            <td class="hidden-xs">
                        <%--        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mealcomplain/mealcomplain.do" name="form1">
	                        	<button type="submit" class="btn btn-info edit glyphicon glyphicon-remove"></button>
	                        	<input type="hidden" name="action"      value="delete">
	                        	<input type="hidden" name="complainNo"  value="${mealComplainVO.complainNo}">
							    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
							    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
	                          </FORM> --%>
                            </td>
                       </tr>
 </c:forEach>

 <!-- 資料欄 ================================================================================ -->

<!-- 回覆跳窗 ================================================================================ -->


<!-- line modal -->
<div class="modal fade" id="ansower" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h3 class="modal-title replyDetail" id="lineModalLabel">回覆申訴</h3>
        </div>
        <div class="modal-body">
            
            <!-- content goes here -->
            <form>
              <div class="form-group">
                <label for="complainNo" id="complainTi"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 申訴編號 : </label>
                <p id="complainIn" class="repComNo"><%-- ${mealComplainVO.complainNo} --%></p>
              </div>
             <div class="form-group">
                <label for="complainNo" id="complainTi"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 申訴時間 : </label>
                <p id="complainIn" class="repComTime"><%-- ${sdf.format(mealComplainVO.detailDate)} --%></p>
              </div>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-envelope fo-1x" aria-hidden="true"></i> 申訴內容 : </label>
                <p id="complainIn" class="repComDetail"><%-- ${mealComplainVO.complainDetail} --%></p>
              </div>

              <hr>
              <div class="form-group">
                <label for="replayIntro" id="complainTi"><i class="fa fa-pencil fo-1x" aria-hidden="true"></i> 回覆內容:</label>
                <textarea class="form-control newReplay" id="replayIntro" rows="5" placeholder="請輸入回覆內容"></textarea>
              </div>
              <div class="messageAlert"></div>
<!--               <div class="form-group imgform">
<!--                 <label for="exampleInputFile">上傳圖片</label> -->
<!--                 <input type="file" name="fileData[]" size="35" id="uploadImage" accept="image/*" multiple > -->
<!--                 <img id="img" src=""> -->
<!--               </div> --> 
            </form>

        </div>
        <div class="modal-footer">
            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-danger" id="canelBtn" data-dismiss="modal" role="button">取消</button>
                </div>
                
				<div class="btn-group" role="group">
                    <button type="button" class="btn btn-warning" id="submit"role="button">送出</button>
               		<input type="hidden" name="action"     value="update"> 
                    <input type="hidden" name="complainNo" class="replyNoDe" value="${mealComplainVO.complainNo}">
                    <input type="hidden" name="whichPage"	value="<%=whichPage%>"> 
                </div>
            </div>
        </div>
    </div>
  </div>
</div>

<!-- 回覆跳窗 ================================================================================ -->


<!-- 詳細跳窗 ================================================================================ -->

<!-- line modal -->
<div class="modal fade" id="moreDetail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h3 class="modal-title detailBack" id="lineModalLabelDe"><%-- ${mealComplainVO.complainNo} --%>：<%-- ${mealComplainVO.complainStatus} --%></h3>
        </div>
        <div class="modal-body">
            
            <!-- content goes here -->
            <form>
              <div class="form-group">
                <label for="complainNo" id="complainTi"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 訂單編號 : </label>
                <p id="complainIn" class="orderNoDe"><%-- ${mealComplainVO.mo_no} --%></p>
              </div>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-envelope fo-1x" aria-hidden="true"></i> 申訴內容 : </label>
                <p id="complainIn" class="compDe"><%-- ${mealComplainVO.complainDetail} --%></p>
              </div>
                <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-clock-o" aria-hidden="true"></i> 申訴時間 : </label>
                <p id="complainIn" class="comptime"><%-- ${sdf.format(mealComplainVO.detailDate)} --%></p>
              </div>
              <hr>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-envelope fo-1x" aria-hidden="true"></i> 回覆申訴 : </label>
                <p id="complainIn" class="compRep"><%-- ${mealComplainVO.complainReply} --%></p>
              </div>
<!--               <div class="form-group"> -->
<!--                 <label for="complainIntro" id="complainTi"><i class="fa fa-user-o" aria-hidden="true"></i> 員工名字 : </label> -->
<%--                 <p id="complainIn" class="empIdM">${employeeVO.empId}</p> --%>
<!--               </div> -->
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-clock-o" aria-hidden="true"></i> 回覆時間 : </label>
                <p id="complainIn" class="reptime"><%-- ${sdf.format(mealComplainVO.replyDate)} --%></p>
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

	</div>
</div>	
		
    <script src="https://code.jquery.com/jquery.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.min.js"></script>
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
    
</body>
<%@ include file="/back/production/BA104G1_footer.jsp"%>
<script>
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
//	    $("#uploadImage").change(function(){
//	      readImage( this );
//	    });

	   
	// 回覆取消事件
	    
	    $('#canelBtn').on('click', function(){
	        $(".form-control").val("");
	        $(".repComNo").html("");
		    $(".repComTime").html("");
		    $(".repComDetail").html("");
	    });
	    
	 // 回覆取消事件
	    
	    
	 // 回覆跳窗事件
	    
	    $(".actionReply").on('click', function() {
	    	$('#ansower').remove("data-dismiss");
	    		$(".newReplay").val("");
	            $(".repComNo").html("");
	    	    $(".repComTime").html("");
	    	    $(".repComDetail").html("");

	    		$item = $( this );
	  		  	var replyNo = $item.parent().find("input.serchNo");
	  		  console.log('回覆查詢：'+replyNo.val());
	  		  console.log("item:"+replyNo.val() +"// old:" + $(".repComNo").html());
	  		  var seachNo = replyNo.val();
	  		  console.log("查詢號碼:-----------"+replyNo.val());
			  $.ajax({
		    		 type:"POST",  //指定http參數傳輸格式為POST 
		    		 contentType:"application/x-www-form-urlencoded",
		    		 url:"<%=request.getContextPath()%>/mealcomplain/mealcomplain.do?action=getOne_For_Updat_meal&complainNo="+seachNo,   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//		    		 data:text,  //要傳給目標的data
		    		 dataType: "json",
		    		 
		    		//Ajax成功後執行的function，response為回傳的值
		    		 success : function(res){
			    	     console.log("-----------------------"+res);//看JSON物件
console.log("No:"+res.complainNo);//看JSON物件
			    	     
			    	     $(".repComNo").html(res.complainNo);
			    	     $(".repComTime").html(res.detailDate);
			    	     $(".repComDetail").html(res.complainDetail);
			    	     if(res.complainStatus === "已完成" ){
			    	    	 $(".newReplay").val(res.complainReply);
			    	    	 swal({ 
			    	    		  title: res.complainNo + '已經完成回覆,請問還要修改嗎？', 
			    	    		  text: '新訊息將會舊訊息覆蓋過去', 
			    	    		  type: 'warning',
			    	    		  confirmButtonColor: '#3085d6',
			    	    		  cancelButtonColor: '#d33',
			    	    		  confirmButtonText: '了解', 
			    	    		})
			    	     }
			    	     
		    		 },
		    			    		 
		    		 error : function(xhr, ajaxOptions, thrownError){
		    			 console.log("error");
		             }
		    	 }); 
		  });
	    
	 // 回覆跳窗事件   
	    
	    
	// 回覆查詢    
	    $("#submit").on('click', function() {
	    	var detail = $(".newReplay").val();
	    	console.log(detail);
	    	console.log('hhhhhhhhh');
			  $item = $('.repComNo').html();
			console.log("送出的值"+$item);
		    	if(detail == ""){
		    		swal(
	    				  '尚未完成',
	    				  '回覆不能為空',
						  'warning'
	    				)
	    		
		    	} else if(detail != ""){
		    		$('#ansower').modal('hide');

		  		  $.ajax({
		  	    		 type:"POST",  //指定http參數傳輸格式為POST 
		  	    		 contentType:"application/x-www-form-urlencoded",
		  	    		 url:"<%=request.getContextPath()%>/MealComplainServlet?action=update&complainNo="+$item+"&complainReply="+ $(".newReplay").val(),   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//		  	    		 data:text,  //要傳給目標的data
		  	    		 dataType: "json",
		  	    		 
		  	    		//Ajax成功後執行的function，response為回傳的值
		  	    		 success : function(res){
		  		    	     console.log(res);//看JSON物件
		  		    	     console.log("No:"+res.complainNo);//看JSON物件
		  		    	     var showNo = $('#showNo').html();
		  		    	   console.log("Find +++ "+ showNo);
			  		    	   swal({
			  		    		    title: res.complainNo+': 已成功回覆',
			  		    		    type:	'success',
	
			  		    		})
			  		    		setTimeout(function(){ 
	  		    				    location.reload();
	  		    				} ,800);
			  			
		  	    		 },
		  	    		 error : function(xhr, ajaxOptions, thrownError){
		  	                 alert(xhr.status+"\n"+thrownError);
		  	             }
		  	    	 }); 
		    	};
		    });
	  
	    
	    
	    
	    
	// 回覆查詢
	    
	    
	// 查詢詳細資料 AJAX方法
	    $(".clickDetail").on('click', function() {
	    	$(".detailBack").html("訂單申訴內容");
		     $(".orderNoDe").html('');
		     $(".compDe").html('');
		     $(".comptime").html('');
		     $(".compRep").html('');
		     $(".reptime").html('');
	  	  
			  $item = $( this );
			  var seach = $item.parent().find("input.complainNoDetail");
			  console.log('查詢'+seach.val());
			  $.ajax({
		    		 type:"POST",  //指定http參數傳輸格式為POST 
		    		 contentType:"application/x-www-form-urlencoded",
		    		 url:"<%=request.getContextPath()%>/MealComplainServlet?action=getOne_For_Display&complainNo="+seach.val(),   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//		    		 data:text,  //要傳給目標的data
		    		 dataType: "json",
		    		 
		    		//Ajax成功後執行的function，response為回傳的值
		    		 success : function(res){
			    	     console.log(res);//看JSON物件
			    	     console.log("No:"+res.complainNo);//看JSON物件
			    	     
			    	     $(".detailBack").html("訂單申訴內容 - "+ res.complainNo+" : 【 "+res.complainStatus+ " 】");
			    	     $(".orderNoDe").html(res.mo_no);
			    	     $(".compDe").html(res.complainDetail);
			    	     $(".comptime").html(res.detailDate);
			    	     $(".compRep").html(res.complainReply);
			    	     $(".reptime").html(res.replyDate);
			    	     
		    		 },
		    		 beforeSend : function(){
		    			 $(".clickDetail").attr({ disabled: "disabled" });
		    			 $(".wait").show();
		    		 },
		    		 complete : function(){
		    			 $(".clickDetail").removeAttr("disabled");
		    			 $(".wait").hide();
		    		 },
		    		 
		    		 error : function(xhr, ajaxOptions, thrownError){
		                 alert(xhr.status+"\n"+thrownError);
		             }
		    	 }); 
		      });
	// 查詢詳細資料 AJAX方法



	//
//	    function readImage(input) {
//	    // for(var i =0 ; i.)
//	      if ( input.files && input.files[0] ) {
//	        var size = Math.round(input.files[0].size / 1024 / 1024);
//	        if (size > 3) {
//	         alert('图片大小不得超过3M');
//	         input.files.remove();
//	        }
	//
//	        var FR= new FileReader();
//	        FR.onload = function(e) {
//	          //e.target.result = base64 format picture
//	          $('#img').attr( "src", e.target.result );
//	        };       
//	        FR.readAsDataURL( input.files[0] );
//	      }
//	    }


//	    $('#img').click(function(){
//	        $(this).toggleClass('min');
//	        $(this).toggleClass('max');
//	        });




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

	});


</script>

</html>