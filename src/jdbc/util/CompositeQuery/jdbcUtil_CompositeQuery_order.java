package jdbc.util.CompositeQuery; 

//*  1. 萬用複合查詢-可由客戶端隨意增減任何想查詢的欄位
//*  2. 為了避免影響效能:
//*        所以動態產生萬用SQL的部份,本範例無意採用MetaData的方式,也只針對個別的Table自行視需要而個別製作之
//* */
import java.util.*;

public class jdbcUtil_CompositeQuery_order {

	public static String get_aCondition_For_Oracle(String columnName, String value) {

		String aCondition = null;
		
		columnName = columnName.replaceFirst("N", "_N").replaceAll("S", "_S").replaceAll("D", "_D");


		if ("order_No".equals(columnName) || "mem_No".equals(columnName) || "cared_No".equals(columnName)) // 用於其他
			aCondition = columnName + "=" +"'"+ value+"'";
			
		else if ("order_Status".equals(columnName)) // 用於varchar
			aCondition = columnName + " like '%" + value + "%'";
		else if ("order_Date".equals(columnName))                          // 用於Oracle的date
			aCondition = "to_char(" + columnName + ",'yyyy-mm-dd')='" + value + "'";

		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_Oracle(key, value.trim());

				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);

				System.out.println("有送出查詢資料的欄位數count = " + count);
			}
		}
		
		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("orderNo", new String[] { "20171102-500001" });
		map.put("memNo", new String[] { "MEM0002" });
		map.put("orderDate", new String[] { "2017-11-15" });
		map.put("caredNo", new String[] { "CRD0001" });
		map.put("orderStatus", new String[] { "未確認" });

		map.put("action", new String[] { "listOrds_ByCompositeQuery" }); // 注意Map裡面會含有action的key

		String finalSQL = "select * from HC_ORDER_MASTER "
				          + jdbcUtil_CompositeQuery_order.get_WhereCondition(map)
				          + "order by order_No";
		System.out.println("●●finalSQL = " + finalSQL);

	}
}

