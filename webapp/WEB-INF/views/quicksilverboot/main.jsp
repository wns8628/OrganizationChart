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
			<div id="main-tree" class="tree">
			  <c:import url="/WEB-INF/views/quicksilverboot/includes/navigation.jsp"/>
			</div>
			<br>	
	
		<!--  -->
 			<!-- chart일단뺌 -->
			<%--
			  <c:import url="/WEB-INF/views/quicksilverboot/includes/chart.jsp"/>
 			--%>
 			
		    <!-- 검색창 -->    
	        <div class="main-body">
				<!-- Navbar Search -->
				<span class="search-body">
					  	   <span class="select-box">
						  	 	<label for="select"></label>
								<select id="search-opt" class=""><!-- custom-select custom-select-sm -->
										<option class='lang' data-lang='total' value="all" >전체</option>			
										<option class='lang' data-lang='emp' value="emp" >사원명(ID)</option> <!--  -->
										<option class='lang' data-lang='deptName' value="dept">부서명</option>	<!--  -->	
										<option class='lang' data-lang='position' value="position">직급</option>	
										<option class='lang' data-lang='duty' value="duty">직책</option>	
										<option class='lang' data-lang='call' value="call">전화번호</option>
										<option class='lang' data-lang='phone' value="phone">휴대전화</option>	
								</select>
							</span>   
					    <!-- </div> -->
				        <input type="text" class="input-text" placeholder="" aria-label="kwd" aria-describedby="basic-addon2">
				        <!-- <div class="input-group-append"> -->
				          <button class="search sch-submit lang" data-lang='search' id="search-button" type="button">
				            	검색
				          </button>
			    </span>
			    <br>	
			    <!-- -->
			    
			    <!--  -->
				<div class="header2">
					<span class="title lang" data-lang='empList'>● 사원목록 </span>
 					
 					<!--
 					 <ul class="sort_list">
						<li>사번순</li>
						<li>사원명순</li>
					</ul>
					 -->
					 
 					<iframe id="iframe" name="iframe" style="display:none;"></iframe><!--익스플로러 엑셀저장위해  -->
					<div id="dvjson"></div>
 					<span class="exelbtn">
						<button type= "submit" class="exel-submit lang" data-lang='exel'>엑셀 저장</button>
					</span>
				</div>
		    	<!--  -->
				
		         <!-- 직원테이블 -->
		         <div class="table-body">
	                <table class="table table-bordered member" id="dataTable" width="100%" cellspacing="0" >
                       <thead>
	                    <tr>
	                  	  <th class='lang' data-lang='empNo'>사번</th>
	                  	  <th class='lang' data-lang='deptNo'>부서번호 </th>
	                      <th class='lang' data-lang='dept'>부서</th>
	                      <th class='lang' data-lang='position'>직급</th>
	                      <th class='lang' data-lang='duty'>직책</th>
	                      <th class='lang' data-lang='empName'>사원명(ID)</th>
	                      <th class='lang' data-lang='call'>전화번호</th>
	                      <th class='lang' data-lang='phone'>휴대전화</th>
	                    </tr>
	                  </thead>
	                  <tbody>
	                   	
	                  </tbody>
	                </table>
                 </div>
                 
                 <!-- 페이지네이션 -->
                 <div class="pagination-group">
	                <div class="pagination">
	                 	
	                </div>
	                <div class="pagination-info">
	                 	
	                </div>                 
                 	<input type='text' name='page-point' onkeydown='return onlyNumber(event)' placeholder='pageNo'class='page-point' size='5' maxlength='5' />
                 </div>
                 <!--  -->
				
				<!-- 디테일 사원표시  -->
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
