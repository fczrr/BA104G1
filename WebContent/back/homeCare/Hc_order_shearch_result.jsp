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
                <h3>首頁</h3>
              </div>

              <div class="title_right">
                <div class="col-md-12 col-sm-12 col-xs-12 form-group pull-right top_search">
<!--                    <div class="input-group"> -->
<!--                     <input type="text" class="form-control" placeholder="訂單查詢..."> -->
<!--                     <span class="input-group-btn"> -->
<!--                       <button class="btn btn-default" type="button">搜尋</button> -->
<!--                     </span> -->
<!--                   </div>  -->
<form id=order-sherch action = '' method='post'>
  <div class="form-row align-items-center">
    <div class="col-3 pull-right" >
      <button type="submit" class="btn btn-primary">查詢</button>
    </div>

    <div class="col-sm-3 pull-right">
      <label class="sr-only" for="inlineFormInputGroupUsername"></label>
      <div class="input-group mb-2 mb-sm-0">
     	 <input type="text" class="form-control mb-2 mb-sm-0" id="inlineFormInputName" placeholder="查詢訂單編號..." style="border-radius:5px;">
   	 </div>
	</div>
	
    <div class="col-sm-3 pull-right">
      <label class="sr-only" for="inlineFormInputGroupUsername"></label>
      <div class="input-group mb-2 mb-sm-0">
     	 <input type="text" class="form-control mb-2 mb-sm-0" id="inlineFormInputName" placeholder="查詢會員編號..." style="border-radius:5px;">
   	 </div>   	 
	</div>
	
    <div class="col-sm-3 pull-right">
      <label class="sr-only" for="inlineFormInputGroupUsername"></label>
      <div class="input-group mb-2 mb-sm-0">
     	 <input type="text" class="form-control mb-2 mb-sm-0" id="inlineFormInputName" placeholder="查詢其他條件..." style="border-radius:5px;">
   	 </div>   	 
	</div>
	
     	 <input type="hidden" class="form-control mb-2 mb-sm-0" name="action" value="listOrds_ByCompositeQuery">
     	 <input type="hidden" class="form-control mb-2 mb-sm-0" name="successView" value="">
     	 <input type="hidden" class="form-control mb-2 mb-sm-0" name="failureV" value="/back/homeCare/BA104G1_index-1.jsp">
	
	
  </div>
</form>
                  

                  
                </div>
              </div>
            </div>


            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>長照訂單管理</h2>
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

										<c:forEach var="hcOrder"
											items="${hcOrderSvc.getAll()}"
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
															<div class="col-xs-12 col-sm-2">${hcOrder.memNo}</div>
															<div class="col-xs-12 col-sm-2">${hcOrder.orderDate}</div>
															<div class="col-xs-12 col-sm-2">${theCaredSvc.getOneTHECARED(hcOrder.caredNo).caredName}</div>
															<div class="col-xs-12 col-sm-2">${hcOrder.orderStatus}</div>
															<div class="col-xs12  col-sm-2"><span class="btn btn-info"><a>修改訂單</a></span></div>
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
															<tbody>
																<c:forEach var="detail"
																	items="${hcDetailSvc.getAllByOrderNo(hcOrder.orderNo)}">

																	<tr>
																		<td>${detail.orderDetailNo}</td>
																		<td>${detail.serviceDate}</td>
																		<td>${detail.serviceTime}</td>
																		<td>${empSvc.findByPrimaryKey(detail.empNo).empName}</td>
																		<td>${detail.orderDetailStataus}</td>
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
