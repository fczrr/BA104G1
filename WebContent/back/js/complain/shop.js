$(document).ready(function () {

    $('.btn-filter').on('click', function () {
        var $target = $(this).data('target');
        if ($target != 'all') {
            $('.table tbody tr').css('display', 'none');
            $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
        } else {
            $('.table tbody tr').css('display', 'none').fadeIn('slow');
        }
    });

    $('#checkall').on('click', function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
//    $("#uploadImage").change(function(){
//      readImage( this );
//    });

   
// 回覆取消事件
    
    $('#canelBtn').on('click', function(){
        $(".form-control").val("");
        $(".repComNo").html("");
	    $(".repComTime").html("");
	    $(".repComDetail").html("");
    });
    
 // 回覆取消事件
    
    
 // 回覆跳窗事件
    
    $(".actionReply").on('click', function() {
    	$('#ansower').remove("data-dismiss");
    		$(".newReplay").val("");
            $(".repComNo").html("");
    	    $(".repComTime").html("");
    	    $(".repComDetail").html("");
    		
    		$item = $( this );
  		  	var replyNo = $item.parent().find("input.serchNo");
  		  console.log('回覆查詢：'+replyNo.val());
  		  console.log("item:"+replyNo.val() +"// old:" + $(".repComNo").html());
		  $.ajax({
	    		 type:"POST",  //指定http參數傳輸格式為POST 
	    		 contentType:"application/x-www-form-urlencoded",
	    		 url:"/BA104G1/ShopComplainServlet?action=getOne_For_Updat_shop&complainNo="+replyNo.val(),   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//	    		 data:text,  //要傳給目標的data
	    		 dataType: "json",
	    		 
	    		//Ajax成功後執行的function，response為回傳的值
	    		 success : function(res){
		    	     console.log(res);//看JSON物件
		    	     console.log("No:"+res.complainNo);//看JSON物件
		    	     
		    	     $(".repComNo").html(res.complainNo);
		    	     $(".repComTime").html(res.detailDate);
		    	     $(".repComDetail").html(res.complainDetail);
		    	     if(res.complainStatus === "已完成" ){
		    	    	 $(".newReplay").val(res.complainReply);
		    	    	 swal({ 
		    	    		  title: res.complainNo + '已經完成回覆,請問還要修改嗎？', 
		    	    		  text: '新訊息將會舊訊息覆蓋過去', 
		    	    		  type: 'warning',
		    	    		  confirmButtonColor: '#3085d6',
		    	    		  cancelButtonColor: '#d33',
		    	    		  confirmButtonText: '了解', 
		    	    		})
		    	     }
		    	     
	    		 },
	    		 beforeSend : function(){
	    			 $(".clickDetail").attr({ disabled: "disabled" });
	    			 $(".wait").show();
	    		 },
	    		 complete : function(){
	    			 $(".clickDetail").removeAttr("disabled");
	    			 $(".wait").hide();
	    		 },
	    		 
	    		 error : function(xhr, ajaxOptions, thrownError){
	                 alert(xhr.status+"\n"+thrownError);
	             }
	    	 }); 
	  });
    
 // 回覆跳窗事件   
    
    
// 回覆查詢    
    $("#submit").on('click', function() {
    	var detail = $(".newReplay").val();
    	console.log(detail);
    	console.log('hhhhhhhhh');
		  $item = $('.repComNo').html();
		console.log("送出的值"+$item);
	    	if(detail == ""){
	    		swal(
    				  '尚未完成',
    				  '回覆不能為空',
    				  'warning'
    				)
    		
	    	} else if(detail != ""){
	    		$('#ansower').modal('hide');

	  		  $.ajax({
	  	    		 type:"POST",  //指定http參數傳輸格式為POST 
	  	    		 contentType:"application/x-www-form-urlencoded",
	  	    		 url:"/BA104G1/ShopComplainServlet?action=update&complainNo="+$item+"&complainReply="+$(".newReplay").val(),   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//	  	    		 data:text,  //要傳給目標的data
	  	    		 dataType: "json",
	  	    		 
	  	    		//Ajax成功後執行的function，response為回傳的值
	  	    		 success : function(res){
	  		    	     console.log(res);//看JSON物件
	  		    	     console.log("No:"+res.complainNo);//看JSON物件
	  		    	     var showNo = $('#showNo').html();
	  		    	   console.log("Find +++ "+ showNo);
		  		    	   swal({
		  		    		    title: res.complainNo+': 已成功回覆',
		  		    		    type:	'success',
		  		    		    timer: 4500
		  		    		}).then(
		  		    		    function () {},
		  		    		    // handling the promise rejection
		  		    		    function (dismiss) {
		  		    		        if (dismiss === 'timer') {
		  		    		            console.log('I was closed by the timer')
		  		    		        }
		  		    		    }
		  		    		)
		  		    		if(res.complainNo == showNo){
		  		    			alert('yaaaa');
		  		    		}
		  		    		
		  		    		
	  	    		 },
	  	    		 error : function(xhr, ajaxOptions, thrownError){
	  	                 alert(xhr.status+"\n"+thrownError);
	  	             }
	  	    	 }); 
	    	};
	    });
  
    
    
    
    
// 回覆查詢
    
    
// 查詢詳細資料 AJAX方法
    $(".clickDetail").on('click', function() {
    	$(".detailBack").html("訂單申訴內容");
	     $(".orderNoDe").html('');
	     $(".compDe").html('');
	     $(".comptime").html('');
	     $(".compRep").html('');
	     $(".reptime").html('');
		  $item = $( this );
		  var seachNo = $item.parent().find("input.complainNoDetail");
		  console.log('查詢：'+seachNo.val());
		  $.ajax({
	    		 type:"POST",  //指定http參數傳輸格式為POST 
	    		 contentType:"application/x-www-form-urlencoded",
	    		 url:"/BA104G1/ShopComplainServlet?action=getOne_For_Display&complainNo="+seachNo.val(),   	 //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
//	    		 data:text,  //要傳給目標的data
	    		 dataType: "json",
	    		 
	    		//Ajax成功後執行的function，response為回傳的值
	    		 success : function(res){
		    	     console.log(res);//看JSON物件
		    	     console.log("No:"+res.complainNo);//看JSON物件
		    	     
		    	     $(".detailBack").html("訂單申訴內容 - "+ res.complainNo+" : 【 "+res.complainStatus+ " 】");
		    	     $(".orderNoDe").html(res.orderno);
		    	     $(".compDe").html(res.complainDetail);
		    	     $(".comptime").html(res.detailDate);
		    	     $(".compRep").html(res.complainReply);
		    	     $(".reptime").html(res.replyDate);
		    	     
	    		 },
	    		 beforeSend : function(){
	    			 $(".clickDetail").attr({ disabled: "disabled" });
	    			 $(".wait").show();
	    		 },
	    		 complete : function(){
	    			 $(".clickDetail").removeAttr("disabled");
	    			 $(".wait").hide();
	    		 },
	    		 
	    		 error : function(xhr, ajaxOptions, thrownError){
	                 alert(xhr.status+"\n"+thrownError);
	             }
	    	 }); 
	      });
// 查詢詳細資料 AJAX方法



//
//    function readImage(input) {
//    // for(var i =0 ; i.)
//      if ( input.files && input.files[0] ) {
//        var size = Math.round(input.files[0].size / 1024 / 1024);
//        if (size > 3) {
//         alert('图片大小不得超过3M');
//         input.files.remove();
//        }
//
//        var FR= new FileReader();
//        FR.onload = function(e) {
//          //e.target.result = base64 format picture
//          $('#img').attr( "src", e.target.result );
//        };       
//        FR.readAsDataURL( input.files[0] );
//      }
//    }


//    $('#img').click(function(){
//        $(this).toggleClass('min');
//        $(this).toggleClass('max');
//        });




      $(".search").keyup(function () {
        var searchTerm = $(".search").val();
        var listItem = $('.results tbody').children('tr');
        var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
        
      $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
            return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
        }
      });
        
      $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
        $(this).attr('visible','false');
      });

      $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
        $(this).attr('visible','true');
      });

      var jobCount = $('.results tbody tr[visible="true"]').length;
        $('.counter').text(jobCount + ' item');

      if(jobCount == '0') {$('.no-result').show();}
        else {$('.no-result').hide();}
    
      });  

});
