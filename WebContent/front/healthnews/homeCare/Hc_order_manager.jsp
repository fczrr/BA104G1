<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Emp: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Emp: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Emp: Home</p>

<h3>��Ƭd��:</h3>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<!-- //useBean����o�� -->
<jsp:useBean id="crdSvc" scope="page" class="com.thecared.model.ThecaredService"/>

<ul>
<%--   <li><a href='<%=request.getContextPath()%>/emp/listAllEmp.jsp'>List</a> all Emps. <br><br></li> --%>
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/HcOrder/HcOrderController.do" >
        <b>��J�q��s��(20171114-500084) :</b>
        <input type="text" name="orderNo">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

  <jsp:useBean id="hcOrderMasterService" scope="page" class="com.hcorder.modal.HcOrderMasterService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/HcOrder/HcOrderController.do" >
       <b>��ܭq��s��:</b>
       <select size="1" name="orderNo">
         <c:forEach var="hcOrderMasterVO" items="${hcOrderMasterService.all}" > 
          <option value="${hcOrderMasterVO.orderNo}">${hcOrderMasterVO.orderNo}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
  <ul>  
  <li>   
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/HcOrder/HcOrderController.do">
        <b><font color=blue>�U�νƦX�d��:</font></b> <br>
        <b>��q��s��:</b>
        <input type="text" name="orderNo" value=""><br>
           
       <b>��J�q�檬�A:</b>
       <select size="1" name="orderStatus" >
			<option value="" selected>�п��</option>
			<option value="���T�{" >���T�{</option>
			<option value="�w�T�{" >�w�T�{</option>
			<option value="�A�Ȥ�" >�A�Ȥ�</option>
			<option value="�w����" >�w����</option>
       </select><br>    
    
       <b>��Q���U��</b>
       <select size="1" name="caredNo" >
			<option value="" selected>�п��</option>
			<c:forEach var="crdVO" items="${crdSvc.getAllByMemNo('MEM0002')}" > 
				<option value="${crdVO.caredNo}">${crdVO.caredName}
			</c:forEach>     
       </select><br>
           
       <b>��J�U�q���:</b>
	   <input name="orderDate" id="orderDate" type="text">
		        
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="listOrds_ByCompositeQuery">
        <input type="hidden" name="memNo" value="MEM0002">
<!--       MEM0002�g�� -->
     </FORM>
  </li>
</ul>
  
<!--   <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/HcOrder/HcOrderController.do" > --%>
<!--        <b>��ܭ��u�m�W:</b> -->
<!--        <select size="1" name="empno"> -->
<%--          <c:forEach var="empVO" items="${empSvc.all}" >  --%>
<%--           <option value="${empVO.empno}">${empVO.ename} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="submit" value="�e�X"> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--      </FORM> -->
<!--   </li> -->
  
  
<%--    <jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
  
<!--   <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/dept.do" > --%>
<!--        <b><font color=orange>��ܳ���:</font></b> -->
<!--        <select size="1" name="deptno"> -->
<%--          <c:forEach var="deptVO" items="${deptSvc.all}" >  --%>
<%--           <option value="${deptVO.deptno}">${deptVO.dname} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="submit" value="�e�X"> -->
<!--        <input type="hidden" name="action" value="listEmps_ByDeptno_A"> -->
<!--      </FORM> -->
<!--   </li> -->
<!-- </ul> -->


<!-- <h3>���u�޲z</h3> -->

<!-- <ul> -->
<%--   <li><a href='<%=request.getContextPath()%>/emp/addEmp.jsp'>Add</a> a new Emp.</li> --%>
<!-- </ul> -->

<!-- <h3><font color=orange>�����޲z</font></h3> -->

<!-- <ul> -->
<%--   <li><a href='<%=request.getContextPath()%>/dept/listAllDept.jsp'>List</a> all Depts. </li> --%>
<!-- </ul> -->

</body>
<script src="<%=request.getContextPath()%>/front/homeCare/laydate/laydate.js"></script> 
<script>
    laydate.render({
        elem: '#orderDate' 
        ,done: function(value, date, endDate){
            $('#servDate-final').attr('value',value);
            console.log(value); 
            console.log(date); 
        }
    });
</script>

</html>