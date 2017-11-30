package com.hccomplain.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;
import com.hccomplain.model.*;
import com.hcorder.modal.HcOrderMasterService;
import com.hcorder.modal.HcOrderMasterVO;


@WebServlet("/HcComplainServlet")
public class HcComplainServlet  extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doPost(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

/************************************** 會員前端查詢 getOne_For_Update **********************************************************************************/		
		if ("getOne_For_Update_HcOrder".equals(action)) { // 來自listAllHcOrder.jsp
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/complain/listAllHcCom.jsp】 或 
			req.setAttribute("requestURL", requestURL); // 送出修改的來源網頁路徑
			
			String whichPage = req.getParameter("whichPage");
			req.setAttribute("whichPage", whichPage);   // 送出修改的來源網頁的第幾頁, 存入req(只用於:listAllHccom.jsp)
			
			
			try {
				/***************************1.接收請求參數****************************************/
				String orderNo = new String(req.getParameter("orderNo"));
				
				/***************************2.開始查詢資料****************************************/
				HcOrderMasterService hcOrderMasterorderSvc = new HcOrderMasterService();
				HcOrderMasterVO hcOrderMasterVO = hcOrderMasterorderSvc.getOne(orderNo);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("hcOrderMasterVO", hcOrderMasterVO); // 資料庫取出的VO物件,存入req
				
				String url = "/front/complain/addHCCom.jsp";      // 成功轉交 addHcCom.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交addHcCom.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}		

		
		
/************************************** 會員前端新增申訴 insert **********************************************************************************/		
		
		if("insert_front".equals(action)){  //addHcCom.jsp請求
			
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				//  申訴單號
				String order_no = req.getParameter("order_no");

				// 申訴內容
				String complainDetail = new String(req.getParameter("complainDetail").getBytes("ISO-8859-1"),("UTF-8"));
			
				HcComplainVO hcComplainVO = new HcComplainVO();
				hcComplainVO.setOrder_no(order_no);
				hcComplainVO.setComplainDetail(complainDetail);
				hcComplainVO.setComplainStatus("未處理");
				
				
				// Send the use back to the form, if there were errors

				
				/***************************2.開始修改資料*****************************************/
				HcComplainService hcComplainSvc = new HcComplainService();
				hcComplainVO = hcComplainSvc.addHcCom(order_no, complainDetail, "未處理");
				
				
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(hcComplainVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        System.out.println(responseJSONObject);
		        out.flush();
	            out.close();
				
		}
				
		
/************************************** getOne_For_Updat_car **********************************************************************************/		

		if ("getOne_For_Updat_hc".equals(action)) { // 來自listAllHcCom.jsp 或  的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/complain/listAllHcCom.jsp】
			req.setAttribute("requestURL", requestURL); // 送出修改的來源網頁路徑, 存入req (是為了給update_Hc_input.jsp)
			
			String whichPage = req.getParameter("whichPage");
			req.setAttribute("whichPage", whichPage);   // 送出修改的來源網頁的第幾頁, 存入req(只用於:listAllHccom.jsp)

			try {
				/***************************1.接收請求參數****************************************/
				
				String complainNo = req.getParameter("complainNo");
				System.out.println(complainNo);

				
				/***************************2.開始查詢資料****************************************/
				HcComplainService hcComplainSvc = new HcComplainService();
				HcComplainVO hcComplainVO = hcComplainSvc.getOneHcCom(complainNo);
						
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(hcComplainVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        out.flush();
	            out.close();
								
				
				
				
//				/***************************3.查詢完成,準備轉交(Send the Success view)************/
//				req.setAttribute("hcComplainVO", hcComplainVO); // 資料庫取出的hcComplainV物件,存入req
//				String url = "/back/complain/update_hc_input.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交update_hc_input.jsp
//				successView.forward(req, res);

				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
/************************************** 查詢單個 getOne_For_Display **********************************************************************************/		
		if("getOne_For_Display".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs",errorMsgs);

			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			String complainNo = req.getParameter("complainNo");
			System.out.println(complainNo);
			
			/***************************2.開始查詢資料*****************************************/
			HcComplainService hcComplainSvc = new HcComplainService();
			HcComplainVO hcComplainVO = hcComplainSvc.getOneHcCom(complainNo);
			
			String responseJSONObject ="";
			Gson gson=  new Gson();
			responseJSONObject = gson.toJson(hcComplainVO);
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
	        out.println(responseJSONObject); 
	        System.out.println(responseJSONObject);
	        out.flush();
            out.close();
			
			
//			/***************************3.查詢完成,準備轉交(Send the Success view)*************/
//			req.setAttribute("hcComplainVO", hcComplainVO); // 資料庫取出的hcComplainV物件,存入req
//			String url = "/back/complain/listOneHcCom.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
//			successView.forward(req, res);
	}

		
/************************************** 刪除 delete **********************************************************************************/		
		if ("delete".equals(action)) { // 來自listAllHcCom.jsp

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/complain/listAllHcCom.jsp】 或 
			String whichPage = req.getParameter("whichPage");
			
			try {
				/***************************1.接收請求參數***************************************/
				String complainNo = req.getParameter("complainNo");
						
				/***************************2.開始刪除資料***************************************/
				HcComplainService hcComplainSvc = new HcComplainService();
				hcComplainSvc.deleteHcCom(complainNo);
						
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				
				String url = requestURL+"?whichPage="+whichPage+"&complianNo="+complainNo; // 送出修改的來源網頁的第幾頁(只用於:listAllHcCom.jsp)和修改的是哪一筆
				System.out.println("requestURL:"+requestURL+"------------"+"complainNo:"+complainNo);
				RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);
					
				/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
								.getRequestDispatcher("/back/newsdetail/listAllHcCom.jsp");
				failureView.forward(req, res);
			}
		}
				
			
		
/************************************** 修改 update **********************************************************************************/		
				
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
					
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
					
			String whichPage = req.getParameter("whichPage"); // 送出修改的來源網頁的第幾頁
					
			try {	
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String complainNo = req.getParameter("complainNo");
				
				
				String complainReply = new String(req.getParameter("complainReply").getBytes("ISO-8859-1"),("UTF-8"));
				
				
				
				
				Timestamp replyDate = new Timestamp(System.currentTimeMillis());
				
				String emp_no = req.getParameter("emp_no");
				System.out.println("================"+emp_no);
				
				String complainStatus = req.getParameter("complainStatus");
				
				HcComplainVO hcComplainVO = new HcComplainVO();
				hcComplainVO.setComplainNo(complainNo);
				hcComplainVO.setComplainReply(complainReply);
				hcComplainVO.setReplyDate(replyDate);
				hcComplainVO.setEmp_no(emp_no);
				hcComplainVO.setComplainStatus(complainStatus);
				String responseJSONObject ="";
				Gson gson=  new Gson();
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					responseJSONObject = gson.toJson(hcComplainVO);
					res.setCharacterEncoding("UTF-8");
					PrintWriter out = res.getWriter();
			        out.println(responseJSONObject); 
			        out.flush();
		            out.close();
				}
				
				/***************************2.開始修改資料*****************************************/
				HcComplainService hcComplainSvc = new HcComplainService();
				hcComplainVO = hcComplainSvc.updateHcCom(complainNo, complainReply,replyDate, emp_no ,"已完成");
				
				responseJSONObject = gson.toJson(hcComplainVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        out.flush();
	            out.close();
				
//				/***************************3.修改完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("hcComplainVO", hcComplainVO); // 資料庫update成功後,正確的的VO物件,存入req
//				String url = requestURL+"?whichPage="+whichPage+"&complianNo="+complainNo; // 送出修改的來源網頁的第幾頁(只用於:listAllHcCom.jsp)和修改的是哪一筆
//				System.out.println("requestURL:"+requestURL+"------------"+"complainNo:"+complainNo);
//				RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
//				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/complain/update_hc_input.jsp");
				failureView.forward(req, res);
			}
		}
	
	}

}
