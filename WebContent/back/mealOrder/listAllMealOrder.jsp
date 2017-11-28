<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.mealorder.model.*"%>
<%@ page import="com.mealorderdetail.model.*"%>
<%@ page import="com.setmeal.model.*"%>
<%
	List<MealOrderVO> list = (List<MealOrderVO>) request.getAttribute("list");
	if (list == null) {
		MealOrderService mealOrderSvc = new MealOrderService();
		list = mealOrderSvc.getAll();
		pageContext.setAttribute("list", list);    
	}
%>

<jsp:useBean id="setMealSvc" scope="page"
	class="com.setmeal.model.SetMealService" />
<%-- <%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%> --%>

<!-- page content -->
<div class="right_col" role="main">
	<div class="">

		<div class="page-title">
			<div class="title_left">
				<h3>首頁</h3>
			</div>

			<div class="title_right"> 
				<div
					class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
					<!--                   <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div> -->
				</div>
			</div>
		</div>


		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>Plain Page</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false"><i
									class="fa fa-wrench"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Settings 1</a></li>
									<li><a href="#">Settings 2</a></li>
								</ul></li>
							<!-- XX -->
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>

						<div class="clearfix"></div>
					</div>
					<h1 class="text-center">送餐訂單</h1>

					<div class="container">
						<div class="btn-group">
							<a
									href="<%=request.getContextPath()%>/back/mealOrder/listAllMealOrder.jsp"
									class="btn btn-info" role="button">全部訂單</a> <a
									href="<%=request.getContextPath()%>/MealOrder.do?action=listOrders_ByStatus&moStatus=未處理"
									class="btn btn-info" role="button">未處理訂單</a> <a
									href="<%=request.getContextPath()%>/MealOrder.do?action=listOrders_ByStatus&moStatus=已確認"
									class="btn btn-info" role="button">已確認訂單</a> <a
									href="<%=request.getContextPath()%>/MealOrder.do?action=listOrders_ByStatus&moStatus=服務中"
									class="btn btn-info" role="button">服務中訂單</a> <a
									href="<%=request.getContextPath()%>/MealOrder.do?action=listOrders_ByStatus&moStatus=已完成"
									class="btn btn-info" role="button">已完成訂單</a> <a
									href="<%=request.getContextPath()%>/MealOrder.do?action=listOrders_ByStatus&moStatus=取消訂單"
									class="btn btn-info" role="button">已取消訂單</a>
						</div>
					</div>
					<div class="x_content">
						<div class="container">
							<div class="row">
								<table class="table table-hover">
									<thead>
									<tr>
										<th>訂單編號</th>
										<th>訂購日期</th>
										<th>會員編號</th>
										<th>收件人</th>
										<th>收件人地址</th>
										<th>收件人電話</th>
										<th>處理情形</th>
										<th>訂單明細</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="mealOrderVO" items="${list}">
										<tr>
											<th>${mealOrderVO.moNo}</th>
											<th><fmt:formatDate value="${mealOrderVO.moDate}"
													pattern="yyyy-MM-dd HH:mm:ss" /></th>
											<th>${mealOrderVO.memNo}</th>

											<th>${mealOrderVO.rcptName}</th>
											<th>${mealOrderVO.rcptAdd}</th>
											<th>${mealOrderVO.rcptPhone}</th>
											<th>
												<form action="<%=request.getContextPath()%>/MealOrder.do"
													method="post">
													<select name="moStatus">
														<option ${(mealOrderVO.moStatus)=='未處理' ? 'selected' :''}>未處理</option>
														<option ${(mealOrderVO.moStatus)=='已確認' ? 'selected' :''}>已確認</option>
														<option ${(mealOrderVO.moStatus)=='服務中' ? 'selected' :''}>服務中</option>
														<option ${(mealOrderVO.moStatus)=='已完成' ? 'selected' :''}>已完成</option>
														<option ${(mealOrderVO.moStatus)=='取消訂單' ? 'selected' :''}>取消訂單</option>
													</select> <input type="hidden" name="action" value="update_status">
													<input type="hidden" name="moNo"
														value="${mealOrderVO.moNo}">
													<button class="btn btn-danger" type="submit">
														<span class="glyphicon glyphicon-pencil"></span>
													</button>
												</form>
											</th>
											<th><a href='#${mealOrderVO.moNo}' data-toggle="modal"
												class="btn btn-primary"><i class="glyphicon glyphicon-search"></i></a>

												<div class="modal fade" id="${mealOrderVO.moNo}">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true">&times;</button>
																<h4 class="modal-title">標題</h4>
															</div>
															<div class="modal-body">
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th>送餐日期</th>
																			<th>餐點時段</th>
																			<th>套餐名稱</th>
																			<th>每餐餐數</th>
																		</tr>
																	</thead>
																	<tbody>
																		<jsp:useBean id="mealOrderDetailSvc" scope="page"
																			class="com.mealorderdetail.model.MealOrderDetailService" />
																		<c:forEach var="mealOrderDetailVO"
																			items="${mealOrderDetailSvc.getByOrderNo(mealOrderVO.moNo)}">
																			<tr>
																				<td>${mealOrderDetailVO.deliveryDate}</td>
																				<td>${mealOrderDetailVO.mealTime}</td>
																				<td><c:forEach var="setMealVO"
																						items="${setMealSvc.getAll()}">
																						<c:if
																							test="${mealOrderDetailVO.smNo==setMealVO.smNo}">
							                                                                  ${setMealVO.smName}
							                                                             </c:if>
																					</c:forEach></td>
																				<td>${mealOrderDetailVO.orderQty}</td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">關閉</button>
															</div>
														</div>
													</div>
												</div></th>
										</tr>
									</c:forEach>
								</tbody>
								</table>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<!-- /page content -->


<%@ include file="/back/production/BA104G1_footer.jsp"%>
