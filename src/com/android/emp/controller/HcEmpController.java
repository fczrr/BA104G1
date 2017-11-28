package com.android.emp.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.android.emp.model.HcEmpService;
import com.android.tool.ImageUtil;
import com.employee.model.EmployeeService;
import com.employee.model.EmployeeVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;


public class HcEmpController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		BufferedReader br = req.getReader();
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = br.readLine())!=null){
			sb.append(line);
		}
		Gson gson = new Gson();
		JsonObject json = gson.fromJson(sb.toString(),JsonObject.class);
		String action;
		HcEmpService hcEmpSvc = new HcEmpService();
		if(json.get("action")!=null){
			action = json.get("action").getAsString();
		}else{
			action = req.getParameter("action");
		}
		
		
		if("getAll".equals(action)){
			System.out.println("查詢全部長照人員");
			System.out.println(gson.toJson(hcEmpSvc.getAll()));
			writeToClient(res,gson.toJson(hcEmpSvc.getAll()));
		}
		if("getImage".equals(action)){
			ServletOutputStream out;
			byte[] img = hcEmpSvc.getImgByEmpNo(json.get("id").getAsString());
			if(img!=null){
				img = ImageUtil.shrink(img,json.get("imageSize").getAsInt());
				res.setContentType("image/jpeg");
				res.setContentLength(img.length);
				out = res.getOutputStream();
				out.write(img);
				out.flush();
			}
		}
		if("getShifts".equals(action)){
			
		}
		
		if("login".equals(action)){
			EmployeeVO empVO = gson.fromJson(sb.toString(), EmployeeVO.class);
			String empId = empVO.getEmpId();
			String empPwd = empVO.getEmpPwd();
			Gson gson1 = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").create();
			
			EmployeeService employeeSvc = new EmployeeService();			
			empVO = employeeSvc.findByEmpId(empId);
			if(empVO==null){
				empVO = new EmployeeVO();
				empVO.setEmpId("empIdError");
			}else if(!empVO.getEmpPwd().equals(empPwd)){
				empVO = new EmployeeVO();
				empVO.setEmpId("empPwdError");
			}
			System.out.println(gson1.toJson(empVO.getOnBoardDate()));
			writeToClient(res,gson1.toJson(empVO));
			
		}
		
	}
	
	private void writeToClient(HttpServletResponse res,String jsonStr) throws IOException{
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		out.println(jsonStr);
		out.flush();
	}
}
