package com.newsdetail.model;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.io.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.nio.file.Files;

public class NewsdetailJNDIDAO implements NewsdetailDAO_interface{
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	// 新增
	private static final String INSERT_STMT =
			"INSERT INTO NEWSDETAIL (NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS) VALUES (to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0')),? ,?, ?, ?, ?)";
	// 查全部
	private static final String GET_ALL_STMT =
			"SELECT NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, NEWSDATE, STATUS FROM NEWSDETAIL ORDER BY NEWSNO DESC";
	// 查上架新聞
	private static final String GET_NEWSON_STMT =
			"SELECT NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, NEWSDATE, STATUS FROM NEWSDETAIL WHERE STATUS ='上架' ORDER BY NEWSNO DESC";
	
	// 員工關鍵字查詢
	private static final String GET_ONE_STMT =
			"SELECT NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, NEWSDATE, STATUS FROM NEWSDETAIL WHERE NEWSNO = ?";
	// 刪除
	private static final String DELETE = 
			"DELETE FROM NEWSDETAIL WHERE NEWSNO = ?";
	// 修改
	private static final String UPDATE = 
			"UPDATE NEWSDETAIL SET NEWSTITLE=?, NEWSINTRO=?, EMP_NO=?, COVERPIC=?, NEWSDATE=CURRENT_TIMESTAMP , STATUS=? where NEWSNO = ?";

	@Override
	public void insert(NewsdetailVO newsdetailVO){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			
			pstmt.setString(1, newsdetailVO.getNewstitle());
			pstmt.setString(2, newsdetailVO.getNewsintro());
			pstmt.setString(3, newsdetailVO.getEmpno());
			pstmt.setBytes(4, newsdetailVO.getCoverpic());
			pstmt.setString(5, newsdetailVO.getStatus());
			
			pstmt.executeUpdate();
			
		// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		
		// Clean up JDBC resources
		} finally {
			if(pstmt !=null){
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			if(con != null){
				try {
					con.close();
				} catch (Exception e){
					e.printStackTrace(System.err);
				}
			}
		}
	}

	
	@Override
	public void update(NewsdetailVO newsdetailVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, newsdetailVO.getNewstitle());
			pstmt.setString(2, newsdetailVO.getNewsintro());
			pstmt.setString(3, newsdetailVO.getEmpno());
			pstmt.setBytes(4, newsdetailVO.getCoverpic());
			pstmt.setString(5, newsdetailVO.getStatus());
			pstmt.setString(6, newsdetailVO.getNewsno());
			pstmt.executeUpdate();
		
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
				
			// Clean up JDBC resources
		} finally {
			if(pstmt !=null){
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			if(con != null){
				try {
					con.close();
				} catch (Exception e){
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(String newsno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, newsno);
			
			pstmt.executeUpdate();
			
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public NewsdetailVO findByPrimaryKey(String empno) {
		NewsdetailVO newsdetailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
		
		
			pstmt.setString(1, empno);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()){
				newsdetailVO = new NewsdetailVO();
				newsdetailVO.setNewsno(rs.getString("newsno"));
				newsdetailVO.setNewstitle(rs.getString("newstitle"));
				newsdetailVO.setNewsintro(rs.getString("newsintro"));
				newsdetailVO.setEmpno(rs.getString("emp_no"));
				newsdetailVO.setCoverpic(rs.getBytes("coverpic"));
				newsdetailVO.setNewsdate(rs.getTimestamp("newsdate"));
				newsdetailVO.setStatus(rs.getString("status"));
			}
			
			
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return newsdetailVO;
	}

	@Override
	public List<NewsdetailVO> getNewOnAll() {
		List<NewsdetailVO> list = new ArrayList<NewsdetailVO>();
		NewsdetailVO newsdetailVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_NEWSON_STMT);
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				newsdetailVO = new NewsdetailVO();
				newsdetailVO.setNewsno(rs.getString("newsno"));
				newsdetailVO.setNewstitle(rs.getString("newstitle"));
				newsdetailVO.setNewsintro(rs.getString("newsintro"));
				newsdetailVO.setEmpno(rs.getString("emp_no"));
				newsdetailVO.setCoverpic(rs.getBytes("coverpic"));
				newsdetailVO.setNewsdate(rs.getTimestamp("newsdate"));
				newsdetailVO.setStatus(rs.getString("status"));
				list.add(newsdetailVO);			
			}
			
		// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		
		// Clean up JDBC resources
		} finally {
			if(pstmt !=null){
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			
			if(con != null){
				try {
					con.close();
				} catch (Exception e){
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	

	
	@Override
	public List<NewsdetailVO> getAll() {
		List<NewsdetailVO> list = new ArrayList<NewsdetailVO>();
		NewsdetailVO newsdetailVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				newsdetailVO = new NewsdetailVO();
				newsdetailVO.setNewsno(rs.getString("newsno"));
				newsdetailVO.setNewstitle(rs.getString("newstitle"));
				newsdetailVO.setNewsintro(rs.getString("newsintro"));
				newsdetailVO.setEmpno(rs.getString("emp_no"));
				newsdetailVO.setCoverpic(rs.getBytes("coverpic"));
				newsdetailVO.setNewsdate(rs.getTimestamp("newsdate"));
				newsdetailVO.setStatus(rs.getString("status"));
				list.add(newsdetailVO);			
			}
			
		// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		
		// Clean up JDBC resources
		} finally {
			if(pstmt !=null){
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			
			if(con != null){
				try {
					con.close();
				} catch (Exception e){
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	public static void main(String[] args) throws IOException{
		
		NewsdetailJNDIDAO dao = new NewsdetailJNDIDAO();
		
		File pic = new File("WebContent/img", "p1.jpg");
		byte[] buffer = Files.readAllBytes(pic.toPath());
		
		// 新增 *****************
//		NewsdetailVO newsdetailVO1 = new NewsdetailVO();
//		newsdetailVO1.setNewstitle("有我罩你進駐中科，佈局國際市場");
//		newsdetailVO1.setNewsintro("全球人口高齡化的必然趨勢，促使生技醫療產業前景持續看好，我國向來致力發展生技產業，由科技部輔導廠商投入創新研發，落實科研成果產業化，並於全台設立科學園區形成生技產業聚落，有我罩你於7月25日正式進駐中部科學工業園區，成立「克弗爾肽」研發中心，擴大研發能量，進軍國際市場");
//		newsdetailVO1.setEmpno("EMP0005");
//		newsdetailVO1.setCoverpic(buffer);
//		newsdetailVO1.setStatus("上架");
//		dao.insert(newsdetailVO1);
//		System.out.println("新增成功");
		
		
		// 修改  *****************
//		NewsdetailVO newsdetailVO2 = new NewsdetailVO();
//		
//		newsdetailVO2.setNewsno("ND0059");
//		newsdetailVO2.setNewstitle("讓我們一起學習有尊嚴的照護，熱烈報名中");
//		newsdetailVO2.setNewsintro("全球人口高齡化的必然趨勢，促使生技醫療產業前景持續看好，我國向來致力發展生技產業，由科技部輔導廠商投入創新研發，落實科研成果產業化，並於全台設立科學園區形成生技產業聚落，有我罩你於7月25日正式進駐中部科學工業園區，成立「克弗爾肽」研發中心，擴大研發能量，進軍國際市場");
//		newsdetailVO2.setEmpno("EMP0010");
//		newsdetailVO2.setCoverpic(buffer);
//		newsdetailVO2.setNewsdate(new Timestamp(System.currentTimeMillis()));
//		newsdetailVO2.setStatus("下架");
//		dao.update(newsdetailVO2);
//		System.out.println("修改成功:" + System.currentTimeMillis());
//		
		
		
		
		// 刪除 *****************
//		dao.delete("ND0005");
//		System.out.println("刪除成功");
//		
		
//		NewsdetailVO newsdetailVO3 = dao.findByPrimaryKey("ND0010");
//		System.out.println("Newsno : " + newsdetailVO3.getNewsno() + ".");
//		System.out.println("NewsTitle : " + newsdetailVO3.getNewstitle() + ".");
//		System.out.println("NewsIntro : " + newsdetailVO3.getNewsintro() + ".");
//		System.out.println("Empno : " + newsdetailVO3.getEmpno() + ".");
//		System.out.println("Coverpic : " + newsdetailVO3.getCoverpic() + ".");
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		System.out.println("Newsdate : " + format.format(newsdetailVO3.getNewsdate()));
//		System.out.println();
		
		
		// 查全部 *****************
//		List<NewsdetailVO> list = dao.getAll();
//		for(NewsdetailVO newsDetailVO : list){
//			System.out.println("Newsno : " + newsDetailVO.getNewsno()+ ",");
//			System.out.println("Newstitle : " + newsDetailVO.getNewstitle()+ ",");
//			System.out.println("NewsIntro : " + newsDetailVO.getNewsintro()+ ",");
//			System.out.println("Empno : " + newsDetailVO.getEmpno()+ ",");
//			System.out.println("Coverpic : " + newsDetailVO.getCoverpic()+ ",");
//			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			System.out.println("Newsdate : " + format.format(newsDetailVO.getNewsdate()));
//			System.out.println();
//		}
		
		List<NewsdetailVO> list = dao.getNewOnAll();
		for(NewsdetailVO newsDetailVO : list){
			System.out.println("Newsno : " + newsDetailVO.getNewsno()+ ",");
			System.out.println("Newstitle : " + newsDetailVO.getNewstitle()+ ",");
			System.out.println("NewsIntro : " + newsDetailVO.getNewsintro()+ ",");
			System.out.println("Empno : " + newsDetailVO.getEmpno()+ ",");
			System.out.println("Coverpic : " + newsDetailVO.getCoverpic()+ ",");
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println("Newsdate : " + format.format(newsDetailVO.getNewsdate()));
			System.out.println("Status :" + newsDetailVO.getStatus());
			System.out.println();
		}
	}
		
}
	
