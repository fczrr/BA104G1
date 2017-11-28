<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
<html>
<head>
<title>I18N˜ËºžŽì</title>
</head>
<body>
	<fmt:formatDate value="${date}"></fmt:formatDate>
	<br>
	<fmt:formatDate value="${date}" type="both"></fmt:formatDate>
	<br>
	<fmt:formatDate value="${date}" type="both" dateStyle="default"
		timeStyle="default"></fmt:formatDate>
	<br>
	<fmt:formatDate value="${date}" type="both" dateStyle="short"
		timeStyle="short"></fmt:formatDate>
	<br>
	<fmt:formatDate value="${date}" type="both" dateStyle="long"
		timeStyle="long"></fmt:formatDate>
	<br>
	<fmt:formatDate value="${date}" type="both" dateStyle="full"
		timeStyle="full"></fmt:formatDate>
	<br>
	<fmt:formatDate value="${date}" type="both" dateStyle="full"
		timeStyle="full"></fmt:formatDate>
	<br>
</body>
</html>
</html>