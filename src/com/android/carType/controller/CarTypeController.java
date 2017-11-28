package com.android.carType.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.android.carType.model.CarTypeService;
import com.android.setMeal.model.SetMealService;
import com.android.tool.ImageUtil;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class CarTypeController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.getWriter().append("Served at: ").append(req.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		BufferedReader br = req.getReader();
		StringBuilder sb = new StringBuilder();
		String str = null;
		while((str=br.readLine())!=null){
			sb.append(str);
		}
		
		Gson gson = new Gson();
		JsonObject jsonObject = gson.fromJson(sb.toString(), JsonObject.class);
		String action = jsonObject.get("action").getAsString();
		System.out.println("INPUT = "+action);
		CarTypeService carTypeSvc = new CarTypeService();
		
		if("getAllCarType".equals(action)){
			
			String carTypeJson = gson.toJson(carTypeSvc.getAll());
			
			System.out.println("OUTPUT {getAllCarType} = "+carTypeJson);
			writeToClient(res,carTypeJson);
		}
		if("getImage".equals(action)){
			
			OutputStream out = res.getOutputStream();
			byte[] img = carTypeSvc.getImg(jsonObject.get("id").getAsInt());
			if(img!=null){
				img=ImageUtil.shrink(img, jsonObject.get("imageSize").getAsInt());
				res.setContentType("image/jpeg");
				res.setContentLength(img.length);
			}
			out.write(img);
		}
	}
	
	private void writeToClient(HttpServletResponse res,String jsonStr) throws IOException{
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		out.println(jsonStr);
	}

}
