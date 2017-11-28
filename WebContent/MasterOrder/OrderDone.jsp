<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.detail.cart.CartVO"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%@ include file="pages/navbar.jsp" %> 
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" -->
<!-- 	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" -->
<!-- 	crossorigin="anonymous"> -->

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	    <div class="col-lg-12">
      <h1 style="font-size: 72px;text-align: center;">定貨成功</h1>
      
    </div>
<body>

<style type="text/css">
	.table{
	font-size: 25px;
	font-family: sans-serif;
	}
</style>
						<%
							Vector<CartVO> buylist = (Vector<CartVO>) session.getAttribute("shoppingcart");
							String amount = (String)session.getAttribute("amount");
							
							request.setAttribute("amount", amount);
						%>
						<%if (buylist != null && (buylist.size() > 0)) {%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>產品名稱</th>
							<th>數量</th>
							<th class="text-center">單價</th>
							<th class="text-center">總價</th>
							
						</tr>
					</thead>

						
						<%
							for (int i = 0; i < buylist.size(); i++) {
								CartVO order = buylist.get(i);
								Integer ITEMNO = order.getITEMNO();
								String NAME = order.getNAME();
								Integer QUANTITY = order.getQUANTITY();
								String DES = order.getDES();
								float PRICE = order.getPRICE();
						%>
						<tbody>
							<tr>
								<td class="col-sm-8 col-md-6">
									<div class="media">
										<a class="thumbnail pull-left" href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=<%=ITEMNO%>&PRO=0"" style=" margin-top: 10px;"> <img
											src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=<%=ITEMNO%>" height="72px"
											width="72px">
										</a>
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 39px">
												<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=<%=ITEMNO%>&PRO=0"><%=NAME%></a>
											</h4>

										</div>
									</div>
								</td>

								<td class="col-sm-1 col-md-1 text-center">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 36px">
												<%=QUANTITY%>
											</h4>
										</div>
									</div>
								</td>
								<td class="	col-sm-1 col-md-1 text-center">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 36px">
												<strong>$<%=PRICE%></strong>
											</h4>
										</div>
									</div>
								</td>
								<td class="	col-sm-1 col-md-1 text-center">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 36px">
												<strong>$<%=PRICE * QUANTITY%></strong>
											</h4>
										</div>
									</div>
								</td>
						
							</tr>

							<%
								}
							%>

							<tr>
								
								<td> </td>
								<td> </td>
								<td><h3>Total</h3></td>
								<td class="text-right"><h3>
										<strong>$<b id="amountofshow"><%=amount%></b></strong>
									</h3></td>
							</tr>
							<tr>
							<td> 送貨地址:</td>

							
							<td><input style="width:500px;height: 40px;border-radius: 4px; border: 1px solid #ccc;" type="text" value="桃園縣中壢市中央大學"></td>

							<td><a href="<%=request.getContextPath()%>/front/shopindex.jsp" class="btn btn-success" role="button"> 繼續購買 <span
									class="glyphicon glyphicon-play"></span></a></td>

						</tr>
						</tbody>
				</table>
				
			</div>
		</div>
	</div>
	<%}%>
</body>
<%@ include file="pages/footerbar.jsp" %> 

</html>