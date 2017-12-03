package com.cardetail.controller;

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
import com.cartype.model.CarTypeService;
import com.cartype.model.CarTypeVO;
import com.google.gson.Gson;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.vehicle.model.VehicleService;
import com.vehicle.model.VehicleVO;
import com.cardetail.model.*;
import com.carorder.model.CarOrderService;
import com.carorder.model.CarOrderVO;

public class CarDetailServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
			System.out.println("我來拿資料了!");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String order_no = req.getParameter("order_no");
				/*************************** 2.開始查詢資料 *****************************************/
				CarDetailService cardetailSvc = new CarDetailService();
				List<CarDetailVO> cardetailVOList = cardetailSvc.findByOrderNo(order_no);
				if (cardetailVOList == null) {
					errorMsgs.add("查無資料");
				}
				

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/
				
				List cardetailList = new ArrayList();
				for(CarDetailVO cardetailVO:cardetailVOList){
					String detail_no =cardetailVO.getDetail_no();
					String detail_date = cardetailVO.getDetail_date().toString();
					String detail_time = cardetailVO.getDetail_time();
					String passenger_name =cardetailVO.getPassenger_name();
					String passenger_phone =cardetailVO.getPassenger_phone();
					String getinto_address =cardetailVO.getGetinto_address();
					String arrival_address =cardetailVO.getArrival_address();
					Integer vehicle_no = cardetailVO.getVehicle_no();
					String sendcar_status =cardetailVO.getSendcar_status();
					String one_detail = "{detail_no:"+detail_no+",detail_date:"+detail_date+",detail_time:"+detail_time+",passenger_name:"+passenger_name+",passenger_phone:"
					+passenger_phone+",getinto_address:"+getinto_address+",arrival_address:"+arrival_address+",vehicle_no:"+vehicle_no+",sendcar_status:"+sendcar_status+"}";
					cardetailList.add(one_detail);
				}
				
					String cdSource = "{cardetailList:"+cardetailList+"}";
				try {
					JSONObject myObj = new JSONObject(cdSource);
					res.setCharacterEncoding("UTF-8");
					PrintWriter out = res.getWriter();
					out.write(myObj.toString());
					System.out.println(myObj.toString());
					System.out.println("送資料回去囉");
					out.flush();
					out.close();
				} catch (JSONException e) {

					e.printStackTrace();
				}

				
				


				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("get_BY_CAR_For_Display".equals(action)) { // 來自select_page.jsp的請求
			System.out.println("我來拿資料了!");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				Integer vehicle_no = new Integer(req.getParameter("vehicle_no").trim());
				
				java.sql.Date detail_date = null;
				try {
					detail_date = java.sql.Date.valueOf(req.getParameter("detail_date").trim());
				} catch (IllegalArgumentException e) {
					detail_date = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				/*************************** 2.開始查詢資料 *****************************************/
				CarDetailService cardetailSvc = new CarDetailService();
				List<CarDetailVO> cardetailVOList = cardetailSvc.findByCar(vehicle_no,detail_date);
				if (cardetailVOList == null) {
					errorMsgs.add("查無資料");
				}
				

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/
				
				List cardetailList = new ArrayList();
				for(CarDetailVO cardetailVO:cardetailVOList){
					String detail_no =cardetailVO.getDetail_no();
					//String detail_date = cardetailVO.getDetail_date().toString();
					String detail_time = cardetailVO.getDetail_time();
					String passenger_name =cardetailVO.getPassenger_name();
					String passenger_phone =cardetailVO.getPassenger_phone();
					String getinto_address =cardetailVO.getGetinto_address();
					String arrival_address =cardetailVO.getArrival_address();
					//Integer vehicle_no = cardetailVO.getVehicle_no();
					String sendcar_status =cardetailVO.getSendcar_status();
					String one_detail = "{detail_no:"+detail_no+",detail_date:"+detail_date+",detail_time:"+detail_time+",passenger_name:"+passenger_name+",passenger_phone:"
					+passenger_phone+",getinto_address:"+getinto_address+",arrival_address:"+arrival_address+",vehicle_no:"+vehicle_no+",sendcar_status:"+sendcar_status+"}";
					cardetailList.add(one_detail);
				}
				
					String cdSource = "{cardetailList:"+cardetailList+"}";
				try {
					JSONObject myObj = new JSONObject(cdSource);
					res.setCharacterEncoding("UTF-8");
					PrintWriter out = res.getWriter();
					out.write(myObj.toString());
					System.out.println(myObj.toString());
					System.out.println("送資料回去囉");
					out.flush();
					out.close();
				} catch (JSONException e) {

					e.printStackTrace();
				}

				
				


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

		if ("getDisableDates".equals(action)) {

			Integer cartypeno = null;
			String inputCarTypeName = req.getParameter("cartypename").trim();
			CarTypeService cartypeSv = new CarTypeService();
			List<CarTypeVO> cartypeVO = cartypeSv.getAll();

			for (CarTypeVO cartypeAll : cartypeVO) {

				if (cartypeAll.getCartypename().equals(inputCarTypeName)) {
					cartypeno = cartypeAll.getCartypeno();
				};
			};
			System.out.println("車型編號:" + cartypeno);

			java.sql.Date sysdate = new java.sql.Date(System.currentTimeMillis());
			sysdate.setDate(1);
			System.out.println("系統日期:" + sysdate);

			CarSchedulService carSchedulSv = new CarSchedulService();
			List<CarSchedulVO> carSchedulVO = carSchedulSv.getMonthInfo(cartypeno, sysdate);
			int detail_time_no = new Integer(req.getParameter("detail_time_no").trim());
			System.out.println("預約時段數字:" + detail_time_no);

			Set<String> dayStatusSet = new TreeSet<String>();
			Set<String> dayEmpty = new TreeSet<String>();
			int i;
			
			
			for (i = 1; i < 32; i++) {
				System.out.println("本月" + i + "號");
				System.out.println("符合條件(車型)(當前月份)的司機有幾位?:"+carSchedulVO.size());
				int endIndex = 1;
				int driver = 1;
				for (CarSchedulVO schedulList : carSchedulVO) {
					String schedul = schedulList.getAttendance();
					System.out.println("取出第"+driver+"位司機班表:" + schedul);
					
					
						System.out.println("開始檢查第"+driver+"位司機的班表");
						String dayStatus = schedul.substring((detail_time_no), (detail_time_no + endIndex));
						System.out.println("起始index:" + (detail_time_no) + "," + "結束index:" + (detail_time_no + endIndex));
	
						String emptyIndex = String.valueOf(i);
						System.out.println("當日該時段狀態:" + dayStatus);
						//判定為空的日期就放進空日期專用Set
						if(dayStatus.equals("空")){
							dayStatusSet.remove(emptyIndex);	
							break;
						}
						//判定不為空的日期就放進封鎖日期專用Set
						if (!dayStatus.equals("空")) {
							dayStatusSet.add(emptyIndex);
							System.out.println("將" + emptyIndex + "號放進Set.");
						}
						 driver++;
				};
				detail_time_no = detail_time_no + 3;
				endIndex = detail_time_no + 3;
			};
			/*System.out.println("有空的日期:"+dayEmpty);
			System.out.println("沒空的日期:"+dayStatusSet);
			//將dayStatusSet內有空的日期，從封鎖日期用陣列內移除.
			List<String> list = new LinkedList<String>();
			//將為空的日期取出放進list內
		        for (String str : dayEmpty) {                
		            if (!list.contains(str)) {
		                list.add(str);
		            }
		        }
		        System.out.println("加入有空的日期:"+list);
		      //比對list內加入的有空日期，如有相同就去除
		        for (String str : dayStatusSet) {      
		            if(list.contains(str)){
		                list.remove(str);
		            }
		        }
		        System.out.println("去除有空的日期:"+list);*/
		         
		         
			
			JSONObject myObj = new JSONObject();
			try {
				myObj.put("dayStatusList", dayStatusSet);
			} catch (JSONException e) {
				
				e.printStackTrace();
			}

			PrintWriter out = res.getWriter();

			out.write(myObj.toString());
			System.out.println(myObj.toString());
			out.flush();
			out.close();
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
			System.out.println("------------接收訂單開始!!-------------");
			String mem_no = req.getParameter("memNO").trim();
			String order_status = "未確認";
			Integer vehicle_no;
			
			
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
			
			//接收前端送進來所有申請服務的日期
			String detailDateString = req.getParameter("detail_date").trim();
			System.out.println("訂單日期(多天)字串:"+ detailDateString);
			detailDateString.replaceAll(" ", "");
			//切割日期字串，放入日期List內,並得到需要新增的明細筆數
			List<Date> dateList = new ArrayList<Date>();
			List<String> dateStringList = new ArrayList<String>();
			int howManyDays=0; 
			String[] days = detailDateString.split(",");
			 for (String orderDay:days) {
			   System.out.println(orderDay);
			   
			   //2017-02-01
			   
			   String addZeroString =orderDay.split("-")[0]+"-"+String.format("%02d", Integer.parseInt(orderDay.split("-")[1]))+"-"+String.format("%02d", Integer.parseInt(orderDay.split("-")[2]));
			   System.out.println(addZeroString);
			   dateStringList.add(addZeroString.substring(8,10));
			   System.out.println(addZeroString.substring(8,10));
			   dateList.add(java.sql.Date.valueOf(orderDay));
			   howManyDays++;
			 }
			 System.out.println("切出日期:"+dateStringList);
			 System.out.println("這次交易申請服務天數:"+howManyDays+"天、產生"+howManyDays+"筆訂單明細");
			
			//找出符合條件(車型、月份)的車輛，優先將工時低的車輛(司機)找出來
			CarSchedulService carSchedulSv = new CarSchedulService();
			VehicleService vSv = new VehicleService();
			List<VehicleVO> vehicleVO = carSchedulSv.getVehicleInfo(cartypeno, sysdate);
			List<CarSchedulVO> carSchedulVO = carSchedulSv.getMonthInfo(cartypeno, sysdate);
			List<Integer> vehicleList = new ArrayList<Integer>();
			//List<String> schedulList = new ArrayList<String>();
			//List<Integer> SerialNoList = new ArrayList<Integer>();
			
			
		
			//包裝班表List用於新增
			int startIndex = 0;
			List dayList  = new ArrayList();
			int a = 0;
			
			//設定比對日期陣列
			for(int k = 0;k<32;k++){
				
				dayList.add(a+1);
				a = a+3;
			}
			System.out.println("比對班表用List:"+dayList);
			
			String detail_time = null;
			StringBuffer schedul2 = null;
			String attendance = null;
			List<CarSchedulVO> carSchedulVOList = new ArrayList();
			Integer work_hours;
			
			
				
				int dateNotify =0;
				int dateIndex =0;
				//更改班表內容
				for(int j = 0;j<dateStringList.size();j++){
					//將當下天數更新為解析天數
					int c = 0;
					System.out.println("dateIndex:"+dateIndex);
					
					int date = 1;
					Boolean judgDateIndex = true;
						while( judgDateIndex == true){
							
							int dayConvertInt = Integer.parseInt(dateStringList.get(dateIndex));
							int dayInt = (int) dayList.get(c);
							
							if(dayConvertInt == date){
								startIndex = dayInt;
								dateIndex++;
								System.out.println("此筆資料為"+date+"號，將目前的Index指向:"+ startIndex);
								dateNotify = dayConvertInt;
							
							    judgDateIndex = false;
							}
							
							date++;
							c++;
						}
						
						detail_time = req.getParameter("detail_time").trim();
						int detailTimeStatus =0;
						if(detail_time.equals("M")){
							detailTimeStatus = 1;
						}
					    if(detail_time.equals("A")){
					    	detailTimeStatus = 0;
						}
					    if(detail_time.equals("N")){
					    	detailTimeStatus = -1;
						}	
						//取得服務日期有空的車輛(司機)
						try{
						//for(int i = 0;i < howManyDays; i++){
					    //從符合條件的車裡
							int i=0;
						Integer vehicleNO = vehicleVO.get(i).getVehicle_no();
						String empNo = vSv.getOneVehicle(vehicleNO).getEmp_no();
						//找到該車所屬司機的班表
						String schedul = carSchedulSv.findByEmpNo(empNo, sysdate).getAttendance();
						//取得班表的編號
						Integer serial_no = carSchedulSv.findByEmpNo(empNo, sysdate).getSerial_no();
						//String schedul = carSchedulVO.get(i).getAttendance();
						//Integer serial_no =carSchedulVO.get(i).getSerial_no();
								int dtIndex = startIndex -(detailTimeStatus);	
								char workTimeChar = schedul.charAt(dtIndex);
								//開始檢查班表於當日該時段是否為空
								if(workTimeChar == '空'){
									System.out.println("當日:"+detail_time+"時段為"+workTimeChar);
									vehicleList.add(vehicleNO);
//									schedulList.add(schedul);
//									SerialNoList.add(serial_no);
									
									System.out.println("車輛編號vehicle_no:"+vehicleNO+"於當日有空,編號:"+serial_no+"將更新班表");
									
									System.out.println("原本的班表:" + schedul);
									
									if(schedul2 == null){
									schedul2 =  new StringBuffer(schedul);
									}
										
										
									//更新現有班表內容
									if(detail_time.equals("M")){
										System.out.println(dateNotify+"號早上有空");
										int index = startIndex-1;
										schedul2.setCharAt(index, '早');
										System.out.println("把"+index+"位置的字元替換成'早'");
										
									}
									
									if(detail_time.equals("A")){
										System.out.println(dateNotify+"號中午有空");
										int index = startIndex; 
										schedul2.setCharAt(index, '中');
										System.out.println("把"+index+"位置的字元替換成'中'");
										
									}
									
									if(detail_time.equals("N")){
										System.out.println(dateNotify+"號晚上有空");
										int index = startIndex+1;
										schedul2.setCharAt(index, '晚');
										System.out.println("把"+index+"位置的字元替換成'晚'");
								
									}
									
									attendance = schedul2.toString();
									System.out.println("更新的班表:"+attendance);
									//計算工時
									int charCount = 0;
									String strTemp = "";
									for(int k = 0;k<attendance.length();k++){
										strTemp = String.valueOf(attendance.charAt(k));
										if(!strTemp.equals("空")){
											charCount++;
										}
									}
									work_hours = charCount*4;
									System.out.println("更新後的工時:"+work_hours);
									CarSchedulVO carSchedulVO2 = new CarSchedulVO();
									carSchedulVO2.setSerial_no(serial_no);
									carSchedulVO2.setAttendance(attendance);
									carSchedulVO2.setWork_hours(work_hours);
									
									carSchedulVOList.add(carSchedulVO2);
									i++;
								}
							//}
						
						} catch (IndexOutOfBoundsException iobe) {
							System.out.println("只有名司機符合條件!!");
						}
						
					
			}
				
				
			
			
			
			
			java.sql.Date order_date = null;
			try {
			
				order_date = new java.sql.Date(System.currentTimeMillis());
				
			} catch (IllegalArgumentException e) {
				order_date = new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("請輸入日期!");
				System.out.println("請輸入日期!");
			}
	
			
			//接收訂單相關資料
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
			
			
			
			//整理一筆訂單資料(CarOrderVO)用來新增
			CarOrderVO carorderVO = new CarOrderVO();
			carorderVO.setMem_no(mem_no);
			carorderVO.setOrder_date(order_date);
			carorderVO.setOrder_status(order_status);
			
			//整理數筆訂單明細資料(carDetailList)用來新增
			List<CarDetailVO> carDetailList = new LinkedList<CarDetailVO>();
			
			int vehicleCount;
			for(int i = 0; i<howManyDays ; i++){
				CarDetailVO cardetailVO = new CarDetailVO();	
			try{	
			cardetailVO.setVehicle_no(vehicleList.get(i));
			}catch (IndexOutOfBoundsException e) {
			//vehicleCount = vehicleList.size() -1;
			System.out.println("司機只有"+vehicleList.size()+"人，這"+howManyDays+"天都派他出車");
			//cardetailVO.setVehicle_no(vehicleList.get(vehicleCount));	
			}
			Date mydate = dateList.get(i);
			cardetailVO.setDetail_date(mydate);
			System.out.println("把服務日期:"+dateList.get(i)+"放進VO");
			cardetailVO.setDetail_time(detail_time);
			cardetailVO.setPassenger_name(passenger_name);
			cardetailVO.setPassenger_phone(passenger_phone);
			cardetailVO.setGetinto_address(getinto_address);
			cardetailVO.setArrival_address(arrival_address);
			cardetailVO.setSendcar_status(sendcar_status);
			
			carDetailList.add(cardetailVO);
			System.out.println("Detail_date:"+cardetailVO.getDetail_date());
			}
			
			
			//處理會員扣點，用來更新餘額
			Integer defrayPoint = new Integer(req.getParameter("defrayPoint").trim());
			
			MemberService memberSv = new MemberService();
			MemberVO memberVO  = memberSv.findByPrimaryKey(mem_no);
			Integer point = memberVO.getPoint() - defrayPoint; 
			System.out.println("會員原有點數:"+ memberVO.getPoint()+"扣除:"+defrayPoint+"點，現有:"+point+"點");
			memberVO.setPoint(point);
			
			System.out.println("所有訂單資訊處理完成!!");
			
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				//錯誤大禮包
				return;
			}   

			/*************************** 2.開始新增資料 ***************************************/
			
			CarOrderService carorderSvc = new CarOrderService();
			carorderSvc.addCarOrder(carorderVO, carSchedulVOList, carDetailList, memberVO);
			System.out.println("新增一筆訂單:會員編號為"+mem_no+",訂單成立日期為"+order_date+",目前訂單狀態為"+order_status);
			
			  
			

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
