<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>사원 부서 연결</title>
<c:import url="/WEB-INF/views/admin/includes/head.jsp" />

</head>
<body>
<div id="container">

<div id="wrapper">
	<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
	<div id="contents">
		
				<!-- 모으자 -->
				<div id="contents-header" draggable='true'>
					<img class="home" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/home.png">
					<img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>시스템설정</span> <img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>사원관리</span> <img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>사원부서연결</span>
				</div>
				<!-- 모으자 -->
		
		<!-- 회사선택 -->
		<div id="select-bar">
			<span>회사선택</span>
			<select id="compSelect">
				<c:forEach items="${compList }" var="vo">
					<option value="${vo.compSeq }">${vo.compName }
				</c:forEach>
			</select>
			
			<span>재직여부</span>
			<select>
				<option>재직
				<option>퇴직
				<option>휴직
			</select>

			<span>사원명/ID검색</span>
			<input type="text" placeholder="사원명/ID검색">
			<button>검색</button>

		</div>
		
		<!-- body -->
		
		
		
		
		
		</div>	
	    <!-- nav  -->
		<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
	  </div>
	  
	<!-- footer -->
	<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
	
</div>
</body>
</html>