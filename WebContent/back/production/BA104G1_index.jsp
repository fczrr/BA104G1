<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp" %>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<style>
.texto_grande {
    font-size: 2.5rem;
    color: white;
} 
#icone_grande {
    font-size: 8rem;
    color:#fff;
}

.mybtn{
	background:#555;
}
.mybtn:hover{
	color: #333;
    background-color: #000;
    border-color: #adadad;
}

.btn-size{
	margin-top:30Px;
	margin-left:15px;
	margin-right:15px;
}

/* .btn-default:hover { */
/*     color: #333; */
/*     background-color: #e6e6e6; */
/*     border-color: #adadad; */
/* } */
 
</style>
</head>
       <!-- page content -->
        <div class="right_col" role="main">
          <div class="">

            <div class="page-title">
              <div class="title_left">
<!--                 <h3>首頁/</h3> -->
              </div>

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
                 		<div id="mytitle" style="padding: 10px; color: #FFFFFF; text-align: center;">
									<a class="btn btn-block btn-lg btn-primary" data-toggle="modal" data-target="#mymodal" style="background: #428fdc">
								<h1> 有我罩你後端平台系統
								</h1>
							</a>
						</div>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>

                    </ul>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  
                  
<div class="container">
     <div class="col-md-4">
        <a class="btn btn-block btn-lg btn-success btn-size" href="<%=request.getContextPath()%>/back/employee/listAllEmployee.jsp">
            <i class="fa fa-users" id="icone_grande"></i> <br><br>
            <span class="texto_grande"><i class="fa fa-edit"></i> 員工管理</span></a>
      </div>
      <div class="col-md-4">
        <a class="btn btn-block btn-lg btn-danger btn-size" href="<%=request.getContextPath()%>/back/member/listAllMember1.jsp">
            <i class="fa fa-user" id="icone_grande"></i> <br><br>
            <span class="texto_grande"><i class="fa fa-edit"></i>送餐管理</span></a>
      </div>
      <div class="col-md-4">
        <a class="btn btn-block btn-lg btn-primary btn-size" data-toggle="modal" data-target="#mymodal">
            <i class="fa fa-cog fa-spin" id="icone_grande"></i> <br><br>
            <span class="texto_grande"><i class="fa fa-edit"></i>派車管理</span></a>
      </div>
      <div class="col-md-4">
        <a class="btn btn-block btn-lg btn-warning btn-size" href="<%=request.getContextPath()%>/back/setMeal/listAllSetMeal.jsp">
            <i class="fa fa-automobile" id="icone_grande"></i> <br><br>
            <span class="texto_grande"><i class="fa fa-edit"></i>送餐管理</span></a>
      </div> 
      <div class="col-md-4">
        <a class="btn btn-block btn-lg btn-default mybtn btn-size" href="<%=request.getContextPath()%>/back/homeCare/Hc_order_shearch.jsp">
            <i class="fa fa-home" id="icone_grande"></i> <br><br>
            <span class="texto_grande"><i class="fa fa-edit"></i>長照管理</span></a>
      </div> 
      <div class="col-md-4">
        <a class="btn btn-block btn-lg btn-info btn-size" href="<%=request.getContextPath()%>/back/production/BA104G1_back_ShopMaster.jsp">
            <i class="fa fa-automobile" id="icone_grande"></i> <br><br>
            <span class="texto_grande"><i class="fa fa-edit"></i>商城管理</span></a>
      </div> 
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
