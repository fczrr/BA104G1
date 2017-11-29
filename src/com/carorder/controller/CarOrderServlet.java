package com.carorder.controller;

import java.io.*;
import java.sql.*;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.carschedul.model.CarSchedulService;
import com.carschedul.model.CarSchedulVO;
import com.cartype.model.CarTypeService;
import com.cartype.model.CarTypeVO;
import com.google.gson.Gson;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.vehicle.model.VehicleVO;
import com.cardetail.model.*;
import com.carorder.model.CarOrderService;
import com.carorder.model.CarOrderVO;

public class CarOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		
		
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑:
																// 可能為【/emp/listAllEmp.jsp】
																// 或
																// 【/dept/listEmps_ByDeptno.jsp】
																// 或 【
																// /dept/listAllDept.jsp】
																// 或 【
																// /emp/listEmps_ByCompositeQuery.jsp】

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String order_no = req.getParameter("order_no").trim();
				String order_status = req.getParameter("order_status").trim();
			
				/*************************** 2.開始修改資料 *****************************************/
				CarOrderService carorderSvc = new CarOrderService();
				carorderSvc.updateCarOrder(order_no,order_status);
				/***************************
				 * 3.修改完成,準備轉交(Send the Success view)
				 *************/
				CarOrderVO carorderVO = carorderSvc.getOneCarOrder(order_no);
				String new_order_status =carorderVO.getOrder_status();
				JSONObject myObj = new JSONObject();
				try {
					myObj.put("orderStatus", new_order_status);
				} catch (JSONException e) {

					e.printStackTrace();
				}

				PrintWriter out = res.getWriter();

				out.write(myObj.toString());
				System.out.println(myObj.toString());
				out.flush();
				out.close();
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/cardetail/update_cardetail_input.jsp");
				failureView.forward(req, res);
			}
		}

		
		

	}
}
