package com.newsdetail.controller;

import java.io.*;
import java.sql.Timestamp;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.google.gson.Gson;
import com.newsdetail.model.*;


@WebServlet("/NewsdetailServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class NewsdetailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
/************************************** insert **********************************************************************************/		
	
		if("insert".equals(action)){  // 來自addNewsdetail.jsp的請求 
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
//			try{
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String newstitle = req.getParameter("newstitle").trim();
System.out.println("新增 newstitle----" +newstitle);
				
				String newsintro = req.getParameter("newsintro").trim();
System.out.println("新增 newsintro----" +newsintro);		

				String empno = req.getParameter("empno").trim();
System.out.println("新增 empno----" +empno);	

				String status = req.getParameter("status").trim();
System.out.println("新增 status----" +status);					
				
				// 萬惡圖片區 
				byte[] coverpic = null;
			    
				try {
				     Part part = req.getPart("coverpic");
				     coverpic = getPictureByteArray(part);
				     if(part.getSize()==0){
				    	 errorMsgs.add("請上傳封面照片");
				     }
			    } catch (Exception e) {
			    	e.printStackTrace();
			    }
				
				System.out.println("-------------" + coverpic);
				
				
				NewsdetailVO newsdetailVO = new NewsdetailVO();
				newsdetailVO.setNewstitle(newstitle);
				newsdetailVO.setNewsintro(newsintro);
				newsdetailVO.setEmpno(empno);
				newsdetailVO.setCoverpic(coverpic);
				newsdetailVO.setStatus(status);
				
				
				// Send the use back to the form, if there were errors
//				if(!errorMsgs.isEmpty()){
//					// 含有輸入格式錯誤的newsdetailVO物件,也存入req
//					req.setAttribute("newsdetailVO", newsdetailVO);
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/back/newsdetail/add_news.jsp");
//					failureView.forward(req, res);
//					return;
//				}
				
				/***************************2.開始新增資料***************************************/
				
				NewsdetailService newsdetailSvc = new NewsdetailService();
				newsdetailVO = newsdetailSvc.addNews(newstitle, newsintro, empno, coverpic, status);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back/newsdetail/AllNews.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllNews.jsp
				successView.forward(req,res);	
//				
//			} catch(Exception e){
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/back/newsdetail/add_news.jsp");
//				failureView.forward(req,res);
//			}
			
		}
		
		
/************************************** update **********************************************************************************/		

		if ("update".equals(action)) { // 來自update_newsdetail_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); 
			String whichPage = req.getParameter("whichPage"); // 送出修改的來源網頁的第幾頁(只用於:istAllNews.jsp)
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
				String newsno = req.getParameter("newsno").trim();
	System.out.println("========================" +newsno);	
	
				String newstitle = new String(req.getParameter("newstitle").trim());
	System.out.println("========================" + newstitle);
				
				String newsintro = req.getParameter("newsintro").trim();
				
System.out.println("修改 newsintro----" +newsintro);		

				
				String empno = new String(req.getParameter("empno"));
	System.out.println("========================" + empno);
				
				// 就是你啦 圖片
				byte[] coverpic = null;
				Part part = req.getPart("coverpic");
			    try {
			    	if (part.getSize() != 0 ){   // 如果有新圖
			          coverpic = getPictureByteArray(part);
			    	}else {
			    		NewsdetailService newsdetailSvc = new NewsdetailService();
						NewsdetailVO newsdetailVO = newsdetailSvc.getOneNews(newsno);
					    coverpic = newsdetailVO.getCoverpic();
			    	}
			   
			    } catch (Exception e) {
			    	e.printStackTrace();
			    }
			    
			    System.out.println("========================" + coverpic);
			
			    
				Timestamp newsdate = new Timestamp(System.currentTimeMillis());
				String status = new String(req.getParameter("status"));
				
				
				NewsdetailVO newsdetailVO = new NewsdetailVO();
				newsdetailVO.setNewsno(newsno);
				newsdetailVO.setNewstitle(newstitle);
				newsdetailVO.setNewsintro(newsintro);
				newsdetailVO.setEmpno(empno);
				newsdetailVO.setCoverpic(coverpic);
				newsdetailVO.setNewsdate(newsdate);
				newsdetailVO.setStatus(status);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("newsdetailVO", newsdetailVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back/newsdetail/update_news.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				NewsdetailService newsdetailSvc = new NewsdetailService();
				newsdetailVO = newsdetailSvc.updateNews(newsno, newstitle, newsintro, empno ,coverpic ,newsdate, status);
	System.out.println("========================準備轉交" + newsno);
			
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("newsdetailVO", newsdetailVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = requestURL+"?whichPage="+whichPage+"&newsno="+newsno;
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/newsdetail/update_news.jsp");
				failureView.forward(req, res);
			}
		}
		
/************************************** getOne_For_Display **********************************************************************************/		
				
		if("getOne_For_Display".equals(action)){ // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String newsno = req.getParameter("newsno");
				System.out.println(newsno);

				
				/***************************2.開始查詢資料*****************************************/
				NewsdetailService newsdetailSvc = new NewsdetailService();
				NewsdetailVO newsdetailVO = newsdetailSvc.getOneNews(newsno);
				
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(newsdetailVO);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
		        out.println(responseJSONObject); 
		        System.out.println(responseJSONObject);
		        out.flush();
	            out.close();
				
				
//				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("newsdetailVO", newsdetailVO); // 資料庫取出的newsdetailVO物件,存入req
//				String url = "/back/newsdetail/listOneNewsdetail.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
//				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch(Exception e){
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/newsdetail/AllNews.jsp");
				failureView.forward(req, res);	
				
			}
			
		}
		
/************************************** getOne_For_Display_Front **********************************************************************************/		
		
		if("getOne_For_Display_Front".equals(action)){   //來自/front/news.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			
			try{
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String newsno = req.getParameter("newsno");
	
				
				/***************************2.開始查詢資料*****************************************/
				NewsdetailService newsdetailSvc = new NewsdetailService();
				NewsdetailVO newsdetailVO = newsdetailSvc.getOneNews(newsno);
				

				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("newsdetailVO", newsdetailVO); // 資料庫取出的newsdetailVO物件,存入req
				String url = "/front/newsdetail/OneNew.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch(Exception e){
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front/newsdetail/allNews.jsp");
				failureView.forward(req, res);	
				
			}
		}
				
		
/************************************** getOne_For_Update **********************************************************************************/		
	
		if ("getOne_For_Update".equals(action)) { // 來自listAllNewsdetail.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL");
			String whichPage = req.getParameter("whichPage");
			
			try {
				/***************************1.接收請求參數****************************************/
				String newsno = req.getParameter("newsno");
				
	System.out.println("準備修改: " + newsno);			
				/***************************2.開始查詢資料****************************************/
				NewsdetailService newsdetailSvc = new NewsdetailService();
				NewsdetailVO newsdetailVO = newsdetailSvc.getOneNews(newsno);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("newsdetailVO", newsdetailVO);         // 資料庫取出的newsdetailVO物件,存入req
				String url = "/back/newsdetail/update_news.jsp";
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
			String requestURL = req.getParameter("requestURL"); 
	
			try {
				/***************************1.接收請求參數***************************************/
				String newsno = req.getParameter("newsno");
				
				/***************************2.開始刪除資料***************************************/
				NewsdetailService newsdetailSvc = new NewsdetailService();
				newsdetailSvc.deleteNews(newsno);
System.out.println("刪除"+ newsno);
				
				String responseJSONObject ="";
				Gson gson=  new Gson();
				responseJSONObject = gson.toJson(newsno);
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				out.println(responseJSONObject); 
				System.out.println(responseJSONObject);
				out.flush();
				out.close();





//				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
//				String url = requestURL;
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//				successView.forward(req, res);
//				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/newsdetail/AllNews.jsp");
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


