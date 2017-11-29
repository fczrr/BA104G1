package com.mealorder.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mealorder.model.MealOrderService;
import com.mealorder.model.MealOrderVO;
import com.mealorderdetail.model.MealOrderDetailVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.setmeal.model.SetMealService;
import com.setmeal.model.SetMealVO;

public class MealOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String action2=new String(action.getBytes("ISO-8859-1"),"UTF-8");
		
		
		
		
		if("listOrders_ByStatus".equals(action2)){
			String moStatus=req.getParameter("moStatus");
			String moStatus2=new String(moStatus.getBytes("ISO-8859-1"),"UTF-8");
			System.out.println(moStatus2);
			MealOrderService mealOrderSvc=new MealOrderService();
			List<MealOrderVO> list=mealOrderSvc.getByStatus(moStatus2);
			
			
			req.setAttribute("list", list);
			
			String url = "/back/mealOrder/listAllMealOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
			
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		// res.setContentType("text/html;charset=UTF-8");
		String action = req.getParameter("action");
		
		
		if("update_status".equals(action)){
			String moNo=req.getParameter("moNo");
			String moStatus=req.getParameter("moStatus");
			
			
			MealOrderService mealOrderSvc=new MealOrderService();
            mealOrderSvc.updateStatus(moNo, moStatus);
			
            
            
        	String url = "/back/mealOrder/listAllMealOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
		}
		
		
		
		
		
		
		
		
		if ("fill_in_a_form".equals(action)) {
			HttpSession session=req.getSession();
			session.removeAttribute("datesStr");
			
			
			
			Integer smNo = new Integer(req.getParameter("smNo"));
			SetMealService setMealSvc = new SetMealService();
			SetMealVO setMealVO = setMealSvc.getOneSetMeal(smNo);
			Integer smPrice = setMealVO.getSmPrice();
			req.setAttribute("smPrice", smPrice);
            
			Integer breakfast = 0;
			Integer lunch=0;
			Integer dinner=0;
			Set<String> set=new HashSet<>();
			
			String dates=req.getParameter("dates").trim();
			session.setAttribute("datesStr", dates);
			req.setAttribute("dates", dates);
	        System.out.println("dates:"+dates);
	        String[] dates2=dates.split(",");
	       
	        for(String str:dates2){
	        	System.out.println(str);
	        }
		    	
		
            for(int i=0;i<dates2.length;i++){
            	if(dates2[i].contains("早")){
            		breakfast++;
            	}
            	if(dates2[i].contains("中")){
            		lunch++;
            	}
            	if(dates2[i].contains("晚")){
            		dinner++;
            	}
            	String day=new String();
            	day=dates2[i].substring(0,10);
            	set.add(day);
            	System.out.println(day);
            	System.out.println(dates2[i]);
            }
		
            System.out.println("breakfast"+breakfast);
            System.out.println("lunch"+lunch);
            System.out.println("dinner"+dinner);
            

			Integer days = set.size();
			System.out.println(days);
			req.setAttribute("days", days);

			Integer orderQty = new Integer(req.getParameter("orderQty"));


			
            Integer totalBreakfast=breakfast*orderQty;
		    req.setAttribute("totalBreakfast", totalBreakfast);
           
		    Integer totalLunch=lunch*orderQty;
			req.setAttribute("totalLunch",totalLunch);


            Integer totalDinner=dinner*orderQty;
			req.setAttribute("totalDinner", totalDinner);

			Integer totalMeals = totalBreakfast + totalLunch + totalDinner;
			req.setAttribute("totalMeals", totalMeals);

			Integer totalPrice = smPrice * totalMeals;
			req.setAttribute("totalPrice", totalPrice);

			String url = "/front/mealService/FileInAForm.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}

		if ("insert".equals(action)) {
			System.out.println("進來訂單新增");

			HttpSession session = req.getSession();
			session.removeAttribute("datesStr");
			MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

			Integer smNo = new Integer(req.getParameter("smNo"));
            System.out.println(smNo);
			
		    String dates=req.getParameter("dates").trim();
		    String[] dates2=dates.split(",");		    
	
			Integer orderQty = new Integer(req.getParameter("orderQty").trim());
			String memNo = memberVO.getMemNo();
			String rcptName = req.getParameter("rcptName").trim();
			String rcptAdd = req.getParameter("rcptAdd").trim();
			String rcptPhone = req.getParameter("rcptPhone").trim();

			Integer totalPrice = new Integer(req.getParameter("totalPrice"));
			Integer memberPoint = memberVO.getPoint();

			if (memberPoint > totalPrice) {
			    System.out.println("進來點數判斷");
				MealOrderVO mealOrderVO = new MealOrderVO();
				mealOrderVO.setMemNo(memNo);
				mealOrderVO.setRcptName(rcptName);
				mealOrderVO.setRcptAdd(rcptAdd);
				mealOrderVO.setRcptPhone(rcptPhone);
				List<MealOrderDetailVO> list = new ArrayList<>();
				for (int i = 0; i < dates2.length; i++) {
					MealOrderDetailVO mealOrderDetailVO = new MealOrderDetailVO();
					mealOrderDetailVO.setDeliverDate(java.sql.Date.valueOf(dates2[i].trim().substring(0,10)));
					mealOrderDetailVO.setMealTime(dates2[i].trim().substring(11, 13));
					mealOrderDetailVO.setSmNo(smNo);
					mealOrderDetailVO.setOrderQty(orderQty);
					list.add(mealOrderDetailVO);
				}
                System.out.println("開使新增第訂單");
				MealOrderService mealOrderSvc = new MealOrderService();
				mealOrderSvc.addMealOrder(mealOrderVO, list);

				MemberService memberSvc = new MemberService();
				memberSvc.updatePoint((memberPoint - totalPrice), memberVO.getMemNo());
				
			    session.removeAttribute("memberVO");
			    session.setAttribute("memberVO", memberSvc.findByPrimaryKey(memNo));
				

			}

//			String url = "/front/mealService/OrderSuccess.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);
//			successView.forward(req, res);

		}

		if ("get_All_mealOrder_ByMember".equals(action)) {
			String memNo = req.getParameter("memNo");

			MealOrderService mealOrderSvc = new MealOrderService();
			List<MealOrderVO> list = mealOrderSvc.getByMember(memNo);
			req.setAttribute("list", list);

			String url = "/back/MealOrder/listAllMealOrderByMember.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}
	}

}
