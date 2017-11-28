<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.detail.cart.CartVO"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
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
							<th style="text-align: center;">單價</th>
							<th style="text-align: center;">總價</th>
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
											<h4 class="media-heading" style="margin-top: 36px;margin-right: 45px">
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
								<td class="col-sm-1 col-md-1">
										<div align="center">

								<div class="media">
										<div class="media-body">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 36px">
												<strong>$<%=PRICE * QUANTITY%></strong>
											</h4>
										</div>
									</div>
								</div>
									</div>
									</button></td>
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
								<td> </td>
								
							<td> </td>
								
								<td><a href="<%=request.getContextPath()%>/front/shopindex.jsp" class="btn btn-default"
									role="button"><span
										class="glyphicon glyphicon-shopping-cart"></span> Continue
										Shopping</a></td>
							<td><a class="btn btn-success" role="button" href='<%=request.getContextPath()%>/MasterOrder/Checkout.jsp' >
							 前往購買<span class="glyphicon glyphicon-play"></span></a></td>
								
							</tr>
						</tbody>
				</table>
				
			</div>
		</div>
	</div>
	<%}%>
</body>


</html>