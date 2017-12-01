<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.member.model.*" %>

<%@ include file="/front/navbar.jsp" %>
<jsp:useBean id="crdSvc" scope="page" class="com.thecared.model.ThecaredService"/>
<%-- <% MemberService memSvc = new MemberService(); --%>
//    MemberVO memberVO = (MemberVO)memSvc.getOneMemByNo("MEM0002");
//    session.setAttribute("memberVO",memberVO);           
<%-- %>  --%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <link href="<%=request.getContextPath()%>/back/gentelella-master/vendors/iCheck/skins/flat/green.css" rel="stylesheet"> --%>

<style>
/* //內容距離footer30px */
	.innnerContent{
		margin-top:40px;
		margin-bottom:30px;
	}
	
	.dateTitle{
	float:left;
	}
	
	.divCheck input[type="checkbox"] {
		display: none;
	}
	.divCheck input[type="checkbox"] + label {
		display: inline-block;
		background: #009688b5;
		cursor: pointer;
		padding: 5px 10px;
		-webkit-border-radius: 5px;
	}
/* 		display: inline-block;background: #cccccc;cursor: pointer;padding: 5px 10px; */
	
	.divCheck input[type="checkbox"]:checked + label {
	-webkit-border-radius: 5px;
		background-color: #f3d42e;
	}
	
	.laydate-disabled .divCheck  input[type="checkbox"] + label{
	 	display: inline-block;
		background: #cccccc;
		cursor: not-allowed;
		padding: 5px 10px;
		-webkit-border-radius: 5px;   
	}
	.layui-laydate .layui-this{    border-radius: 10px;}
	
/* 	.layui-laydate-content th { */
/* 		height:70px; */
/* 	} */

body{
display:block;
}

</style>
</head>
<body>






<div class="container">
  <div class="page-header" id="banner">
  <div class="row">
    <div class="col-lg-6">
      <h1>長期照護服務</h1>
      <p class="lead">        歡迎使用長期照護服務,</p>
    </div>
  </div>
</div>
</div>
<c:if test="${not empty errorMsgs}">
		<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
		</ul>
</c:if>
<div class="container innnerContent">
	<div class="panel-body calender-container text-center">
		 <form action="<%=request.getContextPath()%>/HcOrder/HcOrderController.do" class="hc_order" method="post" id="hc_order">		 
   

					<div class="row">
						<div class="col-xs-12 col-sm-2">
						<span class="dateTitle">請選擇照護對象:</span>
						</div>
						<div class="col-xs-12 col-sm-8">
							<select size="1" class="form-control" name="caredNo"  id="caredNo-final" aria-describedby="helpBlock2">
								<option value="" selected>請選擇服務對象</option>
								<c:forEach var="crdVO" items="${crdSvc.getAllByMemNo(memberVO.getMemNo())}" > 
									<option value="${crdVO.caredNo}">${crdVO.caredName}
								</c:forEach>   
							</select>
						</div>
						<div class="col-xs-12 col-sm-2">
							<input type="submit" >						
						</div>
						
					</div>
					
					<div class="row">
						<div class="col-xs-12 col-sm-10">
							<span class="dateTitle">請選擇服務時間:</span>
							<br>
							<br>
						</div>
						<div class="col-xs-12 col-sm-2">
						</div>
					</div>

				    <div class="row">
					    <div id="test-n1" class=" center-block calender-body"></div>
						<input type="hidden" name="action" value="add_hc_order_many">
						<input type="hidden" name="memNo" value="${memberVO.getMemNo()}">
						<input type="hidden" name="forwardURL" value="<%=request.getServletPath()%>">
					</div>
		    
		 </form>
	  
	</div>
</div>

</body>

<%@ include file="/front/footerbar.jsp" %>

<script src="<%=request.getContextPath()%>/front/css/homeCare/laydate/laydate2.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- iCheck -->
<%--     <script src="<%=request.getContextPath()%>/back/gentelella-master/vendors/iCheck/icheck.min.js"></script> --%>

		<script type="text/javascript">
			lay('#version').html('-v'+ laydate.v);
	
			laydate.render({
			  elem: '#test-n1'
			  ,position: 'static'
			  ,min:'0'
			  ,showBottom: false
			});
			
			function check_all(obj,cName) 
			{ 
			    var checkboxs = document.getElementsByName(cName); 
			    for(var i=0;i<checkboxs.length;i++){checkboxs[i].checked = obj.checked;} 
			} 
			
			$('body').on('click','.laydate-disabled',function(){
				return false;
			});
			
			

		</script>
