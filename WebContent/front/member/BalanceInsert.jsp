<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.balance.model.*"%>
<%@ page import="com.member.model.*"%>

<%@ include file="/front/navbar.jsp"%>

<%@ include file="/front/member/Breadcrumbs_Main.jsp"%>
<jsp:useBean id="balanceSvc" class="com.balance.model.BalanceService" />
<jsp:useBean id="memberSvc" class="com.member.model.MemberService" />

<%
	String memNo = request.getParameter("memNo");
	List<BalanceVO> balanceVO = balanceSvc.getBalanceByMemNo(memNo);
	pageContext.setAttribute("balanceVO", balanceVO);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加值</title>
<style type="text/css">

tr: {
	margin-bottom: 20px;
}

.crd {
	float: left;
	style ="width: 60px";
}

input[type=radio] {
	border: 0px;
	width: 20px;
	height: 2em;
}
</style>

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
</head>
<body>

	<style>
.demo-container {
	width: 100%;
	max-width: 350px;
	margin: 50px auto;
}

form {
	margin: 30px;
}

input {
	width: 200px;
	margin: 10px auto;
	display: block;
}
</style>
	<div class="container">
		<div class="row">
			<img alt=""
				src="<%=request.getContextPath()%>/img/member/longterm6.jpg">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/index.jsp">首頁</a></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/front/member/MemberInfo.jsp">會員資料管理</a></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/front/member/MyWallet.jsp">我的錢包</a></li>
				<li class="breadcrumb-item active" aria-current="page"><a
					href="<%=request.getContextPath()%>/front/member/MemberHcOrder.jsp">訂單管理</a></li>
			</ol>
			<hr>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-4" style="background-color: #E0E0E0;">
<hr>
				<div>1. 一元等於一點。</div>
				<div>2. 完成付款程序後，將會直接進行加值，無法取消該筆交易，請詳細確認購買資料。
					確認付款完成後，詳情請至會員專區/我的錢包 網頁中查詢儲值狀態。</div>
				<div>3.請輸入以上信用卡資料、以便於向發卡行取得交易授權。完成交易授權只是發卡行確認信用卡的有效性及授權交易額度，您的信用卡信用額度在交易金額範圍內會被保留，但不代表您的付款已經完成，這筆交易也還不會出現在您的信用卡帳單中。
				</div>
				<div>4.為確保網路交易安全，您同意本公司得就此筆交易向發卡銀行、收單行及持卡人核對是否屬實。</div>
				<img colspan="4" alt=""
					src="<%=request.getContextPath()%>/img/balance/visalogo.jpg"
					width="100px">
				<table>
					<tr>
						<td rowspan="3">電子發票</td>
						<td>

							<div class="crd">
								<input onclick="companyInvoice1()" type="radio"
									class="form-control" id="invoice1" name="invoice" value="個人發票">
							</div>
							<div class="crd">個人發票</div>




						</td>
					</tr>

					<tr>
						<td>
							<div class="crd">
								<input onclick="companyInvoice2()" type="radio"
									class="form-control" id="invoice2" name="invoice" value="捐贈發票">
							</div>
							<div class="crd">捐贈發票</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="crd">
								<input onclick="companyInvoice3()" type="radio"
									class="form-control" id="invoice3" name="invoice" value="公司戶發票">
							</div>
							<div class="crd">公司戶發票（寄送至購買人地址）</div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="3"><span id="showUNI" style="display: none">
								統一編號：<input type="text" name="userAddr" value="">
						</span></td>
					</tr>
					<tr>
						<td align="center">
							<button class="btn" onclick="myFunction()">
								<div>magic</div>
							</button>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-xs-12 col-sm-8">

				<div class=" ">



					<form method="post" id="form"
						action="<%=request.getContextPath()%>/member/member.do">

						<table>
							<tr>
								<td width="100px;" rowspan="2">會員編號</td>
								<td width="150px;" rowspan="2">${memberVO.memNo}
								<input type="hidden" class="form-control" id="memNo" name="memNo"
									value="${memberVO.memNo}"> 
								<input type="hidden" class="form-control" id="topupWay" name="topupWay"
									value="CREDIT"></td>
								<td width="120px;">信用卡卡號</td>
								<td width="200px;">
									<div class="crd">
										<input placeholder="Card number" type="tel" name="number"
											id="creditCard1">
									</div>
								</td>
								<td rowspan="4" width="25px;">&nbsp;<td>
								<td rowspan="4"><input type="hidden" name="action"
									value="balance_insert"> <input type="hidden"
									name="myurl" value="${myurl}" > <input type="hidden"
									name="memNo" value="${memberVO.memNo}"> <br> <input 
									type="submit" class="btn btn-danger" value="確定送出"
									style="width: 80px;"  ></td>
							</tr>
							<tr>
								<td>持卡人姓名</td>
								<td><div class="form-container active">
										<input placeholder="Full name" type="text" name="name" id="namecard" value="">
									</div></td>
							</tr>

							<tr>
								<td rowspan="2">儲值金額</td>
								<td rowspan="2"><input type="text" class="form-control crd"
									id="topupValue" name="topupValue" value=""
									style="width: 100px;"></td>
								<td>信用卡有效期限</td>
								<td><input placeholder="MM/YY" type="tel" name="expiry"
									id="yymm"></td>
							</tr>


							<tr>
								<td>背面檢查碼</td>
								<td><input placeholder="CVC" type="number" name="cvc">
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>

							<tr>
								<div></div>
								<td colspan="4" align="center"></td>
							</tr>
  
	 				 	</table>
						<div class="demo-container">
							<div class="card-wrapper"></div>
						</div>

					</form>

				</div>
			</div>

		</div>
	</div>
	<br>

	<%@ include file="/front/footerbar.jsp"%>
	<script
		src="<%=request.getContextPath()%>/front/js/member/jquery.card.js"></script>
	<script type="text/JavaScript">
		function myFunction() {
			document.getElementById("topupValue").value = "606000";
			document.getElementById("creditCard1").value = "35891324123";
			document.getElementById("yymm").value = "12";
			document.getElementById("namecard").value = "BEI LI";
		}

		var UNI = document.getElementById("showUNI");

		function companyInvoice1() {
			UNI.style.display = "none";
		}
		function companyInvoice2() {
			UNI.style.display = "none";
		}
		function companyInvoice3() {
			if (UNI.style.display == "none") {
				UNI.style.display = "block";
			} else {
				UNI.style.display = "none";
			}
		}
		$('form').card({
			// a selector or DOM element for the container
			// where you want the card to appear
			container : '.card-wrapper', // *required*

		// all of the other options from above
		});
	</script>
</body>

<script
	src="<%=request.getContextPath()%>/front/js/member/vendor/demo.fix.js"></script>
<script
	src="<%=request.getContextPath()%>/front/js/member/vendor/jquery-2.0.3.min.js"></script>
<script
	src="<%=request.getContextPath()%>/front/js/member/skeuocard.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
</html>