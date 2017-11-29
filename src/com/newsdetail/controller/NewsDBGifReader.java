package com.newsdetail.controller;
import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

public class NewsDBGifReader extends HttpServlet{

	Connection con;

	  public void doGet(HttpServletRequest req, HttpServletResponse res)
	                               throws ServletException, IOException {
	     
	    req.setCharacterEncoding("UTF-8"); //先
	    res.setContentType("image/png");
	    ServletOutputStream out = res.getOutputStream();
	    
	    try {
	      
	      Statement stmt = con.createStatement();
	      String newsno  = req.getParameter("newsno"); //後
	      String newsno2 = new String(newsno.getBytes("ISO-8859-1"), "UTF-8");  //再 (用doget & 有需要輸入中文時)
	      ResultSet rs = stmt.executeQuery(
	    		  "SELECT COVERPIC from NEWSDETAIL where NEWSNO= '"+newsno2+"'"); // SQL動態捕捉

	      if (rs.next()) {
	        BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("coverPic"));
	        byte[] buf = new byte[4 * 1024];  // 4K buffer
	        int len;
	        while ((len = in.read(buf)) != -1) {
	          out.write(buf, 0, len);
	        }
	        in.close();
	      } else {
	          res.sendError(HttpServletResponse.SC_NOT_FOUND);
	      }
	      rs.close();
	      stmt.close();
	    } catch(Exception e) {
//	        System.out.println(e);
	        InputStream in = getServletContext().getResourceAsStream("/img/notimg.jpg");
			byte[] buf = new byte[in.available()];
			in.read(buf);
			out.write(buf);
			in.close();
	    }
	  }
	  
	  public void init() throws ServletException {
			try {
				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
				con = ds.getConnection();
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		public void destroy() {
			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
		}
	}

