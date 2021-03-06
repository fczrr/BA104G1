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
			<div class="title_left" style="background-color:#233D4D;height:100px;width:100%" >
			      <h1 class="text-center" style="color:white;margin-top:30px">新增菜色</h1>
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
											style="max-width: 200px; max-height: 200px;">
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
									<input type="hidden" name="action" value="insert"> 
									<input type="submit" class="btn btn-warning" value="送出新增">
								</form>
                                <br>
                             
								<button id="magicBtn" type="button" class="btn btn-default">神奇小按鈕</button>
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
<script>
$("#magicBtn").click(function(){
	$("#dishName").val("椒鹽鮭魚");
	$("#dishIntro").val("鮭魚含有極豐富的Omega-3多元不飽和脂肪酸，含量居所有魚類之冠，可幫助孩童腦部發展，特別是提升注意力及記憶力，還可幫助視力發展、減低罹患氣喘的機率、防止心血管疾病等。");
    $("#dishType").val("主食");
});


$(function (){
 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
 
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", "#dishPic", function (){
        preview(this);
    })
    
})
</script>
