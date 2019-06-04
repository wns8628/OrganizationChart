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
</head>
<body>
	<div id="container">
			<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
			<div id="wrapper">
				<div id="contents">
					<div id="contents-header" draggable='true'>
						<img class="home" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/home.png">
						<img class="next" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/next.png">
						<span>시스템설정</span> <img class="next" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/next.png">
						<span>회사/조직관리</span> <img class="next" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/next.png">
						<span>조직도정보관리</span>
					</div>
					<div id="select-bar">
						<span>회사선택</span>
						<select id="compSelect">
<%-- 							<c:forEach items="${compList }" var="vo"> --%>
<%-- 								<option value="${vo.compSeq }">${vo.compName } --%>
<%-- 							</c:forEach> --%>
						</select>
						
						<span>부서명</span>
						<input type="text" value="검색">
						<span>사용여부</span>
						<select>
							<option>전체
							<option>사용함
							<option>사용안함
						</select>
					</div>
				</div>
				<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
			</div>
			<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
		</div>
</body>
</html>