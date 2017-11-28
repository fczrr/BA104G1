package com.setmeal.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.dish.model.DishService;
import com.dish.model.DishVO;
import com.setmeal.model.SetMealService;
import com.setmeal.model.SetMealVO;

import oracle.sql.DATE;

@MultipartConfig()
public class SetMealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		String action = req.getParameter("action");
		
		

		if("insertMenu".equals(action)){
			String jsonStr=req.getParameter("test");
			System.out.println(jsonStr);
			
			try {
				JSONArray jsonArray = new JSONArray(jsonStr);
				for(int i=0;i<jsonArray.length();i++){
					JSONObject jsonObject=jsonArray.getJSONObject(i);
					String date=jsonObject.getString("date");
					String time=jsonObject.getString("time");
					String dish=jsonObject.getString("dish");
					System.out.println(date);
					System.out.println(time);
					System.out.println(dish);
				}				
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		
		
		
		
		
		

		if ("update".equals(action)) {// 來自update_dish_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer smNo = new Integer(req.getParameter("smNo").trim());
				System.out.println(smNo);
				String smName = req.getParameter("smName");
				System.out.println(smName);
				if (smName == null || smName.trim().length() == 0) {
					errorMsgs.add("套餐名稱: 請勿空白");
				}

				String smIntro = req.getParameter("smIntro");
				System.out.println(smIntro);
				Integer smPrice = Integer.parseInt(req.getParameter("smPrice"));
				System.out.println(smPrice);
				Integer supply = Integer.parseInt(req.getParameter("supply"));
				System.out.println(supply);
				byte[] smPic1 = null;
				Part smPicPart1 = req.getPart("smPic1");
				if (getFileNameFromPart(smPicPart1) == null) {
					SetMealService setMealSvc2 = new SetMealService();
					SetMealVO setMealVO2 = setMealSvc2.getOneSetMeal(smNo);
					smPic1 = setMealVO2.getSmPic1();
				} else {
					InputStream is = smPicPart1.getInputStream();

					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					byte[] buffer = new byte[1024 * 8];
					int length = 0;

					while ((length = is.read(buffer)) != -1) {
						baos.write(buffer, 0, length);
					}

					smPic1 = baos.toByteArray();

					baos.close();
					is.close();
				}
				System.out.println(smPic1);

				byte[] smPic2 = null;
				Part smPicPart2 = req.getPart("smPic2");
				if (getFileNameFromPart(smPicPart2) == null) {
					SetMealService setMealSvc3 = new SetMealService();
					SetMealVO setMealVO3 = setMealSvc3.getOneSetMeal(smNo);
					smPic2 = setMealVO3.getSmPic2();
				} else {
					InputStream is = smPicPart2.getInputStream();

					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					byte[] buffer = new byte[1024 * 8];
					int length = 0;

					while ((length = is.read(buffer)) != -1) {
						baos.write(buffer, 0, length);
					}

					smPic2 = baos.toByteArray();

					baos.close();
					is.close();
				}
				System.out.println(smPic2);
				byte[] smPic3 = null;
				Part smPicPart3 = req.getPart("smPic3");
				if (getFileNameFromPart(smPicPart3) == null) {
					SetMealService setMealSvc4 = new SetMealService();
					SetMealVO setMealVO4 = setMealSvc4.getOneSetMeal(smNo);
					smPic3 = setMealVO4.getSmPic3();
				} else {
					InputStream is = smPicPart3.getInputStream();

					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					byte[] buffer = new byte[1024 * 8];
					int length = 0;

					while ((length = is.read(buffer)) != -1) {
						baos.write(buffer, 0, length);
					}

					smPic3 = baos.toByteArray();

					baos.close();
					is.close();
				}
				System.out.println(smPic3);
				System.out.println("start");
				SetMealVO setMealVO = new SetMealVO();
				setMealVO.setSmNo(smNo);
				setMealVO.setSmName(smName);
				setMealVO.setSmPrice(smPrice);
				setMealVO.setSupply(supply);
				setMealVO.setSmPic1(smPic1);
				setMealVO.setSmPic2(smPic2);
				setMealVO.setSmPic3(smPic3);
				setMealVO.setSmIntro(smIntro);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("setMealVO", setMealVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back/SetMeal/update_setMeal_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				/*************************** 2.開始修改資料 *****************************************/
				SetMealService setMealSvc = new SetMealService();
				System.out.println("start update");
				setMealVO = setMealSvc.updateSetMeal(smNo, smName, smPrice, supply, smPic1, smPic2, smPic3, smIntro);
				/***************************
				 * 3.修改完成,準備轉交(Send the Success view)
				 *************/
				req.setAttribute("setMealVO", setMealVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back/setMeal/listAllSetMeal.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneSetMeal.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				// errorMsgs.add("修改資料失敗:" + e.getMessage());
				// RequestDispatcher failureView =
				// req.getRequestDispatcher("/back/SetMeal/update_setMeal_input.jsp");
				// failureView.forward(req, res);
				e.printStackTrace();
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllSetMeal.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer smNo = new Integer(req.getParameter("smNo"));

				/*************************** 2.開始查詢資料 ****************************************/
				SetMealService setMealSvc = new SetMealService();
				SetMealVO setMealVO = setMealSvc.getOneSetMeal(smNo);

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 ************/
				req.setAttribute("setMealVO", setMealVO); // 資料庫取出的setMealVO物件,存入req
				String url = "/back/SetMeal/update_setMeal2_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
																				// update_setMeal_input.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back/dish/listAllSetMeal2.jsp");
				failureView.forward(req, res);

			}
		}

		if ("getOne_For_Display".equals(action)) { // 來自index.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/

				String str = req.getParameter("smNo");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入套餐編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back/SetMeal/index.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer smNo = null;
				try {
					smNo = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("套餐編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back/SetMeal/index.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				SetMealService setMealSvc = new SetMealService();
				SetMealVO setMealVO = setMealSvc.getOneSetMeal(smNo);
				if (setMealVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back/SetMeal/index.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/
				req.setAttribute("setMealVO", setMealVO); // 資料庫取出的dishVO物件,存入req
				String url = "/back/SetMeal/listOneSetMeal.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
																				// listOneDish.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back/SetMeal/index.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) { // 來自addSetMeal.jsp的請求

			String smName = req.getParameter("smName");
			Integer smPrice = Integer.parseInt(req.getParameter("smPrice"));
			Integer supply = Integer.parseInt(req.getParameter("supply"));
			String dishType = req.getParameter("dishType");

			InputStream is1 = req.getPart("smPic1").getInputStream();
			ByteArrayOutputStream baos1 = new ByteArrayOutputStream();
			byte[] buffer1 = new byte[1024 * 8];
			int length1 = 0;
			while ((length1 = is1.read(buffer1)) != -1) {
				baos1.write(buffer1, 0, length1);
			}
			byte[] smPic1 = baos1.toByteArray();

			InputStream is2 = req.getPart("smPic2").getInputStream();
			ByteArrayOutputStream baos2 = new ByteArrayOutputStream();
			byte[] buffer2 = new byte[1024 * 8];
			int length2 = 0;
			while ((length2 = is2.read(buffer2)) != -1) {
				baos2.write(buffer2, 0, length2);
			}
			byte[] smPic2 = baos2.toByteArray();

			InputStream is3 = req.getPart("smPic3").getInputStream();
			ByteArrayOutputStream baos3 = new ByteArrayOutputStream();
			byte[] buffer3 = new byte[1024 * 8];
			int length3 = 0;
			while ((length3 = is3.read(buffer3)) != -1) {
				baos3.write(buffer3, 0, length3);
			}
			byte[] smPic3 = baos3.toByteArray();

			String smIntro = req.getParameter("smIntro");

			SetMealVO setMealVO = new SetMealVO();
			setMealVO.setSmName(smName);
			setMealVO.setSmPrice(smPrice);
			setMealVO.setSupply(supply);
			setMealVO.setSmPic1(smPic1);
			setMealVO.setSmPic2(smPic2);
			setMealVO.setSmPic3(smPic3);
			setMealVO.setSmIntro(smIntro);

			baos3.close();
			is3.close();
			baos2.close();
			is2.close();
			baos1.close();
			is1.close();

			/*************************** 2.開始新增資料 ***************************************/
			SetMealService setMealSvc = new SetMealService();
			setMealVO = setMealSvc.addSetMeal(smName, smPrice, supply, smPic1, smPic2, smPic3, smIntro);
			/***************************
			 * 3.新增完成,準備轉交(Send the Success view)
			 ***********/

			String url = "/back/SetMeal/listAllSetMeal.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllDish.jsp
			successView.forward(req, res);

		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("i'm here1");

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer smNo = new Integer(req.getParameter("smNo"));
				
				/*************************** 2.開始刪除資料 ***************************************/
				SetMealService setMealSvc = new SetMealService();
				
				setMealSvc.deleteSetMeal(smNo);
				
				/***************************
				 * 3.刪除完成,準備轉交(Send the Success view)
				 ***********/
				String url = "/back/SetMeal/listAllSetMeal2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
			}

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
