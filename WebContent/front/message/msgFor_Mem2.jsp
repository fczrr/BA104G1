<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.*" %>
<%@ page import="java.sql.Timestamp"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<jsp:useBean id="MemSvc" scope="page" class="com.member.model.MemberService"/>
<% MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO"); %> 

<!DOCTYPE html>
<html>
    <head>
        <title>有我罩你-聊天室</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

		<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
		<link href="<%=request.getContextPath()%>/front/css/message/Newthis.css" rel="stylesheet" >
    </head>
    
    <body onload="connect();" onunload="disconnect();">
  
  
<div class="container">  
  <div class="row"> 
<%-- <p>${memVO.memName}</p> --%>
<!-- 測試用 -->
<h1> Chat Room test!!</h1>
<h3 id="statusOutput" class="statusOutput"></h3>
<hr>
<!-- 使用者名稱 -->
<input id="userName" class="text-field" type="text" placeholder="User name"/>

<!-- HTML -->


<!-- 訊息通知框  -->
<div class="tipmsg">
<span class="label label-primary">5</span>
</div>
<!-- 訊息通知框  -->
<div id="chat-circle" class="btn btn-raised" id="connect" >
<div id="chat-overlay">
</div>
<i class="fa fa-comments fa-2x icontitle"></i>
</div>


<!-- 中間訊息框  -->
<div class="chat-box">
<input type="button" class="sendmsg" onclick="sendMessage()" value="送出"  onkeydown="if (event.keyCode == 13) sendMessage();">
	<div class="chat-box-header">
	<p class="panel-title"><i class="fa fa-user-o"></i>&nbsp&nbsp有我罩你&nbsp客服中心
	<span class="chat-box-toggle" id="disconnect"><i class="fa fa-window-minimize fa-1x"></i></span>
	</p>
	</div>
	<div class="chat-box-body">
		<div class="chat-box-overlay"> 
		</div>	

<!--chat-訊息區 -->
	<div class="chat-logs" id="textArea">
 


	</div>
<!--chat-訊息區 -->


	</div>

	<!-- button區  -->
	<div class="chat-input">      
	<form class="bgwhite">
	     
	<input type="text" id="chat-input" placeholder="Send a message..."/>
	<button type="submit" class="chat-submit" id="sendMessage"><i class="fa fa-paper-plane-o fasize"></i></button>
	
	<label class="btn btn-light chat-file">
	<input style="display:none;" type="file">
	<i class="fa fa-photo fasize imgupload"></i>
	</label>
	
	</form>      
	</div>
	<!-- button區  -->

</div>
  
<!-- 中間訊息框  -->  


</div>
</div> 





</div>
</div>

</div>




<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


</body>
 
 
 
<!-- webSocket從這裡開始 -->    
<script>

	 $("#chat-circle").click(function() {    
	    $("#chat-circle").toggle('scale');
	    $(".chat-box").toggle('scale');
	  });
	  
	  $(".chat-box-toggle").click(function() {
	    $("#chat-circle").toggle('scale');
	    $(".chat-box").toggle('scale');
	    $(".tipmsg").toggle('scale');
	  }); 
	
	  
	  $('.sendmsg').click(function(){
		  sendMessage();
	  });
	
// 	var memName = '${memberVO.memName}';
	var memName = 'newGuset';
	var context = '<%=request.getContextPath() %>';
	var count;
	  
	  
	
   var MyPoint = "/MessageServlet/peter/309";
    console.log(MyPoint);
    var host = window.location.host;
    console.log(host);
    var path = window.location.pathname;
    console.log(path);
    var webCtx = path.substring(0, path.indexOf('/', 1));
    console.log(webCtx);
    
    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint; /* Websocket路徑 */
    console.log(endPointURL);
    var statusOutput = document.getElementById("statusOutput"); /* 測試連線顯示 */
	var webSocket;
	
	
	
	/* 網頁一開始load or 點擊button連線觸發 connect() */
	function connect() {
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		
		
		/* 與servlet onOpen方法 */
		webSocket.onopen = function(event) {
			updateStatus("WebSocket 成功連線");
			document.getElementById('sendMessage').disabled = false;
			document.getElementById('disconnect').disabled = false;
		};
		
		
		/* 發送訊息 與servlet onMessage方法  */
		webSocket.onmessage = function(event) {
			
			var jsonObj = JSON.parse(event.data);
			
			var userName = jsonObj.vistName;
console.log('userName:'+userName);
			var messagesArea = jsonObj.message;
console.log('訊息:'+messagesArea);			
			// 設置一個變數 data, 將剛剛 JSON 的資料存入
	        
console.log('比對名字userName:'+userName+'比對名字jsonObj.vistName:'+jsonObj.vistName);

			if(jsonObj.status =='上線'){
		   		if(userName == jsonObj.vistName){
		   			if(src =='undefined'){
		   				var msg=
		   					'<div>'+
		   					'<div class="picmem-right">'+
		   					'<img src="https://api.fnkr.net/testimg/50x50/00CED1/FFF/?text=img+placeholder" class="img-circle img-sm img-right">'+
		   					'<p class="nametext-right">'+ jsonObj.vistName +'</p>'+
		   					'<p class="speeh-text-right">'+jsonObj.message+'</p>'+
		   					'</div>'+
		   					'<div class="text-right">'+
		   					'<div class="leftchattime-right">'+
		   					'<i class="leftchattime-right fa fa-clock-o fa-fw">&nbsp'+ jsonObj.date +'&nbsp&nbsp</i>'+
		   					'</div>'+
		   					'</div>'+
		   					'</div>';
		   			} else if(src !='undefined'){
		   				'<div>'+
		   				'<div class="picmem-right">'+
		   				'<img src="https://api.fnkr.net/testimg/50x50/00CED1/FFF/?text=img+placeholder" class="img-circle img-sm img-right">'+
		   				'<p class="nametext-right">'+jsonObj.vistName+'</p>'+
		   				'<p class="speeh-text-right">'+'<img id="img" class="imgup" src="'+src+'">'+'</p>'+
		   				'</div>'+
		   				'<div class="text-right">'+
		   				'<div class="leftchattime-right">'+
		   				'<i class="leftchattime-right fa fa-clock-o fa-fw">&nbsp'+ jsonObj.date +'&nbsp&nbsp</i>'+
		   				'</div>'+
		   				'</div>'+
		   				'</div>';
		   			}
		   		}else if(userName != jsonObj.vistName){
		   			if(src =='undefined'){
		   				'<div>'+
		   				'<div class="picmem-left">'+
		   				'<img src="https://api.fnkr.net/testimg/50x50/00CED1/FFF/?text=img+placeholder" class="img-circle img-sm">'+
		   				'<p class="nametext">'+jsonObj.empName+'</p>'+
		   				'<p class="speeh-text">'+jsonObj.message+'</p>'+
		   				'</div>'+
		   				'<div class="text-left">'+
		   				'<div class="leftchattime">'+
		   				'<i class="leftchattime fa fa-clock-o fa-fw">&nbsp'+jsonObj.date+'&nbsp&nbsp</i>'+
		   				'</div>'+
		   				'</div>'+
		   				'</div>';
		   			}else if(src !='undefined'){
		   				'<div>'+
		   				'<div class="picmem-left">'+
		   				'<img src="https://api.fnkr.net/testimg/50x50/00CED1/FFF/?text=img+placeholder" class="img-circle img-sm">'+
		   				'<p class="nametext">'+ jsonObj.vistName +'</p>'+
		   				'<p class="speeh-text">'+'<img id="img" class="imgup" src="'+ jsonObj.src +'">'+'</p>'+
		   				'</div>'+
		   				'<div class="text-left">'+
		   				'<div class="leftchattime">'+
		   				'<i class="leftchattime fa fa-clock-o fa-fw">&nbsp'+ jsonObj.date +'&nbsp&nbsp</i>'+
		   				'</div>'+
		   				'</div>'+
		   				'</div>';
		   			}
		   		}
		   	}
	 	 };
		
	   
		/* 關閉觸發 與servlet onClose方法  */
		webSocket.onclose = function(event) {
			updateStatus("WebSocket 已離線");
		};
		
		
	}
	
	

	
	
 
	// 當用戶發送訊息
	function sendMessage() {
		
		// 先判斷userName
		if(userName == null){
			//是否為會員
// 			if(${memberVO.memName} != null){
// 				userName = ${memberVO.memName};
// 			} else{
console.log("數字累加 ====="+count);
				userName = 'guest'+  count+1;		
			}
	
		//取得當下時間
	    var date = new Date();
	    var nowdate = date.getHours()+":"+ date.getMinutes() + ":" + date.getSeconds();
console.log('時間：'+nowdate);

	    var inputMessage = document.getElementById("chat-input");
	    var message = inputMessage.value.trim();
	    var status ='上線';
	    var src = 'undefined';

	    if (inputMessage === ""){
	        alert ("訊息請勿空白!");
	        inputMessage.focus();	
	    } else { 
	    	console.log('第一次名字：'+userName);
			var jsonObj = {
					"vistName" : userName,
	 				"message" : message,
					"date" : nowdate,
					"status": status,
					"src" : src
					};
			webSocket.send(JSON.stringify(jsonObj));
		    inputMessage.value = "";
	        inputMessage.focus();
	        }
	 };


	
		
	function disconnect () {
		var userName = inputUserName.value.trim();
		var date = new Date();
	    var nowdate = date.getHours()+":"+ date.getMinutes() + ":" + date.getSeconds();
		var status ='離線'
		var jsonObj = { 
				"userNameJ" : userName,
				"time" : nowdate,
				"status": status
				};
		webSocket.send(JSON.stringify(jsonObj));
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connect').disabled = false;
		document.getElementById('disconnect').disabled = true;
	}

	function updateStatus(newStatus) {
		statusOutput.innerHTML = newStatus;
	}
	
	/* 圖片區 */
	$("#uploadImage").change(function(){
	    readImage( this );
	  });
	
	  function readImage(input) {
		
	    if ( input.files && input.files[0] ) {
	      var FR= new FileReader();
	      FR.onload = function(e) {
	        //e.target.result = base64 format picture
	        sendimg(e.target.result);
	      };       
	      FR.readAsDataURL( input.files[0] );
	    }
	  }
	    
	    
	  function sendimg(url) {
		var userName = inputUserName.value.trim();
		var status ='上線';
		var date = new Date();
	    var nowdate = date.getHours()+":"+ date.getMinutes() + ":" + date.getSeconds();
		var jsonObj = { 
				"userNameJ" : userName,
				"src" : url,
				"time" : nowdate,
				"status": status
				};
	    console.log("src:"+url);
	    webSocket.send(JSON.stringify(jsonObj));
	  }
	/* 圖片區 */
	
	
</script>
<!-- webSocket從這裡結束 -->


</html>
