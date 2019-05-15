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
	href="${pageContext.servletContext.contextPath }/assets/css/admin.css?ver=1"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<style type="text/css">
div#tree-btn-wrapper{background-color: #FFFFFF; width: 49.5%; float: left; min-height: 500px; border-right: 3px solid black}
div#admin-btn-wrapper{background-color: #FFFFFF; width: 49.5%; float: right; min-height: 500px; }

div#tree-btn { margin: 0 300px; margin-top: 150px;}
div#tree-btn span {font-size: 30px; display: block; color: #717171; font-weight: bolder; margin-left: 18px;}
</style>
<script type="text/javascript">
function win_pop(){
	window.open( contextPath+'/boot', '조직도', 'width=1300, height=800');
}

$(function(){
	$("#tree-btn").click(function(){
		win_pop();
	});
})
</script>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
		<div id="wrapper">
			<div id="tree-btn-wrapper">
				<div id="tree-btn">
					<span>조직도</span>
					<img src="${pageContext.request.contextPath }/assets/images/tree_btn.png" >
				</div>
			</div>
			<div id="admin-btn-wrapper">
				<div id="tree-btn">
					<span>관리자</span>
					<img src="${pageContext.request.contextPath }/assets/images/setting_btn.png" >
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
	</div>
</body>
</html>