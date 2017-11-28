package com.hcworkshifts.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_workShift;





public class HcWorkShiftsJDBCDAO implements HcWorkShiftsDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = 
		"INSERT INTO Hc_WorkShifts (MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) "
		+ "VALUES (?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "select * from HC_WORKSHIFTS ORDER BY MONTH_OF_YEAR,EMP_NO";
	
	private static final String GET_ONE_BY_DATE = "select * from HC_WORKSHIFTS "
			+ "where MONTH_OF_YEAR =? and Substr(WORK_SHIFT_STATUS,?,1)='空' order by TOTAL_WORK_SHIFTS";
	
	private static final String GET_ALl_BY_MONTH = "select * from HC_WORKSHIFTS "
			+ "where MONTH_OF_YEAR =? order by TOTAL_WORK_SHIFTS";
	
	private static final String GET_ALl_BY_COMPOSITESQL = "SELECT W.EMP_NO, MONTH_OF_YEAR, WORK_SHIFT_STATUS, "
			+ "TOTAL_WORK_SHIFTS, EMP_NAME,EMP_DEP,EMP_BRANCHES,EMP_STATUS "
			+ "FROM HC_WORKSHIFTS W JOIN EMPLOYEE E ON W.EMP_NO = E.EMP_NO "
			+ "AND EMP_DEP='長照' AND EMP_BRANCHES='10' AND EMP_STATUS='ON' ";
	
//	private static final String GET_EMPNO_BY_TOTALWORKTIME = "select * from HC_WORKSHIFTS "
//			+ "where MONTH_OF_YEAR =? and Substr(WORK_SHIFT_STATUS,?,1)='空' order by TOTAL_WORK_SHIFTS";
	
	private static final String GET_ONE_STMT = 
		"SELECT MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS "
		+ "FROM Hc_WorkShifts where MONTH_OF_YEAR=? and EMP_NO=?";
	
	private static final String UPDATE = 
		"UPDATE Hc_WorkShifts set WORK_SHIFT_STATUS=?, TOTAL_WORK_SHIFTS=? "
		+ "where MONTH_OF_YEAR=? and EMP_NO=?";


	@Override
	public void insert(HcWorkShiftsVO hcWorkShifts) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, hcWorkShifts.getMonthOfYear());
			pstmt.setString(2, hcWorkShifts.getEmpNo());
			pstmt.setString(3, hcWorkShifts.getWorkShiftStatus());
			pstmt.setInt(4, hcWorkShifts.getTotalWorkShifts());
			
			int i =pstmt.executeUpdate();
			System.out.println("�s�W"+i+"��");
			
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
	public void update(HcWorkShiftsVO hcWorkShifts) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
						
			pstmt.setString(1, hcWorkShifts.getWorkShiftStatus());
			pstmt.setInt(2, hcWorkShifts.getTotalWorkShifts());
			pstmt.setString(3, hcWorkShifts.getMonthOfYear());
			pstmt.setString(4, hcWorkShifts.getEmpNo());
			int i = pstmt.executeUpdate();
			System.out.println("修改"+i+"修改");

			// Handle any driver errors
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
	public HcWorkShiftsVO findByPrimarykey(String monthOfYear ,String empNo) {
		HcWorkShiftsVO hcWorkShifts = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			System.out.println("monthOfYear:" + monthOfYear);
			System.out.println("empNo:" + empNo);
			pstmt.setString(1, monthOfYear);
			pstmt.setString(2, empNo);
			rs = pstmt.executeQuery();

			while(rs.next()){
				
				hcWorkShifts = new HcWorkShiftsVO();
				hcWorkShifts.setMonthOfYear(rs.getString("month_Of_Year"));
				hcWorkShifts.setEmpNo(rs.getString("Emp_No"));
				hcWorkShifts.setWorkShiftStatus(rs.getString("WORK_SHIFT_STATUS"));
				hcWorkShifts.setTotalWorkShifts(rs.getInt("TOTAL_WORK_SHIFTS"));
				
				
				
				System.out.println(hcWorkShifts.getEmpNo());
				System.out.println(hcWorkShifts.getMonthOfYear());
				System.out.println(hcWorkShifts.getWorkShiftStatus());
				System.out.println(hcWorkShifts.getTotalWorkShifts());

			}

			// Handle any driver errors
		} catch (SQLException se) {
			System.out.println(1);
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
		return hcWorkShifts;
		
	}

	@Override
	public List<HcWorkShiftsVO> getAll() {
		List<HcWorkShiftsVO> list = new ArrayList<HcWorkShiftsVO>();
		

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				HcWorkShiftsVO workShifts = new HcWorkShiftsVO();
				workShifts.setMonthOfYear(rs.getString("MONTH_OF_YEAR"));
				workShifts.setEmpNo(rs.getString("EMP_NO"));
				workShifts.setWorkShiftStatus(rs.getString("WORK_SHIFT_STATUS"));
				workShifts.setTotalWorkShifts(rs.getInt("TOTAL_WORK_SHIFTS"));
				list.add(workShifts); // Store the row in the list
			}

			// Handle any driver errors
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
		return list;
	}
	
	
	@Override
	public List<HcWorkShiftsVO> getAll(Map map) {
		List<HcWorkShiftsVO> list = new ArrayList<HcWorkShiftsVO>();
		

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			
			con = ds.getConnection();
			String SQL = "select * from HC_WORKSHIFTS W JOIN EMPLOYEE E ON"
					+ " W.EMP_NO = E.EMP_NO AND EMP_DEP='長照' AND EMP_BRANCHES='10' "
					+ "AND EMP_STATUS='ON' "
					+ jdbcUtil_CompositeQuery_workShift.get_WhereCondition(map)
					+ "order by  TOTAL_WORK_SHIFTS ";
			System.out.println(SQL);
			pstmt = con.prepareStatement(SQL);
					
								
			rs = pstmt.executeQuery();

			while (rs.next()) {
				HcWorkShiftsVO workShifts = new HcWorkShiftsVO();
				workShifts.setMonthOfYear(rs.getString("MONTH_OF_YEAR"));
				workShifts.setEmpNo(rs.getString("EMP_NO"));
				workShifts.setWorkShiftStatus(rs.getString("WORK_SHIFT_STATUS"));
				workShifts.setTotalWorkShifts(rs.getInt("TOTAL_WORK_SHIFTS"));
				list.add(workShifts); // Store the row in the list
			}

			// Handle any driver errors
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
		return list;
	}
	
	@Override
	public List<HcWorkShiftsVO> getAllByDateTime (String yearOfMonth, String shiftNumber) {
		List<HcWorkShiftsVO> list = new ArrayList<HcWorkShiftsVO>();
		

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println("wdao"+yearOfMonth);
			System.out.println("wdao"+shiftNumber);

			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_BY_DATE);
			pstmt.setString(1, yearOfMonth);
			pstmt.setString(2, shiftNumber);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// Store the row in the list
				HcWorkShiftsVO hcWorkShiftsVO = new HcWorkShiftsVO();
				hcWorkShiftsVO.setEmpNo(rs.getString("EMP_NO")); 
				hcWorkShiftsVO.setMonthOfYear(rs.getString("MONTH_OF_YEAR"));
				hcWorkShiftsVO.setWorkShiftStatus(rs.getString("WORK_SHIFT_STATUS"));
				hcWorkShiftsVO.setTotalWorkShifts(rs.getInt("TOTAL_WORK_SHIFTS"));
				list.add(hcWorkShiftsVO); 
			}

			// Handle any driver errors
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
		return list;
	}
	
	@Override
	public HcWorkShiftsVO getOneByDateTime (String yearOfMonth, String shiftNumber){
		HcWorkShiftsVO hcWorkShiftsVO = new HcWorkShiftsVO();
		

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println(yearOfMonth);
			System.out.println(shiftNumber);

			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_BY_DATE);
			pstmt.setString(1, yearOfMonth);
			pstmt.setString(2, shiftNumber);
			rs = pstmt.executeQuery();

			rs.next();
				// Store the row in the list
				hcWorkShiftsVO.setEmpNo(rs.getString("EMP_NO")); 
				hcWorkShiftsVO.setMonthOfYear(rs.getString("MONTH_OF_YEAR"));
				hcWorkShiftsVO.setWorkShiftStatus(rs.getString("WORK_SHIFT_STATUS"));
				hcWorkShiftsVO.setTotalWorkShifts(rs.getInt("TOTAL_WORK_SHIFTS"));


			// Handle any driver errors
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
		return hcWorkShiftsVO;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		HcWorkShiftsJDBCDAO dao = new HcWorkShiftsJDBCDAO();
		
//		HcWorkShiftsVO workShifts = new HcWorkShiftsVO();
//		workShifts.setMonthOfYear("10601");
//		workShifts.setEmpNo("EMP0001");
//		String workShiftStr = "�Ť��ŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪ�"
//				+ "�ŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪ�"
//				+ "�ŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪŪ�";
//		workShifts.setWorkShiftStatus(workShiftStr);		
//		workShifts.setTotalWorkShifts(countWorkShifts(workShiftStr));
//		dao.insert(workShifts);
	
//		HcWorkShiftsVO workShifts2 = new HcWorkShiftsVO();
//		
		HcWorkShiftsVO workShifts = new HcWorkShiftsVO();
		workShifts.setMonthOfYear("10612");
		workShifts.setEmpNo("EMP0020");
		String workShiftStr = "空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空晚空空晚空中晚空空空空空空空空空空空空空空休休休休休休無無無";
		workShifts.setWorkShiftStatus(workShiftStr);
		workShifts.setTotalWorkShifts(countWorkShifts(workShiftStr));
		dao.update(workShifts);
		
//		List<HcWorkShiftsVO> list =dao.getAll();
//		System.out.println("--------getall----------------");
//		for(HcWorkShiftsVO workShift:list){
//			System.out.println(workShift.getMonthOfYear());
//			System.out.println(workShift.getEmpNo());
//			System.out.println(workShift.getWorkShiftStatus());
//			System.out.println(workShift.getTotalWorkShifts());
//			System.out.println("------1-----------------");
//		}
		
//		System.out.println("--------getOne----------------");
//			HcWorkShiftsVO workShift = dao.findByPrimarykey("10611", "EMP0017");
//			System.out.println(workShift.getMonthOfYear());
//			System.out.println(workShift.getEmpNo());
//			System.out.println(workShift.getWorkShiftStatus());
//			System.out.println(workShift.getTotalWorkShifts());
		
//		String[] listS = dao.convertDateToNumber("2017-11-05","晚");
//		
//		for(String Str :listS){
//			System.out.println(Str);
//		}

//		
//		List<HcWorkShiftsVO> listVO = dao.getAllByDateTime(listS[0],listS[1]);
//		for(HcWorkShiftsVO VO :listVO){
//			System.out.println("員工編號"+VO.getEmpNo());
//		}
		
//		Map<String, String[]> map = new TreeMap<String, String[]>();
//		map.put("monthOfYear", new String[] {"10611"});
//		map.put("totalWorkShifts", new String[] {"0-50"});
//		map.put("shiftNumber", new String[] {"66"});
//		map.put("EMP_NAME", new String[] {"關羽"});
//
//		
//		List<HcWorkShiftsVO> list =dao.getAll(map);
//		System.out.println("--------getall--map--------------");
//		for(HcWorkShiftsVO workShift:list){
//			System.out.println(workShift.getMonthOfYear());
//			System.out.println(workShift.getEmpNo());
//			System.out.println(workShift.getWorkShiftStatus());
//			System.out.println(workShift.getTotalWorkShifts());
//			System.out.println("------1-----------------");
//		}
		
		
	}
	static int countWorkShifts(String workShiftStr){
		int count = 0;
		for(int i=0;i<workShiftStr.length();i++){
			if(workShiftStr.charAt(i) == '\u65e9'|| workShiftStr.charAt(i) =='\u4e2d'|| workShiftStr.charAt(i) =='\u665a'){
				count++;
			}
		}		
		return count;
		
	}
	
	static String[] convertDateToNumber(String date,String time){
		String[] listS = new String[2];
		String monthOfYear = (Integer.valueOf(date.substring(0,4))-1911)+date.substring(5,7);
		listS[0] = monthOfYear;
		int shiftNumber = (Integer.valueOf(date.substring(8,10))*3);
		if(time.equals("\u65e9")){
			shiftNumber = shiftNumber-3;
		}else if(time.equals("\u4e2d")){
			shiftNumber = shiftNumber-2;
		}else if(time.equals("\u665a")){
			shiftNumber = shiftNumber-1;
		}
		listS[1] = String.valueOf(shiftNumber);
		return listS;
	}


	
	

}
