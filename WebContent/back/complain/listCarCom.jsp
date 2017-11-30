<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.carcomplain.model.*"%>
<%@ page import="com.employee.model.*"%>


<%	
	List<CarComplainVO> list  = (List<CarComplainVO>) request.getAttribute("list");
	if (list == null) {
		CarComplainService carComplainSvc = new CarComplainService();
		list = carComplainSvc.getAll();
		pageContext.setAttribute("list", list);    
	}
%>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	pageContext.setAttribute("sdf",sdf);
%>


<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>派車申訴</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.css">
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/back/css/complain/com.css">

</head>

<body>
<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

<div class="container">
<div class="right_col" role="main">
		<div class="col-md-8">
			<div class="tab-content ">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs custom-tab">
					<li class="tapone"><a href="<%=request.getContextPath()%>/back/complain/listHCCom.jsp"><i class="fa fa-user-md" aria-hidden="true"></i>&nbsp長照申訴</a></li>
					<li class="tapone active"><a href="<%=request.getContextPath()%>/back/complain/listCarCom.jsp"><i class="fa fa-car" aria-hidden="true"></i>&nbsp派車申訴</a></li>
					<li class="tapone"><a href="<%=request.getContextPath()%>/back/complain/listMealCom.jsp"><i class="fa fa-cutlery" aria-hidden="true"></i>&nbsp送餐申訴</a></li>
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
								<a href="<%=request.getContextPath()%>/back/mealOrder/listAllMealOrder.jsp" class="btn btn-info" role="button">全部申訴</a>
								<a href="<%=request.getContextPath()%>/MealOrder.do?action=listOrders_ByStatus&moStatus=未處理" class="btn btn-danger" role="button">未處理</a>
								<a href="<%=request.getContextPath()%>/MealOrder.do?action=listOrders_ByStatus&moStatus=已確認" class="btn btn-info" role="button">已完成</a>
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
  			<c:forEach var="carComplainVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
   					<!--將修改的那一筆加入對比色而已-->
                        <tbody id="mytablebody" ${(carComplainVO.complainNo == param.complainNo) ? 'text-primary':''} valign='middle'>

 						<c:choose>
							<c:when test="${carComplainVO.complainStatus == '未處理'}">
							    <tr data-status="notyet" align="center">
							</c:when>
							<c:otherwise>
							    <tr data-status="done" align="center">
							</c:otherwise>
						</c:choose>
                            <td class="col-text" id="showNo">${carComplainVO.complainNo}</td>
                            <td class="col-text">${carComplainVO.order_no}</td>
                            <td class="col-text">John Doe</td>
                            <td class="hidden-xs" id="rowWidth">${carComplainVO.complainDetail}</td>
                            <td class="hidden-xs">${sdf.format(carComplainVO.detailDate)}</td>
                            <c:choose>
							    <c:when test="${carComplainVO.complainStatus == '未處理'}">
							       <td align="center" class="col-text notyetText readstat">${carComplainVO.complainStatus}</td>
							    </c:when>
							    <c:otherwise>
							       <td class="col-text readstat">${carComplainVO.complainStatus}</td>
							    </c:otherwise>
							</c:choose>
						
                            <td class="hidden-xs" data-toggle="modal"  data-target="#ansower">
                                <a class="btn btn-info actionReply">
                                	<input type="hidden" name="complainNo" class="complainNoDetail serchNo" disabled="disabled" value="${carComplainVO.complainNo}">
                                	<input type="hidden" name="emp_no" class="emp_no" disabled="disabled" value="${employeeVO.empNo}">
                                	<input type="hidden" name="action"	value="getOne_For_Updat_car"> 
                                	<span class="glyphicon glyphicon-pencil"></span>
                                </a>
                            </td>
                            <td class="col-text" data-toggle="modal"  data-target="#moreDetail">
                                <a class="btn btn-default clickDetail">
                                <i class="fa fa-chevron-down"></i>
                                 <input type="hidden" name="complainNo" class="complainNoDetail" value="${carComplainVO.complainNo}">
                                 <input type="hidden" name="action"	value="getOne_For_Display"> 
                                </a>
                            </td>
<!--                             <td class="hidden-xs"> -->
                        <%--        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/carcomplain/carcomplain.do" name="form1">
	                        	<button type="submit" class="btn btn-info edit glyphicon glyphicon-remove"></button>
	                        	<input type="hidden" name="action"      value="delete">
	                        	<input type="hidden" name="complainNo"  value="${carComplainVO.complainNo}">
							    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
							    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
	                          </FORM> --%>
<!--                             </td> -->
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
                <p id="complainIn" class="repComNo"><%-- ${carComplainVO.complainNo} --%></p>
              </div>
             <div class="form-group">
                <label for="complainNo" id="complainTi"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 申訴時間 : </label>
                <p id="complainIn" class="repComTime"><%-- ${sdf.format(carComplainVO.detailDate)} --%></p>
              </div>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-envelope fo-1x" aria-hidden="true"></i> 申訴內容 : </label>
                <p id="complainIn" class="repComDetail"><%-- ${carComplainVO.complainDetail} --%></p>
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
                    <input type="hidden" name="complainNo" class="replyNoDe" value="${carComplainVO.complainNo}">
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
            <h3 class="modal-title detailBack" id="lineModalLabelDe"><%-- ${carComplainVO.complainNo} --%>：<%-- ${carComplainVO.complainStatus} --%></h3>
        </div>
        <div class="modal-body">
            
            <!-- content goes here -->
            <form>
              <div class="form-group">
                <label for="complainNo" id="complainTi"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 訂單編號 : </label>
                <p id="complainIn" class="orderNoDe"><%-- ${carComplainVO.order_no} --%></p>
              </div>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-envelope fo-1x" aria-hidden="true"></i> 申訴內容 : </label>
                <p id="complainIn" class="compDe"><%-- ${carComplainVO.complainDetail} --%></p>
              </div>
                <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-clock-o" aria-hidden="true"></i> 申訴時間 : </label>
                <p id="complainIn" class="comptime"><%-- ${sdf.format(carComplainVO.detailDate)} --%></p>
              </div>
              <hr>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-envelope fo-1x" aria-hidden="true"></i> 回覆申訴 : </label>
                <p id="complainIn" class="compRep"><%-- ${carComplainVO.complainReply} --%></p>
              </div>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-user-o" aria-hidden="true"></i> 員工名字 : </label>
                <p id="complainIn" class="empIdM"><%-- ${employeeVO.EmpNo} --%></p>
              </div>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-clock-o" aria-hidden="true"></i> 回覆時間 : </label>
                <p id="complainIn" class="reptime"><%-- ${sdf.format(carComplainVO.replyDate)} --%></p>
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


<%-- <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/carcomplain/carcomplain.do" >
<input type="hidden" name="action" value="update">
<input type="submit" > 
</FORM> --%>




<!-- <script>
window.onload = function (){
	function detailMore(){
		  console.log('hhhhhhhhh');
		  $item = $( this );
		  $item.parent().find("input.complainNoDetail");
		  alert($item.parent().find("input.complainNoDetail"));
	};
};
</script> -->
		
		
		
    <script src="https://code.jquery.com/jquery.js"></script>
 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
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
//    $("#uploadImage").change(function(){
//      readImage( this );
//    });

   var path = '<%=request.getContextPath() %>' ;
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
  		  	var empNo = $item.parent().find("input.emp_no");
  		  console.log('回覆查詢：'+replyNo.val() +" / 回覆員工 : "+ empNo.val());
  		  console.log("item:"+replyNo.val() +"// old:" + $(".repComNo").html());
  		  
		  $.ajax({
	    		 type:"POST",  //指定http參數傳輸格式為POST 
	    		 contentType:"application/x-www-form-urlencoded;charset=utf-8",
	    		 url: "<%=request.getContextPath() %>/carcomplain/carcomplain.do?action=getOne_For_Updat_car&complainNo="+replyNo.val()+"&emp_no="+empNo.val(),   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//	    		 data:text,  //要傳給目標的data
	    		 dataType: "json",
	    		 
	    		 
	    		 
	    		//Ajax成功後執行的function，response為回傳的值
	    		 success : function(res){
		    	     console.log(res);//看JSON物件
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
    
 // 回覆跳窗事件   
    
    
// 回覆查詢    
    $("#submit").on('click', function() {
    	var detail = $(".newReplay").val();
		  $item = $('.repComNo').html();
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
	  	    		 contentType:"application/x-www-form-urlencoded;charset=utf-8",
	  	    		 url:"<%=request.getContextPath()%>/carcomplain/carcomplain.do?action=update&complainNo="+$item+"&complainReply="+detail,   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//	  	    		 data:text,  //要傳給目標的data
	  	    		 dataType: "json",
	  	    		 
	  	    		//Ajax成功後執行的function，response為回傳的值
	  	    		 success : function(res){
	  		    	     console.log(res);//看JSON物件
	  		    	     console.log("No:"+res.complainNo);//看JSON物件

		  		    	   swal({
		  		    		    title: res.complainNo+': 已成功回覆',
		  		    		    type:	'success',
		  		    		    timer: 4500
		  		    		})
	  		    	     
		  		    		
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
		  
		  $.ajax({
	    		 type:"POST",  //指定http參數傳輸格式為POST 
	    		 contentType:"application/x-www-form-urlencoded;charset=utf-8",
	    		 url: "<%=request.getContextPath()%>/carcomplain/carcomplain.do?action=getOne_For_Display&complainNo="+seach.val(),   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//	    		 data:text,  //要傳給目標的data
	    		 dataType: "json",
	    		 
	    		//Ajax成功後執行的function，response為回傳的值
	    		 success : function(res){
		    	     console.log(res);//看JSON物件
		    	     console.log("No:"+res.complainNo);//看JSON物件
		    	     
		    	     $(".detailBack").html("訂單申訴內容 - "+ res.complainNo+" : 【 "+res.complainStatus+ " 】");
		    	     $(".orderNoDe").html(res.order_no);
		    	     $(".compDe").html(res.complainDetail);
		    	     $(".comptime").html(res.detailDate);
		    	     $(".compRep").html(res.complainReply);
		    	     $(".empIdM").html(res.emp_no);
		    	     $(".reptime").html(res.replyDate);
		    	     
	    		 },
	    	 }); 
	      });
// 查詢詳細資料 AJAX方法



//
//    function readImage(input) {
//    // for(var i =0 ; i.)
//      if ( input.files && input.files[0] ) {
//        var size = Math.round(input.files[0].size / 1024 / 1024);
//        if (size > 3) {
//         alert('图片大小不得超过3M');
//         input.files.remove();
//        }
//
//        var FR= new FileReader();
//        FR.onload = function(e) {
//          //e.target.result = base64 format picture
//          $('#img').attr( "src", e.target.result );
//        };       
//        FR.readAsDataURL( input.files[0] );
//      }
//    }


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

});

</script>
</html>