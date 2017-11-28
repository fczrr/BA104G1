package com.android.carOrder.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.android.carOrder.model.CarOrderService;
import com.android.carOrder.model.CarOrderVO;
import com.android.carSchedul.model.CarSchedulService;
import com.android.carSchedul.model.CarSchedulVO;
import com.android.carType.model.CarTypeService;
import com.android.emp.model.HcEmpVO;
import com.android.hcOrderDetail.model.HcOrderDetailDAO;
import com.android.member.model.MemberVO;
import com.android.vehicle.model.VehicleVO;
import com.employee.model.EmployeeVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


public class CarOrderController extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		
		
		BufferedReader br = req.getReader();
		StringBuilder sb = new StringBuilder();
		String str;
		while((str = br.readLine())!=null){
			sb.append(str);
		}
		
		Gson gson =  new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").create();
		String action = req.getParameter("action");		
		
		if(action.equals("addCarOrder")){
			CarOrderVO carOrder = (CarOrderVO) gson.fromJson(sb.toString(), CarOrderVO.class);
			CarTypeService carTypeSvc = new CarTypeService();
			CarSchedulService carSchedulSvc = new CarSchedulService();
			
			Map<String,List<CarSchedulVO>> empCarSchedulMap = new HashMap();
			List<VehicleVO> vehicleList = carTypeSvc.getVehicleVObyCarTypeNo(carOrder.getCarTypeNo());
			for(VehicleVO vechicleVO:vehicleList){
				carSchedulSvc.getByEmpNo(vechicleVO.getEmpNo(),"");
			}
			
		}
		if(action.equals("queryAllCarOrder")){
			MemberVO memberVO = (MemberVO) gson.fromJson(sb.toString(), MemberVO.class);
			CarOrderService carOrderService = new CarOrderService();
			List<CarOrderVO> carOrdList = carOrderService.findByMemNo(memberVO.getMemNo());
			System.out.println(gson.toJson(carOrdList));
			out.write(gson.toJson(carOrdList));
			out.flush();
			return;
		}
		
		if("queryByEmp".equals(action)){
			System.out.println("queryByEmp");	
			EmployeeVO emp  = gson.fromJson(sb.toString(), EmployeeVO.class);
			System.out.println(gson.toJson(new CarOrderService().getEmpOrder(emp.getEmpNo())));
			out.write(gson.toJson(new CarOrderService().getEmpOrder(emp.getEmpNo())));
			out.flush();
			return;
		}
		
	}

}
