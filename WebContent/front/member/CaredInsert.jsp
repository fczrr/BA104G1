<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.thecared.model.*"%>

<%@ include file="/front/navbar.jsp"%>

<jsp:useBean id="caredSvc" class="com.thecared.model.ThecaredService" />
<%
	String memNo = request.getParameter("memNo");
	System.out.print(memNo);
	List<ThecaredVO> thecaredVO = caredSvc.getAllByMemNo(memNo);
	pageContext.setAttribute("thecaredVO", thecaredVO);
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增被照顧者資料</title>
	<style type="text/css">
		.mb20{
			margin-bottom: 20px;	
		}
	</style>
</head>
<body>
<h1 class="text-center">新增 被照顧者名單</h1>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-sm-offset-3" >
				
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do">
					
				  		<div class="input-group mb20">
				  		<span class="input-group-addon" id="basic-addon1">被照顧者姓名</span>
				  		<input type="text" class="form-control" placeholder="name" 
				  		id="caredName" name="caredName" value="">			  
						</div>

				  		<div class="input-group mb20">
				  		<span class="input-group-addon" id="basic-addon1">被照顧者性別</span>
				  		<input type="text" class="form-control" 
				  		id="caredGender" name="caredGender" >
				  		</div>	

				  		<div class="input-group mb20">
				  		<span class="input-group-addon" id="basic-addon1">會員對其稱呼</span>
				  		<input type="text" class="form-control"  
				  		id="kinship" name="kinship" >
						</div>

						<div class="input-group mb20">
				  		<span class="input-group-addon" id="basic-addon1">被照顧者身高</span>
				  		<input type="text" class="form-control"  
				  		id="caredHeight" name="caredHeight" >
				  		<div class="input-group-addon">公分</div>			  
						</div>

						<div class="input-group mb20">
				  		<span class="input-group-addon" id="basic-addon1">被照顧者體重</span>
				  		<input type="text" class="form-control" placeholder="如：70" 
				  		id="caredWeight" name="caredWeight" >
				  		<div class="input-group-addon">公斤</div>
						</div>

				  		<div class="input-group mb20">
				  		<span class="input-group-addon" id="basic-addon1">被照顧者地址</span>
				  		<input type="text" class="form-control" placeholder="如：桃園市中壢區中大路300號" 
				  		id="caredAddress" name="caredAddress" >
						</div>

				  		<div class="input-group mb20">
				  		<span class="input-group-addon" id="basic-addon1">被照顧者電話</span>
				  		<input type="text" class="form-control" placeholder="如：0910111222" 
				  		id="caredPhone" name="caredPhone" >
				  		</div>	

				  		<div class="input-group mb20">
				  		<span class="input-group-addon" id="basic-addon1">認知功能狀態</span>
				  		<input type="text" class="form-control" placeholder="請下拉選擇" 
				  		id="conStatus" name="conStatus" >
						</div>

				  		<div class="input-group mb20">
				  		<span class="input-group-addon" id="basic-addon1">生理功能狀態</span>
				  		<input type="text" class="form-control" placeholder="請下拉選擇" 
				  		id="bioStatus" name="bioStatus" >
				  		</div>
				  		
						<p>
					  		<input type="hidden" name="action" value="cared_insert">
							<input type="hidden" name="memNo" value="${memberVO.memNo}" >
							<input type="submit" value="確認新增">	
						</p>
				  	</form>
				  	
	
				</div>
			</div>
				  		

			<button onclick="myFunction()">
				<div class="col-xs-12 col-sm-6">
					<div class="btn"><span >magic</span>
					</div>
				</div>
			</button>
		</div>
		
<br><br><br><br>
	<script type="text/JavaScript">
		function myFunction() {
		    document.getElementById("caredName").value = "劉姥姥";
		    document.getElementById("caredGender").value = "F";
		    document.getElementById("kinship").value = "伯母";
		    document.getElementById("caredHeight").value = "160";
		    document.getElementById("caredWeight").value = "60";
		    document.getElementById("caredAddress").value = "大觀園";
		    document.getElementById("caredPhone").value = "0900123000";
		    document.getElementById("conStatus").value = "輕度";
		    document.getElementById("bioStatus").value = "重度";
		}
	</script>
</body>
<%@ include file="/front/footerbar.jsp"%>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
</html>