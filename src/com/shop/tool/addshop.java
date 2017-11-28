package com.shop.tool;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import com.shop.model.ShopService;
import com.shop.model.ShopVO;

import java.io.InputStream;

@WebServlet("/addshop.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class addshop extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static DataSource ds = null;
	static {

		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();

		}
	}
	private static final String INSERT_STMT = "INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3)  VALUES (FORSHOPITEM.Nextval,?,?,?,?,?,?,?,?,?)";

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("進入addshop.do");
		doPost(req, res);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("uploadgogo".equals(action)){
		System.out.println("進入addshop.do.uploadgogo");
		req.setCharacterEncoding("utf-8"); // 處理中文檔名
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		System.out.println("ContentType=" + req.getContentType()); // 測試用
		ShopVO shopVO = new ShopVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		Part part = req.getPart("upfile1");
		Part part2 = req.getPart("upfile2");
		Part part3 = req.getPart("upfile3");
		InputStream part11 = (InputStream) part.getInputStream();
		InputStream part22 = (InputStream) part2.getInputStream();
		InputStream part33 = (InputStream) part3.getInputStream();
		// 很奇怪只有setbyte才會在資料庫出現blob
		byte[] part111 = InputStreamToByte(part11);
		byte[] part222 = InputStreamToByte(part22);
		byte[] part333 = InputStreamToByte(part33);
		String key = null;

		// 取得上一個網頁的資訊(目前無法新增中文...)
		// int ITEMNO = Integer.parseInt(req.getParameter("ITEMNO"));
		int CLASSNO = Integer.parseInt(req.getParameter("CLASSNO"));
		int STOCK = Integer.parseInt(req.getParameter("STOCK"));
		int PRICE = Integer.parseInt(req.getParameter("PRICE"));
		// STATE
		String NAME = req.getParameter("NAME");
		String DES = req.getParameter("DES");

		try {
			String[] cols = { "ITEMNO" };
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT, cols);
			// pstmt.setInt(1, ITEMNO);
			pstmt.setInt(1, STOCK);
			pstmt.setInt(2, PRICE);
			pstmt.setInt(3, 1);// STATE暫時都先給1
			pstmt.setInt(4, CLASSNO);
			pstmt.setString(5, NAME);
			pstmt.setString(6, DES);
			pstmt.setBytes(7, part111);
			pstmt.setBytes(8, part222);
			pstmt.setBytes(9, part333);
			System.out.println("我倒了嗎0");
			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();
			if (rs.next()) {
				do {
					for (int i = 1; i <= columnCount; i++) {
						key = rs.getString(i);
						System.out.println("自增主鍵值 = " + key + "(剛新增成功的員工編號)");
					}
				} while (rs.next());
			} else {
				System.out.println("NO KEYS WERE GENERATED.");
			}

			rs.close();
			shopVO.setSTOCK(STOCK);
			shopVO.setPRICE(PRICE);
			shopVO.setCLASSNO(CLASSNO);
			shopVO.setNAME(NAME);
			shopVO.setCLASSNO(CLASSNO);
			shopVO.setKey(key);
			shopVO.setDES(DES);
			req.setAttribute("shopVO", shopVO);
			String url = "/back/production/BA104G1_back_ShopADDAfter.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
																			// listOneEmp.jsp
			successView.forward(req, res);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}else if ("uploadgogo2".equals(action)){
		String SQL_FORUPDATE="UPDATE ShoppingMall set  STOCK=?, PRICE=?,NAME=?,DES=?,PICTURE1=? where ITEMNO =?";
		System.out.println("進入addshop.do.uploadgogo2");
		req.setCharacterEncoding("utf-8"); // 處理中文檔名
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		System.out.println("ContentType=" + req.getContentType()); // 測試用
		ShopVO shopVO = new ShopVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		Part part = req.getPart("upfile1");
		System.out.println("req.getPart(upfile1);"+part);
		Part part2 = req.getPart("upfile2");
		Part part3 = req.getPart("upfile3");
		byte[] PIC1=null;
		Integer ITEMNO= Integer.parseInt(req.getParameter("ITEMNO"));


		InputStream part11 = (InputStream) part.getInputStream();
		System.out.println("part11 :"+part11);
		InputStream part22 = (InputStream) part2.getInputStream();
		InputStream part33 = (InputStream) part3.getInputStream();
		if(part11.read()==-1){
			ShopService empSvc = new ShopService();
			ShopVO shopVO2 = empSvc.getOneEmp(ITEMNO);
			PIC1=shopVO2.getPicture1();
			
	}
		// 很奇怪只有setbyte才會在資料庫出現blob
		byte[] part111 = InputStreamToByte(part11);
		byte[] part222 = InputStreamToByte(part22);
		byte[] part333 = InputStreamToByte(part33);
		String key = null;
		
		// 取得上一個網頁的資訊
		
		int CLASSNO = Integer.parseInt(req.getParameter("CLASSNO"));
		int STOCK = Integer.parseInt(req.getParameter("STOCK"));
		int PRICE = Integer.parseInt(req.getParameter("PRICE"));
		// STATE
		String NAME = req.getParameter("NAME");
		String DES = req.getParameter("DES");
//String SQL_FORUPDATE="UPDATE ShoppingMall set  STOCK=?, PRICE=?,NAME=?,DES=?,PICTURE1=? where ITEMNO =?";
		try {
			String[] cols = { "ITEMNO" };
			con = ds.getConnection();
			pstmt = con.prepareStatement(SQL_FORUPDATE);
			// pstmt.setInt(1, ITEMNO);
			pstmt.setInt(1, STOCK);
			pstmt.setInt(2, PRICE);
			pstmt.setString(3, NAME);// STATE暫時都先給1
			pstmt.setString(4, DES);
			if (part11.read() == -1) {
				pstmt.setBytes(5, PIC1);
			} else {
				pstmt.setBytes(5, part111);
			}
			pstmt.setInt(6, ITEMNO);
			System.out.println("我倒了嗎0");
			pstmt.executeUpdate();

			String key2=req.getParameter("ITEMNO");
			
			shopVO.setSTOCK(STOCK);
			shopVO.setPRICE(PRICE);
			shopVO.setCLASSNO(CLASSNO);
			shopVO.setNAME(NAME);
			shopVO.setCLASSNO(CLASSNO);
			shopVO.setKey(key2);
			shopVO.setDES(DES);
			req.setAttribute("shopVO", shopVO);
			String url = "/back/production/BA104G1_back_ShopADDAfter.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
																			// listOneEmp.jsp
			successView.forward(req, res);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		}
	}
	// 把inputstream轉成byte[]
	private byte[] InputStreamToByte(InputStream is) throws IOException {
		ByteArrayOutputStream bytestream = new ByteArrayOutputStream();

		int ch;
		while ((ch = is.read()) != -1) {
			bytestream.write(ch);
		}
		byte imgdata[] = bytestream.toByteArray();
		bytestream.close();
		return imgdata;

	}

	// 取出上傳的檔案名稱 (因為API未提供method,所以必須自行撰寫)
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		System.out.println("header=" + header); // 測試用
		String filename = new File(header.substring(header.lastIndexOf("."), header.length() - 1)).getName();
		System.out.println("filename=" + filename); // 測試用
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}
