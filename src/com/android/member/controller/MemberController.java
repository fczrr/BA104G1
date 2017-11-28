package com.android.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.android.mealOrder.model.*;
import com.android.mealOrderDetail.model.MealOrderDetailVO;
import com.android.member.model.*;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
	

public class MemberController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		
		PrintWriter out = res.getWriter();
		//取得Android送出content
		String str = "";
		StringBuilder sb = new StringBuilder();
		BufferedReader br = new BufferedReader(req.getReader());
		while((str=br.readLine())!=null){
			sb.append(str);
		}

		
		//判斷
		if("login".equals(req.getParameter("action"))){
			
			Gson gson = new Gson();
			MemberVO memberVO = gson.fromJson(sb.toString(), MemberVO.class);
			
			String memId = memberVO.getMemId();
			String memPwd = memberVO.getMemPwd();
 			
			MemberService memSvc = new MemberService();
			memberVO = memSvc.getOneMemById(memberVO.getMemId());
			
			System.out.println(memberVO);
			
			if(memberVO == null){
				memberVO = new MemberVO();
				memberVO.setMemId("memIdError");
			}else if(!(memberVO.getMemPwd().equals(memPwd))){
				memberVO = new MemberVO();
				memberVO.setMemId("memPwdError");
			}
			String memVOJSON = gson.toJson(memberVO);

			out.println(memVOJSON);
		}
		
		
		if("getCared".equals(req.getParameter("action"))){
			System.out.println("hi");
			Gson gson = new Gson();
			MemberService memSvc = new MemberService();
			List<TheCaredVO> caredList = memSvc.getCared(gson.fromJson(sb.toString(),JsonObject.class).get("memNo").getAsString());
			out.println(gson.toJson(caredList));
			out.flush();
		}
	
	}

}
