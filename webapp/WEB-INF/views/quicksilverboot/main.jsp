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

	<body id="page-top" class="frame">
		
	<div class="header">  
	  <c:import url="/WEB-INF/views/quicksilverboot/includes/header.jsp"/>
	</div>
	
	<div id="wrapper" class="body-container">
		<div class="navi">
		  <c:import url="/WEB-INF/views/quicksilverboot/includes/navigation.jsp"/>
		</div>
		<br>	
	
		<!--  -->
  			   <!-- chart일단뺌 -->
				<%--
				  <c:import url="/WEB-INF/views/quicksilverboot/includes/chart.jsp"/>
	 			--%>
		        
	        <div class="main-body">
				<!-- Navbar Search -->
				<span class="search-body">
					  	   <span class="select-box">
						  	 	<label for="select"></label>
						  	 	<c:if test="${langCode eq 'kr'}">
								<select id="search-opt" class=""><!-- custom-select custom-select-sm -->
										<option value="all" >전체</option>			
										<option value="emp" >사원명(ID)</option> <!--  -->
										<option value="dept">부서명</option>	<!--  -->	
										<option value="position">직급</option>	
										<option value="duty">직책</option>	
										<option value="call">전화번호</option>
										<option value="phone">휴대전화</option>	
								</select>
								</c:if>
						  	 	<c:if test="${langCode eq 'en'}">
								<select id="search-opt" class=""><!-- custom-select custom-select-sm -->
										<option value="all" >All</option>			
										<option value="emp" >Employee(ID)</option> <!--  -->
										<option value="dept">Department</option>	<!--  -->	
										<option value="position">Position</option>	
										<option value="duty">Duty</option>	
										<option value="call">Call Number</option>
										<option value="phone">Phone Number</option>	
								</select>
								</c:if>
							</span>   
					    <!-- </div> -->
				        <input type="text" class="input-text" placeholder="" aria-label="kwd" aria-describedby="basic-addon2">
				        <!-- <div class="input-group-append"> -->
				        <c:if test="${langCode eq 'kr'}">
				          <button class="search sch-submit" id="search-button" type="button">
				            	검색
				          </button>
				        </c:if>
				        <c:if test="${langCode eq 'en'}">
				          <button class="search sch-submit" id="search-button" type="button">
				            	Search
				          </button>
				        </c:if>
			    </span>
			    <br>	
			    <!---->
			    
			    <!--  -->
			    
				<div class="header2">
					<c:if test="${langCode eq 'kr'}">
					<span class="title">● 사원목록 </span>
					</c:if>
					<c:if test="${langCode eq 'en'}">
					<span class="title">● Employees List </span>
					</c:if>
					
					<c:if test="${langCode eq 'kr'}">
 					<span class="exelbtn">
						<button type= "submit" class="exel-submit">엑셀 저장</button>
					</span>
					</c:if>
					<c:if test="${langCode eq 'en'}">
 					<span class="exelbtn">
						<button type= "submit" class="exel-submit">Exel Save</button>
					</span>
					</c:if>
				</div>
		    	<!--  -->
				
		      <!-- Begin Page Content -->
 
		         <!-- DataTales Example -->
		         <div class="table-body">
	                <table class="table table-bordered member" id="dataTable" width="100%" cellspacing="0" >
                       <thead>
                       	<c:if test="${langCode eq 'kr'}">
	                    <tr>
	                  	  <th>사번</th>
	                  	  <th>부서번호 </th>
	                      <th>부서</th>
	                      <th>직급</th>
	                      <th>직책</th>
	                      <th>사원명</th>
	                      <th>ID</th>
	                      <th>전화번호</th>
	                      <th>휴대전화</th>
	                    </tr>
	                    </c:if>
                       	<c:if test="${langCode eq 'en'}">
	                    <tr>
	                  	  <th>Employee Number</th>
	                  	  <th>Department Number </th>
	                      <th>Department</th>
	                      <th>Position</th>
	                      <th>Duty</th>
	                      <th>Name</th>
	                      <th>ID</th>
	                      <th>Call Number</th>
	                      <th>Phone Number</th>
	                    </tr>
	                    </c:if>
	                  </thead>
	                  <tbody>
	                   	
	                  </tbody>
	                </table>
                 </div>
                 
                <div class="page-ajax"> 
                	<div class="btn-group">
		                <button type="button" class="pagePre btn btn-sm btn-outline-secondary" >이전</button >
		                <button type="button" class="pageNext btn btn-sm btn-outline-secondary" data-no="1" data-seq="1" data-kwd="" data-selectSearch="">다음</button>   
					</div>
				</div>

				
				<!-- 디테일  -->
				<div class="container-detail">
				
				
				</div>

			
		 </div>	
		 
 		<%-- 	 
	      <footer class="sticky-footer">
			  <c:import url="/WEB-INF/views/quicksilverboot/includes/footer.jsp"/>
	      </footer>
		 --%>
	  </div>
	</body>	
</html>
