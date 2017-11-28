package com.detail.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.detail.promotion.ProService;
import com.detail.promotion.ProVO;
import com.shop.model.ShopService;
import com.shop.model.ShopVO;

public class ProServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("in /pro.do");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {// 來自listallpro.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String str = req.getParameter("ITEMNO");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}



				/*************************** 2.開始查詢資料 *****************************************/
				ProService proSvc = new ProService();
				List<ProVO> proVO =  proSvc.getOneEmpbyString(str);
				if (proVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("proVO", proVO); // 資料庫取出的empVO物件,存入req
				String url = "/Promotion/listonepro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/mainforpro.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Display2".equals(action)) {// 來自listallpro.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String str = req.getParameter("ITEMNO");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}

				/*************************** 2.開始查詢資料 *****************************************/
				ProService proSvc = new ProService();
				ProVO proVO =  proSvc.getOneEmpForStringName(str);
				if (proVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Promotion/listoneProForName.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("SeachForOneProShop", proVO); // 資料庫取出的empVO物件,存入req
				//String url = "/Promotion/listoneProForName.jsp";
				String url = "/front/SearchForProShop.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Promotion/listoneProForName.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("GET_ONE_FOR_BACKPRO".equals(action)) {// 來自listallpro.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String str = req.getParameter("ITEMNO");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/
				ProService proSvc = new ProService();
				ProVO proVO =  proSvc.getOneEmpForStringName(str);
				if (proVO == null) {
					errorMsgs.add("查無資料");
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("SeachForOneProShop", proVO); // 資料庫取出的empVO物件,存入req
				//String url = "/Promotion/listoneProForName.jsp";
				String url = "/back/production/BA104G1_back_ShopProSearchForResult.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/production/BA104G1_back_ShopProSearchForResult.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("getOne_For_Display3".equals(action)) {// 來自listallpro.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String str = req.getParameter("PRONO");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				
				Integer empno = null;
				try {
					empno = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("商品編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}


				/*************************** 2.開始查詢資料 *****************************************/
				ProService proSvc = new ProService();
				ProVO proVO =  proSvc.getOneOnItemNO(empno);
				if (proVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("proVO", proVO); // 資料庫取出的empVO物件,存入req
				String url = "/Promotion/listoneProForName.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/mainforpro.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllPro.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer PRONO = new Integer(req.getParameter("ITEMNO"));
				
				/***************************2.開始查詢資料****************************************/
				ProService proSvc = new ProService();
				ProVO proVO = proSvc.getOneEmp(PRONO);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("proVO", proVO);         // 資料庫取出的empVO物件,存入req
				String url = "/Promotion/update_pro_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_pro_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println("getOne_For_Update跳錯了");
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Promotion/listAllPro.jsp");
				failureView.forward(req, res);
			}
		}
		//到目前為止還沒有傳日期進去要記得實做
		if ("update".equals(action)) {	// 來自update_pro_input.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String NAME = req.getParameter("NAME").trim();
				Integer ITEMNO =new Integer(req.getParameter("ITEMNO"));
				//字串轉Integer再轉Long
				Long BEGINDATE = new Long(req.getParameter("BEGINDATE"));
				Long ENDDATE = new Long(req.getParameter("ENDDATE"));
			
				Integer PROMOTIOMNO=new Integer(req.getParameter("PROMOTIOMNO"));
				
				int PRICE = 0;
				try {
					PRICE =new Integer(req.getParameter("PRICE").trim());
				} catch (NumberFormatException e) {
					PRICE = 0;
					errorMsgs.add("填入產品價格");
				}
				ProVO proVO = new ProVO();
				//不需要import寫法
				proVO.setBEGINDATE(new java.sql.Date(BEGINDATE*1000L));
				proVO.setENDDATE(new java.sql.Date(ENDDATE*1000L));
				proVO.setNAME(NAME);
				proVO.setPRICE(PRICE);
				proVO.setITEMNO(ITEMNO);
				proVO.setPROMOTIOMNO(PROMOTIOMNO);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("proVO", proVO); // 含有輸入格式錯誤的proVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Promotion/update_pro_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				//重複做避免兩次錯誤同時產生輸出字串格式不正確
				if(BEGINDATE>ENDDATE) {
					
					errorMsgs.add("日期格式不正確:開始時間比結束時間晚");
				}
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("proVO", proVO); // 含有輸入格式錯誤的proVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Promotion/update_pro_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				ProService proSvc = new ProService();
				System.out.println("pro修改資料前");
				proVO = proSvc.updateEmp(NAME, PROMOTIOMNO, PRICE, ITEMNO,new java.sql.Date(BEGINDATE*1000L),new java.sql.Date(ENDDATE*1000L));
				System.out.println("pro修改資料後");
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("proVO", proVO); // 資料庫update成功後,正確的的proVO物件,存入req
				String url = "/Promotion/listoneProForName.jsp";
				System.out.println("PROSERVLET成功FORWARED TO  LISTONEPRO");
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				System.out.println("進入了*其他可能的錯誤處理*");
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Promotion/update_pro_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("addpromotion".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("進入addpromotion");
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
				String NAME = req.getParameter("NAME");
				if (NAME == null || (NAME.trim()).length() == 0) {
					errorMsgs.add("請輸入商品名稱");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Promotion/addpromotion.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				//字串轉Integer再轉Long
				Long BEGINDATE = new Long(req.getParameter("BEGINDATE"));
				Long ENDDATE = new Long(req.getParameter("ENDDATE"));
			
				ProVO proVO = new ProVO();
				//不需要import寫法
				proVO.setBEGINDATE(new java.sql.Date(BEGINDATE*1000L));
				proVO.setENDDATE(new java.sql.Date(ENDDATE*1000L));
				proVO.setNAME(NAME);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("proVO", proVO); // 含有輸入格式錯誤的proVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Promotion/addpromotion.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				//重複做避免兩次錯誤同時產生輸出字串格式不正確
				if(BEGINDATE>ENDDATE) {
					errorMsgs.add("日期格式不正確:開始時間比結束時間晚");
				}
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("proVO", proVO); // 含有輸入格式錯誤的proVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Promotion/addpromotion.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				ProService proSvc = new ProService();
				//傳入是秒數 DATE*1000L
				proVO = proSvc.addPro(NAME, new java.sql.Date(BEGINDATE*1000L),new java.sql.Date(ENDDATE*1000L));
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("proVO", proVO); // 資料庫update成功後,正確的的proVO物件,存入req
				String url = "/Promotion/listAllPromotion.jsp";
				System.out.println("PROSERVLET成功FORWARED TO  listAllPro");
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				System.out.println("進入了*其他可能的錯誤處理*");
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Promotion/addpromotion.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("delete".equals(action)) { // 來自listAllPro.do,listonepro.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO"));
				
				/***************************2.開始刪除資料***************************************/
				ShopService empSvc = new ShopService();
				empSvc.deleteEmp(ITEMNO);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/Promotion/listAllPro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Promotion/listAllPro.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("PUTINPROJECT".equals(action)) {// 來自listallpro.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO"));
				Integer PRICE =new Integer(req.getParameter("PRICE"));
				String DES =req.getParameter("DES");
				/*************************** 2.開始查詢資料 *****************************************/
				ProService proSvc = new ProService();
				ProVO proVOproject =  proSvc.getProProjectNow();
				proVOproject.setPRICE(PRICE);
				proVOproject.setITEMNO(ITEMNO);
				proVOproject.setDES(DES);
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("proVOproject", proVOproject); // 資料庫取出的empVO物件,存入req
				String url ="/back/production/BA104G1_back_ShopAddToPROJECT.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/production/BA104G1_back_ShopAddToPROJECT.jsp");
				failureView.forward(req, res);
			}
		}
		if ("addtopromotion".equals(action)) {// 來自listallpro.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO"));
				Integer PRICE =new Integer(req.getParameter("PRICE"));
				Integer NEWPRICE =new Integer(req.getParameter("NEWPRICE"));
				Integer PROMOTIOMNO =new Integer(req.getParameter("PROMOTIOMNO"));
				String DES =req.getParameter("DES");
				
				ProService proSvc = new ProService();
				ProVO proVOproject =  proSvc.getProProjectNow();
				proVOproject.setPRICE(PRICE);
				proVOproject.setITEMNO(ITEMNO);
				proVOproject.setDES(DES);
				req.setAttribute("proVOproject", proVOproject);
				if(NEWPRICE>PRICE) {
					errorMsgs.add("<div style='font-size:50px;text-align: center;' class='alert alert-danger alert-dismissible' role='alert'>"
							+ "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span style='font-size:80px; aria-hidden='true'>"+
							"&times;</span></button>促銷商品價格不得高於原價!</div>");
				}
				
				if (!errorMsgs.isEmpty()) {
				 // 含有輸入格式錯誤的proVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back/production/BA104G1_back_ShopAddToPROJECT.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				/*************************** 2.開始做事*****************************************/
				proSvc.putShopInPromotion(PROMOTIOMNO, ITEMNO, NEWPRICE);
					
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("proVOproject", proVOproject); // 資料庫取出的empVO物件,存入req
				String url ="/back/production/BA104G1_back_ShopProSearch.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
				
			} catch (Exception e) {
				System.out.println(e);
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back/production/BA104G1_back_ShopAddToPROJECT.jsp");
				failureView.forward(req, res);
			}
		}
		
	}

}