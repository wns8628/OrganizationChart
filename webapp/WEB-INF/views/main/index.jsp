<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>

	<c:forEach items="${mainMap.companyVoList}" var="companyList">
		<h2>${companyList}</h2>
	</c:forEach>
	
	<c:forEach items="${mainMap.departmentsVoList}" var="departmentsList">
		<h2>${departmentsList}</h2>
	</c:forEach>
	
</body>
</html>