<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).on("click", "#popup-boot", function(key) {	    						    //부서검색클릭

	//듀얼모니터 까지 처리
	var popWidth  = '1500'; // 파업사이즈 너비
	var popHeight = '800'; // 팝업사이즈 높이
	var winWidth  = document.body.clientWidth;  // 현재창의 너비
	var winHeight = document.body.clientHeight; // 현재창의 높이
	var winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
	var winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표
	w = winX + (winWidth - popWidth) / 2;
	h = winY + (winHeight - popHeight) / 2;
	
	window.open( contextPath+'/boot', '부서검색', 'width=1500, height=800, top='+ h +' , left='+w);
	
});

function logout(){
	window.location.href = contextPath+"/logout";
}
</script>
<style>
 #popup-boot{ color:white;  cursor: pointer;}
 #logout{
	color:white;
	cursor: pointer;
	border-left: 2px solid white;
	padding-left: 10px;
	margin-left: 10px;
}
</style>
<div id="header">
	<div class="header-wrapper">
		<div class="admin-top-header">
			<a href='${pageContext.request.contextPath }'>
				<span class="logo-label">Quick Silver </span>
			</a>
		</div>
		<div class="header-menubar">
			<button id="popup-boot">조직도</button>
			<c:if test="${authuser ne null }">
			<button id="logout" onclick="logout()">로그아웃</button>
			</c:if>
		</div>
	</div>
</div>