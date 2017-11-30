package com.hccomplain.model;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


public class HcComplainJDBCDAO implements HcComplainDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String userid = "BA104G1DB";
	String passwd = "BA104G1DB";
	

//	// ************* Localhost **********
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	String url = "jdbc:oracle:thin:@13.229.86.22:1521:XE";
	
	
	

	// 新增申訴
	private static final String INSERT_STMT = 
			"INSERT INTO HCCOMPLAIN (COMPLAINNO, ORDER_NO, COMPLAINDETAIL, COMPLAINSTATUS) VALUES (to_char('HC'||LPAD(to_char(HCCOM_NO_SEQ.NEXTVAL),6,'0')), ?, ?, ? )";
	
	// 修改申訴
	private static final String UPDATE = 
			"UPDATE HCCOMPLAIN SET COMPLAINREPLY=?, REPLYDATE=CURRENT_TIMESTAMP, EMP_NO =?, COMPLAINSTATUS =? WHERE COMPLAINNO = ?";
	
	// 查全部申訴
	private static final String GET_ALL_STMT =
			"SELECT COMPLAINNO, ORDER_NO, COMPLAINDETAIL, DETAILDATE , COMPLAINREPLY, REPLYDATE, EMP_NO ,COMPLAINSTATUS FROM HCCOMPLAIN ORDER BY COMPLAINNO";
	
	// 申訴單號單一查詢
	private static final String GET_ONE_STMT = 
			"SELECT COMPLAINNO, ORDER_NO, COMPLAINDETAIL, DETAILDATE , COMPLAINREPLY, REPLYDATE, EMP_NO ,COMPLAINSTATUS FROM HCCOMPLAIN WHERE COMPLAINNO=?";

	private static final String DELETE =
			"DELETE FROM HCCOMPLAIN WHERE COMPLAINNO = ?";
	
	private static final String GET_STAT_STMT = 
			"SELECT COMPLAINNO, ORDER_NO, COMPLAINDETAIL, DETAILDATE , COMPLAINREPLY, REPLYDATE, EMP_NO ,COMPLAINSTATUS FROM HCCOMPLAIN WHERE COMPLAINSTATUS=?";

	
	
	@Override
	public void insert(HcComplainVO hcComplainVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, hcComplainVO.getOrder_no());
			pstmt.setString(2, hcComplainVO.getComplainDetail());
			pstmt.setString(3, hcComplainVO.getComplainStatus());
			pstmt.executeQuery();
			
		// Handle any driver errors		
		} catch (ClassNotFoundException e){
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());

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
	public void update(HcComplainVO hcComplainVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, hcComplainVO.getComplainReply());
			pstmt.setString(2, hcComplainVO.getEmp_no());
			pstmt.setString(3, hcComplainVO.getComplainStatus());
			pstmt.setString(4, hcComplainVO.getComplainNo());
			
			pstmt.executeQuery();
		
			// Handle any driver errors	
			} catch (ClassNotFoundException e) {
				throw new RuntimeException("Couldn't load database driver. "
						+ e.getMessage());
							
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
	public HcComplainVO findByStatus(String complainStatus) {
		HcComplainVO hcComplainVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_STAT_STMT );
			
			pstmt.setString(1, complainStatus);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				hcComplainVO = new HcComplainVO();
				hcComplainVO.setComplainNo(rs.getString("complainno"));
				hcComplainVO.setOrder_no(rs.getString("order_no"));
				hcComplainVO.setComplainDetail(rs.getString("complaindetail"));
				hcComplainVO.setDetailDate(rs.getTimestamp("detaildate"));
				hcComplainVO.setComplainReply(rs.getString("complainreply"));
				hcComplainVO.setReplyDate(rs.getTimestamp("replydate"));
				hcComplainVO.setEmp_no(rs.getString("emp_no"));
				hcComplainVO.setComplainStatus(rs.getString("complainstatus"));
			}
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
		return hcComplainVO;
	}
	
	
	@Override
	public HcComplainVO findByPrimaryKey(String complainNo) {
		HcComplainVO hcComplainVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, complainNo);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				hcComplainVO = new HcComplainVO();
				hcComplainVO.setComplainNo(rs.getString("complainno"));
				hcComplainVO.setOrder_no(rs.getString("order_no"));
				hcComplainVO.setComplainDetail(rs.getString("complaindetail"));
				hcComplainVO.setDetailDate(rs.getTimestamp("detaildate"));
				hcComplainVO.setComplainReply(rs.getString("complainreply"));
				hcComplainVO.setReplyDate(rs.getTimestamp("replydate"));
				hcComplainVO.setEmp_no(rs.getString("emp_no"));
				hcComplainVO.setComplainStatus(rs.getString("complainstatus"));
			}
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
		return hcComplainVO;
	}
	
	
	
	
	
	@Override
	public List<HcComplainVO> getAll() {
		List<HcComplainVO> list = new ArrayList<HcComplainVO>();
		HcComplainVO hcComplainVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				hcComplainVO = new HcComplainVO();
				hcComplainVO.setComplainNo(rs.getString("complainno"));
				hcComplainVO.setOrder_no(rs.getString("order_no"));
				hcComplainVO.setComplainDetail(rs.getString("complaindetail"));
				hcComplainVO.setDetailDate(rs.getTimestamp("detaildate"));
				hcComplainVO.setComplainReply(rs.getString("complainreply"));
				hcComplainVO.setReplyDate(rs.getTimestamp("replydate"));
				hcComplainVO.setEmp_no(rs.getString("emp_no"));
				hcComplainVO.setComplainStatus(rs.getString("complainstatus"));
				list.add(hcComplainVO);
			}
			
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, complainNo);
			
			pstmt.executeUpdate();
			
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
		
		HcComplainJDBCDAO dao = new HcComplainJDBCDAO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		// 新增
		for(int i= 0; i<10 ;i++){
		HcComplainVO hcComplainVO1 = new HcComplainVO();
		hcComplainVO1.setOrder_no("20171104-500003");
		hcComplainVO1.setComplainDetail("tESTTESTETSTETETSTTESte");
		hcComplainVO1.setComplainStatus("未處理");
		dao.insert(hcComplainVO1);
		System.out.println("新增成功");
	}
		
		// 修改
//		HcComplainVO hcComplainVO2 = new HcComplainVO();
//		hcComplainVO2.setComplainNo("HC000003");
//		hcComplainVO2.setEmp_no("EMP0001");	
//		hcComplainVO2.setComplainReply("小天使來解答,我們會再跟進!!!!");
//		hcComplainVO2.setComplainStatus("已完成");
//		dao.update(hcComplainVO2);
//		System.out.println("修改成功阿阿阿阿阿");
		
		
		// 查單個
//		HcComplainVO hcComplainVO3 = dao.findByPrimaryKey("HC000003");
//		System.out.println("ComplainNo : " + hcComplainVO3.getComplainNo());
//		System.out.println("OrderNO : " + hcComplainVO3.getOrder_no());
//		System.out.println("ComplainDetail : " + hcComplainVO3.getComplainDetail());
//		System.out.println("DetailDate : " + sdf.format(hcComplainVO3.getDetailDate()));
//		System.out.println("ComplainReply : " + hcComplainVO3.getComplainReply());
//		System.out.println("ReplyDate : " + sdf.format(hcComplainVO3.getReplyDate()));
//		System.out.println("EmpNO : " + hcComplainVO3.getEmp_no());
//		System.out.println("Status : " + hcComplainVO3.getComplainStatus());
//		System.out.println();
		
		
		
		// 查全部
//		List<HcComplainVO> list = dao.getAll();
//		for(HcComplainVO hcComplainVO : list){
//			System.out.println("ComplainNo : " + hcComplainVO.getComplainNo());
//			System.out.println("OrderNO : " + hcComplainVO.getOrder_no());
//			System.out.println("ComplainDetail : " + hcComplainVO.getComplainDetail());
//			System.out.println("DetailDate : " + sdf.format(hcComplainVO.getDetailDate()));
//			System.out.println("ComplainReply : " + hcComplainVO.getComplainReply());
//			System.out.println("ReplyDate : " + sdf.format(hcComplainVO.getReplyDate()));
//			System.out.println("EmpNO : " + hcComplainVO.getEmp_no());
//			System.out.println("Status : " + hcComplainVO.getComplainStatus());
//			System.out.println();
//		}
	}
}
