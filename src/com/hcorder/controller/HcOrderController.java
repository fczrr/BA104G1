package com.hcorder.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.expert.model.ExpertService;
import com.expertlist.model.ExpertlistService;
import com.expertlist.model.ExpertlistVO;
import com.hcorder.modal.HcOrderDetailVO;
import com.hcorder.modal.HcOrderMasterService;
import com.hcorder.modal.HcOrderMasterVO;
import com.hcworkshifts.model.HcWorkShiftsService;
import com.hcworkshifts.model.HcWorkShiftsVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;



public class HcOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HcOrderController() {
        super();
    }


	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
	}


	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		



		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");;
		String action = req.getParameter("action");
		
		Enumeration en = req.getParameterNames();
	System.out.println("----------------------------");	
		
		while(en.hasMoreElements()){
			String name = (String)en.nextElement();
	System.out.println(name+":"+req.getParameter(name)); 
		}
		
		
		
		
		if ("add_hc_order".equals(action)) { // 來自HC_order.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String servDate = req.getParameter("servDate");
				String serviceTime = req.getParameter("servTime");
				String caredNo = req.getParameter("caredNo");
				String empNo = req.getParameter("empNo");
				String memNo = req.getParameter("memNo");
				String expNo = req.getParameter("expNo");
				if(req.getSession().getAttribute("memberVO") == null){
					errorMsgs.add("請登入");
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front/homeCare/Hc_order.jsp");
					failureView.forward(req, res);
					
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front/homeCare/Hc_order.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				if (servDate == null || (servDate.trim()).length() == 0) {
					errorMsgs.add("請選擇服務日期");
				}
				if (serviceTime == null || (serviceTime.trim()).length() == 0) {
					errorMsgs.add("請選擇服務時段");
				}
				if (caredNo == null || (caredNo.trim()).length() == 0) {
					errorMsgs.add("請選擇服務對象");
				}
				if (empNo == null || (empNo.trim()).length() == 0) {
					errorMsgs.add("請選擇服務人員");
				}				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front/homeCare/Hc_order.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Date serviceDate = null;				
				try {
					serviceDate = java.sql.Date.valueOf(req.getParameter("servDate").trim());
				} catch (Exception e) {
					errorMsgs.add("服務日期格式不正確");
				}
				
				//檢查錢包 
				MemberService memberService  = new MemberService();
				MemberVO  memberVO = memberService.findByPrimaryKey(memNo);
				Integer point = memberVO.getPoint();
				
				ExpertlistService expertlistService = new ExpertlistService();
				Integer cost=0;
				if(empNo.equals("EMP0000")){
					ExpertlistVO expertlistVO = expertlistService.getOneEXPLIST(expNo);
					cost =expertlistVO.getExpPrice();
				}else{
					ExpertService expertService = new ExpertService();					
					ExpertlistVO expertlistVO = expertlistService.getOneEXPLIST(expertService.getAllByEmpNo(empNo).get(0).getExpNo());
					cost =expertlistVO.getExpPrice();
				}
				
				if(cost>point){
					errorMsgs.add("抱歉! 餘額不足喔! 目前餘額"+point+", 請至會員中心儲值");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front/homeCare/Hc_order.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
			//檢查該天是否已經下定  (先不用)

				
				/***************************2.開始新增資料*****************************************/
//				if(empNo.equals("EMP0000")){
//					HcWorkShiftsService hcWorkShiftsService = new HcWorkShiftsService();
//					//分派當天有空  工作時數最少員工
//					HcWorkShiftsVO hcWorkShiftsVO = hcWorkShiftsService.getOneByDateTime(servDate, serviceTime);
//					if(hcWorkShiftsVO != null){
//					empNo = hcWorkShiftsVO.getEmpNo();
//					System.out.println("自動選人empNo  "+empNo);
//					}
//				}  
				
				if(empNo.equals("EMP0000")){
					HcWorkShiftsService hcWorkShiftsService = new HcWorkShiftsService();
					//map 轉為可增減
					HashMap<String, String[]> map = (HashMap<String, String[]>) req.getParameterMap();
					HashMap<String, String[]> map2 = new HashMap<String, String[]>();
					Set<String> keys = map.keySet();
					for (String key : keys) {
						String[] value = map.get(key);
						map2.put(key, value);						
					}	
					//移除員工0000 以免查詢錯誤
					map2.remove("empNo");
					String [] Number =HcWorkShiftsService.convertDateToNumber(servDate , serviceTime);
					String shiftNumber = Number[1] ;
					String monthOfYear = Number[0];
					map2.put("shiftNumber", new String[] {shiftNumber});	
					map2.put("monthOfYear", new String[] {monthOfYear});
					//以map2條件做查詢  分派當天有空  工作時數最少員工					
					List<HcWorkShiftsVO> hcWorkShiftsVOList = hcWorkShiftsService.getAll(map2);
					//如果查出來目前有員工  則改變員工編號  否則維持0000代表排不到人
					if(hcWorkShiftsVOList.size() != 0){
					empNo = hcWorkShiftsVOList.get(0).getEmpNo();
					System.out.println("自動選人empNo  "+empNo);
					}else{
						empNo = "EMP0000"+String.valueOf(cost);
					}
				}				
				
				HcOrderMasterService hcOrderSvc = new HcOrderMasterService();
				HcOrderMasterVO hcOrderMasterVO = hcOrderSvc.addHcOrderMaster(memNo, caredNo, "未確認",serviceDate,serviceTime,empNo);
			System.out.println("取回來的VO"+hcOrderMasterVO.getOrderNo());
				
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front/homeCare/Hc_order.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				/***************************3.新增完成,準備轉交(Send the Success view)*************/
				req.setAttribute("hcOrderMasterVO", hcOrderMasterVO);
				String url = "/front/homeCare/Hc_show_order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front/homeCare/Hc_order.jsp");
				failureView.forward(req, res);
			}
		}
	
			
		
		

		if ("add_hc_order_many".equals(action)) { // 來自select_page.jsp的請求
	System.out.println("cr order_many");
			String forwardURL = req.getParameter("forwardURL");

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String[] servDates = req.getParameterValues("servDate");				
				String caredNo = req.getParameter("caredNo");
				String memNo = req.getParameter("memNo");
				System.out.println(memNo);
				
			if (servDates == null || servDates.length == 0) {
				errorMsgs.add("請選擇服務日期");
			}

			if (caredNo == null || (caredNo.trim()).length() == 0) {
				errorMsgs.add("請選擇服務對象");
			}
			
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher(forwardURL);
				failureView.forward(req, res);
				return;//程式中斷
			}
				
				HcWorkShiftsService hcWorkShiftsService = new HcWorkShiftsService();
				List<HcOrderDetailVO> hcOrderDetailList =  new ArrayList<HcOrderDetailVO>();
				for(int i =0;i<servDates.length;i++){
					String servDate = 	servDates[i].substring(0, servDates[i].lastIndexOf("-"));
			System.out.println(servDate);
					String servTime = 	servDates[i].substring(servDates[i].length()-1, servDates[i].length());
			System.out.println(servTime);
					
					//錯誤驗證 
					Date serviceDate = null;				
					try {
						serviceDate = java.sql.Date.valueOf(servDate);
					} catch (Exception e) {
						errorMsgs.add(servDate+": 服務日期格式不正確");
					}
					
					
					if(serviceDate.getTime() < System.currentTimeMillis()){
						errorMsgs.add(servDate+servTime+": 時間已過期");
						continue;
					}
					
					
					//分派當天有空  工作時數最少員工
					HcWorkShiftsVO hcWorkShiftsVO = hcWorkShiftsService.getOneByDateTime(servDate, servTime);
					 String empno = hcWorkShiftsVO.getEmpNo();
					 
					 if(empno.equals("")){
						 
					 }
					
					HcOrderDetailVO hcOrderDetail = new HcOrderDetailVO();					
					hcOrderDetail.setServiceDate(serviceDate);
					hcOrderDetail.setServiceTime(servTime);
					hcOrderDetail.setEmpNo(hcWorkShiftsVO.getEmpNo());
					hcOrderDetail.setOrderDetailStataus("未服務");
					hcOrderDetailList.add(hcOrderDetail);
				}
				
				if(req.getSession().getAttribute("memberVO") == null){
					errorMsgs.add("請登入");
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front/homeCare/Hc_order.jsp");
					failureView.forward(req, res);
					
				}
				
				//檢查錢包 
				MemberService memberService  = new MemberService();
				MemberVO  memberVO = memberService.findByPrimaryKey(memNo);
				Integer point = memberVO.getPoint();
				
//				ExpertlistService expertlistService = new ExpertlistService();
//				Integer cost=0;
//				if(empNo.equals("EMP0000")){
//					ExpertlistVO expertlistVO = expertlistService.getOneEXPLIST(expNo);
//					cost =expertlistVO.getExpPrice();
//				}else{
//					ExpertService expertService = new ExpertService();					
//					ExpertlistVO expertlistVO = expertlistService.getOneEXPLIST(expertService.getAllByEmpNo(empNo).get(0).getExpNo());
//					cost =expertlistVO.getExpPrice();
//				}
//				
//				if(cost>point){
//					errorMsgs.add("抱歉! 餘額不足喔! 目前餘額"+point+", 請至會員中心儲值");
//				}
				

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(forwardURL);
					failureView.forward(req, res);
					return;//程式中斷
				}

				
				/***************************2.開始新增資料*****************************************/
				HcOrderMasterVO hcOrderMaster = new HcOrderMasterVO();
				hcOrderMaster.setMemNo(memNo);
				hcOrderMaster.setOrderDate(new Date(System.currentTimeMillis()));
				hcOrderMaster.setCaredNo(caredNo);
				hcOrderMaster.setOrderStatus("未確認");

				HcOrderMasterService hcOrderSvc = new HcOrderMasterService();
				HcOrderMasterVO hcOrderMasterVO = hcOrderSvc.addHcOrderMaster(hcOrderMaster,hcOrderDetailList);
			System.out.println("取回來的VO"+hcOrderMasterVO.getOrderNo());
				
				
				/***************************3.新增完成,準備轉交(Send the Success view)*************/
				req.setAttribute("hcOrderMasterVO", hcOrderMasterVO);
				String url = "/front/homeCare/Hc_show_order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				
				errorMsgs.add("無法取得資料:" + e.getMessage());

				RequestDispatcher failureView = req
						.getRequestDispatcher(forwardURL);
				failureView.forward(req, res);
			}
		}
		

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String orderNo = req.getParameter("orderNo");
				if (orderNo == null || (orderNo.trim()).length() == 0) {
					errorMsgs.add("請輸入員工編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back/homeCare/Hc_order_manage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
//				Integer empno = null;
//				try {
//					empno = new Integer(str);
//				} catch (Exception e) {
//					errorMsgs.add("員工編號格式不正確");
//				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back/homeCare/Hc_order_manage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				HcOrderMasterService empSvc = new HcOrderMasterService();
				HcOrderMasterVO hcOrderMasterVO = empSvc.getOne(orderNo);
				if (hcOrderMasterVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back/homeCare/Hc_order_manage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("hcOrderMasterVO", hcOrderMasterVO); // 資料庫取出的empVO物件,存入req
				String url = "/front/homeCare/Hc_show_order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/homeCare/Hc_order_manage.jsp");
				failureView.forward(req, res);
			}
		}
		
		

		if ("listOrds_ByCompositeQuery".equals(action)) { // 來自select_page.jsp的複合查詢請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String failureV = req.getParameter("failureV");

			try {
				
				/***************************1.將輸入資料轉為Map**********************************/ 
				//採用Map<String,String[]> getParameterMap()的方法 
				//注意:an immutable java.util.Map 
				//Map<String, String[]> map = req.getParameterMap();
				HttpSession session = req.getSession();
				Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
				if (req.getParameter("whichPage") == null){
					HashMap<String, String[]> map1 = (HashMap<String, String[]>)req.getParameterMap();
					HashMap<String, String[]> map2 = new HashMap<String, String[]>();
					map2 = (HashMap<String, String[]>)map1.clone();
					session.setAttribute("map",map2);
					map = (HashMap<String, String[]>)req.getParameterMap();
				} 
				//加入錯誤處理
				

				
				/***************************2.開始複合查詢***************************************/
				HcOrderMasterService hcOrderMasterService = new HcOrderMasterService();
				List<HcOrderMasterVO> list  = hcOrderMasterService.getAll(map);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("listOrds_ByCompositeQuery", list); // 資料庫取出的list物件,存入request
				RequestDispatcher successView = req.getRequestDispatcher(req.getParameter("successView")); // 成功轉交listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(failureV);
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("updateOrderStatus".equals(action)) { // 來自select_page.jsp的複合查詢請求
			System.out.println("YA I am  IN");

			String orderStatus = req.getParameter("orderStatus");
			String orderNo = req.getParameter("orderNo");
			try {
				
				/***************************1.**********************************/ 
				if(orderStatus.equals("orderStatus")){
					return;
				}
				
				/***************************2.開始***************************************/
				HcOrderMasterService hcOrderMasterService = new HcOrderMasterService();
				hcOrderMasterService.updateOrderStatus(orderNo,orderStatus);
				
				/***************************3.查詢完成,準備轉交()************/
				res.getWriter().println("改動成功");
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				res.getWriter().println("改動失敗");

			}
		}
				
		


	}

}
