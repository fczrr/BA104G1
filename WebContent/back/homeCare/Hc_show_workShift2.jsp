<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp" %>

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
                      
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12">	



                <table class="table table-hover">
                    <caption>長期照護 班表清單</caption>
                    <thead>
                        <tr>
                            <th>月份</th>
                            <th>員工編號</th>
                            <th>員工姓名</th>
                            <th>總工作時段</th>

                        </tr>
                    </thead>
                    <tbody>
                    <c:if  test='${not empty hcWorkShiftsVO.getEmpNo()}'>
                        <tr>
                            <td>${hcWorkShiftsVO.monthOfYear}</td>
                            <td>${hcWorkShiftsVO.empNo}</td>
                            <td>${hcWorkShiftsVO.empNo}</td>
                            <td>${hcWorkShiftsVO.totalWorkShifts}</td>
                            <td>${hcWorkShiftsVO.workShiftStatus}</td>
 
                        </tr>
                     </c:if>
	
					<c:forEach var="hcWorkShiftsVO" items="${listHcWorks_ByCompositeQuery}">						
                        <tr>
                            <td>${hcWorkShiftsVO.monthOfYear}</td>
                            <td>${hcWorkShiftsVO.empNo}</td>
                            <td>${hcWorkShiftsVO.empNo}</td>
                            <td>${hcWorkShiftsVO.totalWorkShifts}</td>
                            <td>${hcWorkShiftsVO.workShiftStatus}</td>
 
                        </tr>
                     </c:forEach>						

                    </tbody>
                </table>

			</div>
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
