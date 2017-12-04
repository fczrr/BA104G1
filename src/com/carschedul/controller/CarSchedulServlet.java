package com.carschedul.controller;

import java.io.*;
import java.sql.*;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.carschedul.model.CarSchedulService;
import com.carschedul.model.CarSchedulVO;
import com.carschedul.model.CarShiftVO;
import com.cartype.model.CarTypeService;
import com.cartype.model.CarTypeVO;
import com.employee.model.EmployeeService;
import com.employee.model.EmployeeVO;
import com.google.gson.Gson;
import com.vehicle.model.VehicleService;
import com.vehicle.model.VehicleVO;
import com.cardetail.model.*;

public class CarSchedulServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String str = req.getParameter("detail_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入員工編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String detail_no = null;
				try {
					detail_no = str;
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				CarDetailService cardetailSvc = new CarDetailService();
				CarDetailVO cardetailVO = cardetailSvc.getOneCarDetail(detail_no);
				if (cardetailVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/
				req.setAttribute("cardetailVO", cardetailVO); // 資料庫取出的empVO物件,存入req
				String url = "/emp/listOneEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp 或
													// /dept/listEmps_ByDeptno.jsp
													// 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑:
																// 可能為【/emp/listAllEmp.jsp】
																// 或
																// 【/dept/listEmps_ByDeptno.jsp】
																// 或 【
																// /dept/listAllDept.jsp】

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String detail_no = new String(req.getParameter("detail_no"));

				/*************************** 2.開始查詢資料 ****************************************/
				CarDetailService cardetailSvc = new CarDetailService();
				CarDetailVO cardetailVO = cardetailSvc.getOneCarDetail(detail_no);

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 ************/
				req.setAttribute("cardetailVO", cardetailVO); // 資料庫取出的empVO物件,存入req
				String url = "/emp/update_emp_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑:
																// 可能為【/emp/listAllEmp.jsp】
																// 或
																// 【/dept/listEmps_ByDeptno.jsp】
																// 或 【
																// /dept/listAllDept.jsp】
																// 或 【
																// /emp/listEmps_ByCompositeQuery.jsp】

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String detail_no = req.getParameter("detail_no").trim();
				String order_no = req.getParameter("order_no").trim();
				Integer vehicle_no = new Integer(req.getParameter("vehicle_no").trim());

				java.sql.Date detail_date = null;
				try {
					detail_date = java.sql.Date.valueOf(req.getParameter("detail_date").trim());
				} catch (IllegalArgumentException e) {
					detail_date = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				String detail_time = req.getParameter("detail_time").trim();
				String passenger_name = req.getParameter("passenger_name").trim();
				String passenger_phone = new String(req.getParameter("passenger_phone").trim());
				String getinto_address = req.getParameter("getinto_address").trim();
				String arrival_address = req.getParameter("arrival_address").trim();
				String sendcar_status = req.getParameter("sendcar_status").trim();

				CarDetailVO cardetailVO = new CarDetailVO();
				cardetailVO.setDetail_no(detail_no);
				cardetailVO.setOrder_no(order_no);
				cardetailVO.setVehicle_no(vehicle_no);
				cardetailVO.setDetail_date(detail_date);
				cardetailVO.setDetail_time(detail_time);
				cardetailVO.setPassenger_name(passenger_name);
				cardetailVO.setPassenger_phone(passenger_phone);
				cardetailVO.setGetinto_address(getinto_address);
				cardetailVO.setArrival_address(arrival_address);
				cardetailVO.setSendcar_status(sendcar_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("cardetailVO", cardetailVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/emp/update_emp_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				/*************************** 2.開始修改資料 *****************************************/
				CarDetailService cardetailSvc = new CarDetailService();
				cardetailVO = cardetailSvc.updateCarDetail(detail_no, order_no, vehicle_no, detail_date, detail_time,
						passenger_name, passenger_phone, getinto_address, arrival_address, sendcar_status);
				/***************************
				 * 3.修改完成,準備轉交(Send the Success view)
				 *************/
				req.setAttribute("cardetailVO", cardetailVO);
				String url = "/cardetail/listOneCarDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/cardetail/update_cardetail_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		/*************************** 偷渡員工編號*************************************/
		if ("getEmpNo".equals(action)) {
			Date year_month = java.sql.Date.valueOf(req.getParameter("year_month").trim());
			List empScList = new LinkedList();
			CarTypeService carTypeSvc = new CarTypeService();
			VehicleService vehicleSvc = new VehicleService();
			CarSchedulService carSchedulSvc = new CarSchedulService();
			EmployeeService empSvc = new EmployeeService();
				Integer cartype_no = new Integer(req.getParameter("cartype_no").trim());
				System.out.println("車型編號請求參數:"+cartype_no);
				for(CarSchedulVO carSchedulVO2 : carSchedulSvc.getMonthInfo(cartype_no , year_month)){
					String emp_no2 = carSchedulVO2.getEmp_no();
					String carTypeName = carTypeSvc.getOneCarType(cartype_no).getCartypename();
					Integer work_hours2 = carSchedulVO2.getWork_hours();
					String empName2 = empSvc.findByPrimaryKey(emp_no2).getEmpName();
					String phone = empSvc.findByPrimaryKey(emp_no2).getEmpPhone();
					String empCarLoc = vehicleSvc.getOneByEmpNo(emp_no2).getEmp_branches();
					if(empCarLoc.equals("10")){
						empCarLoc = "台北中心";
					}
					if(empCarLoc.equals("20")){
						empCarLoc = "桃園中心";
					}
					if(empCarLoc.equals("30")){
						empCarLoc = "台中中心";
					}
					if(empCarLoc.equals("40")){
						empCarLoc = "台南中心";
					}
					if(empCarLoc.equals("50")){
						empCarLoc = "高雄中心";
					}
					String empSc = "{emp_no:"+emp_no2+",work_hours:"+work_hours2+",empName:"+empName2+",carTypeName:"+carTypeName+",empCarLoc:"+empCarLoc+",phone:"+phone+"}";
					empScList.add(empSc);
				}
				    String fcSource = "{empScList:"+empScList+"}";
				System.out.println("偷渡的資料回傳:"+fcSource);
				
				try {
					JSONObject myObj = new JSONObject(fcSource);
					res.setCharacterEncoding("UTF-8");
					PrintWriter out = res.getWriter();
					out.write(myObj.toString());
					System.out.println("回傳的JSON:"+myObj.toString());
					out.flush();
					out.close();
				
				} catch (JSONException e) {
	
					e.printStackTrace();
				}
	
				
				
				
		}
		
		
		
		
		
		/*************************** FullCalendar排班表來源處理 *************************************/
		if ("fullCalendarSource".equals(action)) {
			
			Date year_month = java.sql.Date.valueOf(req.getParameter("year_month").trim());
			String year_monthString =  req.getParameter("year_month").trim();
			System.out.println("查詢月份(Date):" + year_month);
			System.out.println("查詢月份:" + year_monthString);
			
			
			String[] year_monthArr = year_monthString.split("-");
	            String yearAndMonth = year_monthArr[0]+"-"+year_monthArr[1];
				System.out.println("年+月:"+yearAndMonth);
	        

			CarSchedulService carSchedulSvc = new CarSchedulService();
			String emp_no = req.getParameter("emp_no").trim();
			System.out.println("員工編號:"+emp_no);
			EmployeeService empSv = new EmployeeService();
			EmployeeVO empVO= empSv.findByPrimaryKey(emp_no);
			String empName = empVO.getEmpName();
			System.out.println("員工姓名:"+ empName);
			
			CarSchedulVO carSchedulVO = carSchedulSvc.findByEmpNo(emp_no, year_month);
			

			
		     int i;  
		     int startIndex = 0;
			 int endIndex = 3;

			 List jsonStringList = new ArrayList();
			for (i = 1; i < 32; i++) {
				System.out.println("==================================");
					String schedul = carSchedulVO.getAttendance();
					System.out.println("總班表:" + schedul);
					
					
					System.out.println("本月" + i + "號");
					String dayStatus = schedul.substring(startIndex, endIndex);
					System.out.println("當日班表狀態:"+dayStatus);
					
					startIndex = startIndex + 3;
					endIndex = endIndex + 3;
					
					if(dayStatus.indexOf("早")!= -1){
						String title = empName;
						String start = "'"+yearAndMonth+"-"+ String.format("%02d", i) +"T08:00:00'";
//						String end = yearAndMonth+"-"+ i;
						System.out.println("員工:"+title+"這天要上早班");
						System.out.println("班表時間:"+start);
//						String fcDay = "{title:"+title+",start:"+start+",end:"+end+"}";
						String fcDay = "{title:"+title+",start:"+start+"}";
						jsonStringList.add(fcDay);
					}
					if(dayStatus.indexOf("中")!= -1){
						String title = empName;
						String start = "'"+yearAndMonth+"-"+  String.format("%02d", i) +"T13:00:00'";
						System.out.println("員工:"+title+"這天要上午班");
						System.out.println("班表時間:"+start);
						String fcDay = "{title:"+title+",start:"+start+"}";
						jsonStringList.add(fcDay);
					}
					if(dayStatus.indexOf("晚")!= -1){
						String title = empName;
						String start = "'"+yearAndMonth+"-"+ String.format("%02d", i) +"T18:00:00'";	
						System.out.println("員工:"+title+"這天要上晚班");
						System.out.println("班表時間:"+start);
						String fcDay = "{title:"+title+",start:"+start+"}";
						jsonStringList.add(fcDay);
					}
				

					System.out.println("==================================");
					
			}
//				List empScList = new LinkedList();
//				EmployeeService empSvc = new EmployeeService();
//					Integer cartype_no = new Integer(req.getParameter("cartype_no").trim());
//					System.out.println("車型編號請求參數:"+cartype_no);
//					for(CarSchedulVO carSchedulVO2 : carSchedulSvc.getMonthInfo(cartype_no , year_month)){
//						String emp_no2 = carSchedulVO2.getEmp_no();
//						Integer work_hours2 = carSchedulVO2.getWork_hours();
//						String empName2 = empSvc.findByPrimaryKey(emp_no2).getEmpName();
//						String empSc = "{emp_no:"+emp_no2+",work_hours:"+work_hours2+",empName:"+empName2+"}";
//						empScList.add(empSc);
//					}
//  				    String fcSource = "{eventinfo:"+jsonStringList+",empScList:"+empScList+"}";
			
			
				VehicleService vSv = new VehicleService();
				Integer vehicle_No = vSv.getOneByEmpNo(emp_no).getVehicle_no();
				
				
  				  String fcSource = "{eventinfo:"+jsonStringList+",vehicle_No:"+vehicle_No+"}";
					System.out.println(fcSource);
					
			
					try {
						JSONObject myObj = new JSONObject(fcSource);
						res.setCharacterEncoding("UTF-8");
						PrintWriter out = res.getWriter();
						out.write(myObj.toString());
						System.out.println("回傳的JSON:"+myObj.toString());
						out.flush();
						out.close();
					
					} catch (JSONException e) {
		
						e.printStackTrace();
					}
		
					
			
				}
		
			//更新班表進入區塊	
	    if ("fullCalendarInsert".equals(action)) {
	 
	    	String eventsInfo = req.getParameter("setEventsInfo").trim();
	    	System.out.println("後端接收排班表字串:"+eventsInfo);
	    	String emp_no = "";
	    	String year_month = "";
	    	Date year_monthDate =null;
	    	String schedul = null;
	    	StringBuffer schedul2 = null;
	    	int startIndex = 0;
			int endIndex = 3;
			String day = "01";
			int predayConvertInt = 0;
			Integer work_hours = 0;
			String attendance = null;
			
	    	
				try {
					JSONArray jsonArray = new JSONArray(eventsInfo);
					System.out.println("後端接收排班表資料:"+jsonArray);
					CarSchedulService carSchedulSvc = new CarSchedulService();
					System.out.println("此次需更新筆數:"+jsonArray.length());
					
					//取出emp_no與year_month
					for(int a = 0 ;a<1;a++){
						Object obj = jsonArray.get(a);
						String objString = String.valueOf(obj);
					
						//for emp_no
						emp_no = req.getParameter("empno").trim();
						System.out.println("emp_no:"+ emp_no);
						
						//for year_month
						year_month  = objString.substring(10,17) + "-01";
						System.out.println("year_month:"+ year_month);
						
						if(year_monthDate == null){
						year_monthDate  = java.sql.Date.valueOf(year_month);
						}
						
					}
					
					//取出該員工當月班表
					if(schedul == null){
						CarSchedulVO carSchedulVO = carSchedulSvc.findByEmpNo(emp_no, year_monthDate);
						schedul = carSchedulVO.getAttendance();
						schedul2 =  new StringBuffer(schedul);
						System.out.println("拿到這個月的班表:"+schedul2);
						}
					
					//將新班表設定成預設空班表
					for(int k = 0;k<93;k++){
						
						schedul2.setCharAt(k, '空');
					}	
					
					List dayList  = new ArrayList();
					int a = 0;
					//設定比對日期陣列
					for(int k = 0;k<32;k++){
						
						dayList.add(a+1);
						a = a+3;
					}
					
					
					System.out.println("月陣:"+ dayList);
					
					//for attendance
					//將前端送進來的events字串放進迴圈解析，取得更新的資料並重設新班表
					for(int i = 0 ;i<jsonArray.length();i++){
						
						//從JSONArray取出解析字串
						Object obj = jsonArray.get(i);
						String objString = String.valueOf(obj);
					
						//找出最後一天
						int ldEndIndex = eventsInfo.length()-12;
						int ldStartIndex =  eventsInfo.length()-14;
						int lastDay = Integer.parseInt(eventsInfo.substring(ldStartIndex, ldEndIndex));
						//System.out.println("lastDay:"+ lastDay);
						System.out.println("======得到第"+(i+1)+"筆資料開始分析======");
							
							
							//判斷是否換天
//							if(objString.substring(18,20).equals(day)==false){
//								int dayConvertInt = Integer.parseInt(objString.substring(18,20));
//								predayConvertInt = Integer.parseInt(day);
//								System.out.println("天數字串轉數字:"+dayConvertInt);
//								
//								for(int j = 0;j<(dayConvertInt-predayConvertInt);j++){
//									System.out.println("與上一筆資料天數差距:"+(dayConvertInt-predayConvertInt));
//									startIndex = startIndex + 3;
//									endIndex = endIndex + 3;
//								}
//								System.out.println("目前的Index:"+startIndex);	
//							}
						
						//將當下天數更新為解析天數
						//　day  = objString.substring(18,20);
						int c = 0;
						int date = 1;
						Boolean judgDateIndex = true;
							while( judgDateIndex == true){
								
								int dayConvertInt = Integer.parseInt(objString.substring(18,20));
								int dayInt = (int) dayList.get(c);
								if(dayConvertInt == date){
									startIndex = dayInt;
									judgDateIndex = false;
									System.out.println("此筆資料為"+date+"號，將目前的Index指向:"+ startIndex);
								}
								date++;
								c++;
							}
							
					 
							//判斷解析字串為早、中、晚班，並寫入新班表，同時增加工時
							if(objString.indexOf("T08")!= -1){
								System.out.println(objString.substring(18,20)+"號早上有班");
								int index = startIndex-1;
								schedul2.setCharAt(index, '早');
								System.out.println("把"+index+"位置的字元替換成'早'");
								work_hours++;
							}
							
							if(objString.indexOf("T13")!= -1){
								System.out.println(objString.substring(18,20)+"號中午有班");
								int index = startIndex; 
								schedul2.setCharAt(index, '中');
								System.out.println("把"+index+"位置的字元替換成'中'");
								work_hours++;
							}
							
							if(objString.indexOf("T18")!= -1){
								System.out.println(objString.substring(18,20)+"號晚上有班");
								int index = startIndex+1;
								schedul2.setCharAt(index, '晚');
								System.out.println("把"+index+"位置的字元替換成'晚'");
								work_hours++;
							}
	
						
						System.out.println("======第"+(i+1)+"筆資料分析完成======");	
					}
					work_hours = work_hours*4;
					attendance = schedul2.toString();
					System.out.println("原本的班表:" + schedul);
					System.out.println("修改的班表:" + schedul2 );
					System.out.println("本月工作時數:" + work_hours );
					/*************************** 2.開始新增資料 ***************************************/
					CarSchedulService carSchedulService = new CarSchedulService();
					carSchedulService.updateCarSchedul(emp_no, year_monthDate, attendance, work_hours);
					System.out.println("更新班表成功!!");
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
					JSONObject myObj = new JSONObject("OK");
					res.setCharacterEncoding("UTF-8");
					PrintWriter out = res.getWriter();
					out.write(myObj.toString());
					System.out.println("回傳的JSON:"+myObj.toString());
					out.flush();
					out.close();
				
				} catch (JSONException e) {
	
					e.printStackTrace();
				}
				
				
		
	    }
	    
	    
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/* try { */
			/***********************
			 * 1.接收請求參數 - 輸入格式的錯誤處理
			 *************************/

			String order_no = "20171115-000003";
			System.out.println("訂單編號order_no:"+ order_no);
			Integer cartypeno = null;
			String inputCarTypeName = req.getParameter("cartypename").trim();
			CarTypeService cartypeSv = new CarTypeService();
			List<CarTypeVO> cartypeVO = cartypeSv.getAll();

			for (CarTypeVO cartypeAll : cartypeVO) {

				if (cartypeAll.getCartypename().equals(inputCarTypeName)) {
					cartypeno = cartypeAll.getCartypeno();

				};
			};
			System.out.println("車型編號cartypeno:" + cartypeno);

			java.sql.Date sysdate = new java.sql.Date(System.currentTimeMillis());
			sysdate.setDate(1);
			
			
			String detailDateString = req.getParameter("detail_date").trim();
			System.out.println("訂單日期(多天)字串:"+ detailDateString);
			
			int howManyDays=0; 
			String[] days = detailDateString.split(",");
			 for (String orderDay:days) {
			   System.out.println(orderDay);
			   howManyDays++;
			 }

			CarSchedulService carSchedulSv = new CarSchedulService();
			List<VehicleVO> vehicleVO = carSchedulSv.getVehicleInfo(cartypeno, sysdate);
			List<CarSchedulVO> carSchedulVO = carSchedulSv.getMonthInfo(cartypeno, sysdate);
			List<Integer> vehicleList = new ArrayList<Integer>();
		    
			for(int i = 0;i < howManyDays; i++){
			Integer vehicleNO = vehicleVO.get(i).getVehicle_no();
			vehicleList.add(vehicleNO);
			System.out.println("車輛編號vehicle_no:" + vehicleNO);
		    }
			
			
//			Integer vehicle_no = new Integer(req.getParameter("vehicle_no").trim());

			Integer vehicle_no = 1001;
			

			java.sql.Date detail_date = null;
			try {
			
				detail_date = java.sql.Date.valueOf("2017-11-15");

			} catch (IllegalArgumentException e) {
				detail_date = new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("請輸入日期!");
				System.out.println("請輸入日期!");
			}
			
			System.out.println("明細日期detail_date:" + detail_date);

			String detail_time = req.getParameter("detail_time").trim();
			String passenger_name = req.getParameter("passenger_name").trim();
			String passenger_phone = req.getParameter("passenger_phone").trim();

			String county = req.getParameter("county").trim();
			String district = req.getParameter("district").trim();
			String address = req.getParameter("address").trim();

			String getinto_address = county + district + address;
			System.out.println("接送地點getinto_address:"+ getinto_address);
			String arrival_address = req.getParameter("arrival_address").trim();
			System.out.println("目的地點arrival_address:"+ arrival_address);
			String sendcar_status = req.getParameter("sendcar_status").trim();
			System.out.println("派車狀態sendcar_status:"+ sendcar_status);
			
			List<CarDetailVO> carDetailList = new ArrayList<CarDetailVO>();
			
			
			CarDetailVO cardetailVO = new CarDetailVO();
			cardetailVO.setOrder_no(order_no);
			cardetailVO.setVehicle_no(vehicle_no);
			cardetailVO.setDetail_date(detail_date);
			cardetailVO.setDetail_time(detail_time);
			cardetailVO.setPassenger_name(passenger_name);
			cardetailVO.setPassenger_phone(passenger_phone);
			cardetailVO.setGetinto_address(getinto_address);
			cardetailVO.setArrival_address(arrival_address);
			cardetailVO.setSendcar_status(sendcar_status);
			
			carDetailList.add(cardetailVO);
			
			
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("cardetailVO", cardetailVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/front/carorder/CarOrder.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始新增資料 ***************************************/
			CarDetailService cardetailSvc = new CarDetailService();
			cardetailVO = cardetailSvc.addCarDetail(order_no, vehicle_no, detail_date, detail_time, passenger_name,
					passenger_phone, getinto_address, arrival_address, sendcar_status);
			System.out.println("新增成功!!");

			/***************************
			 * 3.新增完成,準備轉交(Send the Success view)
			 ***********/
			String url = "/front/carorder/CarOrder.jsp";
			String formCheck = "ok";
			req.setAttribute("formCheck", formCheck);
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 **********************************/
			/*
			 * } catch (Exception e) { errorMsgs.add(e.getMessage());
			 * RequestDispatcher failureView = req
			 * .getRequestDispatcher("/front/carorder/CarOrder.jsp");
			 * failureView.forward(req, res); }
			 */
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp 或
										// /dept/listEmps_ByDeptno.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); // 送出刪除的來源網頁路徑:
																// 可能為【/emp/listAllEmp.jsp】
																// 或
																// 【/dept/listEmps_ByDeptno.jsp】
																// 或 【
																// /dept/listAllDept.jsp】
																// 或 【
																// /emp/listEmps_ByCompositeQuery.jsp】

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String detail_no = req.getParameter("detail_no");

				/*************************** 2.開始刪除資料 ***************************************/
				CarDetailService cardetailSvc = new CarDetailService();
				CarDetailVO cardetailVO = cardetailSvc.getOneCarDetail(detail_no);
				cardetailSvc.deleteCarDetail(detail_no);

				/***************************
				 * 3.刪除完成,準備轉交(Send the Success view)
				 ***********/

				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

	}
}
