<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.cartype.model.*"%>


<%
	CarTypeVO cartypeVO = (CarTypeVO) request.getAttribute("cartypeVO"); 
%>


<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>車型資料</title>

<style>
table#table-1 {
	background-color: #BBEDFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

<style>
table#table-1 {
	width: 930px;
	background-color: #DADFDF;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 930px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

<style type="text/css">
.top {
	height: 200px;
}

.tabox {
	border-width: 1px;
	border-style: solid;
	border-color: #4F4D5F;
	padding: 5px;
	height: 595px;
	width: 942px;
	box-shadow: 4px 4px #979B9C;
}

.aaa {
	width: 930px;
}

.abox {
	box-shadow: 3px;
}

.footer {
	width: 942px;
	box-shadow: 4px 4px #979B9C;
}

#cartypepic {
	height:100px;
}
</style>
<script>
	$(document).ready(function() {

		$(".aaa").hover(function() {
			$(this).animate({
				opacity : '0.6'
			}, "fast");
		}, function() {
			$(this).animate({
				opacity : '1'
			}, "fast");
		});

		$(".aaa").mousedown(function() {

			$(this).animate({
				width : '1000px'
			}, "fast");
		});
		$(".aaa").mouseup(function() {

			$(this).animate({
				width : '930px'
			}, "fast");
		});

	});
</script>

</head>
<body>
<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp" %>


<!-- page content -->
        <div class="right_col" role="main">
          <div class="">

            

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
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
                    <h2>車型管理</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
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



			<div class="row">
				<div class="col-xs-12 col-sm-3">
				</div>
				<div class="col-xs-12 col-sm-3 ">
					
						<img src="<%= request.getContextPath() %>/back/image/car/cleardriver2.png" class="top">
				</div>
				<div class="col-xs-12 col-sm-3">
					
				</div>
			</div>	
		
		
		
		

		
	
			<div class="row">
				<div class="col-xs-12 col-sm-3">
				</div>
				<div class="col-xs-12 col-sm-3">
					<div role="tabpanel" class="tabox">
					    <!-- 標籤面板：標籤區 -->
					    <ul class="nav nav-tabs" role="tablist">
					        <li role="presentation" class="active">
					            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">派車管理</a>
					        </li>
					        
					    </ul>
					
					    <!-- 標籤面板：內容區 -->
					    <div class="tab-content">
					        <div role="tabpanel" class="tab-pane active abox" id="tab1">
						        <div class="bbb">
							<!-- ****************************************** -->

							

							<table>
								<tr>
									<th>車型編號</th>
									<th>車型名稱</th>
									<th>描述</th>
									<th>租賃價格</th>
									<th>車型圖片</th>


								</tr>
								<tr>
									<td><%=cartypeVO.getCartypeno()%></td>
									<td><%=cartypeVO.getCartypename()%></td>
									<td><%=cartypeVO.getDescription()%></td>
									<td><%=cartypeVO.getRentalrates()%></td>
									<td><img id="cartypepic" src="<%=request.getContextPath()%>/cartype/DBG.do?cartypeno=${cartypeVO.cartypeno}"></td>

								</tr>
							</table>

							<!-- ****************************************** -->
						</div>
					        </div>
					   
					    </div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3">
				</div>
			</div>

			<div class="row">
				<div class="col-xs-12 col-sm-3"></div>
				<div class="col-xs-12 col-sm-3"><img src="<%= request.getContextPath() %>/back/images/foot.PNG" class="footer"></div>
				<div class="col-xs-12 col-sm-3"></div>
			</div>
        
		<div id='calendar'></div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
        <!-- /page content -->


<%@ include file="/back/production/BA104G1_footer.jsp" %>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>