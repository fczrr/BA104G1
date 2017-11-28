<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.balance.model.*"%>

<%@ include file="/front/navbar.jsp"%>

<%@ include file="/front/member/Breadcrumbs_Main.jsp"%>
<jsp:useBean id="balanceSvc" class="com.balance.model.BalanceService" />

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
		tr:{
			margin-bottom: 20px;	
		} 
		.crd { 
			float:left; style="width:60px";
		}
		    input[type=radio] {
    border: 0px;
    width: 20px;
    height: 2em;
}
	</style>
</head>
<body>
 

		
		<div class="container">
				<div class="col-xs-12 col-sm-6 col-sm-offset-3" >		

					<img alt="" src="<%=request.getContextPath()%>/img/balance/visalogo.jpg" width="100px">
			
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do">
			<table>
			<tr><td colspan="2"><h1 class="text-center">信用卡加值</h1></td></tr>
			<tr><td>會員編號:</td><td> ${memberVO.memNo}</td>
		  		<td>
		  		<input type="hidden" class="form-control" id="memNo" name="memNo" 
		  		value ="${memberVO.memNo}" >
		  		<input type="hidden" class="form-control" id="topupWay"  name="topupWay" value="CREDIT">
		  	</td></tr>
			<tr><td>儲值金額
		  		</td>
		  		<td>
		  		<input type="text" class="form-control crd"  id="topupValue" name="topupValue" value=""  style="width:100px;">
	  		</td></tr>
			<tr><td>信用卡卡號
</td>
		  		<td>

		  		<div class="crd">	  		
		  		<input type="password" class="form-control" id="creditCard1"  style="width:70px"/>
		  		</div>	
		  		
		  		<div class="crd" style="width:20px;text-align:center;"> - </div>
		  		<div class="crd">	  		
		  		<input type="password" class="form-control" id="creditCard2"  style="width:70px"/>
		  		</div>
		  		
		  		<div class="crd" style="width:20px;text-align:center;"> - </div>
		  		<div class="crd">
		  		<input type="password" class="form-control" id="creditCard3" style="width:70px" />	
		  		</div>
		  		
		  		<div class="crd" style="width:20px;text-align:center;"> - </div>
		  		<div class="crd">	  		
		  		<input type="text" class="form-control" id="creditCard4"style="width:70px"  />
		  		</div>
			</td></tr>
			<tr><td>信用卡有效期限</td>
		  		<td>
		  		<input type="text" class="form-control" id="yymm" placeholder="如：2212" style="width:100px;">
			</td></tr>
			<tr><td>
			背面檢查碼</td>
		  		<td>
		  		<div class="crd" style="width:100px;text-align:center;">
		  		<input type="text" class="form-control" id="code" placeholder="如：123" style="width:100px;" >
		  		</div>
		  		
		  		<div class="crd">
		  		<img alt="" src="<%=request.getContextPath()%>/img/balance/end3.png" height="35px">
		  		</div>
			</td></tr>
			<tr><td>電子發票</td>
		  		<td>
				
		  		<div class="crd">	 
		  		<input onclick="companyInvoice1()" type="radio" class="form-control" id="invoice1" name="invoice" value="個人發票"	></div>
		  		<div class="crd">個人發票</div>
		  		
		  		<div class="crd">
		  		<input onclick="companyInvoice2()"type="radio" class="form-control" id="invoice2" name="invoice" value="捐贈發票">
		  		</div>
		  		<div class="crd">捐贈發票</div>
		  		
		  		<div class="crd">
		  		<input onclick="companyInvoice3()" type="radio" class="form-control" id="invoice3" name="invoice" value="公司戶發票"></div>
		  		<div class="crd">公司戶發票（寄送至購買人地址）</div>	
		  	</td></tr>
		  	
		  	<tr><td></td><td>		  		
		  		<div id="showUNI" style="display:none">統一編號：<input type="text" name="userAddr" value="">
		  		</div>
			</td></tr>
			<tr><td>
				<p>
			  		<input type="hidden" name="action" value="balance_insert">
					<input type="hidden" name="memNo" value="${memberVO.memNo}" >
					<input type="submit" class="btn-danger" value="確定送出">	
				</p>
			</td></tr>
			<tr><td colspan="2">
			
				<div>1. 一元等於一點。</div>			  	
				<div>2. 完成付款程序後，將會直接進行加值，無法取消該筆交易，請詳細確認購買資料。
				確認付款完成後，詳情請至會員專區/我的錢包 網頁中查詢儲值狀態。</div>
				<div>3.請輸入以上信用卡資料、以便於向發卡行取得交易授權。完成交易授權只是發卡行確認信用卡的有效性及授權交易額度，您的信用卡信用額度在交易金額範圍內會被保留，但不代表您的付款已經完成，這筆交易也還不會出現在您的信用卡帳單中。 </div>
				<div>4.為確保網路交易安全，您同意本公司得就此筆交易向發卡銀行、收單行及持卡人核對是否屬實。</div>
			</td></tr>

			</table>
			
			</form>
			<table>
			
			<button class="btn-success" onclick="myFunction()">
				<div class="col-xs-12 col-sm-6">
					<div class="btn"><span >magic</span>
					</div>
				</div>
			</button>
			</table>
</div>              
</div>
<br>
<br>

<br>
<br>


	<script type="text/JavaScript">
		function myFunction() {
		    document.getElementById("topupValue").value = "6000";
		    document.getElementById("creditCard1").value = "0000";
		    document.getElementById("creditCard2").value = "8877";
		    document.getElementById("creditCard3").value = "0000";
		    document.getElementById("creditCard4").value = "7788";
		    document.getElementById("yymm").value = "1221";
		    document.getElementById("code").value = "321";
		}
		
		
	var UNI =document.getElementById("showUNI");

	function companyInvoice1(){
			UNI.style.display="none";
    }
    	function companyInvoice2(){
			UNI.style.display="none";
    }
    	function companyInvoice3(){
        if(UNI.style.display=="none"){
            UNI.style.display="block";
        }else {
            UNI.style.display="none";
        }
	}
	</script>
</body>
<%@ include file="/front/footerbar.jsp"%>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front/js/navbar/usebootstrap.js"></script>
</html>