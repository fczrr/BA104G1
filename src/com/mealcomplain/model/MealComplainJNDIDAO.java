package com.mealcomplain.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class MealComplainJNDIDAO implements MealComplainDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 新增申訴
	private static final String INSERT_STMT = 
			"INSERT INTO MEALCOMPLAIN (COMPLAINNO, MO_NO, COMPLAINDETAIL, COMPLAINSTATUS) VALUES (to_char('MO'||LPAD(to_char(MEALCOM_NO_SEQ.NEXTVAL),6,'0')), ?, ?, ? )";
	
	// 修改申訴
	private static final String UPDATE = 
			"UPDATE MEALCOMPLAIN SET COMPLAINREPLY=?, REPLYDATE=CURRENT_TIMESTAMP, EMP_NO =?, COMPLAINSTATUS =? WHERE COMPLAINNO = ?";
	
	// 查全部申訴
	private static final String GET_ALL_STMT =
			"SELECT COMPLAINNO, MO_NO, COMPLAINDETAIL, DETAILDATE , COMPLAINREPLY, REPLYDATE, EMP_NO ,COMPLAINSTATUS FROM MEALCOMPLAIN ORDER BY COMPLAINNO";
	
	// 申訴單號單一查詢
	private static final String GET_ONE_STMT = 
			"SELECT COMPLAINNO, MO_NO, COMPLAINDETAIL, DETAILDATE , COMPLAINREPLY, REPLYDATE, EMP_NO ,COMPLAINSTATUS FROM MEALCOMPLAIN WHERE COMPLAINNO=?";

	private static final String DELETE =
			"DELETE FROM MEALCOMPLAIN WHERE COMPLAINNO = ?";
	
	
	@Override
	public void insert(MealComplainVO mealComplainVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, mealComplainVO.getMo_no());
			pstmt.setString(2, mealComplainVO.getComplainDetail());
			pstmt.setString(3, mealComplainVO.getComplainStatus());
			pstmt.executeQuery();
			
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
				try{
					con.close();
				} catch(Exception e){
					e.printStackTrace(System.err);
				}
			}
		}
	}
	
	
	@Override
	public void update(MealComplainVO mealComplainVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, mealComplainVO.getComplainReply());
			pstmt.setString(2, mealComplainVO.getEmp_no());
			pstmt.setString(3, mealComplainVO.getComplainStatus());
			pstmt.setString(4, mealComplainVO.getComplainNo());
			
			pstmt.executeQuery();

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
	public MealComplainVO findByPrimaryKey(String complainNo) {
		MealComplainVO mealComplainVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, complainNo);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				mealComplainVO = new MealComplainVO();
				mealComplainVO.setComplainNo(rs.getString("complainno"));
				mealComplainVO.setMo_no(rs.getString("mo_no"));
				mealComplainVO.setComplainDetail(rs.getString("complaindetail"));
				mealComplainVO.setDetailDate(rs.getTimestamp("detaildate"));
				mealComplainVO.setComplainReply(rs.getString("complainreply"));
				mealComplainVO.setReplyDate(rs.getTimestamp("replydate"));
				mealComplainVO.setEmp_no(rs.getString("emp_no"));
				mealComplainVO.setComplainStatus(rs.getString("complainstatus"));
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
		return mealComplainVO;
	}
	
	
	@Override
	public List<MealComplainVO> getAll() {
		List<MealComplainVO> list = new ArrayList<MealComplainVO>();
		MealComplainVO mealComplainVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				mealComplainVO = new MealComplainVO();
				mealComplainVO.setComplainNo(rs.getString("complainno"));
				mealComplainVO.setMo_no(rs.getString("mo_no"));
				mealComplainVO.setComplainDetail(rs.getString("complaindetail"));
				mealComplainVO.setDetailDate(rs.getTimestamp("detaildate"));
				mealComplainVO.setComplainReply(rs.getString("complainreply"));
				mealComplainVO.setReplyDate(rs.getTimestamp("replydate"));
				mealComplainVO.setEmp_no(rs.getString("emp_no"));
				mealComplainVO.setComplainStatus(rs.getString("complainstatus"));
				list.add(mealComplainVO);
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
	public void delete(String complainNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, complainNo);
			
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
	
	
	
	public static void main(String[] args){
		
		MealComplainJNDIDAO dao = new MealComplainJNDIDAO();
		
		
		// 新增
		for(int i=0 ; i<10; i++){
		MealComplainVO mealComplainVO1 = new MealComplainVO();
		mealComplainVO1.setMo_no("20171104-000002");
		mealComplainVO1.setComplainDetail("test test");
		mealComplainVO1.setComplainStatus("未處理");
		dao.insert(mealComplainVO1);
		System.out.println("新增成功"+i);
		}
		
		
		// 修改
//		MealComplainVO mealComplainVO2 = new MealComplainVO();
//		mealComplainVO2.setComplainNo("MO000002");
//		mealComplainVO2.setEmp_no("EMP0001");	
//		mealComplainVO2.setComplainReply("小天使來解答,我們會再跟進!!!!");
//		mealComplainVO2.setComplainStatus("已完成");
//		dao.update(mealComplainVO2);
//		System.out.println("修改成功阿阿阿阿阿");

		// 查單個
//		MealComplainVO mealComplainVO3 = dao.findByPrimaryKey("MO000004");
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

//		System.out.println("ComplainNo : " + mealComplainVO3.getComplainNo());
//		System.out.println("MONO : " + mealComplainVO3.getMo_no());
//		System.out.println("ComplainDetail : " + mealComplainVO3.getComplainDetail());
//		System.out.println("DetailDate : " + sdf.format(mealComplainVO3.getDetailDate()));
//		System.out.println("ComplainReply : " + mealComplainVO3.getComplainReply());
//		System.out.println("ReplyDate : " + sdf.format(mealComplainVO3.getReplyDate()));
//		System.out.println("EmpNO : " + mealComplainVO3.getEmp_no());
//		System.out.println("Status : " + mealComplainVO3.getComplainStatus());
//		System.out.println();
		
		
		// 查全部
//		List<MealComplainVO> list = dao.getAll();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		for( MealComplainVO mealComplainVO : list){
//			System.out.println("ComplainNO :" + mealComplainVO.getComplainNo());
//			System.out.println("MONO :" + mealComplainVO.getMo_no());
//			System.out.println("ComplainDetail : " + mealComplainVO.getComplainDetail());
//			System.out.println("DetailDate : " + sdf.format(mealComplainVO.getDetailDate()));
//			System.out.println("ComplainReply : "+ mealComplainVO.getComplainReply());
//			System.out.println("ReplyDate : " + sdf.format(mealComplainVO.getReplyDate()));
//			System.out.println("EmpNO : " + mealComplainVO.getEmp_no());
//			System.out.println("Status : " + mealComplainVO.getComplainStatus());
//			System.out.println("-------------------------------------");	
//		}
	}
}
