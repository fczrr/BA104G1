package com.dish.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dish.model.*;

@MultipartConfig()

public class DishServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String action2=new String(action.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(action2);
		if ("listDishes_ByType".equals(action2)) {
			
			/*************************** 1.接收請求參數 ****************************************/
			String dishType = req.getParameter("dishType");
			String dishType2=new String(dishType.getBytes("ISO-8859-1"),"UTF-8");

			/*************************** 2.開始查詢資料 ****************************************/
			DishService dishSvc = new DishService();
			List<DishVO> list = dishSvc.getByType(dishType2);
			req.setAttribute("list", list);

			/***************************
			 * 3.修改完成,準備轉交(Send the Success view)
			 *************/
			String url = "back/dish/listAllDish.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		String action = req.getParameter("action");

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer dishNo = new Integer(req.getParameter("dishNo"));

				/*************************** 2.開始刪除資料 ***************************************/
				DishService dishSvc = new DishService();
				dishSvc.deleteDish(dishNo);

				/***************************
				 * 3.刪除完成,準備轉交(Send the Success view)
				 ***********/
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back/dish/listAllDish.jsp");
				failureView.forward(req, res);
			}
		}
		if ("insert".equals(action)) { // 來自addDish.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				// 菜色名稱
				String dishName = req.getParameter("dishName");
				if (dishName == null || (dishName.trim()).length() == 0) {
					errorMsgs.add("請輸入菜色名稱");
				}

				// 菜色介紹
				String dishIntro = req.getParameter("dishIntro");
				if (dishIntro == null || (dishIntro.trim()).length() == 0) {
					errorMsgs.add("請輸入菜色介紹");
				}

				// 菜色類別
				String dishType = req.getParameter("dishType").trim();

				// 菜色圖片
				byte[] dishPic = null;
				InputStream is;
				ByteArrayOutputStream baos;
				is = req.getPart("dishPic").getInputStream();
				baos = new ByteArrayOutputStream();
				byte[] buffer = new byte[1024 * 8];
				int length = 0;

				while ((length = is.read(buffer)) != -1) {
					baos.write(buffer, 0, length);
				}
				dishPic = baos.toByteArray();
				baos.close();
				is.close();
				if(dishPic==null||dishPic.length==0){
					errorMsgs.add("請上傳菜色圖片");
				}
				

				DishVO dishVO = new DishVO();
				dishVO.setDishName(dishName);
				dishVO.setDishPic(dishPic);
				dishVO.setDishIntro(dishIntro);
				dishVO.setDishType(dishType);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("dishVO", dishVO); 
					
					RequestDispatcher failureView = req.getRequestDispatcher("/back/dish/addDish.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				DishService dishSvc = new DishService();
				dishVO = dishSvc.addDish(dishName, dishPic, dishIntro, dishType);

				/*****************************
				 * 3.新增完成,準備轉交(Send the Success view)
				 ***********/
				String url = null;
				if(dishType.equals("米食")){
					url="/back/dish/listAllDishByRice.jsp";
				}else if(dishType.equals("主食")){
					url="/back/dish/listAllDishByMain.jsp";
				}else if(dishType.equals("湯品")){
					url="/back/dish/listAllDishBySoup.jsp";
				}else if(dishType.equals("蔬食")){
					url="/back/dish/listAllDishByVegetable.jsp";
				}else if(dishType.equals("甜品")){
					url="/back/dish/listAllDishByDessert.jsp";
				}else if(dishType.equals("飲品")){
					url="/back/dish/listAllDishByDrink.jsp";
				}
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllDish.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("back/dish/addDish.jsp");
				failureView.forward(req, res);
			}

		}

		if ("getOne_For_Display".equals(action))

		{ // 來自index.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/

				String str = req.getParameter("dishNo");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入菜色編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back/dish/index.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer dishNo = null;
				try {
					dishNo = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("菜色編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back/dish/index.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				DishService dishSvc = new DishService();
				DishVO dishVO = dishSvc.getOneDish(dishNo);
				if (dishVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back/dish/index.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/
				req.setAttribute("dishVO", dishVO); // 資料庫取出的dishVO物件,存入req
				String url = "/back/dish/listOneDish.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
																				// listOneDish.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back/dish/index.jsp");
				failureView.forward(req, res);
			}

		}
		if ("getOne_For_Update".equals(action)) { // 來自listAllDish.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer dishNo = new Integer(req.getParameter("dishNo"));

				/*************************** 2.開始查詢資料 ****************************************/
				DishService dishSvc = new DishService();
				DishVO dishVO = dishSvc.getOneDish(dishNo);

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 ************/
				req.setAttribute("dishVO", dishVO); // 資料庫取出的dishVO物件,存入req
				String url = "/back/dish/update_dish_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
																				// update_dish_input.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);

			}
		}
		if ("update".equals(action)) {// 來自update_dish_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");

			try {
				Integer dishNo = new Integer(req.getParameter("dishNo").trim());
				String dishName = req.getParameter("dishName");

				if (dishName == null || dishName.trim().length() == 0) {
					errorMsgs.add("菜色名稱: 請勿空白");
				}

				String dishIntro = req.getParameter("dishIntro");
				String dishType = req.getParameter("dishType").trim();

				byte[] dishPic = null;

				Part dishPicPart = req.getPart("dishPic");
				if (getFileNameFromPart(dishPicPart) == null) {
					DishService dishSvc2 = new DishService();
					DishVO dishVO2 = dishSvc2.getOneDish(dishNo);
					dishPic = dishVO2.getDishPic();

				} else {
					InputStream is = dishPicPart.getInputStream();

					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					byte[] buffer = new byte[1024 * 8];
					int length = 0;

					while ((length = is.read(buffer)) != -1) {
						baos.write(buffer, 0, length);
					}

					dishPic = baos.toByteArray();

					baos.close();
					is.close();
				}
				DishVO dishVO = new DishVO();
				dishVO.setDishNo(dishNo);
				dishVO.setDishName(dishName);
				dishVO.setDishPic(dishPic);
				dishVO.setDishIntro(dishIntro);
				dishVO.setDishType(dishType);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("dishVO", dishVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back/dish/update_dish_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				/*************************** 2.開始修改資料 *****************************************/
				DishService dishSvc = new DishService();
				dishVO = dishSvc.updateDish(dishNo, dishName, dishPic, dishIntro, dishType);
				/***************************
				 * 3.修改完成,準備轉交(Send the Success view)
				 *************/
				req.setAttribute("dishVO", dishVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back/dish/update_dish_input2.jsp");
				failureView.forward(req, res);
			}
		}

		if ("listDishes_ByType".equals(action)) {

			/*************************** 1.接收請求參數 ****************************************/
			String dishType = req.getParameter("dishType");

			/*************************** 2.開始查詢資料 ****************************************/
			DishService dishSvc = new DishService();
			List<DishVO> list = dishSvc.getByType(dishType);
			req.setAttribute("list", list);

			/***************************
			 * 3.修改完成,準備轉交(Send the Success view)
			 *************/
			String url = "/back/dish/listAllDishByType.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

	}

	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}
