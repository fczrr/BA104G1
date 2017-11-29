package com.member.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.balance.model.BalanceService;
import com.balance.model.BalanceVO;
import com.employee.model.EmployeeService;
import com.employee.model.EmployeeVO;
import com.member.model.*;
import com.thecared.model.ThecaredService;
import com.thecared.model.ThecaredVO;
import com.tool.MailService;

//  /member/member.do

public class MemberServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println("action"+action);
		// =================================================登入================================================================================================
		if ("login".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			String url = "/front/Login.jsp";
			req.setAttribute("errorMsgs", errorMsgs);

			String memId = req.getParameter("memId");
			String memPwd = req.getParameter("memPwd");

			if (memId == null || memId.trim().length() == 0) {
				errorMsgs.add("帳號請勿空白");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}

			if (memPwd == null || memPwd.trim().length() == 0) {
				errorMsgs.add("密碼請勿空白");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}

			// ===========================================================================

			MemberService memberSvc = new MemberService();
			MemberVO memberVO = memberSvc.getOneMemById(memId);

			if (memberVO == null) {
				errorMsgs.add("帳號錯誤");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			if (!memberVO.getMemPwd().equals(memPwd)) {
				errorMsgs.add("密碼錯誤");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setMemLoginTime(new Timestamp(System.currentTimeMillis()));
			memberSvc.updateMember(memberVO);

			HttpSession session = req.getSession();
			session.setAttribute("memberVO", memberVO);
			session.setAttribute("isLogin", "correct");

			String location = (String) session.getAttribute("location");
			System.out.println("location" + location);
			if (location != null) {
				res.sendRedirect(location);
				return;
			} else {
				res.sendRedirect(req.getContextPath() + "/index.jsp");
				return;
			}
		}

		// ==========================================登出===========================================================================
		if ("logout".equals(action)) {
			HttpSession session = req.getSession();
			session.setAttribute("memberVO", null);
			res.sendRedirect(req.getContextPath() + "/index.jsp");
		}
		// ======================================================================================================================================================

		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			String url = "/back/member/listAllMember1.jsp";
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String memId = req.getParameter("memId");
				if (memId == null || (memId.trim()).length() == 0) {
					errorMsgs.add("請勿空白");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneMemById(memId);
				if (memberVO == null) {
					errorMsgs.add("查無帳號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;
				}
				/***************************************/
				List<MemberVO> list = new ArrayList<MemberVO>();
				list.add(memberVO);
				req.setAttribute("list", list); //

				RequestDispatcher successView = req.getRequestDispatcher(url);
				// listOneEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("錯誤訊息:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
			}
		}
		// ======================================================================================================================

		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				String memNo = req.getParameter("memNo");

				/*************************** 2.�}�l�d�߸�� ****************************************/
				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneMemByNo(memNo);

				/***************************
				 * 3.�d�ߧ���,�ǳ����(Send the Success view)
				 ************/
				req.setAttribute("memberVO", memberVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/back/member/update_member_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\���
																				// update_emp_input.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("錯誤訊息:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back/member/listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}
		// ====================================================================================================================

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			MemberService memSvc = new MemberService();
			String url = "/front/member/MemberInfo.jsp";
			// try {

			String memNo = req.getParameter("memNo");
			String memName = req.getParameter("memName");
			String memPwd = req.getParameter("memPwd");
			String memPhone = req.getParameter("memPhone");
			String memGender = req.getParameter("memGender");
			String memEmail = req.getParameter("memEmail");
			String address = req.getParameter("address");

			MemberVO memberVO = memSvc.getOneMemByNo(memNo);

			if (memName == null || memName.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setMemName(memName);

			if (memPwd != null && memPwd.trim().length() != 0) {
				memberVO.setMemPwd(memPwd);
			}

			if (memPhone == null || memPhone.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setMemPhone(memPhone);

			if (memGender != null) {
				memberVO.setMemGender(memGender);
			}

			if (memEmail == null || memEmail.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setMemEmail(memEmail);

			if (address == null || address.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setAddress(address);

			/*************************** 2.�}�l�ק��� *****************************************/

			memberVO = memSvc.updateMember(memberVO);
			/****************************************************************************/
			System.out.println("Update Member Success");
			req.setAttribute("memberVO", memberVO);
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

			/*************************** ��L�i�઺���~�B�z *************************************/
			// } catch (Exception e) {
			// errorMsgs.add("錯誤訊息:" + e.getMessage());
			// RequestDispatcher failureView = req.getRequestDispatcher(url);
			// failureView.forward(req, res);
			// }
		}

		// ======================================================================================================================

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String url = "/front/member/MemberRegister.jsp";
			// =======================================================================
			String memName = req.getParameter("memName");
			String memId = req.getParameter("memId");
			String memPwd = req.getParameter("memPwd");
			String memPhone = req.getParameter("memPhone");
			String memGender = req.getParameter("memGender");
			String memEmail = req.getParameter("memEmail");
			String address = req.getParameter("address");
			Integer point = new Integer(0);
			// =======================================================================
			String memSratus = "未驗證";
			String chkIp = req.getLocalAddr();
			Timestamp memLoginTime = new Timestamp(System.currentTimeMillis());

			MemberVO memberVO = new MemberVO();

			if (memName == null || memName.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setMemName(memName);

			if (memId == null || memId.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setMemId(memId);

			if (memPwd == null || memPwd.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setMemPwd(memPwd);

			if (memPhone == null || memPhone.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setMemPhone(memPhone);

			if (memGender == null || memGender.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setMemGender(memGender);

			if (memEmail == null || memEmail.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setMemEmail(memEmail);

			if (address == null || address.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			memberVO.setAddress(address);

			memberVO.setPoint(point);
			memberVO.setMemSratus(memSratus);
			memberVO.setChkIp(chkIp);
			memberVO.setMemLoginTime(memLoginTime);

			/*************************** 2.�}�l�s�W��� ***************************************/
			MemberService memSvc = new MemberService();
			memberVO = memSvc.addMember(memName, memPhone, memGender, memEmail, address, point, memId, memPwd,
					memSratus, chkIp, memLoginTime);
			/***************************
			 * 3.�s�W����,�ǳ����(Send the Success view)
			 ***********/
			memberVO = memSvc.getOneMemById(memberVO.getMemId());
			req.getSession().setAttribute("memberVO", memberVO);
			String successUrl = "/index.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(successUrl);
			successView.forward(req, res);
			System.out.println("成功");
			/*************************** ��L�i�઺���~�B�z **********************************/

		}
		// ======================================================================================================================

		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				String memNo = req.getParameter("memNo");

				/*************************** 2.�}�l�R����� ***************************************/
				MemberService empSvc = new MemberService();
				empSvc.deleteEmp(memNo);

				/***************************
				 * 3.�R������,�ǳ����(Send the Success view)
				 ***********/
				String url = "/front/member/listAllEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front/member/listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}
		// ======================================================================================================================

		if ("queryStatus".equals(action)) {
			String status = req.getParameter("status");
			System.out.println(status);
			String param = null;
			String url = "/back/member/listAllMember1.jsp";
			MemberService memberSvc = new MemberService();
			List<MemberVO> list = new ArrayList<>();

			if ("verification".equals(status)) {
				list = memberSvc.getStatus("已驗證");
				param = "verification";
			} else if ("unverified".equals(status)) {
				list = memberSvc.getStatus("未驗證");
				param = "unverified";
			} else if ("suspension".equals(status)) {
				list = memberSvc.getStatus("已停權");
				param = "suspension";
			} else {
				list = memberSvc.getAll();
				param = "getAll";
			}
			if (!list.isEmpty()) {
				req.setAttribute("list", list);
				req.setAttribute("status", param);
				RequestDispatcher dis = req.getRequestDispatcher(url);
				dis.forward(req, res);
			}
		}

		// ======================================================================================================================
		if ("updateFromBack".equals(action)) {
			System.out.println("123");
			String memNo = req.getParameter("memNo");
			String memSratus = req.getParameter("memSratus");
			List<MemberVO> list = new ArrayList<>();

			MemberService memSvc = new MemberService();
			MemberVO memberVO = memSvc.getOneMemByNo(memNo);
			memberVO.setMemSratus(memSratus);
			memSvc.updateMember(memberVO);
			System.out.println("後台成功修改會員狀態");
			list.add(memberVO);
			req.setAttribute("list", list);
			RequestDispatcher successView = req.getRequestDispatcher("/back/member/listAllMember1.jsp");
			successView.forward(req, res);
		}
		// ==================================================忘記密碼=============================================================
		if ("forgetPwd".equals(action)) {
			String memNo = req.getParameter("memNo");
			MemberService memSvc = new MemberService();
			MemberVO memVO = memSvc.getOneMemByNo(memNo);
			sendRegisterMail(memVO.getMemEmail(), memVO.getMemName(), memVO.getMemPwd());
			RequestDispatcher successView = req.getRequestDispatcher("/back/employee/listOneEmployee.jsp");
			successView.forward(req, res);
		}
		// ======================================================================================================================
		if ("cared_update".equals(action)) {
			String memNo = req.getParameter("memNo");
			String caredName = req.getParameter("caredName");
			String caredNo = req.getParameter("caredNo");
			String caredGender = req.getParameter("caredGender");
			String kinship = req.getParameter("kinship");
			String caredWeight = req.getParameter("caredWeight");
			String caredAddress = req.getParameter("caredAddress");
			String caredPhone = req.getParameter("caredPhone");
			String conStatus = req.getParameter("conStatus");
			String bioStatus = req.getParameter("bioStatus");

			ThecaredVO thecaredVO = new ThecaredVO();
			thecaredVO.setCaredNo(caredNo);
			thecaredVO.setCaredName(caredName);
			thecaredVO.setCaredWeight(Integer.valueOf(caredWeight));
			thecaredVO.setCaredAddress(caredAddress);
			thecaredVO.setCaredPhone(caredPhone);
			thecaredVO.setConStatus(conStatus);
			thecaredVO.setBioStatus(bioStatus);

			ThecaredService caredSvc = new ThecaredService();
			thecaredVO = caredSvc.updateTHECARED(thecaredVO);
			req.setAttribute("thecaredVO", thecaredVO);
			req.setAttribute(caredNo, caredNo);

			RequestDispatcher successView = req.getRequestDispatcher("/front/member/CaredList.jsp");
			successView.forward(req, res);
		}

		// ======================================================================================================================
		if ("cared_insert".equals(action)) {
			String memNo = req.getParameter("memNo");
			String caredName = req.getParameter("caredName");
			String caredGender = req.getParameter("caredGender");
			String kinship = req.getParameter("kinship");
			String caredWeight = req.getParameter("caredWeight");
			String caredHeight = req.getParameter("caredHeight");
			String caredAddress = req.getParameter("caredAddress");
			String caredPhone = req.getParameter("caredPhone");
			String conStatus = req.getParameter("conStatus");
			String bioStatus = req.getParameter("bioStatus");
			Timestamp modifyTime = new Timestamp(System.currentTimeMillis());

			ThecaredVO thecaredVO = new ThecaredVO();
			thecaredVO.setMemNo(memNo);
			thecaredVO.setCaredName(caredName);
			thecaredVO.setCaredGender(caredGender);
			thecaredVO.setKinship(kinship);
			thecaredVO.setCaredHeight(Integer.valueOf(caredHeight));
			thecaredVO.setCaredWeight(Integer.valueOf(caredWeight));
			thecaredVO.setCaredAddress(caredAddress);
			thecaredVO.setCaredPhone(caredPhone);
			thecaredVO.setConStatus(conStatus);
			thecaredVO.setBioStatus(bioStatus);

			ThecaredService caredSvc = new ThecaredService();
			thecaredVO = caredSvc.addTHECARED(thecaredVO);
			RequestDispatcher successView = req.getRequestDispatcher("/front/member/CaredList.jsp");
			successView.forward(req, res);
		}

		// ======================================================================================================================
		if ("tranfer".equals(action)) {
			String url = req.getParameter("myurl");
			if (url != null && !url.isEmpty()) {
				req.setAttribute("myurl", url);
			}
		//	System.out.println("tranfer:"+url);
			RequestDispatcher successView = req.getRequestDispatcher("/front/member/BalanceInsert.jsp");
			successView.forward(req, res);
		}
		// ======================================================================================================================

		if ("balance_insert".equals(action)) {
			System.out.println("here is balance_insertXXXX:");
			String topupNo = req.getParameter("topupNo");
			String memNo = req.getParameter("memNo");
			String topupValue = req.getParameter("topupValue");
			String topupWay = req.getParameter("topupWay");
			String status = req.getParameter("status");

			String myurl = req.getParameter("myurl");
			
			System.out.println("myurl:"+myurl);
			BalanceVO balanceVO = new BalanceVO();
			balanceVO.setMemNo(memNo);
			balanceVO.setTopupValue(Integer.valueOf(topupValue));
			balanceVO.setTopupWay(topupWay);

			BalanceService balanceSvc = new BalanceService();
			balanceVO = balanceSvc.addTopup(balanceVO);
			HttpSession session = req.getSession();
			String mylocation = (String)session.getAttribute("mylocation");
			System.out.println("mylocation :"+mylocation);
			if("/MasterOrder/Checkout.jsp".equals(mylocation)){
				System.out.println("mylocation,FORWARD出去了。");
				String url = "/MasterOrder/Checkout.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
																				// ListAllProOrder.jsp
				successView.forward(req, res);
				return;
				
			}
			
			if(myurl!=null && !myurl.isEmpty()){
				RequestDispatcher successView = req.getRequestDispatcher(myurl);
				System.out.println("success_myurl:"+myurl);
				successView.forward(req, res);
			}else{
				RequestDispatcher successView = req.getRequestDispatcher("/front/member/MyWallet.jsp");
				successView.forward(req, res);
			}
		}

		// -------------------------------------------------------------------------------
		if ("queryBalanceList".equals(action)) {
			String empDep = req.getParameter("empDep");
			System.out.println(empDep);

			String param = null;
			String url = "/back/member/listAllBalance.jsp";
			BalanceService balanceSvc = new BalanceService();
			List<BalanceVO> list = new ArrayList<>();

			if (!list.isEmpty()) {
				req.setAttribute("list", list);
				req.setAttribute("empDep", param);
				RequestDispatcher dis = req.getRequestDispatcher(url);
				dis.forward(req, res);
			}
		}
		// -------------------------------------------------------------------

		if ("queryBalanceByMemNo".equals(action)) {

			String url = "/back/member/listOneBalance.jsp";
			String memNo = req.getParameter("memNo");

			BalanceService balanceSvc = new BalanceService();
			List<BalanceVO> list = balanceSvc.getAllByMemNo2(memNo.toUpperCase());

			req.setAttribute("memNo", memNo);
			req.setAttribute("list", list);
			System.out.println("set_balanceVO=" + list);

			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}
		// -------------------------------------------------------------------

		if ("changeBalanceStatus".equals(action)) {

			System.out.println("123");
			String status = req.getParameter("status");
			String topupNo = req.getParameter("topupNo");

			BalanceService balanceSvc = new BalanceService();
			balanceSvc.updateStatus(status, topupNo);
			System.out.println("後台成功修改會員狀態");
			RequestDispatcher successView = req.getRequestDispatcher("/back/member/listAllBalance.jsp");
			successView.forward(req, res);

		}

		if ("memVerity".equals(action)) {
			System.out.println("action" + action);

			String memNo = req.getParameter("memNo");
			MemberService memSvc = new MemberService();
			;
			MemberVO memVO = memSvc.findByPrimaryKey(memNo);
			String memCodeOutput = sendRegisterMail(memVO.getMemEmail(), memVO.getMemName());// 程式送出認證碼了
			req.getSession().setAttribute("memCodeOutput", memCodeOutput);

			RequestDispatcher successView = req.getRequestDispatcher("/front/member/MemberVerify.jsp");
			successView.forward(req, res);

		}
		if ("confirmCode".equals(action)) {
			String memNo = req.getParameter("memNo");

			String memCodeOutput = (String) req.getSession().getAttribute("memCodeOutput");
			String memCodeInput = req.getParameter("memCodeInput");
			System.out.println(memCodeOutput);
			System.out.println(memCodeInput);

			String ok = "已驗證";
			String fail = "請重新驗證";

			MemberService memSvc = new MemberService();
			;
			MemberVO memberVO = memSvc.findByPrimaryKey(memNo);
			if (memCodeInput.equals(memCodeOutput)) {
				memberVO.setMemSratus(ok);
			} else {
				memberVO.setMemSratus(fail);
			}

			memSvc.updateMember(memberVO);
			System.out.println("Input驗證碼" + memCodeInput);
			req.setAttribute("memberVO", memberVO);
			RequestDispatcher successView = req.getRequestDispatcher("/front/member/MemberInfo.jsp");
			successView.forward(req, res);
		}

		if ("findOneByMemNo".equals(action)) {
			String memNo = req.getParameter("memNo");
			List<String> errorMsgs = new LinkedList<String>();
			String failureV = req.getParameter("failureV");

			req.setAttribute("errorMsgs", errorMsgs);
			if (memNo == null || memNo.trim().equals("")) {
				errorMsgs.add("請輸入員工編號");
			}

			if (errorMsgs.size() != 0) {
				RequestDispatcher failureView = req.getRequestDispatcher(failureV);
				failureView.forward(req, res);
			}

			MemberService memberService = new MemberService();
			MemberVO memberVO = memberService.findByPrimaryKey(memNo);

			req.setAttribute("memberVO", memberVO);

			RequestDispatcher successView = req.getRequestDispatcher(req.getParameter("successView"));
			successView.forward(req, res);

		}
	}

	private void sendRegisterMail(String Email, String Name, String Pwd) {
		String to = Email;
		String subject = "密碼通知";
		String messageText = "Hello! " + Name + " 請謹記此密碼: " + Pwd + "\n" + " (已經啟用)";
		MailService mailService = new MailService();
		mailService.sendMail(to, subject, messageText);
	}

	private String sendRegisterMail(String memEmail, String memName) {
		String to = memEmail;
		String memCode = getMemCode();
		String subject = "有我罩你-會員認證信";
		System.out.println("驗證碼" + memCode);
		System.out.println("mail:" + memEmail);

		String messageText = "尊敬的會員" + memName + "您好：\n\n" + "感謝申請會員驗證！"
				+ "\n 請至驗證網頁輸入下方驗證碼 http://localhost:8081/BA104G1/front/member/MemberVerify.jsp" + "\n【" + memCode
				+ "】(共4碼)，此驗證碼只在10分鐘內有效，失效時請重新申請。";

		MailService mailService = new MailService();
		mailService.sendMail(to, subject, messageText);
		return memCode;
	}

	private String getMemCode() {
		StringBuffer sb = new StringBuffer();
		int[] A = new int[4];
		for (int i = 0; i < 4; i++) {
			if (i < 1) { // 前 1 放數字
				A[i] = (int) ((Math.random() * 10) + 48);
			} else if (i < 3) { // 中間 2 位放大寫英文
				A[i] = (int) (((Math.random() * 26) + 65));
			} else { // 後 1 位放小寫英文
				A[i] = ((int) ((Math.random() * 26) + 97));
			}
			sb.append((char) A[i]);
		}
		return sb.toString();
	}
}
