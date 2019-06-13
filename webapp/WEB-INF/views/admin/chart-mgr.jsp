<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Chart</title>
<c:import url="/WEB-INF/views/admin/includes/chart-head.jsp" />

</head>
<body>
<div class="modal"></div>	
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
					<span>회사/조직관리</span> <img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>그룹/회사정보</span>
				</div>
				<!-- 모으자 -->
		
			<!-- 회사선택 -->
			<div id="select-bar">
				<span class="Info-label">Quick Silver 그룹</span>
				<%--
 				<select id="compSelect">
					<option value="all">전체
					<c:forEach items="${compList }" var="vo">
						<option value="${vo.compSeq }">${vo.compName }
					</c:forEach>
				</select>
				<button class="search-empID-button button-css-search">검색</button>
				--%>
				
			</div>
			
			<!-- body -->
			<div class="chart-body">
				<!-- body-left  -->
				<div class="chart-body-left">
				<span class="chart-body-left-label">● 회사목록</span>
						<!--  -->
						<table id="chart-company-table">
							<thead>
								<tr>
									<th>회사코드</th>
									<th>회사명</th>
								</tr>
							</thead>
							<tbody>
								<tr style="background-color:rgb(230, 244, 254);">
									<td>all</td>
									<td>전체</td>
								</tr>
								<c:forEach items="${compList }" var="vo">
									<tr>
										<td>${vo.compSeq }</td>
										<td>${vo.compName }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>	
						<!--  -->
				</div>
				
				<!-- body-right -->			
				<c:import url="/WEB-INF/views/admin/includes/chart.jsp"/>
			</div>
			<!--  -->
			
		</div>	
	    <!-- nav  -->
		<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
	  </div>
	  
	<!-- footer -->
	<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
	
</div>
</body>
</html>