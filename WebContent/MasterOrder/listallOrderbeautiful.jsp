<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shoporder.model.*"%>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
//此段複寫equals 去比較itemno

    ShopOrderService shopOrderSvc = new ShopOrderService();
    List<ShopOrderVO> list = shopOrderSvc.getAllOrder();
    pageContext.setAttribute("list", list);

%>

<html>
<head>
<body>
<title>ListallOrder.jsp</title>
</head>
<body>
<!-- <b><font color=red>ListallOrder.jsp</font></b><br> -->
<!-- <a href="javascript:history.go(-1);">回上一頁</a> -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Table with Search Column Feature</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
    body {
        color: #566787;
        background: #f7f5f2;
		font-family: 'Roboto', sans-serif;
	}
	.table-wrapper {
        background: #fff;
        padding: 20px 25px;
        margin: 30px auto;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
    .table-title {
		color: #fff;
		background: #40b2cd;		
		padding: 16px 25px;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
        margin: 5px 0 0;
        font-size: 24px;
    }
	.search-box {
        position: relative;
        float: right;
    }
	.search-box .input-group {
		min-width: 300px;
		position: absolute;
		right: 0;
	}
	.search-box .input-group-addon, .search-box input {
		border-color: #ddd;
		border-radius: 0;
	}	
    .search-box input {
        height: 34px;
        padding-right: 35px;
        background: #f4fcfd;
        border: none;
        border-radius: 2px !important;
    }
	.search-box input:focus {
        background: #fff;
	}
	.search-box input::placeholder {
        font-style: italic;
    }
	.search-box .input-group-addon {
        min-width: 35px;
        border: none;
        background: transparent;
        position: absolute;
        right: 0;
        z-index: 9;
        padding: 6px 0;
    }
    .search-box i {
        color: #a0a5b1;
        font-size: 19px;
        position: relative;
        top: 2px;
    }
    table.table {
        table-layout: fixed;
        margin-top: 15px;
    }
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
    }
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }
    table.table th:first-child {
        width: 60px;
    }
    table.table th:last-child {
        width: 120px;
    }
    table.table td a {
        color: #a0a5b1;
        display: inline-block;
        margin: 0 5px;
    }
	table.table td a.view {
        color: #03A9F4;
    }
    table.table td a.edit {
        color: #FFC107;
    }
    table.table td a.delete {
        color: #E34724;
    }
    table.table td i {
        font-size: 19px;
    }    
    table tr td{
        text-align: center;
    }
    thead tr th{
        text-align: center;
    }
</style>
<script type="text/javascript">
$(document).ready(function(){
	// Activate tooltips
	$('[data-toggle="tooltip"]').tooltip();
    
	// Filter table rows based on searched term
    $("#search").on("keyup", function() {
        var term = $(this).val().toLowerCase();
        $("table tbody tr").each(function(){
            $row = $(this);
            var name = $row.find("td:nth-child(2)").text().toLowerCase();
            console.log(name);
            if(name.search(term) < 0){                
                $row.hide();
            } else{
                $row.show();
            }
        });
    });

    // $("thead").hide();
    //$("tbody > tr").remove();
   // data = [1,2,3,3,44,4];
   // for(var i=0; i<data.length; i++){
   // 	$("tbody").append("<tr><td>"+data[i]+"</td><td>xx</td></tr>");
   // }

});
</script>
</head>
<body>
    <div class="container">
        <div class="table-wrapper">			
            <div class="table-title">
                <div class="row">
					<div class="col-sm-6">
						<h2>Order <b>Details</b></h2>
					</div>
                    <div class="col-sm-6">
                        <div class="search-box">
							<div class="input-group">								
								<input type="text" id="search" class="form-control" placeholder="Search by OrderId">
                                <span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
							</div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th style="width: 50px;">#</th>
                        <th style="width: 20%;">訂單編號</th>
                        <th style="width: 20%;">會員編號</th>
                        <th>訂單成立日期</th>
                        <th>會員姓名</th>
                        <th>訂單狀態</th>
                        <th>修改訂單</th>
                        <th>完成訂單</th>
                        <th>取消訂單</th>
                    </tr>
                </thead>
                <tbody>
                <style type="text/css">
                a:hover {
				    text-decoration: underline;
						}
				.table-striped{
				 font-size: 17px;
				}
                </style>
                <%@ include file="pages/listallOrder1.file" %>
                <c:forEach var="shoporderVO" items="${list}" varStatus="status" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                    <tr>
                    	<td>${status.count}</td>
                        <td><a href="<%=request.getContextPath()%>/order.do?action=LOOKORDERID&ORDERID=${shoporderVO.orderno}&MEMBERNO=${shoporderVO.memberno}">${shoporderVO.orderno}</a></td>
                        <td>${shoporderVO.memberno}</td>
                        <td>${shoporderVO.order_date}</td>
                        <td>${shoporderVO.customer_name}</td>
                        <td>
                            <c:if test="${(shoporderVO.order_state)=='1'}">出貨中
                        	</c:if> 
                        	<c:if test="${(shoporderVO.order_state)=='2'}">已完成
                        	</c:if> 
                        	<c:if test="${(shoporderVO.order_state)=='3'}">取消訂單
                        	</c:if> 
                        </td>
                        <td>

			     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order.do">
				<input type="hidden" name="ORDERID" value="${shoporderVO.orderno}">
				<input type="hidden" name="MEMBERNO"value="${shoporderVO.memberno}"> 
			     <a href="javascript:;" onclick="parentNode.submit();" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
			     	<input type="hidden" name="action" value="UPDATE_ORDERID">
					</FORM>
						</td>
                        <td>
                           
                 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order.do">
			     <input type="hidden" name="ORDERID" value="${shoporderVO.orderno}">
			     <input type="hidden" name="MEMBERNO" value="${shoporderVO.memberno}">
			     <a href="javascript:;" onclick="parentNode.submit();" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">done</i></a>
			     <input type="hidden" name="action"	value="CONFIRNORDER"></FORM>
			     
                        </td>
                        
                 <td>
                           
                 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order.do">
			     <input type="hidden" name="ORDERID" value="${shoporderVO.orderno}">
			     <input type="hidden" name="MEMBERNO" value="${shoporderVO.memberno}">
			     <a href="javascript:;" onclick="parentNode.submit();" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">backspace</i></a>
			     <input type="hidden" name="action"	value="CANCELORDER"></FORM>
			     
                        </td>
                    </tr>
			</c:forEach>
	
                </tbody>
               
            </table>
             <%@ include file="pages/listallOrder2.file" %>
        </div>
    </div>     
</body>
</html>                                		                            