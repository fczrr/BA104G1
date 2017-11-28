<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AddSusses.jsp</title>
</head>
<body>
  	<div class="container">
		<div class="row">
				<table class="table table-hover"  width="1000" >
		
						<tr>
							<td class="text-center">產品照片</td>
							<td class="text-center">產品名稱</td>
							<td class="text-center">數量</td>
							<td class="text-center">商品價錢</td>
							<td class="text-center">商品描述</td>
							<td class="text-center">修改</td>
							<td class="text-center">新增&瀏覽</td>

						</tr>
				
						<tbody >
							<tr>
								<td class="">
								<div align="center">
									<div class="media">
										<a  href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${shopVO.key}&PRO=0"" style=" margin-top: 10px;"> <img
											src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=${shopVO.key}" height="200px"width="200px">
										</a>

									</div>
									</div>
								</td>
								<td class="text-center" >
							
								<div class="media-body">
											<h4 class="media-heading" style="margin-top: 70px">
												<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${shopVO.key}&PRO=0" >
												${shopVO.NAME}</a>
											</h4>
											</div>
								</td>
								<td class="text-center">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top:70px">
												${shopVO.STOCK}
											</h4>
										</div>
									</div>
								</td>
								<td class="text-center">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top:70px">
												<strong>$${shopVO.PRICE}</strong>
											</h4>
										</div>
									</div>
								</td>
								<span>
								<td>
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 36px ">
												<strong>${shopVO.DES}</strong>
											</h4>
										</div>
									</div>
								</td>
								<td>
								
																		<div align="center">

								<div class="media">
										<div class="media-body">
							<form  name="deleteForm" action="<%=request.getContextPath()%>/shop.do" method="POST" ">
								<button  type="submit" class="btn btn-warning" role="button" style="margin-top:70px">
										 <span class="glyphicon glyphicon-paperclip"></span>  修改
									</button>
										<input type="hidden" name="ITEMNO" value="${shopVO.key}"> 
										<input type="hidden" name="action" value="getOne_For_Update"> 
							</form>
								</div>
									</div>
								
								</td>
								
								<td class="col-sm-1 col-md-1">

										<div align="center">

								<div class="media">
										<div class="media-body">
							<form  name="deleteForm" action="<%=request.getContextPath()%>/back/production/BA104G1_back_ShopADD.jsp" method="POST" ">
								<button  type="submit" class="btn btn-success" role="button" style="margin-top:70px">
										 <span class="glyphicon glyphicon-ok"></span>繼續新增
									</button> 
							</form>
							<form  name="deleteForm" action="<%=request.getContextPath()%>/back/production/BA104G1_back_ShopSearch.jsp" method="POST" ">
								<button  type="submit" class="btn btn-success" role="button" style="margin-top:10px">
										 <span class="glyphicon glyphicon-search"></span>流覽商品
									</button> 
							</form>
								</div>
									</div>
								</td>
	
							</tr>
						</tbody>
				</table>
		
		</div>
	</div>
	
</body>
</html>