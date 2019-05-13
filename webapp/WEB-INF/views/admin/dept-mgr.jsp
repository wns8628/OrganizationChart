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
<link
	href="${pageContext.servletContext.contextPath }/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/admin.js"></script>
<style type="text/css">
div#contents div#select-bar{width: 100%; height: 30px; background: #EFF6FE; border: 1px solid #B2B2B2; padding: 10px;}
div#contents div#select-bar span{}
</style>
<script type="text/javascript">
$(function(){
	var menuList = $("div.menu li");
	for(var i=0; i<menuList.length; i++){
		if($(menuList[i]).text() === $("#contents-header span:last").text()){
			$(menuList[i]).parent().parent().show().prev().addClass("active");
			$(menuList[i]).children().css("color","#328CF5").css("font-weight","bold");
		}
	}
});
</script>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
		<div id="wrapper">
			<div id="contents">
				<div id="contents-header">
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
					<select>
						<option>더존비즈온_PS구축부
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