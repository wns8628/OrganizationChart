<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="dialog-message" style="display: none;">
    <p></p>
</div>
<div class="oneOpenYn" style="display: none;" >${oneOpenYn}</div>
<div class="twoOpenYn" style="display: none;" >${twoOpenYn}</div>
    
<div class="navi">
	<div class="menu-title">시스템 설정<img alt="" src="${pageContext.servletContext.contextPath }/assets/images/setting.png"></div>
	<div class="parent-menu">
		<span>회사/조직관리</span>
		<img class="icon1" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle.png">
		<img class="icon2" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle2.png">
	</div>
	<div class="menu">
		<ul>
			<%-- <li><a href="${pageContext.servletContext.contextPath }/admin/chart?oneOpenYn="+ &{oneOpenYn};>그룹/회사정보</a></li>
			 --%>
			<li><a href="#" onclick="location.href = '${pageContext.servletContext.contextPath }/admin/chart?oneOpenYn=' + oneOpenYn +'&twoOpenYn='+ twoOpenYn; return false;">그룹/회사정보</a></li>
			<li><a href="#" onclick="location.href = '${pageContext.servletContext.contextPath }/admin/compMgr?oneOpenYn=' + oneOpenYn +'&twoOpenYn='+ twoOpenYn; return false;">회사정보관리</a></li>
			<li><a href="#" onclick="location.href = '${pageContext.servletContext.contextPath }/admin/deptMgr?oneOpenYn=' + oneOpenYn +'&twoOpenYn='+ twoOpenYn; return false;">조직도정보관리</a></li>
			<li><a href="#" onclick="location.href = '${pageContext.servletContext.contextPath }/admin/rankPositionManagement?oneOpenYn=' + oneOpenYn +'&twoOpenYn='+ twoOpenYn; return false;">직급직책관리</a></li>
			
			<%-- <li><a href="${pageContext.servletContext.contextPath }/admin/compMgr">회사정보관리</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/admin/deptMgr">조직도정보관리</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/admin/rankPositionManagement">직급직책관리</a></li> --%>
		</ul>
	</div>
	<div class="parent-menu">
		<span>사원관리</span>
		<img class="icon1" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle.png">
		<img class="icon2" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle2.png">
	</div>
	<div class="menu">
		<ul>
			<li><a href="#" onclick="location.href = '${pageContext.servletContext.contextPath }/admin/empManagement?oneOpenYn=' + oneOpenYn +'&twoOpenYn='+ twoOpenYn; return false;">사원정보관리</a></li>
	<%-- 		<li><a href="${pageContext.servletContext.contextPath }/admin/connectDeptEmp">사원부서연결</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/admin/movePersonnel">인사이동</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/admin/movePersonnelStatus">인사이동 현황</a></li>
	 --%>
			<li><a href="#" onclick="location.href = '${pageContext.servletContext.contextPath }/admin/connectDeptEmp?oneOpenYn=' + oneOpenYn +'&twoOpenYn='+ twoOpenYn; return false;">사원부서연결</a></li>
			<li><a href="#" onclick="location.href = '${pageContext.servletContext.contextPath }/admin/movePersonnel?oneOpenYn=' + oneOpenYn +'&twoOpenYn='+ twoOpenYn; return false;">인사이동</a></li>
			<li><a href="#" onclick="location.href = '${pageContext.servletContext.contextPath }/admin/movePersonnelStatus?oneOpenYn=' + oneOpenYn +'&twoOpenYn='+ twoOpenYn; return false;">인사이동 현황</a></li>
			
		</ul>
	</div>
</div>
