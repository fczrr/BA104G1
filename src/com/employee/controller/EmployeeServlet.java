package com.employee.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.branches.model.BranchesService;
import com.branches.model.BranchesVO;
import com.employee.model.*;
import com.employee_photo.model.EmpPhotosService;
import com.employee_photo.model.EmpPhotosVO;
import com.expertlist.model.ExpertlistService;
import com.expertlist.model.ExpertlistVO;
import com.google.gson.Gson;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.tool.MailService;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class EmployeeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// =================================================================================================================================================

		if ("login".equals(action)) {

			// ===========================================================================
			List<String> errorMsgs = new LinkedList<String>();
			String url = "/back/Login.jsp";
			req.setAttribute("errorMsgs", errorMsgs);

			String empId = req.getParameter("empId");
			String empPwd = req.getParameter("empPwd");

			if (empId == null || empId.trim().length() == 0) {
				errorMsgs.add("帳號請勿空白");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}

			if (empPwd == null || empPwd.trim().length() == 0) {
				errorMsgs.add("密碼請勿空白");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}

			// ===========================================================================

			EmployeeService empSvc = new EmployeeService();
			EmployeeVO empVO = empSvc.findByEmpId(empId);

			if (empVO == null) {
				errorMsgs.add("帳號錯誤");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			if (!empVO.getEmpPwd().equals(empPwd)) {
				errorMsgs.add("密碼錯誤");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}

			HttpSession session = req.getSession();
			session.setAttribute("empVO", empVO);
			session.setAttribute("isLogin", "true");
			// ****************************還要放權限管理**************************

			res.sendRedirect(req.getContextPath() + "/back/production/BA104G1_index.jsp");

		}
		
		
		if("logout".equals(action)){
			HttpSession session = req.getSession();
			session.setAttribute("empVO", null);
			session.setAttribute("isLogin", "false");
			res.sendRedirect(req.getContextPath()+"/back/Login.jsp");
		}

		// =================================================================================================================================================
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			String url = "/back/employee/listAllEmployee.jsp";
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String empNo = req.getParameter("empNo");
				if (empNo == null || (empNo.trim()).length() == 0) {
					errorMsgs.add("請勿空白");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				EmployeeService empSvc = new EmployeeService();
				EmployeeVO empVO = empSvc.findByPrimaryKey(empNo.toUpperCase());

				if (empVO == null) {
					errorMsgs.add("查無員工");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;
				}
				/***************************************/
				List<EmployeeVO> list = new ArrayList<EmployeeVO>();
				list.add(empVO);
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

		if ("queryDep".equals(action)) {
			String empDep = req.getParameter("empDep");
			System.out.println(empDep);
			String param = null;
			String url = "/back/employee/listAllEmployee.jsp";
			EmployeeService empSvc = new EmployeeService();
			List<EmployeeVO> list = new ArrayList<>();

			if ("hc".equals(empDep)) {
				list = empSvc.getByDep("長照");
				param = "hc";
			} else if ("car".equals(empDep)) {
				list = empSvc.getByDep("派車");
				param = "car";
			} else if ("meal".equals(empDep)) {
				list = empSvc.getByDep("送餐");
				param = "meal";
			} else {
				list = empSvc.getAll();
				param = "getAll";
			}
			if (!list.isEmpty()) {
				req.setAttribute("list", list);
				req.setAttribute("empDep", param);
				RequestDispatcher dis = req.getRequestDispatcher(url);
				dis.forward(req, res);
			}
		}
		// ======================================================================================================================

		if ("register".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String url = "/back/employee/addEmp.jsp";

			String empName = req.getParameter("empName");
			String empGender = req.getParameter("empGender");
			String empDep = req.getParameter("empDep");
			String empBranches = req.getParameter("empBranches");
			String empTitle = req.getParameter("empTitle");
			String authorityNo = req.getParameter("authorityNo");
			String empId = req.getParameter("empId");
			String empEmail = req.getParameter("empEmail");
			String empPhone = req.getParameter("empPhone");

			EmployeeVO empVO = new EmployeeVO();

			if (empName == null || empName.trim().length() == 0) {
				errorMsgs.add("姓名請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			empVO.setEmpName(empName);
			// ===========================================
			if (empId == null || empId.trim().length() == 0) {
				errorMsgs.add("帳號請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			empVO.setEmpId(empId);
			// ===========================================
			if (empEmail == null || empEmail.trim().length() == 0) {
				errorMsgs.add("信箱請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			empVO.setEmpEmail(empEmail);
			// ===========================================
			if (empPhone == null || empPhone.trim().length() == 0) {
				errorMsgs.add("電話請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			empVO.setEmpPhone(empPhone);
			// ===========================================
			empVO.setEmpGender(empGender);
			empVO.setEmpDep(empDep);
			empVO.setEmpBranches(empBranches);
			empVO.setEmpTitle(empTitle);
			empVO.setAuthorityNo(authorityNo);
			empVO.setOnBoardDate(new Date(System.currentTimeMillis()));
			String empPwd = getPwd();
			empVO.setEmpPwd(empPwd);
			System.out.println(new Gson().toJson(empVO));
			// =======================================================================================================================
			EmployeeService empSvc = new EmployeeService();
			empSvc.insert(empVO); // 新增員工
			sendRegisterMail(empVO.getEmpEmail(), empVO.getEmpName(), empPwd); // 註冊信
			// =======================================================================================================================
			HttpSession session = req.getSession();
			session.setAttribute("empVO", empVO);
			session.setAttribute("isLogin", "true");

			res.sendRedirect(req.getContextPath() + "/back/employee/listAllEmployee.jsp");
			return;
		}

// =============================================================================================================================================================================================
		
		if ("modifyManager".equals(action)) {
			String url = "/back/employee/listAllEmployee.jsp";
			System.out.println("modifyManager");
			String empNo = req.getParameter("empNo");
			String empDep = req.getParameter("empDep");
			String empBranches = req.getParameter("empBranches");
			String empTitle = req.getParameter("empTitle");
			String authorityNo = req.getParameter("authorityNo");
			String empStatus = req.getParameter("empStatus");
			System.out.println(empStatus);
			

			EmployeeService empSvc = new EmployeeService();
			EmployeeVO empVO = empSvc.findByPrimaryKey(empNo);
			empVO.setEmpDep(empDep);
			empVO.setEmpBranches(empBranches);
			empVO.setEmpTitle(empTitle);
			empVO.setAuthorityNo(authorityNo);
			empVO.setEmpStatus(empStatus);
			empSvc.update(empVO);
			List<EmployeeVO> list = new ArrayList<>();
			list.add(empVO);
			req.setAttribute("list", list);
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}
// ==================================================================================================================================
		
		if ("modifySelf".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String url = "/back/employee/listOneEmployee.jsp";
System.out.println("come in");
			String empNo = req.getParameter("empNo");
			String empName = req.getParameter("empName");
			String empGender = req.getParameter("empGender");
			String empId = req.getParameter("empId");
			String empPwd = req.getParameter("empPwd");
			String empPhone = req.getParameter("empPhone");
			String empEmail = req.getParameter("empEmail");
			// ===========================================================================
			if (empName == null || empName.trim().length() == 0) {
				errorMsgs.add("姓名請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			// ===========================================
			if (empId == null || empId.trim().length() == 0) {
				errorMsgs.add("帳號請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			// ===========================================
		
			// ===========================================
			if (empPhone == null || empPhone.trim().length() == 0) {
				errorMsgs.add("電話請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
			// ===========================================
			if (empEmail == null || empEmail.trim().length() == 0) {
				errorMsgs.add("信箱請勿空白");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
// =============================更新員工資料==============================================
			
			EmployeeService empSvc = new EmployeeService();
			EmployeeVO empVO = empSvc.findByPrimaryKey(empNo);
			
			empVO.setEmpName(empName);
			empVO.setEmpId(empId);
			if(empGender  != null ){
				empVO.setEmpGender(empGender);
			}
			if(empPwd != null && empPwd.trim().length() != 0){
				empVO.setEmpPwd(empPwd);
			}
			empVO.setEmpPhone(empPhone);
			empVO.setEmpEmail(empEmail);
			
			empSvc.update(empVO);
// ==============================更新員工資料=============================================			
			
			Part part = req.getPart("empPhoto");

			if(part.getSize()!=0){
				InputStream in = part.getInputStream();
				byte[] img = new byte[in.available()];
				in.read(img);
				EmpPhotosVO empPhotosVO = new EmpPhotosVO();
				empPhotosVO.setEmpNo(empNo);
				empPhotosVO.setEmpPhoto(img);
				EmpPhotosService empPhotoSvc = new EmpPhotosService();
				empPhotoSvc.addEmpPhoto(empPhotosVO);
			}
			// ===========================================================================
			EmployeeVO empVOupdate = empSvc.findByPrimaryKey(empNo);
			req.setAttribute("empVO", empVOupdate);
			
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			System.out.println("更新員工自己資料成功");
		}
		
		
// =======================================================================================================================================			
		if("forgetPwd".equals(action)){
			String empNo = req.getParameter("empNo");
			EmployeeService empSvc = new EmployeeService();;
			EmployeeVO empVO = empSvc.findByPrimaryKey(empNo);
			sendRegisterMail(empVO.getEmpEmail(),empVO.getEmpName(),empVO.getEmpPwd());
			RequestDispatcher successView = req.getRequestDispatcher("/back/employee/listOneEmployee.jsp");
			successView.forward(req, res);
		}
		// =======================================================================================================================================			
				if("expertlist_insert".equals(action)){
					String expNo = req.getParameter("expNo");
					String expName = req.getParameter("expName");
					String expSpec = req.getParameter("expSpec");
					String expPrice = req.getParameter("expPrice");
					System.out.println(action);
					ExpertlistVO expertlistVO= new ExpertlistVO();

					expertlistVO.setExpNo(expNo);
					expertlistVO.setExpName(expName);
					expertlistVO.setExpSpec(expSpec);
					expertlistVO.setExpPrice(Integer.valueOf(expPrice));
					
					ExpertlistService expertlistSvc = new ExpertlistService();
					expertlistVO =expertlistSvc.addEXPERTLIST(expertlistVO);
					RequestDispatcher successView = req.getRequestDispatcher("/back/employee/listAllExpertlist.jsp");
																		//	  /back/employee/listAllExpertlist.jsp
					successView.forward(req, res);
				}
		// =======================================================================================================================================			
				if("expertlist_update".equals(action)){
					 System.out.println("執行:"+action);

					String expNo = req.getParameter("expNo");
					String expName = req.getParameter("expName");
					String expSpec = req.getParameter("expSpec");
					Integer expPrice =Integer.valueOf(req.getParameter("expPrice"));

					ExpertlistVO expertlistVO= new ExpertlistVO();
					expertlistVO.setExpName(expName);
					expertlistVO.setExpNo(expNo);
					expertlistVO.setExpPrice(expPrice);
					expertlistVO.setExpSpec(expSpec);
					
					ExpertlistService expertlistSvc = new ExpertlistService();
					expertlistVO = expertlistSvc.updateEXPLIST(expertlistVO);
					System.out.println("後台成功修改會員狀態");
					RequestDispatcher successView = req.getRequestDispatcher("/back/employee/listAllExpertlist.jsp");
					successView.forward(req, res);
				}
		// =======================================================================================================================================			
				if("expertlist_query".equals(action)){
					
				}

		// =======================================================================================================================================			
				if("branches_insert".equals(action)){
					String empBranches = req.getParameter("empBranches");
					String brcLat = req.getParameter("brcLat");
					String brcLon = req.getParameter("brcLon");
					String brcName = req.getParameter("brcName");
					
					BranchesVO branchesVO= new BranchesVO();

					branchesVO.setEmpBranches(empBranches);
					branchesVO.setBrcLat(Double.valueOf(brcLat));
					branchesVO.setBrcLon(Double.valueOf(brcLon));
					branchesVO.setBrcName(brcName);
					System.out.println("empBranches:"+empBranches);
					BranchesService branchesSvc = new BranchesService();
					branchesVO =branchesSvc.addBranches(branchesVO);
					RequestDispatcher successView = req.getRequestDispatcher("/back/employee/listAllBranches.jsp");
					successView.forward(req, res);
					

				}
		// =======================================================================================================================================			
				if("branches_update".equals(action)){
					 System.out.println("執行:"+action);

					String empBranches = req.getParameter("empBranches");
					Double brcLat = Double.valueOf(req.getParameter("brcLat"));
					Double brcLon = Double.valueOf(req.getParameter("brcLon"));
					String brcName = req.getParameter("brcName");

					BranchesVO branchesVO= new BranchesVO();
					branchesVO.setEmpBranches(empBranches);
					branchesVO.setBrcLat(brcLat);
					branchesVO.setBrcLon(brcLon);
					branchesVO.setBrcName(brcName);
					
					BranchesService branchesSvc = new BranchesService();
					branchesVO=branchesSvc.updateBRANCHES(branchesVO);
					
					System.out.println("後台成功修改據點狀態");
					RequestDispatcher successView = req.getRequestDispatcher("/back/employee/listAllBranches.jsp");
					successView.forward(req, res);
				}		
				if("branches_query".equals(action)){
					
				}
		
	}

	
	
	
	private void sendRegisterMail(String empEmail, String empName, String empPwd) {
		String to = empEmail;
		String subject = "有我罩你 員工密碼通知";
		String messageText = "Hello! " + empName + " 請謹記此密碼: " + empPwd + "\n" + " (已經啟用)";
		MailService mailService = new MailService();
		mailService.sendMail(to, subject, messageText);
	}

	private String getPwd() {
		StringBuffer sb = new StringBuffer();
		int[] A = new int[8];
		for (int i = 0; i < 8; i++) {
			if (i < 3) { // 前 3 放數字
				A[i] = (int) ((Math.random() * 10) + 48);
			} else if (i < 6) { // 中間 3 位放大寫英文
				A[i] = (int) (((Math.random() * 26) + 65));
			} else { // 後 2 位放小寫英文
				A[i] = ((int) ((Math.random() * 26) + 97));
			}
			sb.append((char) A[i]);
		}
		return sb.toString();
	}
}
