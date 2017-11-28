package com.carcomplain.controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.carcomplain.model.*;
import com.google.gson.Gson;
import com.carorder.model.*;


@WebServlet("/CarComplainServlet")
public class CarComplainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doPost(req,res);
		
	
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
System.out.println("近來---------"+action);		

/************************************** getOne_For_Update **********************************************************************************/		
		if ("getOne_For_Update_front".equals(action) ){ // 來自listAllOrder.jsp 或  /dept/listEmps_ByDeptno.jsp 的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/complain/listAllCarCom.jsp】 或 
			req.setAttribute("requestURL", requestURL); // 送出修改的來源網頁路徑, 存入req (是為了給update_car_input.jsp)
			
			String whichPage = req.getParameter("whichPage");
			req.setAttribute("whichPage", whichPage);   // 送出修改的來源網頁的第幾頁, 存入req(只用於:listAllCarcom.jsp)
			
			
			try {
				/***************************1.接收請求參數****************************************/
				String order_no = req.getParameter("order_no");
				/***************************2.開始查詢資料****************************************/
				CarOrderService carOrderSvc = new CarOrderService();
				CarOrderVO carOrderVO = carOrderSvc.getOneCarOrder(order_no);
				
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("carOrderVO", carOrderVO); // 資料庫取出的orderVO物件,存入req
				
				String url = null;
				url = "/front/complain/addCarCom.jsp";        // 成功轉交 addCarCom.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交addCarCom.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
						
/************************************** insert **********************************************************************************/		
		
		if("insert_front".equals(action)){  //addCarCom.jsp請求
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				//  申訴單號
				String order_no = req.getParameter("order_no");
	System.out.println("單號---------"+order_no);		
				
			// 申訴內容
			String complainDetail = new String(req.getParameter("complainDetail").getBytes("ISO-8859-1"),("UTF-8"));
										
				
				CarComplainVO carComplainVO = new CarComplainVO();
				carComplainVO.setOrder_no(order_no);
				carComplainVO.setComplainDetail(complainDetail);
				carComplainVO.setComplainStatus("未處理");
				

				/***************************2.開始修改資料*****************************************/
				CarComplainService carComplainSvc = new CarComplainService();
				carComplainVO = carComplainSvc.addCarCom(order_no, complainDetail, "未處理");
				
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(carComplainVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        System.out.println(responseJSONObject);
		        out.flush();
	            out.close();

		}
		
		  
/************************************** getOne_For_Updat_car **********************************************************************************/		

		if ("getOne_For_Updat_car".equals(action)) { // 來自listAllCarCom.jsp 或  的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/complain/listAllCarCom.jsp】
			req.setAttribute("requestURL", requestURL); // 送出修改的來源網頁路徑, 存入req (是為了給update_car_input.jsp)
			
			String whichPage = req.getParameter("whichPage");
			req.setAttribute("whichPage", whichPage);   // 送出修改的來源網頁的第幾頁, 存入req(只用於:listAllCarcom.jsp)
			
			try {
				/***************************1.接收請求參數****************************************/
				
				String complainNo = req.getParameter("complainNo");
				
				/***************************2.開始查詢資料****************************************/
				CarComplainService carComplainSvc = new CarComplainService();
				CarComplainVO carComplainVO = carComplainSvc.getOneCarCom(complainNo);
				
				
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(carComplainVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        out.flush();
	            out.close();
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
//				req.setAttribute("carComplainVO", carComplainVO); // 資料庫取出的carComplainV物件,存入req
//				String url = "/back/complain/update_car_input.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
//				successView.forward(req, res);

				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
		
		
		
		
/************************************** getOne_For_Display **********************************************************************************/		

		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
				String complainNo = req.getParameter("complainNo");
System.out.println("查詢-----" + complainNo);
				
				/***************************2.開始查詢資料*****************************************/
				CarComplainService carComplainSvc = new CarComplainService();
				CarComplainVO carComplainVO = carComplainSvc.getOneCarCom(complainNo);
				
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(carComplainVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        out.flush();
	            out.close();

		        
//				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("carComplainVO", carComplainVO); // 資料庫取出的carComplainV物件,存入req
//				String url = "/back/complain/listCarCom.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
//				successView.forward(req, res);

		}
		
		
/************************************** delete **********************************************************************************/		

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/complain/listAllCarCom.jsp】 或 
			String whichPage = req.getParameter("whichPage");
			
			try {
				/***************************1.接收請求參數***************************************/
				String complainNo = req.getParameter("complainNo");
						
				/***************************2.開始刪除資料***************************************/
				CarComplainService carComplainSvc = new CarComplainService();
				carComplainSvc.deleteCarCom(complainNo);
						
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				
				String url = requestURL+"?whichPage="+whichPage+"&complianNo="+complainNo; // 送出修改的來源網頁的第幾頁(只用於:listAllCarCom.jsp)和修改的是哪一筆
				System.out.println("requestURL:"+requestURL+"------------"+"complainNo:"+complainNo);
				RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);
					
				/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
								.getRequestDispatcher("/back/newsdetail/listAllCarCom.jsp");
				failureView.forward(req, res);
			}
		}
				
	
/************************************** update **********************************************************************************/		
		
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String whichPage = req.getParameter("whichPage"); // 送出修改的來源網頁的第幾頁
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String complainNo = req.getParameter("complainNo");
				System.out.println("complainNo=========" + complainNo);
				
				String complainReply = new String(req.getParameter("complainReply").getBytes("ISO-8859-1"),("UTF-8"));
				
				
				Timestamp replyDate = new Timestamp(System.currentTimeMillis());
				
				String emp_no = req.getParameter("emp_no");
//				System.out.println("emp_no================"+emp_no);
				
				String complainStatus = req.getParameter("complainStatus");
				
				
				CarComplainVO carComplainVO = new CarComplainVO();
				carComplainVO.setComplainNo(complainNo);
				carComplainVO.setComplainReply(complainReply);
				carComplainVO.setReplyDate(replyDate);
				carComplainVO.setEmp_no(emp_no);
				carComplainVO.setComplainStatus(complainStatus);
				String responseJSONObject ="";
				Gson gson=  new Gson();
				
				if (!errorMsgs.isEmpty()) {
					
					responseJSONObject = gson.toJson("stop");
					res.setCharacterEncoding("UTF-8");
					PrintWriter out = res.getWriter();
			        out.println(responseJSONObject); 
			        System.out.println(responseJSONObject);
			        out.flush();
		            out.close();
					return; //程式中斷
					
				}
				
				/***************************2.開始修改資料*****************************************/
				CarComplainService carComplainSvc = new CarComplainService();
				carComplainVO = carComplainSvc.updateCarCom(complainNo, complainReply,replyDate, emp_no ,"已完成");
				
				
				responseJSONObject = gson.toJson(carComplainVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        out.flush();
	            out.close();
				
				
//				
//				/***************************3.修改完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("carComplainVO", carComplainVO); // 資料庫update成功後,正確的的VO物件,存入req
//				String url = "?whichPage="+whichPage+"&complianNo="+complainNo; // 送出修改的來源網頁的第幾頁(只用於:listAllCarCom.jsp)和修改的是哪一筆
//				System.out.println("------------"+"complainNo:"+complainNo);
//				RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
//				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/complain/listCarCom.jsp");
				failureView.forward(req, res);
			}
		}
	
	}

}
