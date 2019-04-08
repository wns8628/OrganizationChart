<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
 	<c:import url="/WEB-INF/views/quicksilverboot/includes/head.jsp"/>
</head>

	<body id="page-top">
		  <c:import url="/WEB-INF/views/quicksilverboot/includes/header.jsp"/>

	<div id="wrapper">
		  <c:import url="/WEB-INF/views/quicksilverboot/includes/navigation.jsp"/>
	
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
		                  <tbody>
		                   
		                  </tbody>
		                </table>
		              </div>
		            </div>
		          </div>
		
		        </div>		
		      </div>
			</div>
	     
	      <footer class="sticky-footer">
			  <c:import url="/WEB-INF/views/quicksilverboot/includes/footer.jsp"/>
	      </footer>
	
	  </div>
	</body>	
</html>
