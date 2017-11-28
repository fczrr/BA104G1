package com.mealorderdetail.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mealorderdetail.model.MealOrderDetailService;
import com.mealorderdetail.model.MealOrderDetailVO;

/**
 * Servlet implementation class MealOrderDetailServlet
 */
@WebServlet("/MealOrderDetailServlet")
public class MealOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("get_AllDetail_ByNo".equals(action)) {
			String moNo = req.getParameter("moNo");

			MealOrderDetailService mealOrderDetialSvc = new MealOrderDetailService();
			List<MealOrderDetailVO> list = mealOrderDetialSvc.getByOrderNo(moNo);
			req.setAttribute("list", list);

			String url = "/back/MealOrder/listAllMealOrderDetailByMoNo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}
	}

}
