<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.servletContext.contextPath }/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/css/rankPositionManagement.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/admin.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/sb-admin-2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/demo/datatables-demo.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/rankPositionManagement.js"></script>
	
<script type="text/javascript">

let contextPath = "${pageContext.servletContext.contextPath }";
let position = "POSITION";
let kwd = '';

let newButtonClick = () => {
	console.log("신규버튼 클릭");
	
	let $select = $(".tg-0lax select");
	let positionField = $(".positionField")[0];
	let option;
	
	$select.removeAttr('disabled');
	$select.empty(); // 싹 다 비움
	
	// 회사선택 다시 세팅
	 <c:forEach items="${compList}" var="vo">
	 	option = document.createElement('option');
	 	option.setAttribute('value', '${vo.compSeq }');
	 	option.innerHTML = '${vo.compName }';
	 	
	 	$select.append(option);
	</c:forEach> 
	
	//$(".tg-0lax select option")[0].value = '';
	positionField.value = '';
	positionField.removeAttribute('disabled');
	$(".koreaField")[0].value = '';
	$(".englishField")[0].value = '';
	$(".useY")[0].checked = true;
	$(".order")[0].value = '';
	$(".comment")[0].value = '';
};

$(function(){
	
	ArrowChange();
	
	// 엔터 클릭 인식
	document.getElementsByTagName('body')[0].addEventListener("keydown", event => {
		console.log(event.keyCode);
		
		if( event.keyCode == 13){ // 엔터를 눌렀을때 검색
			search();
		}
	});
	
	// 검색 버튼 클릭 인식
	document.getElementsByClassName('submit')[0].addEventListener("click", search);
	
	
	// 직급버튼
	$(".positionButtons").click(positionButtonClick);
	
	// 직책버튼
	$(".dutyButtons").click(dutyButtonClick);
	
	// 신규버튼
	$(".new").click(newButtonClick);
	
	// 저장버튼
	$('.save').click(saveButtonClick);
	
	// 직책 검색하는 input 속성을 변경
	$("input[name='position']").focus( event => {
		event.currentTarget.setAttribute('data-focus', true);
	});
	
	$("input[name='position']").blur( event => {
		event.currentTarget.setAttribute('data-focus', false);
	});
	
	// 삭제버튼
	$(".remove").click( removeButtonClick );
});
</script>
</head>

<body>
		<header>
			<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
		</header>
		
		<div class="section">
			
				<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
			
			
			<div class="mainSection" >
			
				<div id="contents-header">
					<img class="home" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/home.png">
					<img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>시스템설정</span> <img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>회사/조직관리</span> <img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>직급직책관리</span>
				</div>
				<div class="topSearchDiv">
				
					
					
						<span>회사선택</span>
						<select class="selectBoxStyle">
							<option value="all" data-compSeq="all">전체</option>
							<c:forEach items="${compList}" var="vo">
								<option value="${vo.compSeq }">${vo.compName }</option>
							</c:forEach>
						</select>
						
						<span>직급/직책</span>
						<input class="inputText" name="position" data-focus=false type="text">
						
						<span>사용여부</span>
						<select class='useYN'>
						  <option value="Y">사용</option>
						  <option value="N">사용안함</option>
						 
						</select>
						
						<input class="submit button-css-search" data-check="false" type="button" value="검색">
						
					
				</div>
				
			
				 <div class="buttonCover"> <span style="visibility:hidden;">--></span>
				 
				 	<div class="positionButtons">
				 	</div>
				 	
					<div class="positionButton">
						<span class="buttonText">직급</span>
					</div>
					
				
					<div class="dutyButtons">
					</div>
					
					<div class="dutyButton">
							<span>직책</span>
					</div>
					
				</div> 
				
				<div class="updateButtons">
					<input class="new button-css" type="button" value="신규">
					<input type="button" class="save button-css" value="저장">
					<input type="button"class="remove button-css" value="삭제">
				</div>
				
				<div id="dialog-message" style="display: none;">
					<p></p>
				</div>
				
				<div class="line">
				</div>
				
					
				<div class="mainDiv">
			
					<div class="listDiv">
			
							 <table class="fixed_header" border="1px;">
								<thead>
									<tr>
										<th class="th-text positionCode">코드</th>
										<th class="th-text positionCodeName">명칭</th>
										<th class="th-text compName">사용회사</th>
										<th class="th-text useYn" >사용여부</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
								
							</table>
				 	<!-- <div class="container-fluid">

			          <div class="card shadow mb-4">
			      
				            <div class="card-body">
				              <div class="table-responsive">
				                <table class="table table-striped table-bordered table-hover" id="dataTable" width="400px" cellspacing="0">
				                  <thead>
				                    <tr>
				                      <th>코드</th>
				                      <th>명칭</th>
				                      <th>사용회사</th>
				                      <th>사용여부</th>
				                    </tr>
				                  </thead>
				                  <tfoot>
				                    <tr>
				                      <th>코드</th>
				                      <th>명칭</th>
				                      <th>사용회사</th>
				                      <th>사용여부</th>
				                    </tr>
				                  </tfoot>
				                  
				                </table>
				              </div>
				            </div>
				          </div>
				
				        </div> -->
						
						
					</div>
					
					<div class="positionInfoDiv">
						<p class="positionInfoLabel">● 직급정보</p>
						
						<div class="positionInfoForm">
							
								<table class="tg" style="undefined;table-layout: fixed;">
								<colgroup>
									<col style="width: 35px">
									<col style="width: 50px">
									<col style="width: 148px">
								</colgroup>
								  <tr>
								    <th class="tg-dvpl" colspan="2">회사선택</th>
								    <th class="tg-0lax">
								    	<select>
								    	
											<c:forEach items="${compList}" var="vo">
												<option value="${vo.compSeq }">${vo.compName }</option>
											</c:forEach>
											
								    	</select>
								    </th>
								  </tr>
								  <tr>
								    <td class="tg-lqy6" colspan="2">코드</td>
								    <td class="tg-0lax">
								    	<input class="inputText positionField" type="text">
								   		
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-baqh" rowspan="4">명칭</td>
								    
								    <td class="tg-lqy6">한국어</td>
								    <td class="tg-0lax">
								   		 <input class="inputText koreaField" type="text">
								   
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6">영어</td>
								    <td class="tg-0lax">
								    	<input class="inputText englishField" type="text">
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6">일본어</td>
								    <td class="tg-0lax">
								    	<input class="inputText" type="text" disabled="disabled">
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6">중국어</td>
								    <td class="tg-0lax">
								    	<input class="inputText" type="text" disabled="disabled">
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6" colspan="2">사용여부</td>
								    <td class="tg-0lax">
								    	<label>
								    		
								    		<input type="radio" class="useY" name="group" value="사용" checked="checked"/>사용
								    	</label>
								    	
								   		<label>
								   			<input type="radio" class="useN" name="group" value="사용안함"/>사용안함
								   		</label>
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6" colspan="2">정렬순서</td>
								    <td class="tg-0lax2">
								    	<input type="text" class="order" >
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6" colspan="2">비고</td>
								    <td class="tg-0lax2">
								    	<input type="text" class="comment">
								    </td>
								  </tr>
								</table>
						</div>
					</div>
					
				</div>
			</div>
		</div>
			
			
		<footer>
			<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
		
		</footer>
</body>
</html>