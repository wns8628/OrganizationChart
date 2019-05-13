<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link
	href="${pageContext.servletContext.contextPath }/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<%-- 
<link href="${pageContext.servletContext.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css">
 --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
function win_pop(){
	window.open('admin/popup', '조직도', 'width=1200, height=800');
}
$(function(){
	$("div.parent-menu").click(function(){
		$this = $(this);
		$icon1 = $this.children().next();
		$icon2 = $this.children().next().next();
		if($this.next().css("display") == "none"){
			$this.addClass("active");
			$this.next().show();
			$icon1.hide();
			$icon2.show();
		}else{
			$this.removeClass("active");
			$this.next().hide();
			$icon1.show();
			$icon2.hide();
		}
	});
   	
// 	$(document).on("div.menu ul li a", function(event){
	$("div.meun ul li a").click(function(){
		var htmls = "<img alt='' src='${pageContext.servletContext.contextPath }/assets/images/next.png'>"+
					"<span>"+$(this).text()+"</span>";
		$("div#contents-header").append(htmls);
	});
	
	$("#popup-btn").click(function(){
		win_pop();
	});
});
</script>
</head>
<body>
	<%-- <div id="header">
		<div class="header-wrapper">
			<span>quicksilver</span>
			<div class="header-menubar">
				<a href="${pageContext.servletContext.contextPath }/main3/kr"><span>kr</span></a>
				<a href="${pageContext.servletContext.contextPath }/main3/en"><span>en</span></a>
				<button>login</button>
			</div>
		</div>
	</div>
	<div id="navigation">
		<div class="navi">
			<div class="menu-title">시스템 설정<img alt="" src="${pageContext.servletContext.contextPath }/assets/images/setting.png"></div>
			<div class="parent-menu">
				<span>회사/조직관리</span>
				<img class="icon1" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle.png">
				<img class="icon2" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle2.png">
			</div>
			<div class="menu">
				<ul>
					<li>그룹정보관리</li>
					<li><a href="${pageContext.servletContext.contextPath }/admin/compMgr">회사정보관리</a></li>
					<li>조직도정보관리</li>
					<li>직급직책관리</li>
					<li>회사그룹핑관리</li>
				</ul>
			</div>
			<div class="parent-menu">
				<span>사원관리</span>
				<img class="icon1" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle.png">
				<img class="icon2" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle2.png">
			</div>
			<div class="menu">
				<ul>
					<li>사원정보관리</li>
					<li>사원부서연결</li>
					<li>인사이동</li>
					<li>인사이동 현황</li>
				</ul>
			</div>
		</div>
		<div class="contents">
			<div class="tbl-header"></div>
			<div class="tbl-wrapper">
				<table class="tbl-result">
					<thead>
						<tr>
							<th>사원번호</th>
							<th>이름</th>
							<th>나이</th>
							<th>성별</th>
							<th>직급</th>
							<th>직책</th>
							<th>부서</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="footer">
		<p>copyright 2019</p>
	</div> --%>
	<div id="container">
		<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
		<div id="wrapper">
			<div id="contents">
				<div id="popup-btn">조직도</div>
			</div>
			<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
		</div>
		<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
	</div>
</body>
</html>