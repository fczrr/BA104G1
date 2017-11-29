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
				<div class="div1" id="yy1" align="center" style="margin-left:700px;">
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
				<td><input type="text" name="NAME" size="20" id="NAME"></td>
			</tr>
			<tr>
				<td>商品數量：</td>
				<td><input type="text" name="STOCK" size="20" id="STOCK"></td>
			</tr>
			<tr>
				<td>商品價格：</td>
				<td><input type="text" name="PRICE" size="20" id="PRICE"></td>
			</tr>
			<tr>
				<td>商品描述：</td>
				<td><textarea rows="4" cols="35" name="DES" id="DES"></textarea>
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
	
							<button onclick="myFunction1()">
							<div class="col-xs-12 col-sm-6">
								<div class="btn"><span >我很神奇</span>
								</div>
							</div>
						</button>
						
						商城完全版本，sql語句修正，神奇小按鈕
	<script type="text/JavaScript">
		function myFunction1() {
		    document.getElementById("NAME").value = "蒸氣眼罩AX-KX500BE ";
		    document.getElementById("STOCK").value = "20";
		    document.getElementById("PRICE").value = "1999";
		    document.getElementById("DES").value = "長輩因為眼睛週遭血液循環差、淚腺老化等眾多因素，常會有眼睛乾澀不適、容易疲勞的情況，加上現在銀髮族普遍使用智慧型手機，也成了低頭族一員，適度讓眼睛休息更是重要。藉由約41度的蒸氣，舒緩疲憊的雙眼，保濕又溫暖，還有內建音樂功能，給予身心同步地放鬆。";
		   
		}
	</script>

</body>
</html>