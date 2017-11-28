package com.hcorder.modal;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_order;

import java.sql.*;

public class HcOrderJDBCDAO implements HcOrderMasterDAO_interface {
	
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
			"INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS) "
			+ "VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),?,CURRENT_TIMESTAMP,?,?)";

	private static final String INSERT_DETAIL_STMT = 
			"INSERT INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)"
			+"VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),?,?,?,?,?)";
	
	private static final String SELECT_WORKSHIFTS_STATUS ="select WORK_SHIFT_STATUS, TOTAL_WORK_SHIFTS from Hc_WorkShifts where MONTH_OF_YEAR=? and EMP_NO=?";
	
//	private static final String UPDATE_WORKSHIFTS_STATUS ="update Hc_WorkShifts for update set WORK_SHIFT_STATUS = ?"
//			+"where MONTH_OF_YEAR=? and EMP_NO=?";
	
	
	private static final String UPDATE_POINT ="UPDATE MEMBER SET POINT=((select POINT from MEMBER WHERE mem_no=?)-(select exp_price from EXPERT T JOIN EXPERT_LIST L  on T.EXP_NO = L.EXP_NO WHERE EMP_no=?)) WHERE mem_no =?";
	
	
	private static final String GET_ALL_STMT = 
		"SELECT ORDER_NO,MEM_NO,to_char(ORDER_DATE,'yyyy-mm-dd') ORDER_DATE,CARED_NO,ORDER_STATUS FROM HC_ORDER_MASTER order by ORDER_NO";
	
	private static final String GET_ONE_STMT = 
		"SELECT ORDER_NO,MEM_NO,to_char(ORDER_DATE,'yyyy-mm-dd') ORDER_DATE,CARED_NO,ORDER_STATUS FROM HC_ORDER_MASTER where ORDER_NO = ?";
	
	private static final String UPDATE = 
		"UPDATE HC_ORDER_MASTER SET CARED_NO=?, ORDER_STATUS=? where ORDER_NO = ?";
	private static final String GET_BY_MEM_NO = "SELECT * FROM HC_ORDER_MASTER WHERE MEM_NO = ?";
	
	
	@Override
	public String insert(HcOrderMasterVO hcOrderMasterVO,List<HcOrderDetailVO> list) {

		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs= null;
		ResultSet rs2= null;
		String nextOrderNo = null;

		try {

			con = ds.getConnection();
			con.setAutoCommit(false);
			
			String cols[] = {"ORDER_NO"};
			pstmt = con.prepareStatement(INSERT_STMT,cols);

			pstmt.setString(1, hcOrderMasterVO.getMemNo());
			pstmt.setString(2, hcOrderMasterVO.getCaredNo());
			pstmt.setString(3, hcOrderMasterVO.getOrderStatus());
			int i =pstmt.executeUpdate();
		System.out.println("update  "+i+"  row");
			rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				nextOrderNo = rs.getString(1);
				System.out.println("自增主鍵值 = " + nextOrderNo + "(剛新增成功的訂單編號)");
			} else {
				System.out.println("未取得自增主鍵值");
			}
			pstmt.close();
			pstmt = con.prepareStatement(INSERT_DETAIL_STMT);

			for(HcOrderDetailVO hcOrderDetailVO :list){
				
				pstmt.setString(1, nextOrderNo);
				pstmt.setDate(2, hcOrderDetailVO.getServiceDate());
				pstmt.setString(3, hcOrderDetailVO.getServiceTime());
		System.out.println(hcOrderDetailVO.getServiceTime()+hcOrderDetailVO.getServiceDate());
				pstmt.setString(4, hcOrderDetailVO.getEmpNo());
				pstmt.setString(5, hcOrderDetailVO.getOrderDetailStataus());
				int j = pstmt.executeUpdate();
				pstmt.clearParameters();
		System.out.println("update detail "+j+"  row");
				//新增班表
				pstmt2 = con.prepareStatement(SELECT_WORKSHIFTS_STATUS,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
				String[] sevDatas = convertDateToNumber(hcOrderDetailVO.getServiceDate().toString(),hcOrderDetailVO.getServiceTime());
				
				pstmt2.setString(1, sevDatas[0]);
				pstmt2.setString(2, hcOrderDetailVO.getEmpNo());
				rs2 = pstmt2.executeQuery();
				
				rs2.absolute(1);				
				
				String oldShifts = rs2.getString("WORK_SHIFT_STATUS");
				 
			System.out.println(oldShifts);
				StringBuilder strb = new StringBuilder(oldShifts);
				String newShifts = (strb.replace(Integer.valueOf(sevDatas[1]),(Integer.valueOf(sevDatas[1])+1),hcOrderDetailVO.getServiceTime()) ).toString();
			System.out.println(newShifts);
				int oldTotal = rs2.getInt("TOTAL_WORK_SHIFTS");
				
				rs2.updateString("WORK_SHIFT_STATUS",newShifts);
				rs2.updateInt("TOTAL_WORK_SHIFTS",oldTotal+1);
				rs2.updateRow();
				rs2.close();
				pstmt2.close();
//傳統方式				
//				pstmt2 = con.prepareStatement(UPDATE_WORKSHIFTS_STATUS);
//				pstmt2.setString(1, newShifts);
//				pstmt2.setString(2, sevDatas[0]);
//				pstmt2.setString(3, hcOrderDetailVO.getEmpNo());
//				pstmt2.executeUpdate();
				
				pstmt2 = con.prepareStatement(UPDATE_POINT,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				pstmt2.setString(1, hcOrderMasterVO.getMemNo());
				pstmt2.setString(2, hcOrderDetailVO.getEmpNo());
				pstmt2.setString(3, hcOrderMasterVO.getMemNo());
				pstmt2.executeUpdate();
				
				
				
			}
			
			
			con.commit();
			System.out.println("dao  訂單新增完成");
			// Handle any driver errors
		}  catch (SQLException se) {
			try {
				con.rollback();
			} catch (SQLException se2) {
				se2.printStackTrace(System.err);
				System.out.println("rollback fail!!");
			}
			se.printStackTrace();
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs2 != null) {
				try {
					rs2.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt2 != null) {
				try {
					pstmt2.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
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
		return nextOrderNo;

	}

	@Override
	public void update(HcOrderMasterVO hcOrderMasterVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con  =ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			
			pstmt.setString(1, hcOrderMasterVO.getCaredNo());
			pstmt.setString(2, hcOrderMasterVO.getOrderStatus());
			pstmt.setString(3, hcOrderMasterVO.getOrderNo());

			pstmt.executeUpdate();

			// Handle any driver errors
		}catch (SQLException se) {
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
	public HcOrderMasterVO findByPrimaryKey(String orderNo) {

		HcOrderMasterVO hcOrder = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con  =ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, orderNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]�٬� Domain objects
				hcOrder = new HcOrderMasterVO();
				hcOrder.setOrderNo(rs.getString("ORDER_NO"));
				hcOrder.setMemNo(rs.getString("MEM_NO"));
				hcOrder.setOrderDate(rs.getDate("ORDER_DATE"));
				hcOrder.setCaredNo(rs.getString("CARED_NO"));
				hcOrder.setOrderStatus(rs.getString("ORDER_STATUS"));

			}

			// Handle any driver errors
		}  catch (SQLException se) {
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
		return hcOrder;
	}

	@Override
	public List<HcOrderMasterVO> getAll() {
		List<HcOrderMasterVO> list = new ArrayList<HcOrderMasterVO>();
		HcOrderMasterVO hcOrder = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con  =ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				
				hcOrder = new HcOrderMasterVO();
				hcOrder.setOrderNo(rs.getString("ORDER_NO"));
				hcOrder.setMemNo(rs.getString("MEM_NO"));
				hcOrder.setOrderDate(rs.getDate("ORDER_DATE"));
				hcOrder.setCaredNo(rs.getString("CARED_NO"));
				hcOrder.setOrderStatus(rs.getString("ORDER_STATUS"));
				list.add(hcOrder); // Store the row in the list
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
	public List<HcOrderMasterVO> getAll(Map map) {
		List<HcOrderMasterVO> list = new ArrayList<HcOrderMasterVO>();
		HcOrderMasterVO hcOrder = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con  =ds.getConnection();
			String finalSQL = "select * from HC_ORDER_MASTER "
			          + jdbcUtil_CompositeQuery_order.get_WhereCondition(map)
			          + "order by order_No";
			pstmt = con.prepareStatement(finalSQL);
		System.out.println("●●finalSQL(by DAO) = "+finalSQL);

			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				
				hcOrder = new HcOrderMasterVO();
				hcOrder.setOrderNo(rs.getString("ORDER_NO"));
				hcOrder.setMemNo(rs.getString("MEM_NO"));
				hcOrder.setOrderDate(rs.getDate("ORDER_DATE"));
				hcOrder.setCaredNo(rs.getString("CARED_NO"));
				hcOrder.setOrderStatus(rs.getString("ORDER_STATUS"));
				list.add(hcOrder); // Store the row in the list
			}

			// Handle any driver errors
		}catch (SQLException se) {
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
	
	
	
	public String[] convertDateToNumber(String date,String time){
		String[] servDatas = new String[2];
		String monthOfYear = (Integer.valueOf(date.substring(0,4))-1911)+date.substring(5,7);
		servDatas[0] = monthOfYear;
		System.out.println("monthOfYear in hcor :"+monthOfYear);
		int shiftNumber = (Integer.valueOf(date.substring(8,10))*3);
		if(time.equals("\u65e9")){
			shiftNumber = shiftNumber-3;
		}else if(time.equals("\u4e2d")){
			shiftNumber = shiftNumber-2;
		}else if(time.equals("\u665a")){
			shiftNumber = shiftNumber-1;
		}
		servDatas[1] = String.valueOf(shiftNumber);
		System.out.println("shiftNumber in hcor :"+shiftNumber);
		return servDatas;
	}
	
	public int countWorkShifts(String workShiftStr){
		int count = 0;
		for(int i=0;i<workShiftStr.length();i++){
			//day mid night
			if(workShiftStr.charAt(i) == '\u65e9'|| workShiftStr.charAt(i) =='\u4e2d'|| workShiftStr.charAt(i) =='\u665a'){
				count++;
			}
		}		
		return count;		
	}
	

	public static void main(String[] args) {

		HcOrderJDBCDAO dao = new HcOrderJDBCDAO();


//		HcOrderMasterVO hcOrder = new HcOrderMasterVO();
//		
//		hcOrder.setMemNo("MEM0003001");
//		hcOrder.setCaredNo("CRD0004001");
//		hcOrder.setOrderStatus("未驗證");
//
//		dao.insert(hcOrder);
//		
//		
//		HcOrderMasterVO hcOrder2 = new HcOrderMasterVO();
//		hcOrder.setCaredNo("CRD0004005");
//		hcOrder.setOrderStatus("以驗證");
//		hcOrder.setOrderNo("20171025-500011");
//		dao.update(hcOrder);


//		HcOrderMasterVO hcOrder3 = dao.findByPrimaryKey("20171025-500001");
//		System.out.println(hcOrder3.getOrderNo());
//		System.out.println(hcOrder3.getMemNo());
//		System.out.println(hcOrder3.getOrderDate());
//		System.out.println(hcOrder3.getCaredNo());
//		System.out.println(hcOrder3.getOrderStatus());
//		System.out.println("-------------------------------------");
//		
//		
//		
//		List<HcOrderMasterVO> list =  dao.getAll();
//		for(HcOrderMasterVO hcOrder :list){
//			System.out.println(hcOrder.getOrderNo());
//			System.out.println(hcOrder.getMemNo());
//			System.out.println(hcOrder.getOrderDate());
//			System.out.println(hcOrder.getCaredNo());
//			System.out.println(hcOrder.getOrderStatus());
//			System.out.println("-------------------------------------");
//		}
		
		
//		HcOrderMasterVO hcOrderMaster = new HcOrderMasterVO();
//		hcOrderMaster.setMemNo("MEM0002");
//		hcOrderMaster.setCaredNo("CRD0001");
//		hcOrderMaster.setOrderStatus("未服務");
//		
//		List<HcOrderDetailVO> hcOrderDetailList =  new ArrayList<HcOrderDetailVO>();
//		HcOrderDetailVO hcOrderDetail = new HcOrderDetailVO();
//		hcOrderDetail.setServiceDate( java.sql.Date.valueOf("2017-11-20"));
//		hcOrderDetail.setServiceTime("中");
//		hcOrderDetail.setEmpNo("EMP0017");
//		hcOrderDetail.setOrderDetailStataus("未服務");
//		hcOrderDetailList.add(hcOrderDetail);
//		
//		System.out.println(hcOrderDetail.getServiceDate().toString());
//
//		
//		dao.insert(hcOrderMaster , hcOrderDetailList);
		
String str = "空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空無無無";
StringBuilder strb = new StringBuilder(str);
String [] bababa =  dao.convertDateToNumber("2017-11-30","晚");
String b = bababa[1];
String a = bababa[0];
System.out.println(strb.replace(new  Integer(b), new  Integer(b+1), "晚"));
		
		// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
//		Map<String, String[]> map = new TreeMap<String, String[]>();
//		map.put("orderNo", new String[] { "20171102-500001" });
//		map.put("memNo", new String[] { "MEM0002" });
//		map.put("orderDate", new String[] { "2017-11-02" });
//		map.put("caredNo", new String[] { "CRD0001" });
//		map.put("orderStatus", new String[] { "未確認" });
//
//		map.put("action", new String[] { "listOrds_ByCompositeQuery" }); // 注意Map裡面會含有action的key
//		
//		dao.getAll(map);
;
	}

	@Override
	public List<HcOrderMasterVO> getByMemNo(String memNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HcOrderMasterVO> orderList = new ArrayList<>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_MEM_NO);
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();
			while(rs.next()){
				HcOrderMasterVO order = new HcOrderMasterVO();
				order.setOrderNo(rs.getString("ORDER_NO"));
				order.setOrderDate(rs.getDate("ORDER_DATE"));
				order.setOrderStatus(rs.getString("ORDER_STATUS"));
				order.setCaredNo(rs.getString("CARED_NO"));
				orderList.add(order);
			}
			
			
		} catch (SQLException e){ 
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
}