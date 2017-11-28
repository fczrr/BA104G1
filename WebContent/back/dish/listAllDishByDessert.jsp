<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dish.model.*"%>
<%
DishService dishSvc = new DishService();
List<DishVO> list =(List<DishVO>)dishSvc.getByType("甜品");
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
					<h1 class="text-center">查詢菜色</h1>

					<div class="container">
						<div class="btn-group">
							<a
								href="<%=request.getContextPath()%>/back/dish/listAllDish.jsp"
								class="btn btn-info" role="button">全部菜色</a> <a
								href="<%=request.getContextPath()%>/back/dish/listAllDishByRice.jsp"
								class="btn btn-info" role="button">米食</a> <a
								href="<%=request.getContextPath()%>/back/dish/listAllDishByMain.jsp"
								class="btn btn-info" role="button">主食</a> <a
								href="<%=request.getContextPath()%>/back/dish/listAllDishBySoup.jsp"
								class="btn btn-info" role="button">湯品</a> <a
								href="<%=request.getContextPath()%>/back/dish/listAllDishByVegetable.jsp"
								class="btn btn-info" role="button">蔬食</a> <a
								href="<%=request.getContextPath()%>/back/dish/listAllDishByDessert.jsp"
								class="btn btn-info" role="button">甜品</a> <a
								href="<%=request.getContextPath()%>/back/dish/listAllDishByDrink.jsp"
								class="btn btn-info" role="button">飲品</a>
						</div>
					</div>
					<div class="x_content">
						<div class="container">
							<div class="row">
								<table class="table table-hover">
									<thead>
										<tr class="success ">
											<th class="col-sm-1">菜色編號</th>
											<th class="col-sm-1">菜色名稱</th>
											<th>菜色圖片</th>
											<th>菜色介紹</th>
											<th class="col-sm-1">菜色類型</th>
											<th>修改</th>
											<th>刪除</th>
										</tr>
									</thead>
									<tbody>
										<%@ include file="/back/dish/page1.file"%>
										<c:forEach var="dishVO" items="${list}" begin="<%=pageIndex%>"
											end="<%=pageIndex+rowsPerPage-1%>">
											<tr>
												<td>${dishVO.dishNo}</td>
												<td>${dishVO.dishName}</td>
												<td><img
													src="<%=request.getContextPath()%>/DBGifReaderForDish?dishNo=${dishVO.dishNo}"
													width="200px" height="200px"></td>
												<td>${dishVO.dishIntro}</td>
												<td>${dishVO.dishType}</td>
												<td><a href='#${dishVO.dishNo}' data-toggle="modal"
													class="btn btn-primary">修改</a>

													<div class="modal fade" id="${dishVO.dishNo}">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal" aria-hidden="true">&times;</button>
																	<h1 class="modal-title text-center">修改菜色</h1>
																</div>
																<form METHOD="post"
																	ACTION="<%=request.getContextPath()%>/dish.do"
																	enctype="multipart/form-data">
																	<div class="modal-body">
																		<div class="form-group">
																			<label>菜色編號:</label>
																			<p>${dishVO.dishNo}</p>
																		</div>
																		<div class="form-group">
																			<label for="dishName">菜色名稱:</label> <input
																				type="text" class="form-control" id="dishName"
																				name="dishName" value="${dishVO.dishName}">
																		</div>
																		<div class="form-group">
																			<label for="dishPic">菜色圖片:</label> <input type="file"
																				class="form-control" id="dishPic" name="dishPic">
																		</div>
																		<div class="form-group">
																			<img class="preview"
																				style="max-width: 150px; max-height: 150px;"
																				src="<%=request.getContextPath()%>/DBGifReaderForDish?dishNo=${dishVO.dishNo}">
																			<div class="size"></div>
																		</div>
																		<div class="form-group">
																			<label for="dishIntro">菜色介紹:</label>
																			<textarea class="form-control" rows="5"
																				id="dishIntro" name="dishIntro">${dishVO.dishIntro}</textarea>
																		</div>
																		<div class="form-group">
																			<label for="dishType">菜色類別:</label> <select
																				class="form-control" id="dishType" name="dishType">
																				<option value="米食"
																					${(dishVO.dishType)=='米食' ? 'selected' : ''}>米食</option>
																				<option value="主食"
																					${(dishVO.dishType)=='主食' ? 'selected' : ''}>主食</option>
																				<option value="湯品"
																					${(dishVO.dishType)=='湯品' ? 'selected' : ''}>湯品</option>
																				<option value="蔬食"
																					${(dishVO.dishType)=='蔬食' ? 'selected' : ''}>蔬食</option>
																				<option value="甜品"
																					${(dishVO.dishType)=='甜品' ? 'selected' : ''}>甜品</option>
																				<option value="飲品"
																					${(dishVO.dishType)=='飲品' ? 'selected' : ''}>飲品</option>
																			</select>
																		</div>
																		<input type="hidden" name="action" value="update">
																		<input type="hidden" name="dishNo"
																			value="${dishVO.dishNo}"> <input
																			type="hidden" name="requestURL"
																			value="<%=request.getServletPath()%>"> <input
																			type="hidden" name="whichPage" value="<%=whichPage%>">
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">關閉</button>
																		<button type="submit" class="btn btn-primary">送出</button>
																	</div>
																</form>
															</div>
														</div>
													</div></td>
												<td>
													<form method="post"
														action="<%=request.getContextPath()%>/dish.do">
														<button type="submit" class="btn btn-danger">刪除</button>
														<input type="hidden" name="dishNo"
															value="${dishVO.dishNo}"> <input type="hidden"
															name="action" value="delete"> <input
															type="hidden" name="requestURL"
															value="<%=request.getServletPath()%>"> <input
															type="hidden" name="whichPage" value="<%=whichPage%>">
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<%@ include file="page2.file"%>
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
