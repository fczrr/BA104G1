package com.healthnewsdetail.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;
import com.healthnewsdetail.model.*;

@WebServlet("/HealthNewsDetailServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class HealthNewsDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

System.out.println("進去哪一塊:"+action);
		
/************************************** insert **********************************************************************************/		
		
		if("insert".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
//			try{
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String newsTitle = req.getParameter("newsTitle").trim();
System.out.println("新增 newstitle----" +newsTitle);
				
				String newsIntro = req.getParameter("newsIntro").trim();
System.out.println("新增 newsIntro----" +newsIntro);
				
				String emp_no = req.getParameter("emp_no").trim();
System.out.println("新增 empno----" +emp_no);			

				String status = req.getParameter("status").trim();
System.out.println("新增 status----" +status);					
				
				//萬惡圖片區 
				byte[] coverPic = null;
				
				try {
				     Part part = req.getPart("coverPic");
				     coverPic = getPictureByteArray(part);
				     if(part.getSize()==0){
				    	 errorMsgs.add("請上傳封面照片");
				     }
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				System.out.println("-------------" + coverPic);

				
				HealthNewsDetailVO healthNewsDetailVO = new HealthNewsDetailVO();
				healthNewsDetailVO.setNewsTitle(newsTitle);
				healthNewsDetailVO.setNewsIntro(newsIntro);
				healthNewsDetailVO.setEmp_no(emp_no);
				healthNewsDetailVO.setCoverPic(coverPic);
				healthNewsDetailVO.setStatus(status);
				
				
				// Send the use back to the form, if there were errors
//				if(!errorMsgs.isEmpty()){
//					req.setAttribute("healthNewsDetailVO", healthNewsDetailVO); // 含有輸入格式錯誤的HealthNewsDetailVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/back/healthnewsdetail/addNewsdetail.jsp");
//					failureView.forward(req, res);
//					return;
//				}
				
				
				/***************************2.開始新增資料***************************************/
				
				HealthNewsDetailService healthNewsDetailSvc = new HealthNewsDetailService();
				healthNewsDetailVO = healthNewsDetailSvc.addHeaNews(newsTitle, newsIntro, emp_no , coverPic , status);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back/healthnewsdetail/AllNews.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllNews.jsp
				successView.forward(req,res);	
				
				/***************************其他可能的錯誤處理**********************************/
//			} catch(Exception e){
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/back/healthnewsdetail/add_news.jsp");
//				failureView.forward(req,res);
//			}
		}
		

		
/**************************************  update **********************************************************************************/		
		
		if ("update".equals(action)) { // 來自update_newsdetail_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑
			String whichPage = req.getParameter("whichPage"); // 送出修改的來源網頁的第幾頁(只用於:istAllNews.jsp)
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String healthNo = req.getParameter("healthNo").trim();
System.out.println("===================" + healthNo);
				
				String newsTitle = req.getParameter("newsTitle");
System.out.println("===================" + newsTitle);
				
				String newsIntro = req.getParameter("newsIntro");
System.out.println("===================" + newsIntro);
				
				String emp_no = req.getParameter("emp_no");
System.out.println("========================" + emp_no);
				
			//就是你啦 圖片
			byte[] coverPic = null;
			Part part = req.getPart("coverPic");
			try {
				if (part.getSize() != 0 ){   // 如果有新圖
			      coverPic = getPictureByteArray(part);
				}else {
					HealthNewsDetailService healthNewsDetailSvc = new HealthNewsDetailService();
					HealthNewsDetailVO healthNewsDetailVO = healthNewsDetailSvc.getOneNews(healthNo);
				    coverPic = healthNewsDetailVO.getCoverPic();
				}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			    
System.out.println("========================" + coverPic);
			
				Timestamp newsDate = new Timestamp(System.currentTimeMillis());
				String status = new String(req.getParameter("status"));
				
				
				HealthNewsDetailVO healthNewsDetailVO = new HealthNewsDetailVO();
				healthNewsDetailVO.setHealthNo(healthNo);
				healthNewsDetailVO.setNewsTitle(newsTitle);
				healthNewsDetailVO.setNewsIntro(newsIntro);
				healthNewsDetailVO.setEmp_no(emp_no);
				healthNewsDetailVO.setCoverPic(coverPic);
				healthNewsDetailVO.setNewsDate(newsDate);
				healthNewsDetailVO.setStatus(status);
				
				
				// Send the use back to the form, if there were errors
				if(!errorMsgs.isEmpty()){
					req.setAttribute("healthNewsDetailVO", healthNewsDetailVO); // 含有輸入格式錯誤的HealthNewsDetailVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back/healthnewsdetail/update_news.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始修改資料*****************************************/
				
				HealthNewsDetailService healthNewsDetailSvc = new HealthNewsDetailService();
				healthNewsDetailVO = healthNewsDetailSvc.updateHeaNews(healthNo, newsTitle, newsIntro, emp_no, coverPic, newsDate, status);
				System.out.println("========================準備轉交" + healthNo);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				req.setAttribute("healthNewsDetailVO", healthNewsDetailVO); // 資料庫update成功後,正確的的healthNewsDetailVO物件,存入req
	System.out.println("========================改成功" + healthNo);
				String url = requestURL+"?whichPage="+whichPage+"&healthNo="+healthNo; // 送出修改的來源網頁的第幾頁(只用於:listAllCarCom.jsp)和修改的是哪一筆
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllNews.jsp
				successView.forward(req,res);	
				
				/***************************其他可能的錯誤處理**********************************/
			} catch(Exception e){
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back/healthnewsdetail/update_news.jsp");
				failureView.forward(req,res);
			}
		}
				
		
/************************************** 查詢單個 getOne_For_Display **********************************************************************************/		
		
		if("getOne_For_Display".equals(action)){
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String healthNo = req.getParameter("healthNo");
				
System.out.println("查詢 ======================" + healthNo);
				
				/***************************2.開始查詢資料*****************************************/
				
				
				HealthNewsDetailService healthNewsDetailSvc = new HealthNewsDetailService();
				HealthNewsDetailVO healthNewsDetailVO = healthNewsDetailSvc.getOneNews(healthNo);
				
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(healthNewsDetailVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        System.out.println(responseJSONObject);
		        out.flush();
	            out.close();
				
				
//				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("healthNewsDetailVO", healthNewsDetailVO); // 資料庫取出的VO物件,存入req
//				String url = "/back/healthnewsdetail/listOneNewsdetail.jsp";    
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
//				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/healthnewsdetail/AllNews.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		
		
/************************************** 查詢單個 getOne_For_Display **********************************************************************************/		
		
		if("getOne_For_Display_Front".equals(action)){
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String healthNo = req.getParameter("healthNo");
System.out.println("");				
				
				/***************************2.開始查詢資料*****************************************/
				HealthNewsDetailService healthNewsDetailSvc = new HealthNewsDetailService();
				HealthNewsDetailVO healthNewsDetailVO = healthNewsDetailSvc.getOneNews(healthNo);
				
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("healthNewsDetailVO", healthNewsDetailVO); // 資料庫取出的VO物件,存入req
				String url = "/front/healthnews/OneNew.jsp";              
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front/healthnews/allNews.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		
/**************************************  getOne_For_Update **********************************************************************************/		
				
		if ("getOne_For_Update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL");
			String whichPage = req.getParameter("whichPage");
			
			try {
				/***************************1.接收請求參數****************************************/
				String healthNo = new String(req.getParameter("healthNo"));
		System.out.println("準備修改: " + healthNo);			
				/***************************2.開始查詢資料****************************************/
				HealthNewsDetailService healthNewsDetailSvc = new HealthNewsDetailService();
				HealthNewsDetailVO healthNewsDetailVO = healthNewsDetailSvc.getOneNews(healthNo);
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("healthNewsDetailVO", healthNewsDetailVO); // 資料庫取出的VO物件,存入req
				String url = "/back/healthnewsdetail/update_news.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_newsdetail_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
/************************************** delete **********************************************************************************/		

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String healthNo = req.getParameter("healthNo");
System.out.println("===================" + healthNo);
				/***************************2.開始刪除資料***************************************/
				HealthNewsDetailService healthNewsDetailSvc = new HealthNewsDetailService();
				healthNewsDetailSvc.deleteHeaNews(healthNo);
System.out.println("刪除 :"+healthNo);

				
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(healthNo);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				out.println(responseJSONObject); 
				System.out.println(responseJSONObject);
				out.flush();
				out.close();
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
//				String url = "/back/healthnewsdetail/listAllNewsdetail.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//				successView.forward(req, res);
//				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/healthnewsdetail/AllNews.jsp");
				failureView.forward(req, res);
			}
		}
	}		

	
	
	public static byte[] getPictureByteArray(Part part) throws IOException{
		
		InputStream fin = part.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192]; //自動緩衝區
		int i;
		while((i = fin.read(buffer)) != -1){
			baos.write(buffer, 0, i); // (哪個陣列,開始索引值,緩衝區資料大小)
		}
		baos.close();
		fin.close();
		
		return baos.toByteArray();
		
	}

	// 取出上傳的檔案名稱 (因為API未提供method,所以必須自行撰寫)
		public String getFileNameFromPart(Part part) {
			String header = part.getHeader("content-disposition");
			System.out.println("header=" + header); // 測試用
			String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
			System.out.println("filename=" + filename); // 測試用
			if (filename.length() == 0) {
				return null;
			}
			return filename;
		}
	}

	



