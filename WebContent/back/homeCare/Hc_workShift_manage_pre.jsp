<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 這裡放BEAN -->
<jsp:useBean id="empSrv" scope="page" class="com.employee.model.EmployeeService" />

<p>This is the Home page for Hc_workShifts: Home</p>

<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


<ul>
<%--   <li><a href='<%=request.getContextPath()%>/emp/listAllEmp.jsp'>List</a> all Emps. <br><br></li> --%>

<!--   getone by PK -->

  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/HcWorkshifts/HcWorkshiftsServlet.do" >
        <b>輸入員工編號 (EMP0002):</b>
        <input type="text" name="empNo"><br>
        
        <b>輸入月份:</b>
        <input type="text" name="monthOfYear">
        
        
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="hidden" name="failureV" value="/back/homeCare/Hc_workShift_manage_pre.jsp">
        <input type="submit" value="送出">
        
    </FORM>
  </li><br>
  
<!--   getall by day time 有空的人們-->
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/HcWorkshifts/HcWorkshiftsServlet.do" >
       
        <b>輸入日期:</b>
        <input type="text" name="servDate">
        
        <b>輸入時間:</b>
        <input type="text" name="servTime">
        
        <input type="hidden" name="action" value="getAllByDateTime">
        <input type="submit" value="送出">
        
    </FORM>
  </li><br>
  
<!--   找出  當日  有空的人  工時最少  getone by day time -->
  <li>  
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/HcWorkshifts/HcWorkshiftsServlet.do" >
        <b>輸入日期 :</b>
        <input type="text" name="servDate"><br>
        <b>輸入時段:</b>
        <input type="text" name="servTime">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getOneByDateTime">
        <input type="hidden" name="successView" value="<%=request.getContextPath()%>/back/Hc_show_workShift.jsp">
    </FORM>
  </li><br>

 <!--   複合查詢-->   
    <li>   
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/HcWorkshifts/HcWorkshiftsServlet.do" name="form1">
       <b><font color=blue>萬用複合查詢:</font></b> <br>
       <b>輸入員工編號:</b>
       <input type="text" name="empNo" value=""><br>
           
<!--        <b>輸入員工姓名:</b> -->
<!--        <input type="text" name="ename" value=""><br>       -->
        
       <b>月份:</b>
	    <input name="monthOfYear" id="monthOfYear" type="text"><br>	
	    
       <b>總工作時數(請輸入數字)</b>
	   <select size="1" name="totalWorkShifts" id="totalWorkShifts" >
          <option value="" selected>請選擇</option>
          <option value="0-10">0~10</option>
          <option value="10-20">10~20</option>
          <option value="20-30">20~30</option>
          <option value="30-40">30~40</option>
          <option value="40-50">40~50</option>
          <option value="50-93">50-93</option>   
             
       </select><br> 
       
        <input type="submit" value="送出">
        
        <input type="hidden" name="action" value="listHcWorks_ByCompositeQuery">
        
     </FORM>
  </li>
  
<!--        <b>選擇部門:</b> -->
<!--        <select size="1" name="empDep" > -->
<!--           <option value="" selected>請選擇</option> -->
<!--           <option value="長照">長照</option> -->
<!--           <option value="派車">派車</option> -->
<!--           <option value="送餐">送餐</option> -->
<!--           <option value="總部">總部</option> -->
   
<!--        </select><br> -->
	
  
</ul>

</body>
</html>