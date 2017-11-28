package com.android.setMeal.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.android.setMeal.model.SetMealDAO;
import com.android.setMeal.model.SetMealService;
import com.android.setMeal.model.SetMealVO;
import com.android.tool.ImageUtil;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;


public class SetMealController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//取得Android送出content
		String str = "";
		StringBuilder sb = new StringBuilder();
		BufferedReader br = new BufferedReader(req.getReader());
		while((str=br.readLine())!=null){
			sb.append(str);
		}
		Gson gson = new Gson();
		JsonObject jsonObject = gson.fromJson(sb.toString(), JsonObject.class);
		String action = jsonObject.get("action").getAsString();
		System.out.println("INPUT = "+action);
		
		if("getAllMeal".equals(action)){
			SetMealService setMealSvc = new SetMealService();
			List<SetMealVO> setMealList = setMealSvc.getAll();
			
			String allMealJson = gson.toJson(setMealList);
			System.out.println("GetAllMeal JSON before send= "+allMealJson);
			writeToClient(res,allMealJson);
			
		}else if("getImage".equals(action)){
			OutputStream out; 
			SetMealService setMealSvc = new SetMealService();
			byte[] img = setMealSvc.getImg(jsonObject.get("id").getAsInt());
			
			if(img!=null){
				out = res.getOutputStream();
//				img=ImageUtil.shrink(img, jsonObject.get("imageSize").getAsInt());
				res.setContentType("image/jpeg");
				res.setContentLength(img.length);
				out.write(img);
			}
		}
		
	}
	private void writeToClient(HttpServletResponse res,String jsonStr) throws IOException{
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		out.println(jsonStr);
	}

}
