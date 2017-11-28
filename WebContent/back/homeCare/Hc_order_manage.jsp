<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>    
<%@ page import="com.member.model.*"%>
<%@ page import="com.hcorder.modal.*"%>


<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp" %>

<jsp:useBean id="hcOrderMasterServicesss"
	class="com.hcorder.modal.HcOrderMasterService" />
<jsp:useBean id="hcOrderDetailService"
	class="com.hcorder.modal.HcOrderDetailService" />
<jsp:useBean id="employeeService" class="com.employee.model.EmployeeService" />
<jsp:useBean id="thecaredService" class="com.thecared.model.ThecaredService" />

<!-- HcOrderMasterService -->

<% HcOrderMasterService hcOrderMasterService =new HcOrderMasterService();
 HcOrderMasterVO hcOrderMasterVO = hcOrderMasterService.getOne("20171001-500001"); 
 MemberService memberService = new MemberService();
 MemberVO memberVO = memberService.findByPrimaryKey("MEM0002");  %> 


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

.table>tbody>tr>td{
	border-top:0px;
	border-right:1px;
}
 
</style>
</head>
       <!-- page content -->
        <div class="right_col" role="main">
          <div class="">

            <div class="page-title">
              <div class="title_left">
                <h3>首頁</h3>
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
                    <h2>Plain Page</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <!-- XX -->
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  
                  <div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
                  
                       			    <table class="table table-hover">
          							<caption>訂單紀錄</caption>
				                    <thead>
				                        <tr>
				                            <th>訂單編號</th>
				                            <th>下定日期</th>
				                            <th>照護對象</th>
				                            <th>訂單狀態</th>
				                        </tr>
				                    </thead>
				                    </table>
     			<c:if test="${listOrds_ByCompositeQuery.size() != 0}">

			<c:forEach var="hcOrderMasterVO" items="${listOrds_ByCompositeQuery}" varStatus="sta">						
                  
  <!-- 區塊1 -->
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="panel${sta.count}">
      <h4 class="panel-title">
        <a href="#aaa${sta.count}" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="true" aria-controls="aaa${sta.count}">
								<table class="table table-hover">
										<tr>
											<td>${hcOrderMasterVO.orderNo}</td>
											<td>${hcOrderMasterVO.orderDate}</td>
											<td>${hcOrderMasterVO.caredNo}</td>
											<td>${hcOrderMasterVO.orderStatus}</td>
										</tr>			
								</table>
        </a>
      </h4>
    </div>
    <div id="aaa${sta.count}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="panel${sta.count}">
      <div class="panel-body">
      

                <table class="table table-hover">
                    <caption>名細清單</caption>
                    <thead>
                        <tr>
                            <th>名細編號</th>
                            <th>下定日期</th>
                            <th>照護對象</th>
                            <th>服務日期</th>
                            <th>服務時段</th>
                            <th>服務人員</th>
                            <th>訂單金額</th>
                            <th>訂單狀態</th>
                        </tr>
                    </thead>
                    <tbody>
							<c:forEach var="hcOrderDetailVO" items="${hcOrderDetailService.getAllByOrderNo(hcOrderMasterVO.orderNo)}">
		                        <tr>
									<td>${hcOrderDetailVO.orderDetailNo}</td>
									<td>${hcOrderMasterVO.orderDate}</td>
									<td>${hcOrderMasterVO.caredNo}</td>
									<td>${hcOrderDetailVO.serviceDate}</td>
                            <td>${hcOrderDetailVO.serviceTime}</td>
                            <td>${hcOrderDetailVO.empNo}</td>
                            <td>${hcOrderDetailVO.empNo}</td>
                            <td>${hcOrderDetailVO.orderDetailStataus}</td>
		                        </tr>
		                     </c:forEach>

                    </tbody>
                </table>



      </div>
    </div>
  </div>
	                     </c:forEach>						
					</c:if>




                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
        <!-- /page content -->


<%@ include file="/back/production/BA104G1_footer.jsp" %>
