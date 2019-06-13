<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- contextPath -->
<script>var contextPath = "${pageContext.servletContext.contextPath }";</script>

<!-- Jquery  -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- css -->    
<link href="${pageContext.servletContext.contextPath }/assets/css/admin.css?ver=1" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/admin/admin-connect-dept-emp.css" rel="stylesheet" type="text/css">

<!-- 부트스트랩 css -->
<%-- <link href="${pageContext.servletContext.contextPath }/assets/css/bootstrap.css" rel="stylesheet" type="text/css">
 --%>

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/admin/admin-nav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/admin/admin-connect-deptEmp.js"></script>

<!-- 부트스트랩 데이터테이블 -->
<script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>
