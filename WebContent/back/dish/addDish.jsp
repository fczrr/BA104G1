<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dish.model.*"%>
<%
	DishVO dishVO = (DishVO) request.getAttribute("dishVO");
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
					<!------- 新增菜色區 ------------->
					<div class="x_content">
						<h1 class="text-center">新增菜色</h1>
						<%-- 錯誤表列 --%>
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
						<div class="container">
							<div class="row">
								<form METHOD="post"
									ACTION="<%=request.getContextPath()%>/dish.do"
									enctype="multipart/form-data">
									<div class="form-group">
										<label for="dishName">菜色名稱:</label> 
										<input type="text" class="form-control" id="dishName" name="dishName" value="${dishVO.dishName}">
									</div>
									<div class="form-group">
										<label for="dishPic">菜色圖片:</label> <input type="file"
											class="form-control" id="dishPic" name="dishPic" >
									</div>
									<div class="form-group">
										<img class="preview"
											style="max-width: 150px; max-height: 150px;">
										<div class="size"></div>
									</div>
									<div class="form-group">
										<label for="dishIntro">菜色介紹:</label>
										<textarea class="form-control" rows="5" id="dishIntro"
											name="dishIntro">${dishVO.dishIntro}</textarea>
									</div>
									<div class="form-group">
										<label for="dishType">菜色類別:</label> <select
											class="form-control" id="dishType" name="dishType">
											<option value="米食" ${(dishVO.dishType)=='米食' ? 'selected' : ''}>米食</option>
											<option value="主食" ${(dishVO.dishType)=='主食' ? 'selected' : ''}>主食</option>
											<option value="湯品" ${(dishVO.dishType)=='湯品' ? 'selected' : ''}>湯品</option>
											<option value="蔬食" ${(dishVO.dishType)=='蔬食' ? 'selected' : ''}>蔬食</option>
											<option value="甜品" ${(dishVO.dishType)=='甜品' ? 'selected' : ''}>甜品</option>
											<option value="飲品" ${(dishVO.dishType)=='飲品' ? 'selected' : ''}>飲品</option>
										</select>
									</div>
									<input type="hidden" name="action" value="insert"> <input
										type="submit" value="送出新增">
								</form>
							</div>
						</div>

						<div id='calendar'></div>
					</div>
					<!------- 新增菜色區  結束------------->
				</div>
			</div>
		</div>

	</div>
</div>
<!-- /page content -->


<%@ include file="/back/production/BA104G1_footer.jsp"%>
