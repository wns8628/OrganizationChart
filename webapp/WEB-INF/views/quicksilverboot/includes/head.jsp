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

  <title>SB Admin - Dashboard</title>
 
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath }/assets/quicksilverbootstrap/css/sb-admin.css" rel="stylesheet">

  <!-- 테이블 CSS -->
  <link href="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  
  <!-- 자세히보기 CSS,js -->
  <link href="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/css/profile.css" rel="stylesheet">

  <!-- 관리자로그인css -->
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <link href="${pageContext.request.contextPath }/assets/quicksilverbootstrap/css/admin-login.css" rel="stylesheet">
	
  <!--  -->
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	
  <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-emp-detail.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-info.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-scroll.js"></script>
	
  <script>
	var contextPath = "${pageContext.servletContext.contextPath }";
  </script>

<!-- 원래바디밑에임  -->
<!-- Bootstrap core JavaScript-->
 
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/bootstrap/js/bootstrap.bundle.js"></script>
  
  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/chart.js/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/jquery.dataTables.js"></script>
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/sb-admin.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/sb-admin-2.min.js"></script>
  
  
  <!-- Demo scripts for this page-->
<%--   <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/demo/datatables-demo.js"></script> --%>
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/demo/chart-bar-demo.js"></script>
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/demo/chart-pie-demo.js"></script>

<!--  -->

 <!--  -->
 <style type="text/css">

   #login-cancel{float:right; padding:5px;}
 </style>
