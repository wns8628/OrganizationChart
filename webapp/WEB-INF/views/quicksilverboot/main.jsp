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
				          <button class="search sch-submit lang" data-lang='search' data-check='true' id="search-button" type="button">
				            	검색
				          </button>
			    </span>
			    <br>	
			    <!-- -->
			    
				<div class="header2">
					<span class="title lang" data-lang='empList'>사원목록 </span>
 		
					<!-- 엑셀다운로드  -->
				    <span class="exelbtn">
						<button id="btn-excel" class="exel-submit">엑셀저장</button>
					</span>
					<!-- 파일 생성중 진행막대 -->
					<div title="Data Download" id="preparing-file-modal"
						style="display: none;">
						<div id="progressbar"
							style="width: 100%; height: 22px; margin-top: 20px;"></div>
					</div>
					<!-- 에러발생시  다이얼로그 -->
					<div title="Error" id="error-modal" style="display: none;">
						<p>생성실패.</p>
					</div>
					<!-- 엑셀다운로드  -->
				</div>
				
		         <!-- 직원테이블 -->
		         <div class="table-body">
	                <table class="table table-bordered member" id="dataTable" width="100%" cellspacing="0" >
                       <thead>
	                    <tr>
	                  	  <th class='lang' data-lang='empNo'>사번</th>
	                  	  <th class='lang' data-lang='deptNo' data-column='deptSeq'>부서번호 <a href="#">↕</a></th>
	                      <th class='lang' data-lang='dept' data-column='deptName'>부서 <a href="#">↕</a></th>
	                      <th class='lang' data-lang='position' data-column='positionCodeName'>직급 <a href="#">↕</a></th>
	                      <th class='lang' data-lang='duty' data-column='dutyCodeName'>직책 <a href="#">↕</a></th>
	                      <th class='lang' data-lang='empName' data-column='empName'>사원명(ID) <a href="#">↕</a></th>
	                      <th class='lang' data-lang='call' data-column='homeTelNum'>전화번호 <a href="#">↕</a></th>
	                      <th class='lang' data-lang='phone' data-column='mobileTelNum'>휴대전화 <a href="#">↕</a></th>
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
