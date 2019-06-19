<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="fail" value="fail"></c:set>
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
    padding-top: 120px;
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
    margin-top: 100px;
    display:flex;  
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center; 
    margin-bottom: 300px;
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
div.input-wrapper{
	display: block;
	width: 275px;
	height: 40px;
	margin-bottom: 15px;
	border: 1px solid #AAAAAA;
/* 	#01b4ec */
}

input:not(last){
	width: 260px;
	height: 26px;
	font-size: 15px;
	border: 0px;
	margin: 7.5px 7px;
}
#login-btn{
	margin: 0px;
	width: 275px;
	height: 40px;
	background-color: #01b4ec;
	color: white;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
}
p{
	margin-top:30px; color:red; font-size: 13px;
}
</style>
<script type="text/javascript">
$(function(){
	$("input").focus(function(){
		$(this).parent().css("border-color","#01b4ec");
	});
	
	$("input").focusout(function(){
		$(this).parent().css("border-color","#AAAAAA");
	});
	
	$("#login-btn").click(function(event){
		$("p").remove();
		if($("input[name='id']").val() == ""){
			$("form").append("<p>아이디를 입력해주세요.</p>")
			event.preventDefault();
		}else if($("input[name='password']").val() == ""){
			$("form").append("<p>비밀번호를 입력해주세요.</p>")
			event.preventDefault();
		}
	});
});
</script>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
		<div class="admin-main-logo-body">
		 	<div id="admin-main-logo-label">
			 	<span class="admin-main-logo-token">Q</span>uick
			 	<span class="admin-main-logo-token">S</span>il<span class="">v</span>er
		 	</div>
			<div class="admin-main-logo-nav-body">
				<form action="${pageContext.servletContext.contextPath }/auth">
					<div class="input-wrapper">
						<input type="text" name="id" placeholder="아이디">
					</div>
					<div class="input-wrapper">
						<input type="password" name="password" placeholder="비밀번호">
					</div>
					
					<input id="login-btn" type="submit" value="로그인">
					<c:if test="${result eq fail}">
						<p>
							아이디 또는 비밀번호를 다시 확인하세요.
						</p>
					</c:if>
				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
	</div>
</body>
</html>