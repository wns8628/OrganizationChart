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
								<select id="search-opt" class=""><!-- custom-select custom-select-sm -->
										<option value="all" >전체</option>			
										<option value="emp" >사원명(ID)</option> <!--  -->
										<option value="dept">부서명</option>	<!--  -->	
										<option value="position">직급</option>	
										<option value="duty">직책</option>	
										<option value="call">전화번호</option>
										<option value="phone">휴대전화</option>	
								</select> 
							</span>   
					    <!-- </div> -->
				        <input type="text" class="input-text" placeholder="" aria-label="kwd" aria-describedby="basic-addon2">
				        <!-- <div class="input-group-append"> -->
				          <button class="search sch-submit" id="search-button" type="button">
				            	검색
				          </button>
			    </span>
			    <br>	
			    <!---->
			    
			    <!--  -->
				<div class="header2">
					<span class="title">● 사원목록 </span>
					
 					<span class="exelbtn">
						<button type= "submit" class="exel-submit">엑셀 저장</button>
					</span>
					 
				</div>
		    	<!--  -->
				
		      <!-- Begin Page Content -->
 
		         <!-- DataTales Example -->
		         <div class="table-body">
	                <table class="table table-bordered member" id="dataTable" width="100%" cellspacing="0" >
                       <thead>
	                    <tr>
	                  	  <th>사번 </th>
	                  	  <th>부서번호 </th>
	                      <th>부서</th>
	                      <th>직급</th>
	                      <th>직책</th>
	                      <th>사원명</th>
	                      <th>ID</th>
	                      <th>전화번호</th>
	                      <th>휴대전화</th>
	                    </tr>
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
