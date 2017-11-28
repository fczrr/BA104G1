<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>



<title></title>
</head>

<script type="text/javascript">
function aa(e) {
	var file = e.files[0];
	console.log(e.id.replace("xx", "yy"));

	if (file) {
		// 讀取檔案
		var fileReader = new FileReader();
		fileReader.onload = function(event) {// 讀取完後執行的動作
			console.dir(event);
			document.getElementById(e.id.replace("xx", "ss")).src = event.target.result;
		};
		fileReader.readAsDataURL(file);// 讀取檔案內容,以DataURL格式回傳結果
	}
}
</script>


<style type="text/css">

img {
	display: hidden height:400px;
	width: 200px;
}

input {
	zoom: 1;
	font-size: 10px;
	color: deeppink
}
td, h3 {
	zoom: 2;
	font-size: 15px;
	color: blue; 
}
</style>
<body background="images/leaf.jpg" style="font-weight: bold;">
	<h3 align="center">商城商品新增&修改</h3>


	<form id="submit" action="<%=request.getContextPath()%>/addshop.do" method=post
		enctype="multipart/form-data">
		<table>
			<th>
				<div class="div1" id="yy1" align="center">
					<img id="ss1" src="" />
				</div>
			</th>
			<th><div class="div1" id="yy2" align="center">
					<img id="ss2" src="" />
				</div></th>
			<th><div class="div1" id="yy3" align="center">
					<img id="ss3" src="" />
				</div></th>
		</table> 
		<table align="center">
			<tr>
				<td>商品圖片</td>
				<td><input type=file id="xx1" name="upfile1" onchange="aa(this)" />
				<input type=file id="xx2" name="upfile2" onchange="aa(this)" />
				<input type=file id="xx3" name="upfile3" onchange="aa(this)" /></td>
			</tr>

			<tr>
				<td><input type="hidden" value="1" name="CLASSNO" size="20"></td>
			<tr>
				<td>商品名稱：</td>
				<td><input type="text" name="NAME" size="20"></td>
			</tr>
			<tr>
				<td>商品數量：</td>
				<td><input type="text" name="STOCK" size="20"></td>
			</tr>
			<tr>
				<td>商品價格：</td>
				<td><input type="text" name="PRICE" size="20"></td>
			</tr>
			<tr>
				<td>商品描述：</td>
				<td><textarea rows="4" cols="35" name="DES" ></textarea>
				</td>
			</tr>



			<tr>
				<td><input type="submit">
				<input type="hidden" name="action" value="uploadgogo">
				</td>
				<br>
			</tr>
		</table>
	</form>
	
	<div align="center" class="foot">
		<a href="ShowAll.jsp">查詢所有商品</a><br>
		<a href='listAll.jsp'>查詢所有商品by EL</a>
	</div>
</body>
</html>