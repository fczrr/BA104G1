<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.setmeal.model.*"%>

<%
	SetMealService setMealSvc = new SetMealService();
	List<SetMealVO> list = setMealSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp"%>

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
					<h1 class="text-center">查詢套餐</h1>
					<div class="x_content">
						<div class="container">
							<div class="row">
								<table class="table table-hover">
									<thead>
										<tr class="success">
											<th >套餐編號</th>
											<th >套餐名稱</th>
											<th >套餐價格</th>
											<th >每餐供應量</th>
											<th>套餐圖片1</th>
											<th>套餐圖片2</th>
											<th>套餐圖片3</th>
											<th>套餐介紹</th>
											<th>更新</th>
											<th>編輯菜單</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="setMealVO" items="${list}">
											<tr>
												<td>${setMealVO.smNo}</td>
												<td>${setMealVO.smName}</td>
												<td>${setMealVO.smPrice}</td>
												<td>${setMealVO.supply}</td>
												<td><img
													src="<%=request.getContextPath()%>/DBGifReaderForSetMeal?picNo=1&smNo=${setMealVO.smNo}"
													width="200px" height="200px"></td>
												<td><img
													src="<%=request.getContextPath()%>/DBGifReaderForSetMeal?picNo=2&smNo=${setMealVO.smNo}"
													width="200px" height="200px"></td>
												<td><img
													src="<%=request.getContextPath()%>/DBGifReaderForSetMeal?picNo=3&smNo=${setMealVO.smNo}"
													width="200px" height="200px"></td>
												<td>${setMealVO.smIntro}</td>
												<td><a href='#${setMealVO.smNo}' data-toggle="modal"
													class="btn btn-danger">修改</a>
													<div class="modal fade" id="${setMealVO.smNo}">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal" aria-hidden="true">&times;</button>
																	<h4 class="modal-title">修改套餐</h4>
																</div>
																<form METHOD="post"
																	ACTION="<%=request.getContextPath()%>/setMeal.do"
																	enctype="multipart/form-data">
																	<div class="modal-body">
																		<div class="form-group">
																			<label for="smName">套餐名稱:</label> <input type="text"
																				class="form-control" id="smName" name="smName"
																				value="${setMealVO.smName}">
																		</div>
																		<div class="form-group">
																			<label for="smPrice">套餐價格:</label> <input type="text"
																				class="form-control" id="smPrice" name="smPrice"
																				value="${setMealVO.smPrice}">
																		</div>
																		<div class="form-group">
																			<label for="supply">每餐供應量:</label> <input type="text"
																				class="form-control" id="supply" name="supply"
																				value="${setMealVO.supply}">
																		</div>
																		<div class="form-group">
																			<label for="smPic1">套餐圖片1:</label> <input type="file"
																				class="form-control" id="smPic1" name="smPic1">
																		</div>
																		<div class="form-group">
																			<img class="preview1"
																				style="max-width: 150px; max-height: 150px;">
																			<div class="size"></div>
																		</div>
																		<div class="form-group">
																			<label for="smPic2">套餐圖片2:</label> <input type="file"
																				class="form-control" id="smPic2" name="smPic2">
																		</div>
																		<div class="form-group">
																			<img class="preview2"
																				style="max-width: 150px; max-height: 150px;">
																			<div class="size"></div>
																		</div>
																		<div class="form-group">
																			<label for="smPic3">套餐圖片3:</label> <input type="file"
																				class="form-control" id="smPic3" name="smPic3">
																		</div>
																		<div class="form-group">
																			<img class="preview3"
																				style="max-width: 150px; max-height: 150px;">
																			<div class="size"></div>
																		</div>
																		<div class="form-group">
																			<label for="smIntro">套餐介紹:</label>
																			<textarea class="form-control" rows="5" id="smIntro"
																				name="smIntro">${setMealVO.smIntro}</textarea>
																		</div>

																		<input type="hidden" name="action" value="update">
																		<input type="hidden" name="smNo"
																			value="${setMealVO.smNo}"> <input
																			type="hidden" name="requestURL">
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">關閉</button>
																		<button type="submit" class="btn btn-primary">送出</button>
																	</div>
																</form>
															</div>
														</div>
													</div>
												<td>
												 <form method="post" action="<%=request.getContextPath()%>/Menu.do">
												 <input type="hidden" name="smNo" value="${setMealVO.smNo}">
												 <input type="hidden" name="smName" value="${setMealVO.smName}">
												 <input type="hidden" name="action" value="getOneForInsert">
												 <input type="submit" class="btn btn-warning" value="編輯">
												 </form>
												</td>
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
