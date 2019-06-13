<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- 조직도페이지 관련입니다.  -->
<title>Quick Silver</title>
 
  <!-- 부트스트랩 -->
  <link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
  <!--
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  -->
   
  <!-- 제이쿼리 -->
  <script src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.1.0.min.js"></script> 
  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/js/jquery/jquery-ui.min.css"/>
  <script src="${pageContext.request.contextPath }/assets/js/jquery/jquery-ui.min.js"></script>

  <!-- 조직도 페이지 js파일  -->
  <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-emp-detail.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-scroll.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-makeTable.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-nav.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-login.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-search.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-exel-submit.js"></script>
  
  <!-- 엑셀저장 lib  -->  
  <script src="${pageContext.request.contextPath }/assets/js/exel-lib/jquery.fileDownload.js"></script>

  <script>
	var contextPath = "${pageContext.servletContext.contextPath }";
  </script>
 
  <!-- css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/quicksilver-detailemp.css">

  <!-- Page level plugin JavaScript-->
  <%-- <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/chart.js/Chart.min.js"></script> --%>
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/jquery.dataTables.js"></script>
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>

