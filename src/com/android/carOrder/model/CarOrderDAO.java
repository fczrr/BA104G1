package com.android.carOrder.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.android.carDetailVO.model.CarDetailVO;
import com.android.carSchedul.model.CarSchedulVO;
import com.android.carType.model.CarTypeService;
import com.android.member.model.MemberVO;
import com.employee.model.EmployeeService;

public class CarOrderDAO implements CarOrderDAO_interface{
	private static DataSource ds;
	
	
	private static final String INSERT_CAR_ORDER="INSERT INTO CAR_ORDER(ORDER_NO,MEM_NO,ORDER_DATE,ORDER_STATUS)　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),?,?,?)";
	private static final String INSERT_CAR_DETAIL="INSERT INTO CAR_DETAIL(DETAIL_NO,ORDER_NO,VEHICLE_NO,DETAIL_DATE,DETAIL_TIME,PASSENGER_NAME,PASSENGER_PHONE,GETINTO_ADDRESS,ARRIVAL_ADDRESS,SENDCAR_STATUS)　"
			+ "VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_CAR_SCHEDUL = "UPDATE CAR_SCHEDUL SET ATTENDANCE = ? WHERE SERIAL_NO=?";
	private static final String UPDATE_MEMBER_POINT = "UPDATE MEMBER SET POINT = ? WHERE MEM_NO=?";
	private static final String FIND_MEMNO_ORDER = "SELECT * FROM CAR_ORDER WHERE MEM_NO=?";
	private static final String GET_DETAIL_BY_ORDERNO = "SELECT * FROM CAR_DETAIL JOIN VEHICLE ON VEHICLE.VEHICLE_NO = CAR_DETAIL.VEHICLE_NO WHERE ORDER_NO=?";
	
	private static final String GET_EMP = "SELECT * FROM CAR_DETAIL JOIN VEHICLE ON (CAR_DETAIL.VEHICLE_NO=VEHICLE.VEHICLE_NO) JOIN EMPLOYEE ON (EMPLOYEE.EMP_NO=VEHICLE.EMP_NO) JOIN CAR_ORDER"
			+ " ON (CAR_ORDER.ORDER_NO=CAR_DETAIL.ORDER_NO) WHERE VEHICLE.EMP_NO=?";
	
	static{
		try {
			Context ctx = new javax.naming.InitialContext();
			ds =(DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void addCarOrder(CarOrderVO carOrderVO,MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String ORDER_NO = null;
		try {
			con = ds.getConnection();
			//=======================
			con.setAutoCommit(false);
			//=======================
			
			String[] cols = {"ORDER_NO"};
			
			//=======================
			pstmt = con.prepareStatement(INSERT_CAR_ORDER,cols);
			//=======================
			
			pstmt.setString(1, carOrderVO.getMemNo());
			pstmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
			pstmt.setString(3, carOrderVO.getOrderStatus());
			int i  = pstmt.executeUpdate();   //1.
			System.out.println("新增"+i+"筆派車訂單");
			
			//=======================
			rs = pstmt.getGeneratedKeys();
			if(rs.next()){
				ORDER_NO = rs.getString(1);
				System.out.println("訂單綁定自增主鍵"+ORDER_NO);
			}
			//=======================
			for(CarDetailVO detail :carOrderVO.getDetailList()){
				detail.setOrderNo(ORDER_NO);
				pstmt = con.prepareStatement(INSERT_CAR_DETAIL);
				pstmt.setString(1, detail.getOrderNo());
				pstmt.setInt(2, detail.getVehicleNo());
				pstmt.setDate(3, detail.getDetailDate());
				pstmt.setString(4, detail.getDetailTime());
				pstmt.setString(5, detail.getPassengerName());
				pstmt.setInt(6, detail.getPassengerPhone());
				pstmt.setString(7, detail.getGetintoAddress());
				pstmt.setString(8, detail.getArrivalAddress());
				pstmt.setString(9, detail.getSendCarStatus());
				pstmt.executeUpdate();   //2.
				System.out.println("新增一筆派車明細");
			}
			
			//=========儲值============
			pstmt = con.prepareStatement(UPDATE_MEMBER_POINT);
			pstmt.setInt(1,memberVO.getPoint());
			pstmt.setString(2,memberVO.getMemNo());
			pstmt.executeUpdate();
			System.out.println("成功更新會員點數");
			
			//=======================
			con.commit();
			
		} catch (SQLException e) {
			try {
				e.printStackTrace();
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
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
	public List<CarOrderVO> findByMemNo(String memNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		List<CarOrderVO> orderList =new ArrayList<>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_MEMNO_ORDER);
			pstmt.setString(1,memNo);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CarOrderVO carOrderVO = new CarOrderVO();
				carOrderVO.setOrderNo(rs.getString("ORDER_NO"));
				carOrderVO.setMemNo(rs.getString("MEM_NO"));
				carOrderVO.setOrderDate(rs.getTimestamp("ORDER_DATE"));
				carOrderVO.setOrderStatus(rs.getString("ORDER_STATUS"));
				System.out.println("抓出一筆會員派車定單");
				
				pstmt2 = con.prepareStatement(GET_DETAIL_BY_ORDERNO);
				pstmt2.setString(1, carOrderVO.getOrderNo());
				rs2 = pstmt2.executeQuery();
				List<CarDetailVO> list = carOrderVO.getDetailList();
	
				while(rs2.next()){
					CarDetailVO carDetailVO = new CarDetailVO();
					carDetailVO.setCarTypeVO(new CarTypeService().getByVehicleNo(rs2.getInt("VEHICLE_NO")));
					carDetailVO.setDetialNo(rs2.getString("DETAIL_NO"));
					carDetailVO.setEmpNo(rs2.getString("EMP_NO"));
					carDetailVO.setEmployeeVO(new EmployeeService().findByPrimaryKey(rs2.getString("EMP_NO")));
					carDetailVO.setDetailTime(rs2.getString("DETAIL_TIME"));
					carDetailVO.setPassengerName(rs2.getString("PASSENGER_NAME"));
					carDetailVO.setPassengerPhone(rs2.getInt("PASSENGER_PHONE"));
					carDetailVO.setDetailDate(rs2.getDate("DETAIL_DATE"));
					carDetailVO.setGetintoAddress(rs2.getString("GETINTO_ADDRESS"));
					carDetailVO.setArrivalAddress(rs2.getString("ARRIVAL_ADDRESS"));
					carDetailVO.setSendCarStatus(rs2.getString("SENDCAR_STATUS"));
					System.out.println("抓出一筆會員派車明細");
					list.add(carDetailVO);
				}
				orderList.add(carOrderVO);
			}
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
		return orderList;
	}
	
	
	
	
	@Override
	public void insert(CarOrderVO carOrderVO) {
		
	}

	@Override
	public void update(CarOrderVO carOrderVO) {
		
	}

	@Override
	public void delete(String orderNo) {
	}

	@Override
	public List<CarOrderVO> getAll() {
		return null;
	}
	@Override
	public List<CarDetailVO> getEmpOrder(String empNo) {
		List<CarDetailVO> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_EMP);
			pstmt.setString(1, empNo);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CarDetailVO carDetailVO = new CarDetailVO();
				carDetailVO.setDetialNo(rs.getString("DETAIL_NO"));
				carDetailVO.setDetailDate(rs.getDate("DETAIL_DATE"));
				carDetailVO.setDetailTime(rs.getString("DETAIL_TIME"));
				carDetailVO.setPassengerName(rs.getString("PASSENGER_NAME"));
				carDetailVO.setPassengerPhone(rs.getInt("PASSENGER_PHONE"));
				carDetailVO.setGetintoAddress(rs.getString("GETINTO_ADDRESS"));
				carDetailVO.setArrivalAddress(rs.getString("ARRIVAL_ADDRESS"));
				carDetailVO.setSendCarStatus(rs.getString("SENDCAR_STATUS"));
				carDetailVO.setMemNo(rs.getString("MEM_NO"));
				System.out.println("派車員工查明係");
				list.add(carDetailVO);
			}
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
		return list;
	}	
}
