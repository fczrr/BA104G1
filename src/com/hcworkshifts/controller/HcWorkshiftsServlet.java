package com.hcworkshifts.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee_photo.model.EmpPhotosService;
import com.employee_photo.model.EmpPhotosVO;
import com.expert.model.ExpertService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.hcorder.modal.HcOrderDetailService;
import com.hcorder.modal.HcOrderDetailVO;
import com.hcworkshifts.model.HcWorkShiftsService;
import com.hcworkshifts.model.HcWorkShiftsVO;





public class HcWorkshiftsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HcWorkshiftsServlet() {
        super();
    }


	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
	}


	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {



		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		res.setContentType("text/html ; charset=UTF-8");
		
		//印log	
	Enumeration en = req.getParameterNames();
	System.out.println("HcWorkshiftsServlet----------------------------");	
		
		while(en.hasMoreElements()){
			String name = (String)en.nextElement();
	System.out.println(name+":"+req.getParameter(name)); 
		}
			
			
		if ("getAllByDateTime".equals(action)) { // 來自Hc_order.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String failureV = req.getParameter("failureV");
			

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String servDate = req.getParameter("servDate");
				String servTime = req.getParameter("servTime");
				
				if (servDate == null || (servDate.trim()).length() == 0) {
					errorMsgs.add("請輸入服務日期");
				}
				
				if (servTime == null || (servTime.trim()).length() == 0) {
					errorMsgs.add("請輸入服務時段");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(failureV);
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				try {
					new SimpleDateFormat("yyyy-MM-dd").parse(servDate);
				} catch (Exception e) {
					errorMsgs.add("服務日期格式不正確");
				}
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(failureV);
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				HcWorkShiftsService  hcwshiftSvc = new HcWorkShiftsService(); 
				ExpertService expertService = new ExpertService();

				List<HcWorkShiftsVO> hcWorkShiftsVOList = hcwshiftSvc.getAllByDateTime(servDate, servTime);
				String expNo = req.getParameter("expNo");
				
				if( expNo != null){
					 for( HcWorkShiftsVO hcWorkShiftsVO :hcWorkShiftsVOList){
						 hcWorkShiftsVO.getEmpNo();
					 }
				}
				
				if (hcWorkShiftsVOList.size()==0) {
					errorMsgs.add("抱歉!您選擇的日期目前尚無人力喔!");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(failureV);
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				for(HcWorkShiftsVO hcWorkShiftsVO:hcWorkShiftsVOList){
				System.out.println(hcWorkShiftsVO.getEmpNo());
				}	
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
			//考慮放哪個scope  上一頁的問題
				req.getSession().setAttribute("hcWorkShiftsVOList", hcWorkShiftsVOList); 
				String url = req.getParameter("successView");
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(failureV);
				failureView.forward(req, res);
			}
		}
		
		
		
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			 String failureV =  req.getParameter("failureV");

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String empNo = req.getParameter("empNo");
				String monthOfYear = req.getParameter("monthOfYear");
				
				if (empNo == null || (empNo.trim()).length() == 0) {
					errorMsgs.add("請輸入員工編號");
				}
				
				if (monthOfYear == null || (monthOfYear.trim()).length() == 0) {
					errorMsgs.add("請輸入年月");
				}
//				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(failureV);
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				if(! empNo.matches("^EMP[0-9]{4}$"))
					errorMsgs.add("員工編號格式不正確:EMPXXXX");
				
					System.out.println("Servlet empNo:"+empNo);

//				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(failureV);
					failureView.forward(req, res);
					return;//程式中斷
				}
				

				
				/***************************2.開始查詢資料*****************************************/
				HcWorkShiftsService  hcwshiftSvc = new HcWorkShiftsService(); 
				
				HcWorkShiftsVO hcWorkShiftsVO = hcwshiftSvc.getOne(monthOfYear, empNo);
				if (hcWorkShiftsVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(failureV);
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("hcWorkShiftsVO", hcWorkShiftsVO); // 資料庫取出的empVO物件,存入req
				String url = "/back/homeCare/Hc_show_workShift2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(failureV);
				failureView.forward(req, res);
			}
		}
		
		

		
		
		
		if ("listHcWorks_ByCompositeQuery".equals(action)) { // 來自select_page.jsp的複合查詢請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String failureV =  req.getParameter("failureV");

			try {
				
				/***************************1.將輸入資料轉為Map**********************************/ 
				//採用Map<String,String[]> getParameterMap()的方法 
				//注意:an immutable java.util.Map 
				//Map<String, String[]> map = req.getParameterMap();
				HttpSession session = req.getSession();
				Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
				HashMap<String, String[]> map3 = new HashMap<String, String[]>();
				if (req.getParameter("whichPage") == null){
					HashMap<String, String[]> map1 = (HashMap<String, String[]>)req.getParameterMap();
					HashMap<String, String[]> map2 = new HashMap<String, String[]>();
						
//					Set<String> keys = map1.keySet();
//					for (String key : keys) {
//						String[] value = map1.get(key);
//						map2.put(key, value);						
//					}	
					map2 = (HashMap<String, String[]>)map1.clone();
					session.setAttribute("map",map2);
					map3 = map2;
					map = (HashMap<String, String[]>)req.getParameterMap();
				} 
//				Set<String> keys = map.keySet();
//				for (String key : keys) {
//					String[] value = map.get(key);
//					System.out.println("--"+key+"--"+value[0]);
//				}	 
				
				
//				if(map.get("servDate")[0].equals("")){
//					errorMsgs.add("請輸入日期");
//				}
//				if(map.get("servTime")[0].equals("")){
//					errorMsgs.add("請輸入時間");
//				}
				
				if(req.getAttribute("servDate") !=null ||req.getAttribute("servTime")!=null){
				String servDate = map3.get("servDate")[0];
				String servTime = map3.get("servTime")[0];
					
					System.out.println("test yes0");
					String [] Number =HcWorkShiftsService.convertDateToNumber(servDate , servTime );
					String shiftNumber = Number[1] ;
					String monthOfYear = Number[0];
					map3.put("shiftNumber", new String[] {shiftNumber});	
					map3.put("monthOfYear", new String[] {monthOfYear});
					map = map3;

				}
				
				System.out.println("test yes1");
				
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(failureV);
					failureView.forward(req, res);
					return;//程式中斷
				}

				
				/***************************2.開始複合查詢***************************************/
				HcWorkShiftsService hcWorkShiftsService = new HcWorkShiftsService();
				List<HcWorkShiftsVO> listHcWorks_ByCompositeQuery  = hcWorkShiftsService.getAll(map);
				
				System.out.println("test yes2");
				if(listHcWorks_ByCompositeQuery.size() == 0){
					errorMsgs.add("查無人選，請重新查詢");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(failureV);
					failureView.forward(req, res);
					return;//程式中斷
				}			
				

				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("listHcWorks_ByCompositeQuery", listHcWorks_ByCompositeQuery); // 資料庫取出的list物件,存入request
				RequestDispatcher successView = req.getRequestDispatcher(req.getParameter("successView")); // 成功轉交listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				errorMsgs.add("test!!");

				RequestDispatcher failureView = req
						.getRequestDispatcher(failureV);
				failureView.forward(req, res);
			}
		}
		
		
		
		
		
		
		
			if ("update_ajax".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
				Gson gson=  new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				String monthOfYear = req.getParameter("monthOfYear");
				String empNo = req.getParameter("empNo");
				
		
				int yyyy = Integer.valueOf(monthOfYear.substring(0, 3))+1911;
				int mm = Integer.valueOf(monthOfYear.substring(3, 5));
				Calendar cal = Calendar.getInstance();
//				cal.set(yyyy, mm-1, 1);
				int maxDate = cal.getActualMaximum(Calendar.DATE);
				System.out.println(cal.getActualMaximum(Calendar.DATE));
				System.out.println(cal.getTime());
				cal.getTime();
				StringBuilder compositionShift =  new StringBuilder();
				for(int i=0;i < maxDate*3;i++){
					compositionShift.append("空");
				}
				
				if(maxDate<31){
					for(int i=0;i < 93-maxDate*3;i++){
						compositionShift.append("無");
					}
				}
				
		System.out.println(compositionShift);
				
				String test = req.getParameter("test"); 
				JsonArray jsonArray = gson.fromJson(test, JsonArray.class);
				
				
				if(jsonArray.isJsonNull()){
					
				}
				if(jsonArray.isJsonArray()){
					
				}
				HcOrderDetailService hcOrderDetailService = new HcOrderDetailService();
//				java.text.SimpleDateFormat sdf =  new java.text.SimpleDateFormat("yyyy-MM-dd");
				List<HcOrderDetailVO> changList = new ArrayList<HcOrderDetailVO>();
				for (JsonElement element : jsonArray) {
					JsonObject obj = element.getAsJsonObject();
					String date = obj.get("date").getAsString();
					date = date.substring(0,10);
					String time = obj.get("time").getAsString();
					int shiftNumber = (Integer.valueOf(date.substring(8,10))*3);
					
					String order = obj.get("order").getAsString();					
					
					if(time.equals("08")){
						time="早";
						shiftNumber = shiftNumber-3;
					}else if(time.equals("13")){
						time="中";
						shiftNumber = shiftNumber-2;
					}else if(time.equals("18")){
						time="晚";
						shiftNumber = shiftNumber-1;
					}
					
					if(order.substring(0, 2).equals("休假")){
						time="休";
					}
					
					if(order.substring(0, 2).equals("訂單")){
//						order.substring(3);
						java.sql.Date sqldate = java.sql.Date.valueOf(date);
						HcOrderDetailVO hcOrderDetailVO = hcOrderDetailService.getAllBySreviceTimeInPerson(date, time, empNo);
						if( (sqldate.getTime() < cal.getTime().getTime()) 
								&& !(hcOrderDetailVO.getServiceDate().getTime() == sqldate.getTime()) 
								|| !time.equals(hcOrderDetailVO.getServiceTime())){
							hcOrderDetailVO.setEmpNo(empNo);
							hcOrderDetailVO.setServiceDate(sqldate);
							hcOrderDetailVO.setServiceTime(time);;
							changList.add(hcOrderDetailVO);
						}
					}
					compositionShift.replace(shiftNumber, shiftNumber+1, time);
				}
				
			System.out.println(compositionShift);
			String workShiftStatus = compositionShift.toString();
			    

				
			
				
//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					hiredate=new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("請輸入日期!");
//				}




				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {

					return; //程式中斷
				}
				
//				/***************************2.開始修改資料*****************************************/
				HcWorkShiftsVO hcWorkShiftsVO = new HcWorkShiftsVO();
				hcWorkShiftsVO.setEmpNo(empNo);
				hcWorkShiftsVO.setMonthOfYear(monthOfYear);;
				hcWorkShiftsVO.setWorkShiftStatus(workShiftStatus);
				
				hcOrderDetailService.updateAll(changList, hcWorkShiftsVO);
				System.out.println(" i an here");
				
				JsonObject jjj = new JsonObject();
				
				String aass =  "516516161";				
				jjj.addProperty("xxx", aass);;
				
				res.getWriter().println(jjj.toString());
				
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/				


				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				res.setStatus(200);
				
				JsonObject jjj = new JsonObject();				
				String aass =  "更新有誤  請重試";				
				jjj.addProperty("xxx", aass);;
				res.getWriter().println(jjj.toString());

			

			}
		}
			
			if ("chageDetail_ajax".equals(action)) { // 來自update_emp_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					
					Gson gson=  new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();


					String test = req.getParameter("test"); 
					JsonObject obj = gson.fromJson(test, JsonObject.class);
					String orderDetailNo = obj.get("orderDetailNo").getAsString();
	

					
				/***************************2.開始修改資料*****************************************/
					HcOrderDetailService hcOrderDetailService = new HcOrderDetailService();
					hcOrderDetailService.getToAuto(orderDetailNo);

					
					System.out.println(" chageDetail_ajax come back");
					
					JsonObject objBack = new JsonObject();
					
				String msg =  "明細更新完成";				
				objBack.addProperty("xxx", msg);
					
					res.getWriter().println(objBack.toString());
					
					
					/***************************3.修改完成,準備轉交(Send the Success view)*************/				
     
					
					
					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					JsonObject jjj = new JsonObject();				
					String aass =  "更新有誤  請重試";				
					jjj.addProperty("xxx", aass);;
					jjj.addProperty("exc", e.getMessage());;
					res.getWriter().println(jjj.toString());
					
					
				}
			}


		
		
		


	}

}
