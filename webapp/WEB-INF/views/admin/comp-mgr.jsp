<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.servletContext.contextPath }/assets/css/admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/admin/admin.js"></script>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/admin/includes/header.jsp"/>
		<div id="contents">
			<div id="contents-header">
				<img class="home" alt="" src="${pageContext.servletContext.contextPath }/assets/images/home.png">
				<img class="next" alt="" src="${pageContext.servletContext.contextPath }/assets/images/next.png">
				<span>시스템설정</span>
				<img class="next" alt="" src="${pageContext.servletContext.contextPath }/assets/images/next.png">
				<span>회사/조직관리</span>
				<img class="next" alt="" src="${pageContext.servletContext.contextPath }/assets/images/next.png">
				<span>회사정보관리</span>
			</div>
			<table>
				<thead>
					<tr>
						<th>회사코드</th>
						<th>회사명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1234</td>
						<td>QS케미칼</td>
					</tr>
				</tbody>
			</table>
		</div>
		<c:import url="/WEB-INF/views/admin/includes/navigation.jsp"/>
		<c:import url="/WEB-INF/views/admin/includes/footer.jsp"/>
	</div>
</body>
</html>