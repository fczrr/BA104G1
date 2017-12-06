<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hcworkshifts.model.*" %>
<%@ page import="com.hcorder.modal.*" %>
<%@ page import="java.util.*" %>


<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp" %>
<jsp:useBean id="hcOrderDetailSvc" scope="page" class="com.hcorder.modal.HcOrderDetailService"/>
<jsp:useBean id="employeeService" scope="page" class="com.employee.model.EmployeeService"/>


	
	<%! List convertNumberToDate(String monthOfYear,String workShiftsStatus){
		List<String> workShifts = new ArrayList<String>();
		List<String> restShiftslist = new ArrayList<String>();
		String year = String.valueOf(Integer.valueOf(monthOfYear.substring(0,3))+1911);
		for(int i =0;i<93;i++){
			String time = workShiftsStatus.substring(i, i+1);
			String DateTime = "";
			String iso8601 = "";
			
			if(time.equals("\u65e9")){
				iso8601="T08:00:01Z";
				DateTime = year+"-"+monthOfYear.substring(3, 5)+"-"+(((i+3)/3 <10) ? "0"+String.valueOf( (i+3)/3 ) : String.valueOf( (i+3)/3 ))+time+iso8601;
				workShifts.add(DateTime);
			}else if(time.equals("\u4e2d")){
				iso8601="T13:00:01Z";
				DateTime = year+"-"+monthOfYear.substring(3, 5)+"-"+(((i+2)/3 <10) ? "0"+String.valueOf( (i+2)/3 ) : String.valueOf( (i+2)/3 ))+time+iso8601;
				workShifts.add(DateTime);
			}else if(time.equals("\u665a")){
				iso8601="T18:00:01Z";
				DateTime = year+"-"+monthOfYear.substring(3, 5)+"-"+(((i+1)/3 <10) ? "0"+String.valueOf( (i+1)/3 ) : String.valueOf( (i+1)/3 ))+time+iso8601;
				workShifts.add(DateTime);
			}else if(time.equals("\u4f11")){
				int j=0;
				if(i%3==0){
					iso8601="T08:00:01Z";
					j=3;
				}else if(i%3==1){
					iso8601="T13:00:01Z";
					j=2;
				}else if(i%3==2){
					iso8601="T18:00:01Z";
					j=1;
				}
				DateTime = year.substring(0, 4)+"-"+monthOfYear.substring(3, 5)+"-"+(((i+j)/3 <10) ? "0"+String.valueOf( (i+j)/3 ) : String.valueOf( (i+j)/3 ))+time+iso8601;
				restShiftslist.add(DateTime);
			}else {
				continue;
			}

		}
			List anser = new ArrayList();
			anser.add(workShifts);
			anser.add(restShiftslist);
		return anser;
	}; %>
	


<%  HcWorkShiftsService hcWorkShiftsSrv =  new HcWorkShiftsService();
	HcWorkShiftsVO  hcWorkShiftsVO  = hcWorkShiftsSrv.getOne(request.getParameter("monthOfyear"),request.getParameter("empNo"));      //取值的地方
	pageContext.setAttribute("hcWorkShiftsVO", hcWorkShiftsVO);
	List mylist = convertNumberToDate(hcWorkShiftsVO.getMonthOfYear(),hcWorkShiftsVO.getWorkShiftStatus());
	List<String> WorkShiftslist = (ArrayList<String>)mylist.get(0);
	List<String> restShiftslist = (ArrayList<String>)mylist.get(1);
	pageContext.setAttribute("WorkShiftslist", WorkShiftslist);
	pageContext.setAttribute("restShiftslist", restShiftslist);	
	
	//決定班表的年月
	String year = request.getParameter("monthOfyear").substring(0, 3);
	String month = request.getParameter("monthOfyear").substring(3, 5);
	
	Integer myYear =  Integer.valueOf(year)+1911;
	Integer myMonth = Integer.valueOf(month);
	
	
	//印LOG
	for(String aaa :WorkShiftslist){
		System.out.println("wjsp++"+aaa);
	}
	for(String aaa :restShiftslist){
		System.out.println("wjsp--"+aaa);
	}

%>



	<head>
<!-- 		<meta charset="utf-8"> -->
<!-- 		<meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!-- 		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"> -->
<!-- 		<title>長照訂單</title> -->
<!-- 		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- 		<link href="css/takecare.css" rel="stylesheet"> -->
		
<!-- 			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<!-- 			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script> -->


<link
	href="<%=request.getContextPath()%>/back/fullcalendar-scheduler/css/fullcalendar.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/back/fullcalendar-scheduler/css/fullcalendar.print.min.css"
	rel="stylesheet" media='print'>
<link
	href="<%=request.getContextPath()%>/back/fullcalendar-scheduler/css/scheduler.min.css"
	rel="stylesheet" />


<style>


	.title_left{
		hiehgt:30px;
		backgroung: #aaa;
	}

	#wrap {
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}
		
	#wrap {
		width: 90%;
		margin: 0 auto;
	}
		
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		margin: 10px ;
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
		
	#external-events2 {
		float: left;
		width: 150px;
		padding: 0 10px;
		margin: 10px ;
		border: 1px solid #ccc;
		background: #eee;
		text-align: left;
	}
		
	#external-events2 h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
	}
		
	#external-events2 .fc-event {
		margin: 10px 0;
		cursor: pointer;
	}
		
	#external-events2 p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
	}
		
	#external-events2 p input {
		margin: 0;
		vertical-align: middle;
	}

	#calendar {
		float: left;
		width: 1100px;
	}
	
	
	#external-events-listing , #external-events-listing2 {
	 	min-height:200px;
	}


	
</style>
		
	</head>



       <!-- page content -->
        <div class="right_col" role="main">
          <div class="">

            <div class="page-title">
              <div class="title_left">
<!--                 <h3>長照班表查詢</h3> -->
              </div>

              <div class="title_right">
<!--                 <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search"> -->
<!--                   <div class="input-group"> -->
<!--                     <input type="text" class="form-control" placeholder="Search for..."> -->
<!--                     <span class="input-group-btn"> -->
<!--                       <button class="btn btn-default" type="button">Go!</button> -->
<!--                     </span> -->
<!--                   </div>  -->
<!--                 </div> -->
              </div>
            </div>


            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>檢視班表</h2>

                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">  
                      


                <table class="table table-hover" >
<!--                     <caption>長期照護 班表清單</caption> -->
                    <thead>
                        <tr>
                            <th>月份</th>
                            <th>員工編號</th>
                            <th>員工姓名</th>
                            <th>總工作時段</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${hcWorkShiftsVO.getMonthOfYear().substring(0,3)}年${hcWorkShiftsVO.getMonthOfYear().substring(3,5)}月</td>
                            <td>${hcWorkShiftsVO.empNo}</td>
                            <td>${employeeService.findByPrimaryKey(hcWorkShiftsVO.empNo).getEmpName()}</td>
                            <td>${hcWorkShiftsVO.totalWorkShifts}</td>
                            	
                            
                        </tr>
	
<%-- 					<c:forEach var="hcWorkShiftsVO11" items="${listHcWorks_ByCompositeQuery}">						 --%>
<!--                         <tr> -->
<%--                             <td>${hcWorkShiftsVO11.monthOfYear}</td> --%>
<%--                             <td>${hcWorkShiftsVO11.empNo}</td> --%>
<%--                             <td>${employeeService.findByPrimaryKey(hcWorkShiftsVO.empNo).getEmpName()}</td> --%>
<%--                             <td>${hcWorkShiftsVO11.totalWorkShifts}</td> --%>
<%--                             <td>${hcWorkShiftsVO11.workShiftStatus}</td>                                      --%>
<!--                         </tr> -->
<%--                      </c:forEach>						 --%>

                    </tbody>
                </table>
				<hr>




	<div id='wrap col-md-12 col-sm-12 col-xs-12'>
<!-- 		<div id='external-events2'> -->
<!-- 		<div id='external-events-listing2'> -->
<!-- 			<h4>員工排班</h4> -->

<%-- 			<c:forEach var="detail" items='${hcOrderDetailSvc.getAllOneMonthInPerson(12,"EMP0000")}'>     <!--       寫死的要改質         --> --%>
<%-- 			<div class='fc-event' >訂單:${detail.orderDetailNo}</div><p style='display:none'>${detail.serviceTime}</p> --%>
<%-- 			</c:forEach> --%>
<!-- 			<p> -->
<!-- 				<input type='checkbox' id='drop-remove2' /> -->
<!-- 				<label for='drop-remove2'>remove after drop</label> -->
<!-- 			</p> -->
<!-- 		</div> -->
<!-- 		</div> -->
<!-- 		<div id='external-events'> -->
<!-- 		<div id='external-events-listing'> -->
		
<!-- 			<h4>員工排假</h4> -->
<!-- 			<div class='fc-event'>休假(早)</div> -->
<!-- 			<div class='fc-event'>休假(中)</div> -->
<!-- 			<div class='fc-event'>休假(晚)</div> -->
<!-- 			<p> -->
<!-- 				<input type='checkbox' id='drop-remove'/> -->
<!-- 				<label for='drop-remove'>remove after drop</label> -->
<!-- 			</p> -->
<!-- 		</div > -->
<!-- 		<div><button class="btn mybtn">確認修改</button></div> -->
<!-- 		</div> -->

		
		<div id='calendar'></div>

		

		<div style='clear:both'></div>

	</div>


	
                      
                      
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
        <!-- /page content -->


<%@ include file="/back/production/BA104G1_footer.jsp" %>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script
	src="<%=request.getContextPath()%>/back/fullcalendar-scheduler/js/moment.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/fullcalendar-scheduler/js/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/fullcalendar-scheduler/js/jquery-ui.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/fullcalendar-scheduler/js/fullcalendar.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/fullcalendar-scheduler/js/scheduler.min.js"></script>
<script
	src="<%=request.getContextPath()%>/back/fullcalendar-scheduler/js/zh-tw.js"></script>
<script>
	var myDate= new Date();
	


	$(function() { // document ready
    
		/* initialize the external events
		-----------------------------------------------------------------*/
       console.log(myDate.getFullYear()+"-"+(myDate.getMonth() + 1)+"-"+ myDate.getDate()+"T"+(myDate.getHours()+1)+":"+myDate.getMinutes()+":"+myDate.getSeconds()+"Z");
		$('#external-events .fc-event').each(function() {

			// store data so the calendar knows to render an event upon drop
			$(this).data('event', {
				title : $.trim($(this).text()), // use the element's text as the event title
				start: ($.trim($(this).text()).substring(3,4) == "早") ? '08:00':($.trim($(this).text()).substring(3,4) == "中") ? '13:00':'18:00',
				stick : true, // maintain when user navigates (see docs on the renderEvent method)
				allDay:false,
				overlap:false,
				resourceId:myDate.getFullYear()+"-"+(myDate.getMonth() + 1)+"-"+ myDate.getDate()+"T"+(myDate.getHours()+1)+":"+myDate.getMinutes()+":"+myDate.getSeconds()+"Z"

			});

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex : 999,
				revert : true, // will cause the event to go back to its
				revertDuration : 0//  original position after the drag
			});

		});
		$('#external-events2 .fc-event').each(function() {
			console.log($(this).next().text());
			// store data so the calendar knows to render an event upon drop
			$(this).data('event', {
				title : $.trim($(this).text()), // use the element's text as the event title
				start : ($(this).next().text() == '早') ? '08:00': ($(this).next().text() == '中') ? '13:00' : '18:00',
				stick : true, // maintain when user navigates (see docs on the renderEvent method)
				allDay:false,
				editable:true,
				overlap:false,
				resourceId:myDate.getFullYear()+"-"+(myDate.getMonth() + 1)+"-"+ myDate.getDate()+"T"+(myDate.getHours()+1)+":"+myDate.getMinutes()+":"+myDate.getSeconds()+"Z"

			});

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex : 999,
				revert : true, // will cause the event to go back to its
				revertDuration : 0//  original position after the drag
			});

		});

		/* initialize the calendar
		-----------------------------------------------------------------*/

		$('#calendar') 
				.fullCalendar(
						{
							schedulerLicenseKey : 'CC-Attribution-NonCommercial-NoDerivatives',
// 							locale : 'zh-tw',
// 							themeSystem:'bootstrap3',
							defaultDate: '<%= myYear.toString()%>-<%= myMonth.toString()%>-01',
							editable : false,
							aspectRatio : 1.8,
							scrollTime: '00:00',
// 							droppable : true,
							dragRevertDuration:0,
// 							validRange:function(currentDate) { 
// 							    return { 
<%-- 							        start: <%= myYear.toString()%>+"-"+<%= myMonth.toString()%>+"-01", --%>
<%-- 							        end: (((<%= myMonth.toString()%>+ 1)>=13) ? <%= myYear.toString()%>+1:<%= myYear.toString()%>)+"-"+<%= myMonth.toString()%>+"-01" --%>
// 							    };
// 							 },
							slotEventOverlap : false,
// 							eventLimit : true,
							header: {
								left: '',
								center: 'title',
								right: ''
							},
							defaultView: 'month',
							defaultEventMinutes:'240',
							slotLabelFormat : [ 'HH:mm',
							//top level of text
							],
							eventClick: function(calEvent, jsEvent, view) {
								 
						        if(calEvent.title.substring(0,2)=="訂單"){
								      $.ajax({
											 type: "post",
											 
											 url: "<%=request.getContextPath()%>/HcOrder/HcOrderController.do?action=ajax_findPK",
											 data: {
												 orderDetailNo:	calEvent.title.substring(3,18)					 
											 }, 
											
											 
											 dataType: "json",
											 success: function (data){
												 console.log(data);
//												 alert("訂單編號"+data.orderDetailNo+"\n\r"+"服務日期"+data.serviceDate);
												 swal("訂單訊息","訂單編號 :"+data.orderDetailNo+"<br>"+"服務日期 :"+data.serviceDate+"<br>"+"服務時段 :"+data.serviceTime+"<br>"+"服務狀況 :"+data.orderDetailStataus);
										     },
								            error: function(e){alert(e+'訂單查尋失敗')}
								        });
						    },

							eventDurationEditable : false,
							resourceAreaWidth : 100,
							resourceLabelText : '班次',
							resources : [ {
								id : '早班',
								title : '早班'
							}, {
								id : '中班',
								title : '中班'
							}, {
								id : '晚班',
								title : '晚班'
							}, ],
							eventColor:'#428fdc',
							eventBackgroundColor:'#428fdc',
							events:[
								<% for(int i=0;i<WorkShiftslist.size();i++){ %>
							 	{<%String date= WorkShiftslist.get(i).substring(0, 10) ; %>
								<%System.out.print("++++"+date+WorkShiftslist.get(i).substring(10, 11)+hcWorkShiftsVO.getEmpNo());
								  HcOrderDetailVO hcOrderDetailVO =hcOrderDetailSvc.getAllBySreviceTimeInPerson(date,WorkShiftslist.get(i).substring(10, 11),hcWorkShiftsVO.getEmpNo());
								%>								
								id:'<%= i %>',
								resourceId:'<%= date %>',
								start:'<%=date+WorkShiftslist.get(i).substring(11, 21)%>',
								title:'<%= "訂單:"+hcOrderDetailVO.getOrderDetailNo() %>', 
							 	editable:false,
							 	color:'#428fdc',
							 	allDay:false,
							 	},
								<%	};%>
								
								<% for(int i=0;i<restShiftslist.size();i++){ %>
							 	{<%String date= restShiftslist.get(i).substring(0, 10) ; %>
								<%System.out.println(date+restShiftslist.get(i).substring(11, 21));%>
								id:'<%= i+100 %>',
								resourceId:'<%= date %>',
								start:'<%=date+restShiftslist.get(i).substring(11, 21)%>',
								title:'<%= (restShiftslist.get(i).substring(12, 14).equals("08")) ? "休假(早)":(restShiftslist.get(i).substring(12, 14).equals("13")) ? "休假(中)":"休假(晚)"%>', 
							 	editable:false,
							 	allDay:false
							 	},
								<%	};%>
							 	], 

						    	
							drop : function(date, jsEvent, ui, resourceId,resourceId) {
						
								console.log( $(this).closest("div").attr('class') );
								// is the "remove after drop" checkbox checked?
								if ($('#drop-remove').is(':checked')) {
									// if so, remove the element from the "Draggable Events" list
									$(this).remove();
								}
								if ($('#drop-remove2').is(':checked')) {
									// if so, remove the element from the "Draggable Events" list
									$(this).remove();
								}
							},
							eventDragStop : function(event, jsEvent, ui, view) {
								
								
								if(isEventOverDiv2(jsEvent.clientX, jsEvent.clientY)) {
				                    $('#calendar').fullCalendar('removeEvents', event._id);
				                    var el = $( "<div class='fc-event'>" ).appendTo( '#external-events-listing2' ).text( event.title );
				                    el.draggable({
				                      zIndex: 999,
				                      revert: true, 
				                      revertDuration: 0 
				                    });
				                    el.data('event', { title: event.title, id :event.id, stick: true ,});
				                    
				                    console.log(event.title);
				                    var title= event.title.split(':');
				                    var  detailObj={ orderDetailNo: title[1] };
				                    console.log(title[1]);
				      		      $.ajax({
				 					 type: "post",
				 					 
				 					 url: "<%=request.getContextPath()%>/HcWorkshifts/HcWorkshiftsServlet.do?action=chageDetail_ajax",
				 					 data: {
				 						   test:JSON.stringify(detailObj)						 
				 					 },
				 					
				 					 
				 					 dataType: "json",
				 					 success: function (data){
				 						 console.log(data.xxx);
				 						 alert(data.xxx);
				 						
				 				     },
				 		            error: function(e){alert(e.xxx+'!!'+e.exc)}
				 		        });
				                    
				                }
								

								if (isEventOverDiv(jsEvent.clientX,
										jsEvent.clientY)) {
									$('#calendar').fullCalendar('removeEvents',
											event._id);
// 									var el = $("<div class='fc-event'>")
// 											.appendTo(
// 													'#external-events-listing')
// 											.text(event.title);
// 									el.draggable({
// 										zIndex : 999,
// 										revert : true,
// 										revertDuration : 0
// 									});
// 									el.data('event', {
// 										title : event.title,
// 										id : event.id,
// 										stick : true,
// 									});
								}
							},

							eventReceive : function(event) { // called when a proper external event is dropped
							    console.log('eventReceive', event);
							    
							


							},
							eventDrop : function(event) { // called when an event (already on the calendar) is moved

								console.log('eventDrop', event);
// 								 console.log( event.resourceId);
// 									console.log( event.title);
// 									console.log( moment(event.start).format('YYYY-MM-DD'));
							}
						}); 

		var isEventOverDiv = function(x, y) {

			var external_events = $('#external-events');
			var offset = external_events.offset();
			offset.right = external_events.width() + offset.left;
			offset.bottom = external_events.height() + offset.top;

			// Compare
			if (x >= offset.left && y >= offset.top && x <= offset.right
					&& y <= offset.bottom) {
				return true;
			}
			return false;

		};
		var isEventOverDiv2 = function(x, y) {

			var external_events = $('#external-events2');
			var offset = external_events.offset();
			offset.right = external_events.width() + offset.left;
			offset.bottom = external_events.height() + offset.top;

			// Compare
			if (x >= offset.left && y >= offset.top && x <= offset.right
					&& y <= offset.bottom) {
				return true;
			}
			return false;

		};
		
		
		var objArray=[];
		
		
		$(".mybtn").click(function(){
			var myclick = '${hcWorkShiftsVO.workShiftStatus}';
			var events = $('#calendar').fullCalendar('clientEvents');
// 		console.log(events);
			$.each( events, function( key, value ) {
				console.log(moment(value.start).format('YYYY-MM-DD'));
				console.log(moment(value.start).format('HH'));
				console.log(value.title);
				var myObj = {
						date:moment(value.start).format('YYYY-MM-DD'),
						time:moment(value.start).format('HH'),
						order:value.title
					};

				objArray.push(myObj);



// 		console.log(myObj);
				});
			
// 		     console.log(JSON.stringify(objArray));
		      $.ajax({
					 type: "post",
					 
					 url: "<%=request.getContextPath()%>/HcWorkshifts/HcWorkshiftsServlet.do?action=update_ajax&monthOfYear=${hcWorkShiftsVO.monthOfYear}&empNo=${hcWorkShiftsVO.empNo}",
					 data: {
						   test:JSON.stringify(objArray)						 
					 },
					
					 
					 dataType: "json",
					 success: function (data){
						 console.log(data.xxx);
						 alert(data.xxx)
						
				     },
		            error: function(e){alert(e+'出現異常')}
		        });
		  
		      
		});
		
		
		
		
		
	});
	

	
</script>
