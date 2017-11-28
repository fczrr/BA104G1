package com.employee.model;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class EmployeeDAO implements EmployeeDAO_interface {
	private static DataSource ds = null;

	private static final String INSERT_STMT = "INSERT INTO EMPLOYEE (EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES) "
			+ "VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')),?,?,?,?,?,?,?, TO_DATE(?,'yyyy/mm/dd'),?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM EMPLOYEE";
	private static final String GET_ONE_STMT = "SELECT * FROM EMPLOYEE WHERE EMP_NO=?";
	private static final String GET_ONE_BYMEMID = "SELECT * FROM EMPLOYEE WHERE EMP_ID=?";
	private static final String GET_BY_DEP = "SELECT * FROM  EMPLOYEE WHERE EMP_DEP = ? ";
	private static final String UPDATE = "UPDATE EMPLOYEE SET EMP_NAME = ?,EMP_PHONE = ?,EMP_GENDER = ?,EMP_EMAIL = ?,EMP_DEP=?,AUTHORITY_NO=?,EMP_TITLE=?,EMP_ID=?,EMP_PWD=?,EMP_BRANCHES=?,EMP_STATUS= ? WHERE EMP_NO=?";

	static {
		try {
			Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void insert(EmployeeVO employeeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, employeeVO.getEmpName());
			pstmt.setString(2, employeeVO.getEmpPhone());
			pstmt.setString(3, employeeVO.getEmpGender());
			pstmt.setString(4, employeeVO.getEmpEmail());
			pstmt.setString(5, employeeVO.getEmpDep());
			pstmt.setString(6, employeeVO.getAuthorityNo());
			pstmt.setString(7, employeeVO.getEmpTitle());
			pstmt.setDate(8, employeeVO.getOnBoardDate());
			pstmt.setString(9, employeeVO.getEmpId());
			pstmt.setString(10, employeeVO.getEmpPwd());
			pstmt.setString(11, employeeVO.getEmpBranches());


			int i = pstmt.executeUpdate();
//			System.out.println("成功新增一筆EmployeeVO");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void update(EmployeeVO employeeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
	
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1,  employeeVO.getEmpName());
			pstmt.setString(2,  employeeVO.getEmpPhone());
			pstmt.setString(3,  employeeVO.getEmpGender());
			pstmt.setString(4,  employeeVO.getEmpEmail());
			pstmt.setString(5,  employeeVO.getEmpDep());
			
			pstmt.setString(6,  employeeVO.getAuthorityNo());
			pstmt.setString(7,  employeeVO.getEmpTitle());
			pstmt.setString(8,  employeeVO.getEmpId());
			pstmt.setString(9,  employeeVO.getEmpPwd());
			pstmt.setString(10, employeeVO.getEmpBranches());
			pstmt.setString(11, employeeVO.getEmpStatus());
			pstmt.setString(12, employeeVO.getEmpNo());
			
			
			int i = pstmt.executeUpdate();
			System.out.println("成功更新"+i+"筆員工資料");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
				
		}
	}

	@Override
	public EmployeeVO findByPrimaryKey(String empNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeVO empVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, empNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				empVO = new EmployeeVO();
				empVO.setEmpNo(rs.getString("EMP_NO"));
				empVO.setEmpName(rs.getString("EMP_NAME"));
				empVO.setEmpPhone(rs.getString("EMP_PHONE"));
				empVO.setEmpGender(rs.getString("EMP_GENDER"));
				empVO.setEmpEmail(rs.getString("EMP_EMAIL"));
				empVO.setEmpDep(rs.getString("EMP_DEP"));
				empVO.setAuthorityNo(rs.getString("AUTHORITY_NO"));
				empVO.setEmpTitle(rs.getString("EMP_TITLE"));
				empVO.setOnBoardDate(rs.getDate("ON_BOARD_DATE"));
				empVO.setEmpId(rs.getString("EMP_ID"));
				empVO.setEmpPwd(rs.getString("EMP_PWD"));
				empVO.setEmpStatus(rs.getString("EMP_STATUS"));
				empVO.setEmpBranches(rs.getString("EMP_BRANCHES"));
				empVO.setEmpUpdateTime(rs.getTimestamp("EMP_UPDATE_TIME"));
				System.out.println("成功查詢一筆員工資料empNo");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return empVO;
	}

	@Override
	public EmployeeVO findByEmpId(String empId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeVO empVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_BYMEMID);
			pstmt.setString(1, empId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				empVO = new EmployeeVO();
				empVO.setEmpNo(rs.getString("EMP_NO"));
				empVO.setEmpName(rs.getString("EMP_NAME"));
				empVO.setEmpPhone(rs.getString("EMP_PHONE"));
				empVO.setEmpGender(rs.getString("EMP_GENDER"));
				empVO.setEmpEmail(rs.getString("EMP_EMAIL"));
				empVO.setEmpDep(rs.getString("EMP_DEP"));
				empVO.setAuthorityNo(rs.getString("AUTHORITY_NO"));
				empVO.setEmpTitle(rs.getString("EMP_TITLE"));
				empVO.setOnBoardDate(rs.getDate("ON_BOARD_DATE"));
				empVO.setEmpId(rs.getString("EMP_ID"));
				empVO.setEmpPwd(rs.getString("EMP_PWD"));
				empVO.setEmpStatus(rs.getString("EMP_STATUS"));
				empVO.setEmpBranches(rs.getString("EMP_BRANCHES"));
				empVO.setEmpUpdateTime(rs.getTimestamp("EMP_UPDATE_TIME"));
				System.out.println("成功查詢一筆員工資料empId");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return empVO;
	}

	@Override
	public List<EmployeeVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EmployeeVO> empList = new ArrayList<>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				EmployeeVO empVO = new EmployeeVO();
				empVO.setEmpNo(rs.getString("EMP_NO"));
				empVO.setEmpName(rs.getString("EMP_NAME"));
				empVO.setEmpPhone(rs.getString("EMP_PHONE"));
				empVO.setEmpGender(rs.getString("EMP_GENDER"));
				empVO.setEmpEmail(rs.getString("EMP_EMAIL"));
				empVO.setEmpDep(rs.getString("EMP_DEP"));
				empVO.setAuthorityNo(rs.getString("AUTHORITY_NO"));
				empVO.setEmpTitle(rs.getString("EMP_TITLE"));
				empVO.setOnBoardDate(rs.getDate("ON_BOARD_DATE"));
				empVO.setEmpId(rs.getString("EMP_ID"));
				empVO.setEmpPwd(rs.getString("EMP_PWD"));
				empVO.setEmpStatus(rs.getString("EMP_STATUS"));
				empVO.setEmpBranches(rs.getString("EMP_BRANCHES"));
				empVO.setEmpUpdateTime(rs.getTimestamp("EMP_UPDATE_TIME"));
				empList.add(empVO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return empList;
	}

	@Override
	public List<EmployeeVO> getByDep(String empDep) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EmployeeVO> empList = new ArrayList<>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_DEP);
			pstmt.setString(1, empDep);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				EmployeeVO empVO = new EmployeeVO();
				empVO.setEmpNo(rs.getString("EMP_NO"));
				empVO.setEmpName(rs.getString("EMP_NAME"));
				empVO.setEmpPhone(rs.getString("EMP_PHONE"));
				empVO.setEmpGender(rs.getString("EMP_GENDER"));
				empVO.setEmpEmail(rs.getString("EMP_EMAIL"));
				empVO.setEmpDep(rs.getString("EMP_DEP"));
				empVO.setAuthorityNo(rs.getString("AUTHORITY_NO"));
				empVO.setEmpTitle(rs.getString("EMP_TITLE"));
				empVO.setOnBoardDate(rs.getDate("ON_BOARD_DATE"));
				empVO.setEmpId(rs.getString("EMP_ID"));
				empVO.setEmpPwd(rs.getString("EMP_PWD"));
				empVO.setEmpStatus(rs.getString("EMP_STATUS"));
				empVO.setEmpBranches(rs.getString("EMP_BRANCHES"));
				empVO.setEmpUpdateTime(rs.getTimestamp("EMP_UPDATE_TIME"));
				empList.add(empVO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return empList;
	}

}
