<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Dashboard</title>
 
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath }/assets/quicksilverbootstrap/css/sb-admin.css" rel="stylesheet">

  <!-- 테이블 CSS -->
  <link href="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  
	
	<!--  -->
	<style type="text/css">
	  #departments{display: none;} 
	  #login-cancel{float:right; padding:5px;}
	</style>
	
	<!-- 로그인테스트 -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<link href="${pageContext.request.contextPath }/assets/quicksilverbootstrap/css/admin-login.css" rel="stylesheet">
	<!--  -->
	
	<%-- 
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	--%>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
	 <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	 <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-ajax-js.js"></script>
	<script>
		var contextPath = "${pageContext.servletContext.contextPath }";
	</script>
	
</head>

<body id="page-top">
    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <a class="navbar-brand mr-1" href="index.html">Quick Silver(douzone)</a>
<!--  
   <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>
-->
    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0"  onsubmit="return false">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="검색..." aria-label="kwd" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary search" id="search-button" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>        
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item">   
         
        <div id="admin-login" class="form-control btn-primary">
       		 관리자 로그인
	     	<!--  -->
	     	<div class="wrapper fadeInDown" id="admin-dialog" style="display:none">				  
				  <div id="formContent" >
				    <img class="underlineHover" id="login-cancel" src="${pageContext.request.contextPath }/assets/images/delete.png"></img>
				    <!-- Tabs Titles -->
					<!-- Icon -->	
			        <h2>관리자</h2>
				     <div class="fadeIn first">
				      <img src="${pageContext.request.contextPath }/assets/images/quicksilver.jpg" id="icon" alt="User Icon" />
				    </div>

				    <!-- Login Form -->
				    <form>
				      <input type="text" id="login" class="fadeIn second" name="login" placeholder="login">
				      <input type="text" id="password" class="fadeIn third" name="login" placeholder="password">
				      <input type="submit" class="fadeIn fourth" value="Log In">
				    </form>
				
				    <!-- Remind Passowrd -->
				    <div id="formFooter">
				      <a class="underlineHover" href="#">Forgot Password?</a>
				    </div>
				  </div>
			</div>    	
	     	<!--  -->
        </div> 

   	  <!-- href="${pageContext.request.contextPath }/testboot/login -->
      </li>	     
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
<!--     <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li> -->
     <!--  <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Login Screens:</h6>
          <a class="dropdown-item" href="login.html">Login</a>
          <a class="dropdown-item" href="register.html">Register</a>
          <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.html">404 Page</a>
          <a class="dropdown-item" href="blank.html">Blank Page</a>
        </div>
      </li> -->
<!--       <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li> 
    </ul> -->

<!--  -->
<!-- ul id="hierarchy" class="sidebar navbar-nav">

</ul> -->

<div class="sidebar navbar-nav">
	<c:forEach items="${companyList }" var="vo">
		<div id="company" class="btn-success" data-no='${vo.no }'>${vo.name }</div>
		<ul data-no='${vo.no }'></ul>
	</c:forEach>
</div>


<!--  -->

    <!-- Content Wrapper -->
	 <div id="content-wrapper" class="d-flex flex-column">
	
      <!-- Main Content -->
      <div id="content">

      <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>사원번호</th>
                      <th>이름</th>
                      <th>나이</th>
                      <th>성별</th>
                      <th>직급</th>
                      <th>부서</th>
                      <th>자회사</th>
                      <th>모회사</th>
                      <th>전화번호</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>사원번호</th>
                      <th>이름</th>
                      <th>나이</th>
                      <th>성별</th>
                      <th>직급</th>
                      <th>부서</th>
                      <th>자회사</th>
                      <th>모회사</th>
                      <th>전화번호</th>
                    </tr>
                  </tfoot>
                  <tbody>
                   
                  
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
	</div>
      <!-- Sticky Footer -->
      <!-- <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer> -->

    <!-- /.content-wrapper -->

  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
  <%-- <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/demo/datatables-demo.js"></script> --%>
  <script src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/demo/chart-area-demo.js"></script>

 
</body>

</html>
