package com.android.mealOrder.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.android.hcOrderMaster.model.HcOrderMasterService;
import com.android.hcOrderMaster.model.HcOrderMasterVO;
import com.android.mealOrder.model.MealOrderService;
import com.android.mealOrder.model.MealOrderVO;
import com.android.mealOrderDetail.model.MealOrderDetailVO;
import com.android.member.model.MemberService;
import com.android.member.model.MemberVO;
import com.android.setMeal.model.SetMealService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;


public class MealOrderController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		
		BufferedReader br = req.getReader();
		StringBuilder sb = new StringBuilder();
		String str = null;
		while((str=br.readLine())!=null){
			sb.append(str);
		}
		
		
		String action = req.getParameter("action");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").create();
		
		if("".equals(action)){
			
			MealOrderVO orderVO = gson.fromJson(sb.toString(),MealOrderVO.class);
			
			SetMealService setMealSvc = new SetMealService();
			MealOrderService orderSvc = new MealOrderService();
			MemberService memSvc = new MemberService();
			
			MemberVO memberVO =memSvc.getOneMemByNo(orderVO.getMemNo());
			List<MealOrderDetailVO> detailList = orderVO.getDetailList();
			
			Integer memPoint = memberVO.getPoint();
			Integer mealPrice= setMealSvc.getOneByNo(detailList.get(0).getSmNo()).getSmPrice()*detailList.size()*detailList.get(0).getOrderQty();
			JsonObject status = new JsonObject();
		
			
			if(memPoint>=mealPrice){
				System.out.println("送餐訂單價格:"+String.valueOf((setMealSvc.getOneByNo(detailList.get(0).getSmNo()).getSmPrice()*detailList.size()*detailList.get(0).getOrderQty())));
				memberVO.setPoint(memPoint-mealPrice);
				orderSvc.addMealOrder(orderVO,memberVO);
				status.addProperty("status", "success");
			}else{
				status.addProperty("status", "fail");
			}
			out.println(status.toString());
			out.flush();
		}
		
		if("queryAllMealOrder".equals(action)){
			
			MemberVO memberVO = gson.fromJson(sb.toString(), MemberVO.class);
			System.out.println(memberVO.getMemNo());
			List<MealOrderVO> list = new MealOrderService().findByMemNo(memberVO.getMemNo());
			System.out.println(gson.toJson(list));
			out.write(gson.toJson(list));
			out.flush();
			return;
		}
		if("queryByEmp".equals(action)){
			System.out.println("123");
			List<MealOrderVO> list = new MealOrderService().getAll();
			System.out.println(gson.toJson(list));
			out.write(gson.toJson(list));
			out.flush();
			return;
		}
		
	}
}
