<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
  
<title>Title Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/front/css/member/login.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/front/js/member/login.js"></script>


</head>
<body>
<c:if test="${not empty errorMsgs}">
  <font color='red'>請修正以下錯誤:
  <ul> 
  <c:forEach var="message" items="${errorMsgs}">
    <li>${message}</li>
  </c:forEach>
  </ul>
  </font>
</c:if>


	<div class="container">	
		<div class="row">

			<!-- Mixins-->
			<!-- Pen Title-->
			<div class="pen-title">
				<h1>有我罩你</h1>
			</div>
			<div class="container">
				<div class="card"></div>
				<div class="card">	
					<h1 class="title">會員登入</h1>
					
					<form action="<%= request.getContextPath()%>/member/member.do" method="post">
						<input type="hidden" name="action" value="login">
						<div class="input-container">
							<input type="text" id="Username" name="memId" value="" /> <label
								for="Username">會員帳號</label>
							<div class="bar"></div>
						</div>
						<div class="input-container">
							<input type="password" id="Password" name="memPwd"  value=""/> 
							<label for="Password">會員密碼</label>
							<div class="bar"></div>
						</div>
						
						<div class="button-container">
							<button type="submit" value="Submit">
								<span>Go</span>
							</button>
							<button type="reset" value="Reset">
								<span>Reset</span>
							</button>
						
						</div>
	
						<div class="footer">
							<a href="<%=request.getContextPath()%>/front/member/MemberRegister.jsp">註冊</a>
						</div>
					</form>
					
				</div>

						<button onclick="myFunction1()">
							<div class="col-xs-12 col-sm-6">
								<div class="btn"><span >MEM0001</span>
								</div>
							</div>
						</button>
						<button onclick="myFunction2()">
							<div class="col-xs-12 col-sm-6">
								<div class="btn"><span >MEM0002</span>
								</div>
							</div>
						</button>
						<button onclick="myFunction3()">
							<div class="col-xs-12 col-sm-6">
								<div class="btn"><span >MEM0003</span>
								</div>
							</div>
						</button>

			</div>

		</div>
	</div>
	
	<script type="text/JavaScript">
		function myFunction1() {
		    document.getElementById("Username").value = "mem01";
		    document.getElementById("Password").value = "pw0000";
		}
	</script>
	<script type="text/JavaScript">
		function myFunction2() {
		    document.getElementById("Username").value = "mem02";
		    document.getElementById("Password").value = "pw0000";
		}
	</script>
	<script type="text/JavaScript">
		function myFunction3() {
		    document.getElementById("Username").value = "mem03";
		    document.getElementById("Password").value = "pw0000";
		}
	</script>

</body>
</html>