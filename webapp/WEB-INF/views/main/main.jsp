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
<link href="${pageContext.servletContext.contextPath }/assets/css/admin.css?ver=1" rel="stylesheet" type="text/css">
<script type="text/javascript"src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<style type="text/css">
.admin-main-logo-body{
    width: 100%;
    text-align: center;
    padding-top: 190px;
}
#admin-main-logo-label{
    font-size: 55px;
    font-weight: 900;
}
.admin-main-logo-token{
    color: #01b4ec;
} 
.admin-main-logo-nav-body{
	width:100%;
    margin-top: 125px;
    display:flex;  
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center; 
}
.admin-main-logo-nav-body-admin , .admin-main-logo-nav-body-boot{
	float:left;
	padding:20px;
}
.admin-main-logo-nav-body-admin:hover , .admin-main-logo-nav-body-boot:hover{
	background-color:#f1f3f4;
}
.admin-main-logo-nav-body-admin-img , .admin-main-logo-nav-body-boot-img{
	float:left;
}
.admin-main-logo-nav-body-admin-label, .admin-main-logo-nav-body-boot-label{
	float:left;
	clear:both;
    padding-left: 6px;
    padding-top: 0px;
    margin-top: 15px;
}
.admin-main-logo-nav-body-boot-img{
	width:50px;
}
.admin-main-logo-body-foot-mention{
    margin-top: 50px;
    text-align: center;
    display: flex;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center;
}
.admin-main-logo-body-foot-mention-label{
	padding: 10px;
    border: 1px solid lightgrey;
    border-radius:2em;
    -moz-border-radius: 2em;
    -webkit-border-radius: 2em;
    color: #2E64FE;
}
</style>
<script type="text/javascript">
var contextPath = "${pageContext.servletContext.contextPath }";
$(function(){
	$(".admin-main-logo-nav-body-boot").click(function(){
		//win_pop();
		window.location.href= contextPath +"/boot";
	});
	$(".admin-main-logo-nav-body-admin").click(function(){
		//win_pop();
		window.location.href= contextPath +"/admin/chart";
	});
})
</script>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
		<div id="wrapper">
			 <div class="admin-main-logo-body">
			 	<div id="admin-main-logo-label">
				 	<span class="admin-main-logo-token">Q</span>uick
				 	<span class="admin-main-logo-token">S</span>il<span class="">v</span>er
			 	</div>
			 	
			 	<div class="admin-main-logo-nav-body">
			 		<div class="admin-main-logo-nav-body-admin">
			 			<img  class="admin-main-logo-nav-body-admin-img" src="${pageContext.request.contextPath }/assets/images/admin_setting.png" >
			 			<span class="admin-main-logo-nav-body-admin-label">
			 			관리자
			 			</span>					
			 		</div>
			 		<div class="admin-main-logo-nav-body-boot">
			 			<img  class="admin-main-logo-nav-body-boot-img"src="${pageContext.request.contextPath }/assets/images/hierarchy.png">
			 		 	<span class="admin-main-logo-nav-body-boot-label">
			 		 	조직도
			 		 	</span>
			 		</div>
			 	</div>
			 </div>
			<div class="admin-main-logo-body-foot-mention">
				<div class="admin-main-logo-body-foot-mention-label">
					웹에서의 대용량 조직도 조회 및 검색 처리
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
	</div>
</body>
</html>