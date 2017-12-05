package jdbc.util.CompositeQuery;

//*  1. 萬用複合查詢-可由客戶端隨意增減任何想查詢的欄位
//*  2. 為了避免影響效能:
//*        所以動態產生萬用SQL的部份,本範例無意採用MetaData的方式,也只針對個別的Table自行視需要而個別製作之
//* */
import java.util.*;

public class jdbcUtil_CompositeQuery_workShift {

	public static String get_aCondition_For_Oracle(String columnName, String value) {

		String aCondition = null;
		
		columnName = columnName.replaceAll("N", "_N").replaceAll("S", "_S").replaceAll("W", "_W")
				.replaceAll("F", "_F").replaceAll("Y", "_Y").replaceAll("O", "_O").replaceAll("D", "_D")
				.replaceAll("B", "_B");


		if ("month_Of_Year".equals(columnName)|| "exp_No".equals(columnName)){ 
			aCondition = columnName + " = " +"'"+ value+"'";			
		}else if("emp_No".equals(columnName) ){
			aCondition = "W."+columnName + " = " +"'"+ value+"'";		

		}else if ("emp_Name".equals(columnName)) 
			aCondition = columnName + " like" +"'%"+value+"%'";
			
		else if ("total_Work_Shifts".equals(columnName)) {
			String [] totals = value.split("-");
			aCondition = columnName + " between "+totals[0]+" and "+totals[1];
		}else if("shift_Number".equals(columnName)){
			aCondition = "Substr(WORK_SHIFT_STATUS,"+value+",1)='空'";
		}else{
			return " ";
		}
		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key) 
					&& !"successView".equals(key) && !"failureView".equals(key)) {
				
				String aCondition = get_aCondition_For_Oracle(key, value.trim());

				if  (aCondition.equals(" ")) {
					continue; 
				}
				else{
					count++;
					whereCondition.append(" and " + aCondition);
				}
				System.out.println("有送出查詢資料的欄位數count = " + count);
			}
		}
		System.out.println("whereCondition"+whereCondition.toString());
		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
		Map<String, String[]> map = new TreeMap<String, String[]>();
//		map.put("empNo", new String[] {"EMP0002"});
		map.put("monthOfYear", new String[] {"10611"});
		map.put("totalWorkShifts", new String[] {"0-50"});
		map.put("shiftNumber", new String[] {"00"});
		map.put("EMP_NAME", new String[] {"關羽"});
		map.put("expNo", new String[] {"201"});
		map.put("maps", new String[] {"77777"});
		map.put("maps", new String[] {"77777"});
		map.put("maps", new String[] {"77777"});
		map.put("maps", new String[] {"77777"});
		map.put("XXXX", new String[] {"66666"});
		map.put("YYYYY", new String[] {"66666"});



		map.put("action", new String[] { "listOrds_ByCompositeQuery" }); // 注意Map裡面會含有action的key

		String finalSQL = "select * from HC_WORKSHIFTS W JOIN EMPLOYEE E ON  W.EMP_NO = E.EMP_NO "
				+ " JOIN EXPERT T ON T.EMP_NO = E.EMP_NO "
				+ " AND EMP_DEP='長照' AND EMP_BRANCHES='10' "
				+ "AND EMP_STATUS='ON' "
				          + jdbcUtil_CompositeQuery_workShift.get_WhereCondition(map)
				          + "order by  TOTAL_WORK_SHIFTS ";
		System.out.println("●●finalSQL = " + finalSQL);

	}
}

