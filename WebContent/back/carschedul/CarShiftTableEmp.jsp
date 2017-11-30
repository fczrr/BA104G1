<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cartype.model.*"%>
<%@ page import="com.carschedul.model.*"%>
<%@ page import="com.employee.model.*"%>
<%@ page import="java.util.*"%>
	<%  pageContext.getSession(); %>
  <% Object empVO=  session.getAttribute("empVO");%>
<!DOCTYPE html>
<html>
<head>
	
	
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back/carschedul/fullcalendar-3.7.0/fullcalendar.min.css">
	<link rel="stylesheet" media='print' type="text/css" href="<%=request.getContextPath()%>/back/carschedul/fullcalendar-3.7.0/fullcalendar.print.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/theme.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/images/ui-bg_gloss-wave_35_f6a828_500x100.png">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/images/ui-bg_highlight-soft_100_eeeeee_1x100.png">
	
	<script src="<%=request.getContextPath()%>/back/js/carschedul/moment.min.js"></script><!-- -->
	<script src="<%=request.getContextPath()%>/back/carschedul/fullcalendar-3.7.0/lib/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/back/carschedul/fullcalendar-3.7.0/lib/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath()%>/back/carschedul/fullcalendar-3.7.0/fullcalendar.js"></script><!-- -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script><!-- 甜甜的sweetalert2 -->
	
	<jsp:useBean id="carSchedulSvc" scope="page" class="com.carschedul.model.CarSchedulService" />
    <jsp:useBean id="empSvc" scope="page" class="com.employee.model.EmployeeService" />

 		<%! String emp_no =null; %>
 		<%! String empName =null; %>
   		<%! String empTitle = null;%>
    	
    	
    
    
<script>

	$(document).ready(function() {
		//載入頁面初始設定
		var empNameSelected =  $('.form-control :selected').text()
		$('.fc-event').attr('c' , empNameSelected);
		$('.media-heading').text(empNameSelected);
		$('.media-heading').text(empNameSelected);
	

		/* initialize the external events
		-----------------------------------------------------------------*/

		$('#external-events .fc-event').each(function() {

			// store data so the calendar knows to render an event upon drop
			$(this).data('event', {
				title: $.trim($(this).attr('c')), // use the element's text as the event title
				start: $.trim($(this).attr('b')),
				stick: true, // maintain when user navigates (see docs on the renderEvent method)
				editable : true,
				overlap : false
			});

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});

		});


		/* initialize the calendar
		-----------------------------------------------------------------*/
		var emp_no="EMP0021";
		var toDay = "2017-11-01";
		var work_hours =0;
		var empName;
		var cartype_no = 1001;
		
			$('#testbtn2').click(function(){
				emp_no=	$('#empSelect').val();
				console.log(emp_no);
				$('#calendar').fullCalendar( 'refetchEvents' )
			}); 
			
		
		$('.cartype_btn').click(function(){
			cartype_no =$(this).attr('cartypeno');
			console.log(cartype_no);
			selectInfo(cartype_no,toDay);
			$('.form-control').empty();		
			$('#calendar').fullCalendar( 'refetchEvents' );
			
		});
		
			
			//班表切換員工
			$('#empSelect').change(function(){
					
				emp_no=	$(this).val();
				console.log(emp_no);
				$('#calendar').fullCalendar( 'refetchEvents' ) 
			
				empNameSelected =  $('.form-control :selected').text()
				$('.fc-event').attr('c' , empNameSelected);
				console.log(empNameSelected);
				$('.media-heading').text(empNameSelected);
				
				
				$('#external-events .fc-event').each(function() {

					// store data so the calendar knows to render an event upon drop
					$(this).data('event', {
						title: $.trim($(this).attr('c')), // use the element's text as the event title
						start: $.trim($(this).attr('b')),
						stick: true, // maintain when user navigates (see docs on the renderEvent method)
						editable : true,
						overlap : false
						
					});

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex: 999,
						revert: true,      // will cause the event to go back to its
						revertDuration: 0  //  original position after the drag
					});

				});
				
			});
			
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultView: 'month',
			validRange:function(currentDate) { 
			    return { 
			        start: currentDate.clone().subtract(1, 'days'), 
			    };
			 },
			themeSystem: 'jquery-ui',
			editable: true,
			droppable: true, // this allows things to be dropped onto the calendar
			drop: function() {
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
			},
			allDay: false,
			businessHours: { 
				dow: [ 0, 1, 2, 3, 4 ,5, 6], // 周一 - 周四 
			    start:'08:00',  
			    end: '22:00', 
			},
			
			slotDuration:'01:00:00',
			defaultTimedEventDuration:'04:00:00',
			
			
			events:function(start, end, timezone, callback) {
				console.log(toDay)
                $.ajax({
                	
                    url:"<%=request.getContextPath()%>/carschedul/carschedul.do?action=fullCalendarSource&year_month="+toDay+"&emp_no="+ emp_no+"&cartype_no="+cartype_no,
                    cache:false,
                    success:function(data) {
                        
                        eval("var j=" + data);
                        var events = [];
                        console.log(j);
                        var info = j.eventinfo;
                        for (var i = 0; i < info.length; i++) {
                            var ev = info[i];
                            var title = ev.title;
                           var evtstart = ev.start;
                            var evtend = ev.end; 
                            /* console.log(evtstart); */
                            events.push({
                                title:title,
                                start:evtstart,
                                end:evtend 
                            });
                        }
                        
                       
                        
                        
                        callback(events);
                    },
                    error:function() {
                        alert('網路忙線中請再刷新頁面一次')
                    }
                })
            },
		        
			//判斷是否全天的CODE
		                   /*  var x;   
		                    if(ev.allDay=='true'){  
		                      x=true;  
		                    }else{  
		                        x=false;  
		                        
		                    }*/
		            
		           eventReceive:function(event) {
		        	   console.log('eventReceive:', event);
		           },
		           eventDrop:function(event) {
		        	   console.log('eventDrop:', event);
		           },
		           
		       
			
			eventClick: function(calEvent, jsEvent, view) { 
		        alert('Event: ' + calEvent.title); 
		        alert('Id: ' + calEvent.id); 
		        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY); 
		        alert('View: ' + view.name); 
		        $('#calendar').fullCalendar('removeEvents',calEvent.id)
		        // change the border color just for fun 
		        $(this).css('border-color', 'red'); 
		 
		    },
		    
		 	 
		});
		
		/* function toDay(){
			var moment = $('#calendar').fullCalendar('getDate');
			 today = moment.format("YYYY-MM");
			 toDay = today + "-01";
			 // 轉為 MM/DD/YYYY 字串格式
			 console.log("本月:"+toDay);
			return toDay;
 		}; */
 		
		 $('.ui-button').click(function(){
		//得到今日年月日
	    var moment = $('#calendar').fullCalendar('getDate');
		 today = moment.format("YYYY-MM");
		 toDay = today + "-01";
		 // 轉為 MM/DD/YYYY 字串格式
		 $('#calendar').fullCalendar( 'refetchEvents' ) 
		 console.log("本月:"+toDay);
		}); 
	   	
		 $('#sendSc').click(function(){
			 var fullCalendarArray =[];
			 var eventsList=[];
			 fullCalendarArray = $('#calendar').fullCalendar('clientEvents');
			 console.log("排班表array:"+fullCalendarArray);
		
		 
		 for(i = 0;i<fullCalendarArray.length;i++){
			 
			 var evtitle = fullCalendarArray[i].title;
			 var evstart = fullCalendarArray[i].start;
			 //console.log("前端排班title:"+ title);
			 var sfd = moment(evstart).format('YYYY-MM-DD,HH');
			 //console.log("前端排班start:"+  sfd);	
			 eventsList.push({title:evtitle,start:evstart});
		 }
			 var jsonText = JSON.stringify(eventsList);
			 var eventSendString = {action:"fullCalendarInsert",empno:emp_no,setEventsInfo:jsonText};
			 console.log("AAA:"+eventsList);
			 $.ajax({
				 type: "POST",
				 url: "<%=request.getContextPath()%>/carschedul/carschedul.do",
				 data: eventSendString,
				 dataType: "json",
				 
				 success: function (data){
					
					 alert("班表更新成功!");
			     },
	            error: function(){alert("班表更新!!")}
	       })
		 
		});
		   

		 function creatQueryString(year_month, emp_no){
				console.log("year_month:"+year_month+"; emp_no:"+emp_no);
				var queryString= {"action":"fullCalendarSource", "year_month":year_month, "emp_no":emp_no};
				return queryString;
		
	 	};
	 function selectInfo(cartype_no,toDay){
	 	 var SendString = {"action":"getEmpNo","cartype_no":cartype_no,"year_month":toDay};
	 	 
		 console.log("送出資料檢查:"+SendString);
		 $.ajax({
			 type: "POST",
			 url: "<%=request.getContextPath()%>/carschedul/carschedul.do",
			 data: SendString,
			 dataType: "json",
			 
			 success: function (data){
				 
               
                 var info = data.empScList;
                 console.log("ajax接到的選單資料:"+info);
                 //emp_no = info2[0];
                 $('.form-control').empty();	
                 for (var i = 0; i < info.length; i++) {
                     var ev = info[i];
                     var emp_no = ev.emp_no;
                    	var work_hours = ev.work_hours;
                     var empName = ev.empName; 
                     console.log
                     if(i == 0){
                     $("#empSelect").append($("<option value='"+emp_no+"' work_hours='"+work_hours+"'>"+empName+"</option>"))
                     }else{
                     $("#empSelect").append($("<option value='"+emp_no+"' work_hours='"+work_hours+"'>"+empName+"</option>"))	
                     }
                     
                 }
                 
		     },
            error: function(){alert("撈選單資料失敗!!")}
       })
	 }; 
	 	
		
		/* $('#testbtn').click(function(){
			$('#calendar').fullCalendar('removeEvents')
			alert('HIHI'); 
		}); */
		
		
		
		/* $('.drop').droppable({
			over: function( event, ui ){
				$(ui.draggable).remove();
				 $('#calendar').fullCalendar('removeEvents',Event.id)
				 $(this).css('border-color', 'red'); 
			}
		}); */
		/* $('.fc-content').draggable(); */
		
		
	 	
		
	});
	
 	//推播 "src/com/carschedul/controller/SchedulEchoServer.java"
 	var MyPoint = "/SchedulEchoServer/peter/309";
    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
    
	var webSocket;
	
	function connect() {
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
			console.log("WebSocket 成功連線");
		
		};

		webSocket.onmessage = function(event) {
			var messagesArea = document.getElementById("messagesArea");
	        var jsonObj = JSON.parse(event.data);
	        swal({
				  position: 'center',
				  type: 'success',
				  title: jsonObj.message,
				  showConfirmButton: false,
				});
	        swal({
	        	  title: jsonObj.message,
	        	  text: "是否要更新班表頁面?",
	        	  type: 'warning',
	        	  showCancelButton: true,
	        	  confirmButtonColor: '#3085d6',
	        	  cancelButtonColor: '#d33',
	        	  confirmButtonText: '更新'
	        	}).then((result) => {
	        	  if (result.value) {
	        	    swal(
	        	      '更新!',
	        	      '你的班表已更新.',
	        	      'success'
	        	    )
	        	  }
	        	  window.location.reload();
	        	})
	       
		};

		webSocket.onclose = function(event) {
			console.log("WebSocket 已離線");
		}
	}
	
	
	function sendMessage() {
	 
	}

	
	function disconnect () {
		webSocket.close();
		
	}

	
</script>




<style>
body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}
		
	#wrap {
		width: 1100px;
		margin: 0 auto;
	}
		
	#external-events {
		float: left;
		width: 150px;
		padding: 10px 10px;
		border: 1px solid #ccc;
		background: #eee;
		text-align: left;
	}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
	}
		
	#external-events .fc-event {
		margin: 10px 0;
		cursor: pointer;
	}
		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
	}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
	}

	#calendar {
		float: right;
		width: 900px;
	}
	
	#deleter{
	width: 100px;
	height: 100px;
	opacity: 0.8;
	background : url("<%=request.getContextPath()%>/back/images/trashcan.png") no-repeat;
	-moz-background-size:contain;
    -webkit-background-size:contain;
    -o-background-size:contain;
    background-size:contain;
	}

	
	span.input-group-addon.custom__addon.blue_addon {
    color: #fff;
    border: none;
    font-size: 12px;
    border-radius: 2px;
    text-transform: uppercase;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	}
	span.input-group-addon.custom__addon.blue_addon {
    background-color: #428fdc;
	}
	
	select.form-control.custom__select {
    border: none;
    border-radius: 2px;
    bx-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
    }
    
	
	.fc-event, .fc-event-dot {
    background-color: #5bc0de;
    border: 1px solid #9ebece;
	}
	
	.fc-day-grid-event .fc-content {
    white-space: nowrap;
    overflow: hidden;
    box-shadow: 4px 4px 3px rgba(20%,20%,40%,0.5);
	}
	
	.event_icon {
    padding-left: 20px;
    background-image: url("<%=request.getContextPath()%>/back/images/sedan-512.png");
    background-size: 100%;
    background-repeat: no-repeat;
    background-position: 2px 50%;
    background-color: #3a87ad00;
    font-family: Microsoft JhengHei;
    font-weight: bold;
    text-align: left;
    position: relative;
    display: block;
    font-size: 30px;
    line-height: 1.3;
    border-radius: 3px;
    border: 1px solid #bdbdbd00;
    height: 50px;
    width: auto;
    color: #e8bb14;
    opacity: 0.8;
	}
	
	/* 車型按鈕 */
	.btn {
	  position: relative;
	  display: inline-block;
	  letter-spacing: 1.2px;
	  padding: 12px 32px;
	  text-align: center;
	  text-transform: uppercase;
	  overflow: hidden;
	  z-index: 1;
	  cursor: pointer;
	}
	.btn:focus {
	  outline: none;
	}
	.btn--primary {
	  color: lightslategray;
	}
	.btn--border {
	  border-width: 1px;
	  border-style: solid;
	  border-radius: 10px;
	  box-sizing: border-box;
	}
	.btn--animated {
	  transition-property: color;
	  transition-duration: 0.5s;
	}
	.btn--animated.btn--border.btn--primary {
	  border: 1px solid lightslategray;
	}
	.btn--animated:before {
	  content: "";
	  position: absolute;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background: lightslategray;
	  transform: scaleX(0);
	  transform-origin: 0 50%;
	  transition-property: transform;
	  transition-duration: 0.5s;
	  transition-timing-function: ease-out;
	  z-index: -1;
	}
	.btn--animated:hover {
	  color: white;
	}
	.btn--animated:hover:before {
	  transform: scaleX(1);
	  transition-timing-function: cubic-bezier(0.45, 1.64, 0.47, 0.66);
	}
	/* 3D按鈕 */
	.btn3d {
    position:relative;
    top: -6px;
    border:0;
     transition: all 40ms linear;
     margin-top:10px;
     margin-bottom:10px;
     margin-left:2px;
     margin-right:2px;
	}
	.btn3d:active:focus,
	.btn3d:focus:hover,
	.btn3d:focus {
	    -moz-outline-style:none;
	         outline:medium none;
	}
	.btn3d:active, .btn3d.active {
	    top:2px;
	}
	
	.btn3d.btn-success {
    box-shadow:0 0 0 1px #31c300 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #5eb924, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#78d739;
	}
	.btn3d.btn-success:active, .btn3d.btn-success.active {
    box-shadow:0 0 0 1px #30cd00 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #78d739;
	}
	
</style>
<title>有我罩你-派車人員排班表</title>
</head>
<body onload="connect();" onunload="disconnect();">

<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp" %> 

  <!-- page content -->
     <div class="right_col" role="main">
          <div class="">

            <div class="page-title">
              <div class="title_left">
                <h3>首頁</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>


            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Plain Page</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content"> 
         <!-- =================================排班表start================================= -->            
		
		
		<div id='wrap'>
		 <!-- =================================派車員工列表================================= -->  
		<div class="container">
	<div class="row">
        <div class="col-md-6">
          
            <hr />
            <jsp:useBean id="cartypeSvc" scope="page" class="com.cartype.model.CarTypeService" />
           
        </div>
         <div class="col-md-6">
        <div class="media">
            <a class="pull-left" href="#">
                <img class="media-object dp img-circle" src="<%=request.getContextPath()%>/back/images/d2361055.jpg" style="width: 100px;height:100px;">
            </a>
            <div class="media-body">
                <h4 class="media-heading">司機姓名 <small> India</small></h4>
                <h5 class="emptitle">專業司機 來自 <a href="http://gridle.in">桃園中心</a></h5>
                <hr style="margin:8px auto">

                <span class="label label-default">電話</span>
                <span class="label label-default">Email</span>
                <span class="label label-info">四人座</span>
                <span class="label label-default">工時:150</span>
            </div>
        </div>

    </div>
	</div>
</div>
		
		<!-- =================================派車員工列表================================= -->  
		
		<div id='calendar'></div>

		<div style='clear:both'></div>
		
	</div>

	<!-- =================================排班表end================================= -->	
               </div>
                </div>
              </div>
            </div>

          </div>
        </div> 
        <!-- /page content -->
	
	 <%-- <%@ include file="/back/production/BA104G1_footer.jsp" %> --%>
	
			<button type="button" class="btn btn-primary" id="testbtn">測試用按鈕</button>
			<button type="button" class="btn btn-primary" id="testbtn2">測試用按鈕2</button>
							
</body>
</html>