<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.servletContext.contextPath }/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/css/rankPositionManagement.css" />

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/css/sb-admin-2.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/vendor/fontawesome-free/css/all.min.css" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> --%>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/admin.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<%--  <script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/jquery/jquery.min.js"></script> --%>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/sb-admin-2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/demo/datatables-demo.js"></script> --%>
	
<script type="text/javascript">
let contextPath = "${pageContext.servletContext.contextPath }";

let rankPositionSearch = (compSeq, kwd, useYn, mainLangCode, position) => {
	
	$('.fixed_header tbody').empty();
	
	 $.ajax({
		url : contextPath + "/rPMSearch/" + compSeq + "/" + useYn + "?kwd=" + kwd + "&langCode=" + mainLangCode + "&position=" + position,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			
			let $tbody = $('.fixed_header tbody'); // tbody Element 가져옴
	
			response.data.forEach( vo => {
				listRender(vo, $tbody);
			})
			
			console.log($tbody);
			//$(".listDiv table").append(tbody);
			
			$(".listDiv table tbody tr").click( event => {
				console.log("tbody tr 클릭");
				console.log(event.currentTarget.children[0].innerHTML); // 직급 직책 코드
				
				
			})
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	}); 
};

let listRender = function(vo, $tbody) {
	
	/* let htmls = "<tr>" +
					"<td>" + vo.positionCode + "</td>" +
					"<td>" + vo.positionCodeName + "</td>" +
					"<td>" + vo.compName + "</td>" + 
					"<td>" + vo.useYn + "</td>" +
				"</tr>"; */
		
	
		/* tr에 td을 붙여서 tbody에 tr을 붙임 */
		let tr = document.createElement("tr");
		
		for(let i = 0; i < 4; i++){
			
			let td = document.createElement("td");
			
			switch (i) {
				case 0:
					td.innerHTML = vo.positionCode;
					td.classList.add('positionCode');
					break;
				case 1:
					td.innerHTML = vo.positionCodeName;
					td.classList.add('positionCodeName');
					break;
				case 2:
					td.innerHTML = vo.compName;
					td.classList.add('compName');
					break;
				case 3:
					td.innerHTML = vo.useYn;
					td.classList.add('useYn');
					break;
			}
			tr.appendChild(td);
		}
		
		$tbody.append(tr);
};
	
let search = () => { // 검색 클릭
	console.log("검색");
	
	let compSeq = document.getElementsByClassName('selectBoxStyle')[0].value;
	let kwd = document.getElementsByClassName('inputText')[0].value;
	let useYn = document.getElementsByClassName('useYN')[0].value;
	
	rankPositionSearch(compSeq, kwd, useYn, mainLangCode);
};

$(function(){
	
	// 엔터 클릭 인식
	document.getElementsByTagName('body')[0].addEventListener("keydown", event => {
		console.log(event.keyCode);
		
		if( event.keyCode == 13){ // 엔터를 눌렀을때 검색
			search();
		}
	})
	
	// 검색 버튼 클릭 인식
	document.getElementsByClassName('submit')[0].addEventListener("click", search);
	
	
	$(".positionButtons").click( () => {
		console.log("position 버튼 클릭");
	});
	
	$(".dutyButtons").click( () => {
		console.log("duty 버튼 클릭");
		console.log($(".dutyButton").style);
	});
	
});
</script>
</head>

<body>
		<header>
			<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
		</header>
		
		<div class="section">
			<div>
				<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
			</div>	
			
			<div class="mainSection" >
				
				<div class="topSearchDiv">
				
					
					
						<span>회사선택</span>
						<select class="selectBoxStyle">
							<option value="all" data-compSeq="all">전체</option>
							<c:forEach items="${compList}" var="vo">
								<option value="${vo.compSeq }">${vo.compName }</option>
							</c:forEach>
						</select>
						
						<span>직급/직책</span>
						<input class="inputText" name="position" type="text">
						
						<span>사용여부</span>
						<select class='useYN'>
						  <option value="Y">사용</option>
						  <option value="N">사용안함</option>
						 
						</select>
						
						<input class="submit" type="button" value="검색">
						
					
				</div>
				
			
				 <div class="buttonCover" style="background-color: blue;"> -->
				 
				 	<div class="positionButtons">
				 	</div>
				 	
					<div class="positionButton" style="background-color: red;">
						<span class="buttonText">직급</span>
					</div>
					
				
					<div class="dutyButtons">
					</div>
					
					<div class="dutyButton" style="background-color: yellow;">
							<span>직책</span>
					</div>
					
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
						<p class="positionInfoLabel">●직급정보</p>
						
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
								    	<select disabled="disabled">
										  <option value="volvo">Volvo</option>
										  <option value="saab">Saab</option>
										  <option value="mercedes">Mercedes</option>
										  <option value="audi">Audi</option>
										</select>
								    </th>
								  </tr>
								  <tr>
								    <td class="tg-lqy6 positionField" colspan="2">코드</td>
								    <td class="tg-0lax">
								    	<input class="inputText" type="text">
								   
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-baqh" rowspan="4">명칭</td>
								    
								    <td class="tg-lqy6">한국어</td>
								    <td class="tg-0lax">
								   		 <input class="inputText" type="text">
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6">영어</td>
								    <td class="tg-0lax">
								    	<input class="inputText" type="text">
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6">일본어</td>
								    <td class="tg-0lax">
								    	<input class="inputText" type="text">
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6">중국어</td>
								    <td class="tg-0lax">
								    	<input class="inputText" type="text">
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6" colspan="2">사용여부</td>
								    <td class="tg-0lax"></td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6" colspan="2">정렬순서</td>
								    <td class="tg-0lax2">
								    	<input type="text">
								    </td>
								  </tr>
								  <tr>
								    <td class="tg-lqy6" colspan="2">비고</td>
								    <td class="tg-0lax2">
								    	<input type="text">
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