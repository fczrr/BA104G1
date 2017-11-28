<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.*"%>
<%@ page import="com.detail.promotion.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

<%
List<ShopVO> shopVO5 = (List) request.getAttribute("shopVOlist"); //EmpServlet.java(Concroller), 存入req的empVO物件
pageContext.setAttribute("shopVO5", shopVO5);
%>
<%
//此段複寫equals 去比較itemno
    ShopService shopSvc = new ShopService();
  //  List<ShopVO> list = shopSvc.getAll();
    List<ShopVO> list = shopSvc.getAllFromBack();
    //給後端查詢使用
    pageContext.setAttribute("list", list);
    
	ProService proSvc = new ProService();
	List<ProVO> list2 = proSvc.getAllProNow();
    List listforpro=list2;
    pageContext.setAttribute("listforpro", list2);
    
// 	list.remove(list2);
	List<ShopVO> list3 = new ArrayList<ShopVO>();
	for(ShopVO vo:list){
		Boolean tag = false;
		for(ProVO vo2:list2){
			if(vo.equals(vo2)){
				tag = true;
			}
		}
		if(!tag){
			list3.add(vo);
		}
	}
    pageContext.setAttribute("list", list3); // forEach EL用
	list = list3;// include page1.file JSP用

	
	
%>
</head>

<body>
  <div class="col-xs-12 col-sm-12">
    <table class="table" " style="border:5px" id="search">
        <tr>
          <th style="background-color: #f5f5f5;border-color: #ddd;border: 3px;border: 1px solid #ddd;font-size: 24px;font-family: Microsoft JhengHei;">搜尋</th>
        </tr>
				<tr>
					<td id="bigword">搜尋關鍵字: <br>
						<form action="<%=request.getContextPath()%>/shop.do" class="form-inline" method="POST">
							<div class="form-group">
								<input placeholder="您想找尋些什麼..." class="form-control input" id="inputforserarh" name="ITEMNO">
								<input type="hidden" name="action" value="getOne_For_Display_byString_FromBack">
								<button class="btn btn-success btn" id="search">
									<span class="glyphicon glyphicon-search" ></span>查詢
								</button>
							</div>
						</form>
					</td>
				</tr>
				<tr>
       <td id="bigword">依照商品搜尋: <br>
       	<jsp:useBean id="empSvc" scope="page" class="com.shop.model.ShopService" />
						<form action="<%=request.getContextPath()%>/shop.do"
							class="form-inline" method="POST">
							<input type="hidden" name="action" value="getOne_For_Display2">
							<div class="form-group">
								<select name="ITEMNO" class="form-control" id="inputforserarh">
									<c:forEach var="empVO" items="${list}">
										<option value="${empVO.NAME}">${empVO.NAME}
       									  </c:forEach>   
								</select></font>
								<button class="btn btn-success btn" id="search">
									<span class="glyphicon glyphicon-search"></span>查詢
								</button>
							</div>
						</form>
      </td>
     </tr>
     	 <tr>
<!--        <td id="bigword"> -->
<!-- 		促銷商品查詢: -->
<!-- 		<br> -->
<%-- 				<jsp:useBean id="proSvc2" scope="page" class="com.detail.promotion.ProService" /> --%>
<%-- 				<form action="<%=request.getContextPath()%>/pro.do" class="form-inline" method="POST"> --%>
<!-- 						<input type="hidden" name="action" value="getOne_For_Display2"> -->
<!-- 							<div class="form-group"> -->
<!-- 								<select  name="ITEMNO" id="inputforserarh" class="form-control"> -->
<%-- 										  <c:forEach var="proVO" items="${listforpro}" >  --%>
<%--          									 <option value="${proVO.SHOPNAME}">${proVO.SHOPNAME} --%>
<%--        									  </c:forEach>    --%>
<!-- 								</select></font> -->
<!-- 								<button class="btn btn-success btn" id="search"> -->
<!-- 									<span class="glyphicon glyphicon-search"></span>查詢 -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</form> -->
<!--       </td> -->
     </tr>
    </table>
    
<!--     ---------------------------------------- -->
  <div class="col-xs-12 col-sm-12">
    <table class="table" " style="border:5px">
        <tr>
          <th style="background-color: #f5f5f5;border-color: #ddd;border: 3px;border: 1px solid #ddd;font-size: 24px;font-family: Microsoft JhengHei;">搜尋</th>
        </tr>

<style type="text/css">
.btn-success:hover {
	background-color: #449d44;
	border-color: #398439;
	color: #ffe200;
	
}

.btn-danger{
    margin-left: 10px;
    width: 100px;
    border-radius: 4px;
    border: 1px solid;
    padding: 6px 12px;
}

.btn-success{
    width: 100px;
    border-radius: 4px;
    border: 1px solid;
    padding: 6px 12px;
}
.thumbnail{
    height: 230px;

}

</style>
		<%@ include file="pages/listallOrderForSearch1.file" %>
		<%@ include file="pages/listallOrderForSearch2.file" %>  
				<c:forEach var="shopVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
	
	
	 <tr>
          <td>
  <div class="row">
        <div class="col-xs-12 col-sm-3">
          <div class="picture thumbnail">
                    <a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${shopVO.ITEMNO}&PRO=0"><img class="img-responsive" img src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=${shopVO.ITEMNO}" style=" height: 188px; width: 188px;" title="##"></a>
                  </div>
        </div>
        <div class="col-xs-12 col-sm-9">
            <div class="item-box">
              <legend class="top_padding15"></legend>
              <div class="product-item">
                <div class="white-box">
                  
                  <div class="middle-content">
                    <h2 class="product-title"><a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${shopVO.ITEMNO}&PRO=0">${shopVO.NAME}</a></h2>
                    <div class="description" style="font-size: 18px;">
                        	${shopVO.DES}
                    </div>
                  </div>
                   <br><br>
                </div>


                <div class="add-info">
                  <div class="ash-box">
                    <div class="prices" style="float:right;">

                   		 <div>
                   		 <span class="price special-price">$${shopVO.PRICE}
                    	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shop.do" class="searchnow">
                       
                       <input type="hidden" class="action" name="action" value="getOne_For_Update">
                       <input type="hidden" class="STOCK" name="STOCK" value="1">
                       <input type="hidden" class="ITEMNO" name="ITEMNO" value="${shopVO.ITEMNO}" id="ITEMNO" >
                      </span><input class="btn btn-sm btn-success" style="background-color: green;font-size: 16px;border-radius: 3px;width: 110px;" type="submit" value="修改">
                      	</FORM>
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shop.do">
			    <input type="submit" style="font-size: 16px;border-radius: 3px;width: 110px;" class="btn btn-sm btn-${((shopVO.STATE)==1)?'warning':'success'}" value="${((shopVO.STATE)==1)?'下架':'上架'}">
			    <input type="hidden" name="STATE" value="${shopVO.STATE}">
			    <input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}">
			    <input type="hidden" name="action"value="shelf"></FORM>
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pro.do">
			    <input type="submit" style="font-size: 16px;border-radius: 3px;width: 110px;" class="btn btn-sm btn-info" value="加入促銷">
			    <input type="hidden" name="PRICE" value="${shopVO.PRICE}">
			    <input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}">
			    <input type="hidden" name="DES" value="${shopVO.DES}">
			    <input type="hidden" name="action"value="PUTINPROJECT"></FORM>
                      	</div>

                    
                    </div>
                  
                  </div>
                </div>
              </div>
            </div>
        </div>
</div>
          
          </td>
                </tr>
	</c:forEach>
    </table>
    <%@ include file="pages/listallOrderForSearch2.file" %> 
  </div>
</body>
</html>