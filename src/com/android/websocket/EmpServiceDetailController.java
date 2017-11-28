package com.android.websocket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.android.member.model.MemberVO;
import com.employee.model.EmployeeVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class EmpServiceDetailController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
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
		
		Gson gson =  new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").create();
		String action = req.getParameter("action");
		
		if("getRecordByMemNo".equals(action)){
			MemberVO memberVO = gson.fromJson(sb.toString(), MemberVO.class);
			EmpServiceDetailSvc empSvc = new EmpServiceDetailSvc();
			List<EmpServiceDetailVO> list = empSvc.getByMemNo(memberVO.getMemNo());
			System.out.println(gson.toJson(list));
			out.write(gson.toJson(list));
			out.flush();
			return;
		}
		
		if("getRecordByEmpNo".equals(action)){
			EmployeeVO empVO = gson.fromJson(sb.toString(), EmployeeVO.class);
			EmpServiceDetailSvc empSvc = new EmpServiceDetailSvc();
			List<EmpServiceDetailVO> list = empSvc.getByEmpNo(empVO.getEmpNo());
			System.out.println(gson.toJson(list));
			out.write(gson.toJson(list));
			out.flush();
			return;
		}
		if("getOne".equals(action)){
			EmpServiceDetailVO empServiceDetailVO = gson.fromJson(sb.toString(), EmpServiceDetailVO.class);
			EmpServiceDetailSvc empSvc = new EmpServiceDetailSvc();
			empServiceDetailVO =  empSvc.getOne(empServiceDetailVO);
			System.out.println(gson.toJson(empServiceDetailVO));
			out.write(gson.toJson(empServiceDetailVO));
			out.flush();
			return;
		}
		if("updateInfo".equals(action)){
			EmpServiceDetailVO empServiceDetailVO = gson.fromJson(sb.toString(), EmpServiceDetailVO.class);
			EmpServiceDetailSvc empSvc = new EmpServiceDetailSvc();
			System.out.println("更新聊天記錄成功");
			empSvc.update(empServiceDetailVO);
			return;
		}
		
	}

}
