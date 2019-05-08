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
			
			    <!-- Breadcrumbs-->
		        <ol class="breadcrumb">
		          <li class="breadcrumb-item">
		            <a href="#" class="dept">QuickSilver</a>
		          </li>
		          <li class="breadcrumb-item active">douzone</li>
		        </ol>
			
		      <!-- Main Content -->
		      <div id="content">
		      
				 <!-- chart일단뺌 -->
				<%--
				  <c:import url="/WEB-INF/views/quicksilverboot/includes/chart.jsp"/>
	 			--%>
		        
		
		      <!-- Begin Page Content -->
		        <div class="container-fluid">
		
		          <!-- DataTales Example -->
		          <div class="card shadow mb-4">
		            <div class="card-header py-3 dept">
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
		        </div>		        		       	
		      </div>		      
				<!-- 디테일  -->
				<div class="container">
				
				</div>
				<!--  -->
			</div>
 	<%-- 	 
	      <footer class="sticky-footer">
			  <c:import url="/WEB-INF/views/quicksilverboot/includes/footer.jsp"/>
	      </footer>
	 --%>
	  </div>
	</body>	
</html>
