<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<li><a href="${pageContext.servletContext.contextPath }/admin/deptMgr">조직도정보관리</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/admin/rankPositionManagement">직급직책관리</a></li>
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
			<li><a href="${pageContext.servletContext.contextPath }/admin/connectDeptEmp">사원부서연결</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/admin/movePersonnel">인사이동</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/admin/movePersonnelStatus">인사이동 현황</a></li>
		</ul>
	</div>
</div>
