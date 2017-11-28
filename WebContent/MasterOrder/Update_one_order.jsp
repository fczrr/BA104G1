<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shoporder.model.*" %>
<%@ page import="com.detail.promotion.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	List<ShopOrderVO> OrderList= (List<ShopOrderVO>) request.getAttribute("OrderList");
	Integer total =(Integer)request.getAttribute("total");
	session.setAttribute("OrderList", OrderList);
%>
<%int i=0;%>

	<%if (OrderList != null && (OrderList.size() > 0)) {%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript">
    function changeQuantity(input,oldValue) {

        var quantity = input.value; // 得到要修改的数量

        //檢查是否為數字
        if(isNaN(quantity)) {
            alert("請輸入數字!");
            //還原原來的值
            input.value = oldValue;
            return;
        }
        //檢查輸入是否為正整數
        if(quantity<0 || quantity!=parseInt(quantity)) {    // 1.1 != 1     parseInt("abc")返回NaN
            alert("請輸入一個正整數!!");
            input.value = oldValue;
            return;
        }

    }
</script>
</head>
<body>

<c:if test="${not empty errorMsgs}">

		<c:forEach var="message" items="${errorMsgs}">
			${message}
		</c:forEach>
	
	</font>
</c:if>

	<div class="container">
		<div class="row">
			<table class="table table-hover" style="font-size:16px;">
<thead>
	<tr>
		<th style="width: 150px;">訂單編號</th>
		<th>會員編號</th>
		<th>商品編號</th>
		<th>訂購數量</th>
		<th>商品名稱</th>
		<th>會員名子</th>
		<th>會員地址</th>
		<th>會員手機</th>
		<th>訂單成立時間</th>
		<th>商品價格</th>
		<th>修改數量</th>
		</thead>

	</tr>
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order.do"  align="center" >
	<c:forEach var="OrderList" items="${OrderList}">
	
		<tr align='center' valign='middle'>

				<td>${OrderList.orderno}</td>
				<td>${OrderList.memberno}</td>
				<td>${OrderList.itemno}</td>
				<td>${OrderList.ordercount}</td>
				<td>${OrderList.customer_name}</td>
				<td>${OrderList.shopname}</td>
				<td>${OrderList.customer_address}</td>
				<td>${OrderList.customer_phone}</td>
				<td>${OrderList.order_date}</td>
				<td>${OrderList.price}</td>

				<td>
			     <input type="number" style="border-radius:3px;width: 35px;" name="quantity<%=i++%>" onchange="changeQuantity(this,${OrderList.ordercount})" value="${OrderList.ordercount}"/>
   </td>
			</td>
		</tr>
</c:forEach>
				<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>總消費金額 :</td>
				<td>${total}</td>
				</tr>
			</div>
		</div>

</table>
	<input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}">
	<input type="hidden" name="amount" id="amount" value="${total}">
	<!-- 						假裝會員已經登入了 -->
	<input type="hidden" name="MEMNO" value="MEM0001">
	<input type="hidden" name="action" value="CONFIRM_UPDATE_ORDERID">
	<div align="center">
		<input  class="btn btn-success" type="submit" value="確認修改">
	</div>
	</FORM>

<%}%>
</body>
</html>