package com.shopcomplain.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;
import com.shopcomplain.model.*;
import com.shoporder.model.*;

@WebServlet("/ShopComplainServlet")
public class ShopComplainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doPost(req,res);
	
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
/************************************** 會員前端查詢 getOne_For_Update **********************************************************************************/		
//		這裡要改小石model的資訊
		
		if ("getOne_For_Update_Shop".equals(action)) { // 來自listAllMealOrder.jsp
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/complain/listAllMealCom.jsp】 或 
			req.setAttribute("requestURL", requestURL); // 送出修改的來源網頁路徑
			
			String whichPage = req.getParameter("whichPage");
			req.setAttribute("whichPage", whichPage);   // 送出修改的來源網頁的第幾頁, 存入req(只用於:listAllMealCom.jsp)
			
			
			try {
				/***************************1.接收請求參數****************************************/
				String orderno = req.getParameter("orderno");
				
				/***************************2.開始查詢資料****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				List<ShopOrderVO> shopOrderVO = shopOrderSvc.getAllByOrderNo(orderno);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("shopOrderVO", shopOrderVO); // 資料庫取出的VO物件,存入req
				
				String url = "/front/complain/addHcCom.jsp";      // 成功轉交 addHcCom.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交addHcCom.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}		

		
				
		
		
		
/************************************** 會員前端新增申訴 insert **********************************************************************************/		
		
		if("insert_front".equals(action)){  //addShopCom.jsp請求
			
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				//  申訴單號
				String orderno = req.getParameter("orderno");
			
				// 申訴內容
				String complainDetail = new String(req.getParameter("complainDetail").getBytes("ISO-8859-1"),("UTF-8"));
			
										
				// 改取小石的
				
				ShopComplainVO shopComplainVO = new ShopComplainVO();
				shopComplainVO.setOrderno(orderno);
				shopComplainVO.setComplainDetail(complainDetail);
				shopComplainVO.setComplainStatus("未處理");
				
				

				/***************************2.開始修改資料*****************************************/
				ShopComplainService shopComplainSvc = new ShopComplainService();
				shopComplainVO = shopComplainSvc.addShopCom(orderno, complainDetail, "未處理");
				
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(shopComplainVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        System.out.println(responseJSONObject);
		        out.flush();
	            out.close();
				
				
		}		
		  
/************************************** getOne_For_Updat_shop **********************************************************************************/		

		if ("getOne_For_Updat_shop".equals(action)) { // 來自listAllShopCom.jsp 或  的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/complain/listAllShopCom.jsp】
			req.setAttribute("requestURL", requestURL); // 送出修改的來源網頁路徑, 存入req (是為了給update_shop_input.jsp)
			
			String whichPage = req.getParameter("whichPage");
			req.setAttribute("whichPage", whichPage);   // 送出修改的來源網頁的第幾頁, 存入req(只用於:listAllShopcom.jsp)
			
			try {
				/***************************1.接收請求參數****************************************/
				
				String complainNo = req.getParameter("complainNo");
				System.out.println(complainNo);
				
				
				/***************************2.開始查詢資料****************************************/
				ShopComplainService shopComplainSvc = new ShopComplainService();
				ShopComplainVO shopComplainVO = shopComplainSvc.getOneShopCom(complainNo);
								
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(shopComplainVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        out.flush();
	            out.close();
				
//				/***************************3.查詢完成,準備轉交(Send the Success view)************/
//				req.setAttribute("shopComplainVO", shopComplainVO); // 資料庫取出的shopComplainV物件,存入req
//				String url = "/back/complain/update_shop_input.jsp";
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
				
				/***************************2.開始查詢資料*****************************************/
				ShopComplainService shopComplainSvc = new ShopComplainService();
				ShopComplainVO shopComplainVO = shopComplainSvc.getOneShopCom(complainNo);
				
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(shopComplainVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        out.flush();
	            out.close();
				
//				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("shopComplainVO", shopComplainVO); // 資料庫取出的shopComplainV物件,存入req
//				String url = "/back/complain/listOneShopCom.jsp";
//				System.out.println("==============商城準備轉交");
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
//				successView.forward(req, res);

		}
		
		
/************************************** delete **********************************************************************************/		

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/complain/listAllShopCom.jsp】 或 
			String whichPage = req.getParameter("whichPage");
			
			try {
				/***************************1.接收請求參數***************************************/
				String complainNo = req.getParameter("complainNo");
						
				/***************************2.開始刪除資料***************************************/
				ShopComplainService shopComplainSvc = new ShopComplainService();
				shopComplainSvc.deleteShopCom(complainNo);
						
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				
				String url = requestURL+"?whichPage="+whichPage+"&complianNo="+complainNo; // 送出修改的來源網頁的第幾頁(只用於:listAllShopCom.jsp)和修改的是哪一筆
				System.out.println("requestURL:"+requestURL+"------------"+"complainNo:"+complainNo);
				RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);
					
				/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
								.getRequestDispatcher("/back/newsdetail/listAllShopCom.jsp");
				failureView.forward(req, res);
			}
		}
				
	
/************************************** update **********************************************************************************/		
		
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑
			String whichPage = req.getParameter("whichPage"); // 送出修改的來源網頁的第幾頁
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String complainNo = req.getParameter("complainNo");
				
				String complainReply = new String(req.getParameter("complainReply").getBytes("ISO-8859-1"),("UTF-8"));
				
				
				Timestamp replyDate = new Timestamp(System.currentTimeMillis());
				
				String emp_no = req.getParameter("emp_no");
				System.out.println("================"+emp_no);
				
				String complainStatus = req.getParameter("complainStatus");
				
//				ShopOrderService shoporderSvc = new ShopOrderService();
				ShopComplainVO shopComplainVO = new ShopComplainVO();
				shopComplainVO.setComplainNo(complainNo);
				shopComplainVO.setComplainReply(complainReply);
				shopComplainVO.setReplyDate(replyDate);
				shopComplainVO.setEmp_no(emp_no);
				shopComplainVO.setComplainStatus(complainStatus);
				String responseJSONObject ="";
				Gson gson=  new Gson();
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					responseJSONObject = gson.toJson(shopComplainVO);
					res.setCharacterEncoding("UTF-8");
					PrintWriter out = res.getWriter();
			        out.println(responseJSONObject); 
			        out.flush();
		            out.close();	
				}
				
				/***************************2.開始修改資料*****************************************/
				ShopComplainService shopComplainSvc = new ShopComplainService();
				shopComplainVO = shopComplainSvc.updateShopCom(complainNo, complainReply,replyDate, emp_no ,"已完成");
				
				
				responseJSONObject = gson.toJson(shopComplainVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        out.flush();
	            out.close();	
				
//				/***************************3.修改完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("shopComplainVO", shopComplainVO); // 資料庫update成功後,正確的的VO物件,存入req
//				String url = requestURL+"?whichPage="+whichPage+"&complianNo="+complainNo; // 送出修改的來源網頁的第幾頁(只用於:listAllShopCom.jsp)和修改的是哪一筆
//				System.out.println("requestURL:"+requestURL+"------------"+"complainNo:"+complainNo);
//				RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
//				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/complain/update_shop_input.jsp");
				failureView.forward(req, res);
			}
		}
	
	}

}
