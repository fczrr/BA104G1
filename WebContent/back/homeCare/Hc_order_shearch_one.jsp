<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp" %>
<jsp:useBean id="hcOrderSvc" class="com.hcorder.modal.HcOrderMasterService" />
<jsp:useBean id="hcDetailSvc" class="com.hcorder.modal.HcOrderDetailService" />
<jsp:useBean id="empSvc" class="com.employee.model.EmployeeService" />
<jsp:useBean id="theCaredSvc" class="com.thecared.model.ThecaredService" />


       <!-- page content -->
        <div class="right_col" role="main">
          <div class="">

            <div class="page-title">
              <div class="title_left">
<!--                 <h3>首頁</h3> -->
              </div>

              <div class="title_right">
                <div class="col-md-12 col-sm-12 col-xs-12 form-group pull-right top_search">
<!--                    <div class="input-group"> -->
<!--                     <input type="text" class="form-control" placeholder="訂單查詢..."> -->
<!--                     <span class="input-group-btn"> -->
<!--                       <button class="btn btn-default" type="button">搜尋</button> -->
<!--                     </span> -->
<!--                   </div>  -->

                  

                  
                </div>
              </div>
            </div>


            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    		<div id="mytitle"
								style="padding: 10px; color: #FFFFFF; text-align: center;">


								<a class="btn btn-block btn-lg btn-primary" data-toggle="modal"
									data-target="#mymodal">
									<h1>
										<b>長照訂單管理</b>
									</h1>

								</a>

							</div>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
<!--                         <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a> -->
<!--                         <ul class="dropdown-menu" role="menu"> -->
<!--                           <li><a href="#">Settings 1</a> -->
<!--                           </li> -->
<!--                           <li><a href="#">Settings 2</a> -->
<!--                           </li> -->
<!--                         </ul> -->
                      </li>
                      <!-- XX -->
<!--                       <li><a class="close-link"><i class="fa fa-close"></i></a> -->
                      </li>
                    </ul>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div>
<form id=order-sherch action = '<%=request.getContextPath()%>/HcOrder/HcOrderController.do' method='post'>
  <div class="form-row align-items-center">
    <div class="col-auto pull-right" >
      <button type="submit" class="btn btn-primary" id="btn-toSearch">查詢</button>
    </div>
    <div class="col-auto pull-left" >
      <button type="button" class="btn btn-success" id="addCondition">增加查詢條件</button>
    </div>

    <div class="col-auto pull-right">
      <label class="sr-only" for="orderNo">訂單編號</label>
      <div class="input-group mb-2 mb-sm-0">
     	 <input type="text" class="form-control mb-2 mb-sm-0" name="orderNo" id="orderNo" placeholder="查詢訂單編號..." style="border-radius:5px;">
   	 </div>
	</div>
	
    <div class="col-auto pull-right">
      <label class="sr-only" for="memNo">會員編號</label>
      <div class="input-group mb-2 mb-sm-0">
     	 <input type="text" class="form-control mb-2 mb-sm-0" name="memNo" id="memNo" placeholder="查詢會員編號..." style="border-radius:5px;display:none;">
   	 </div>   	 
	</div>
	
    <div class="col-auto pull-right">
      <label class="sr-only" for="orderDate">訂購日期</label>
      <div class="input-group mb-2 mb-sm-0">
     	 <input type="text" class="form-control mb-2 mb-sm-0" name="orderDate" id="orderDate" placeholder="查詢訂購日期..." style="border-radius:5px;display:none;">
   	 </div>   	 
	</div>
    <div class="col-auto pull-right">
      <label class="sr-only" for="caredNo">被照顧者編號</label>
      <div class="input-group mb-2 mb-sm-0">
     	 <input type="text" class="form-control mb-2 mb-sm-0" name="caredNo" id="caredNo" placeholder="查詢被照顧者編號..." style="border-radius:5px;display:none;">
   	 </div>   	 
	</div>
    <div class="col-auto pull-right">
      <label class="sr-only" for="orderStatus">訂單狀態</label>
      <div class="input-group mb-2 mb-sm-0">
     	 <select class="form-control mb-2 mb-sm-0" name="orderStatus" id="orderStatus" style="border-radius:5px;display:none;">
     	 	<option value="">請選擇訂單狀態</option>
     	 	<option value="未確認">未確認</option>
     	 	<option value="已確認">已確認</option>
     	 	<option value="服務中">服務中</option>
     	 	<option value="已完成">已完成</option>
     	 	<option value="已取消">已取消</option>
     	 </select>
   	 </div>   	
   	 
 	<div class="col-auto pull-right"><!-- 顯示錯誤訊息 -->
		<c:if test="${not empty errorMsgs}">
				<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color:red">${message}</li>
				</c:forEach>
				</ul>
		</c:if>
		<% request.removeAttribute("errorMsgs"); %>
 	</div>
   	  
	</div>

	
     	 <input type="hidden" class="form-control mb-2 mb-sm-0" name="action" value="listOrds_ByCompositeQuery">
     	 <input type="hidden" class="form-control mb-2 mb-sm-0" name="successView" value="/back/homeCare/Hc_order_shearch.jsp">
     	 <input type="hidden" class="form-control mb-2 mb-sm-0" name="failureV" value="/back/homeCare/Hc_order_shearch.jsp">
	
	
  </div>
</form>
<hr>
                      </div>

					<table class="table">
						<thead>
							<tr>
								<th class="text-center">
									<div class="col-sm-2 ">訂單編號</div>
									<div class="col-sm-2">會員編號</div>
									<div class="col-sm-2">訂購日期</div>
									<div class="col-sm-2">被照護者編號</div>
									<div class="col-sm-2">訂單狀態</div>
									<div class="col-sm-2"></div>
								</th>
							</tr>
						</thead>
						<tbody>



							<tr>
								<td>

									<div class="panel-group" id="accordion2" role="tablist"
										aria-multiselectable="true">
										<% 
										if(request.getAttribute("listOrds_ByCompositeQuery") == null){
											request.setAttribute("listOrds_ByCompositeQuery",hcOrderSvc.getAll());
										}																						
											%>
										<c:forEach var="hcOrder"
											items="${listOrds_ByCompositeQuery}"
											varStatus="s">

											<div class="panel panel-default">
												<div class="panel-heading" role="tab" id="panel${s.index}">
													<h4 class="panel-title text-center">
														<div class="row">
															<div class="col-xs-12 col-sm-2">
																<a href="#aaa${s.index}" data-parent="#accordion2"
																	data-toggle="collapse" role="button"
																	aria-expanded="true" aria-controls="aaa">
																	${hcOrder.orderNo} </a>
															</div>
															<div class="col-xs-12 col-sm-2"><span class=list-memNo>${hcOrder.memNo}</span></div>
															<div class="col-xs-12 col-sm-2"><span class=list-orderDate>${hcOrder.orderDate}</span></div>
															<div class="col-xs-12 col-sm-2"><span class=list-caredName>${theCaredSvc.getOneTHECARED(hcOrder.caredNo).caredName}</span></div>
															<div class="col-xs-12 col-sm-2 elem-tochange" id="elem-tochange${s.index}"><span class=list-orderStatus>${hcOrder.orderStatus}</span></div>
															<div class="col-xs12  col-sm-2"><span class="btn btn-info btn-tochange" id="${hcOrder.orderNo}"><a >修改訂單</a></span></div>
														</div>
													</h4>
												</div>


												<div id="aaa${s.index}" class="panel-collapse collapse"
													role="tabpanel" aria-labelledby="panel${s.index}">
													<div class="panel-body">
														<table class="table table-hover text-center">
															<thead>
																<tr>
																	<th class="text-center">明細編號</th>
																	<th class="text-center">服務日期</th>
																	<th class="text-center">服務時段</th>
																	<th class="text-center">服務人員</th>
																	<th class="text-center">明細狀態</th>
																</tr>
															</thead>
															<tbody class="table-striped">
																<c:forEach var="detail"
																	items="${hcDetailSvc.getAllByOrderNo(hcOrder.orderNo)}">

																	<tr>
																		<td>${detail.orderDetailNo}</td>
																		<td>${detail.serviceDate}</td>
																		<td>${detail.serviceTime}</td>
																		<td>${empSvc.findByPrimaryKey(detail.empNo).empName}</td>
																		<td><span class="btn btn-info btn-tochange2" id="${detail.orderDetailNo}">${detail.orderDetailStataus}</span></td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
   
											</div>
										</c:forEach>
										
										
									</div>


								</td>
							</tr>

						</tbody>
					</table>

                      <div id='calendar'></div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
        <!-- /page content -->


<%@ include file="/back/production/BA104G1_footer.jsp" %>

<script src="<%=request.getContextPath()%>/front/css/homeCare/laydate/laydate.js"></script>


<script>
laydate.render({
    elem: '#orderDate' 
    ,showBottom: false
    ,done: function(value, date, endDate){
        $('#servDate-final').attr('value',value);
        console.log(value); 
        console.log(date); 
    }
});

$(document).ready(function (){

// 	$('.list-memNo').click(function(){
<%-- 		window.location = '<%=request.getContextPath()%>'/;//會員資料 --%>
// 	});
	$('.list-memNo').click(function(){
		window.location = 'http://blog.webgolds.com/';//會員資料
	});
	$('.list-orderDate').click(function(){
		window.location = 'http://blog.webgolds.com/';//訂購時間
	});

	
	$('#addCondition').click(function(){
		$('#orderDate').toggle();
		$('#orderStatus').toggle();
		$('#caredNo').toggle();
		$('#memNo').toggle();
	});
	

	$('.btn-tochange').click(function(){
// 		$(event.target).closest('.row').find('.elem-tochange').css('background','red');
		$(event.target).closest('.row').find('.elem-tochange').empty();
		$(event.target).closest('.row')
		.find('.elem-tochange').html('<div class="input-group mb-2 mb-sm-0"><select class="form-control mb-2 mb-sm-0 goto"  id="'+this.id+'" name="orderStatus" style="border-radius:5px;"><option value="">請選擇訂單狀態</option><option value="未確認">未確認</option><option value="已確認">已確認</option><option value="服務中">服務中</option><option value="已完成">已完成</option><option value="已取消">已取消</option></select></div>');
	});
	
	$( document ).on('click','.btn-tochange2',function(){
		$(event.target).closest('td').html('<select class="mb-2 goto2"  id="'+this.id+'" name="orderDetailStataus" style="border-radius:5px;"><option value="">請選擇訂單狀態</option><option value="未服務">未服務</option><option value="已服務">已服務</option><option value="已取消">已取消</option></select>');
	});
	
});
		$( document ).on( "change", ".goto", function(event) {
			console.log('step1'+this.id);
			var orderNo = this.id;
			var orderStatus = $(this).val();
		    var url ="<%=request.getContextPath()%>/HcOrder/HcOrderController.do"; // the script where you handle the form input.

		    if($(this).val()==""){
		    	return;
		    }
		    
		    $.ajax({
		           type:"POST",
		           url: url,
		           data: { 
		        	   orderStatus : $(this).val(),
		        	   orderNo:orderNo,
		        	   action:'updateOrderStatus',
                   },
		           success:function(data){
		               alert(data);// show response from the php script.
		               if(date=='訂單狀態改動失敗'){
		            	   return false;
		               }
		           }
		         });
		    
		    $(event.target).closest('.row')
			.find('.elem-tochange').html('<span class=list-orderStatus>'+orderStatus+'</span>');
		    

		    return false;// avoid to execute the actual submit of the form.  
			});
		
		
		$( document ).on( "change", ".goto2", function(event) {
			console.log('step1'+this.id);
			var orderDetailNo = this.id;
			var orderDetailStataus = $(this).val();
		    var url ="<%=request.getContextPath()%>/HcOrder/HcOrderController.do"; 

		    if($(this).val()==""){
		    	return;
		    }
		    
		    $.ajax({
		           type:"POST",
		           url: url,
		           data: { 
		        	   orderDetailStataus : $(this).val(),
		        	   orderDetailNo :orderDetailNo,
		        	   action:'updateOrderDetailStataus',
                   },
		           success:function(data){
		               alert(data);
		               if(date=='明細狀態改動失敗'){
		            	   return false;
		               }
		           }
		         });
		    
		    $(event.target).closest('td').html('<span class="btn btn-info btn-tochange2" id="'+orderDetailNo+'">'+orderDetailStataus+'</span>');
		    

		    return false;// avoid to execute the actual submit of the form.  
			});


</script>
