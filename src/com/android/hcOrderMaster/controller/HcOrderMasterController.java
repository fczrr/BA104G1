package com.android.hcOrderMaster.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.android.emp.model.HcEmpVO;
import com.android.hcOrderDetail.model.HcOrderDetailDAO;
import com.android.hcOrderDetail.model.HcOrderDetailVO;
import com.android.hcOrderMaster.model.HcOrderMasterService;
import com.android.hcOrderMaster.model.HcOrderMasterVO;
import com.android.member.model.MemberVO;
import com.employee.model.EmployeeVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

public class HcOrderMasterController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();

		BufferedReader br = req.getReader();
		StringBuilder sb = new StringBuilder();
		String str = null;
		while ((str = br.readLine()) != null) {
			sb.append(str);
		}
		System.out.println("1");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").create();
		String action = req.getParameter("action");
		
		System.out.println(action);
		if("queryAllHcOrder".equals(action)){
			MemberVO memberVO = gson.fromJson(sb.toString(), MemberVO.class);
			System.out.println(memberVO.getMemNo());
			List<HcOrderMasterVO> list =  new HcOrderMasterService().getByMemNo(memberVO.getMemNo());
			System.out.println(gson.toJson(list));
			out.write(gson.toJson(list));
			out.flush();
			return;
		}
		if("queryByEmp".equals(action)){
			System.out.println("123");
			EmployeeVO empVO = gson.fromJson(sb.toString(), EmployeeVO.class);
			System.out.println(gson.toJson(new HcOrderDetailDAO().getByEmpNo(empVO.getEmpNo())));
			out.write(gson.toJson(new HcOrderDetailDAO().getByEmpNo(empVO.getEmpNo())));
			out.flush();
			return;
		}
		
		

	}

}
