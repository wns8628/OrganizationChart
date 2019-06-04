<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>사원 부서 연결</title>
<c:import url="/WEB-INF/views/admin/includes/head.jsp" />

</head>
<body>
<div id="container">

<div id="wrapper">
	<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
	<div id="contents">
		
				<!-- 모으자 -->
				<div id="contents-header" draggable='true'>
					<img class="home" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/home.png">
					<img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>시스템설정</span> <img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>사원관리</span> <img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>사원부서연결</span>
				</div>
				<!-- 모으자 -->
		
			<!-- 회사선택 -->
			<div id="select-bar">
				<span>회사선택</span>
				<select id="compSelect">
					<c:forEach items="${compList }" var="vo">
						<option value="${vo.compSeq }">${vo.compName }
					</c:forEach>
				</select>
				
				<span>재직여부</span>
				<select class="workingStatus">
					<option value="999">재직
					<option value="001">퇴직
					<option value="004">휴직
				</select>
				<span>사원명/ID검색</span>
				<input class="search-empID" type="text" placeholder="사원명/ID검색">
				<button class="search-empID-button">검색</button>
			</div>
		
			<!-- body -->
			
			<div class="connect-deptEmp-body">
				<div class="connect-deptEmp-body-left">
				
					<!--  -->
				  	  <div class="table-body">
		                <table class="table loginIdAndEmpName-Table" id="" width="100%" cellspacing="0" >
	                       <thead>
		                    <tr>
		                      <th class='login-id'  data-column='login-Id'>ID</th>
		                      <th class='emp-name'  data-column='emp-name'>사원명</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                   	
		                  </tbody>
		                </table>
	                 </div>
					<!--  -->
					
				</div>
				<div class="connect-deptEmp-body-right">
				
				    <!-- 위  -->
					<div class="connect-deptEmp-body-right-up">
			  		    <div class="table-body">
			                <table class="table loginIdAndEmpNameClick-Table" id="" width="100%" cellspacing="0" >
		                       <thead>
			                    <tr>
			                      <th class='compName'     data-column='compName'>회사</th>
			                      <th class='deptName'     data-column='deptName'>부서</th>
			                      <th class='mainDeptYn'   data-column='mainDeptYn'>구분</th>
			                      <th class='positionCode' data-column='positionCode'>직급</th>
			                    </tr>
			                  </thead>
			                  <tbody>
			                   	 
			                  </tbody>
			                </table>
		                 </div>				
					</div>
					
				   <!-- 아래 -->
				   <div class="connect-deptEmp-body-right-down">
			
						<table class="tg">
						  <tr>
						    <td class="tg-hf74">회사</td>
						    <td class="tg-0lax detail-comp"></td>
						    <td class="tg-hf74">부서</td>
						    <td class="tg-0lax detail-dept"></td>
						  </tr>
						  <tr>
						    <td class="tg-hf74">ERP사번</td>
						    <td class="tg-0lax detail-empSeq"></td>
						    <td class="tg-hf74">구분</td>
						    <td class="tg-lqy6 detail-mainDeptYn"></td>
						  </tr>
						  <tr>
						    <td class="tg-hf74">직급</td>
						    <td class="tg-0lax detail-positionCode">
		    					<select id="detail-positionCode-select">
										<option value="${vo.compSeq }">${vo.compName }
								</select>
						    </td>
						    <td class="tg-hf74">직책</td>
						    <td class="tg-0lax detail-dutyCode">
					    		<select id="detail-dutyCode-select">
										<option value="${vo.compSeq }">${vo.compName }
								</select>
						    </td>
						  </tr>
						  <tr>
						    <td class="tg-hf74">부서전화</td>
						    <td class="tg-0lax detail-telNum"></td>
						    <td class="tg-hf74">부서팩스</td>
						    <td class="tg-0lax detail-faxNum"></td>
						  </tr>
						  <tr>
						    <td class="tg-hf74">재직여부</td>
						    <td class="tg-0lax detail-workStatus"></td>
						    <td class="tg-hf74">근태여부</td>
						    <td class="tg-0lax detail-checkWorkYn"></td>
						  </tr>
						</table>
				   </div>
					
				</div>
			</div>
		
		</div>	
	    <!-- nav  -->
		<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
	  </div>
	  
	<!-- footer -->
	<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
	
</div>
</body>
</html>