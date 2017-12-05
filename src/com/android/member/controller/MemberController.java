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
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

public class MemberController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");

		PrintWriter out = res.getWriter();
		// 取得Android送出content
		String str = "";
		StringBuilder sb = new StringBuilder();
		BufferedReader br = new BufferedReader(req.getReader());
		while ((str = br.readLine()) != null) {
			sb.append(str);
		}

		// 判斷
		if ("login".equals(req.getParameter("action"))) {

			Gson gson = new Gson();
			MemberVO memberVO = gson.fromJson(sb.toString(), MemberVO.class);

			String memId = memberVO.getMemId();
			String memPwd = memberVO.getMemPwd();

			MemberService memSvc = new MemberService();
			memberVO = memSvc.getOneMemById(memberVO.getMemId());

			System.out.println(memberVO);

			if (memberVO == null) {
				memberVO = new MemberVO();
				memberVO.setMemId("memIdError");
			} else if (!(memberVO.getMemPwd().equals(memPwd))) {
				memberVO = new MemberVO();
				memberVO.setMemId("memPwdError");
			}
			String memVOJSON = gson.toJson(memberVO);

			out.println(memVOJSON);
			return;
		}

		if ("addCared".equals(req.getParameter("action"))) {
			System.out.println("addCared");
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").create();
			TheCaredVO theCaredVO = gson.fromJson(sb.toString(), TheCaredVO.class);
			TheCaredDAO theCaredDAO = new TheCaredDAO();
			theCaredDAO.insert(theCaredVO);
			System.out.println("新增照護成功");
			theCaredVO.setCaredName("success");
			out.write(gson.toJson(theCaredVO));
			out.flush();
			return;
		}
		if ("modifyCared".equals(req.getParameter("action"))) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").create();
			TheCaredVO theCaredVO = gson.fromJson(sb.toString(), TheCaredVO.class);
			System.out.println(gson.toJson(theCaredVO));
			TheCaredDAO theCaredDAO = new TheCaredDAO();
			theCaredDAO.update(theCaredVO);
			System.out.println("更新成功");
			theCaredVO.setCaredName("success");
			out.write(gson.toJson(theCaredVO));
			out.flush();
			return;
		}
		if ("getCared".equals(req.getParameter("action"))) {
			System.out.println("getCared");
			Gson gson = new Gson();
			MemberService memSvc = new MemberService();
			List<TheCaredVO> caredList = memSvc
					.getCared(gson.fromJson(sb.toString(), JsonObject.class).get("memNo").getAsString());
			out.println(gson.toJson(caredList));
			out.flush();
			return;
		}
		if("deleteCared".equals(req.getParameter("action"))){
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").create();
			TheCaredVO theCaredVO = gson.fromJson(sb.toString(), TheCaredVO.class);
			System.out.println("delete caredVO"+theCaredVO.getCaredNo());
			TheCaredDAO theCaredDAO = new TheCaredDAO();
			theCaredDAO.delete(theCaredVO.getCaredNo());
			theCaredVO.setCaredName("success");
			out.write(gson.toJson(theCaredVO));
			out.flush();
			return;
		}
		if ("addPoint".equals(req.getParameter("action"))) {
			System.out.println("會員儲值");
			Gson gson = new Gson();
			BalanceVO balanceVO = gson.fromJson(sb.toString(), BalanceVO.class);
			System.out.println();
			BalanceDAO balanceDAO = new BalanceDAO();
			balanceDAO.insert(balanceVO);

			MemberService memSvc = new MemberService();
			MemberVO memberVO = memSvc.getOneMemByNo(balanceVO.getMemNo());
			System.out.println(gson.toJson(memberVO));
			out.write(gson.toJson(memberVO));
			out.flush();
			return;
		}

		if ("modify".equals(req.getParameter("action"))) {
			System.out.println("會員修改");
			Gson gson = new Gson();
			MemberVO memberVO = gson.fromJson(sb.toString(), MemberVO.class);
			MemberService memSvc = new MemberService();
			MemberVO memVO = memSvc.getOneMemByNo(memberVO.getMemNo());
			System.out.println(memberVO.getMemName());
			memVO.setMemName(memberVO.getMemName());
			memVO.setMemPwd(memberVO.getMemPwd());
			memVO.setAddress(memberVO.getAddress());
			memVO.setMemGender(memberVO.getMemGender());
			memVO.setMemPhone(memberVO.getMemPhone());
			memVO.setMemEmail(memberVO.getMemEmail());

			memSvc.updateMember(memVO);
			System.out.println("更新後" + gson.toJson(memVO));
			out.write(gson.toJson(memVO));
			out.flush();
			return;
		}

	}

}
