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
	
<script type="text/javascript">

let contextPath = "${pageContext.servletContext.contextPath }";
let position = "POSITION";
let kwd = '';

let rankPositionSearch = (compSeq, kwd, useYn, mainLangCode) => {
	
	$('.fixed_header tbody').empty();
	
	 $.ajax({
		url : contextPath + "/rPMSearch/" + compSeq + "/" + useYn + "?kwd=" + kwd + "&langCode=" + mainLangCode + "&position=" + position,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			
			console.log(response.data);
			let $tbody = $('.fixed_header tbody'); // tbody Element 가져옴
	
			response.data.forEach( vo => {
				listRender(vo, $tbody);
			})
			
			//$(".listDiv table").append(tbody);
			
			$(".listDiv table tbody tr").click( event => {
				console.log("tbody tr 클릭");
				
				console.log( $(".tg-0lax select") );
				
				// tr 클릭시 positionInfoForm의 회사선택 select을 disabled 시킴 
				$(".tg-0lax select option")[0].parentNode.setAttribute('disabled', 'disabled');
				
				// positionInfoForm의 각 필드에 값 삽입
				$(".positionField")[0].value = event.currentTarget.children[0].innerHTML;
				// 코드는 수정x
				$(".positionField")[0].setAttribute('disabled', 'disabled');
				
				$(".tg-0lax select option")[0].value = event.currentTarget.children[2].innerHTML;
				$(".tg-0lax select option")[0].innerHTML = event.currentTarget.children[2].innerHTML;
				
				// 각 필드 초기화
				$(".koreaField")[0].value = '';
				$(".englishField")[0].value = '';
				$(".order")[0].value = '';
				$(".comment")[0].value = '';
				
				// 한국어
				$(".koreaField")[0].value = event.currentTarget.children[1].innerHTML;
				
				// 영어
				$(".englishField")[0].value = event.currentTarget.children[0].getAttribute('data-dpNameEn');
				
			/* 	if( event.currentTarget.children[1].innerHTML[0].charCodeAt(0) > 1000 ){
					$(".koreaField")[0].value = event.currentTarget.children[1].innerHTML;
				} else {	// 영어
					$(".englishField")[0].value = event.currentTarget.children[1].innerHTML;
				} */
				
				// 사용여부
				if( event.currentTarget.children[3].innerHTML == $(".useY")[0].value ){ // 사용여부 값에따라 체크표시
					$(".useY")[0].checked = true;
				} else {
					$(".useN")[0].checked = true;
				}
				
				
				// 정렬순서
				$(".order")[0].value = event.currentTarget.children[0].getAttribute('data-order');
				
				// 비고
				$(".comment")[0].value = event.currentTarget.children[0].getAttribute('data-comment');
				
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
					if( vo.orderNum == null) {
						vo.orderNum = '';
					}
					if( vo.commentText == null) {
						vo.commentText = '';
					}
					td.setAttribute("data-order", vo.orderNum);
					td.setAttribute("data-comment", vo.commentText);
					td.setAttribute('data-dpNameEn', vo.dpNameEn);
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
	
let search = position => { // 검색 클릭
	console.log("검색");
	
	
	let compSeq = document.getElementsByClassName('selectBoxStyle')[0].value;
	let inputKwd =  document.getElementsByClassName('inputText')[0];
	let useYn = document.getElementsByClassName('useYN')[0].value;
	
	// 검색키워드 저장
	kwd = inputKwd.value;
	
	// 검색버튼을 눌렀으니 data-check true로 변경
	$("input[data-check='false']").attr("data-check", "true");
	console.log('position : ' + position);
	
	// 직급 직책 버튼을 누르면 검색한 데이터 그냥 가져옴
	if( position != undefined || inputKwd.getAttribute('data-focus') != 'false' && $("input[data-check='true']").attr("data-check") == "true"){
		rankPositionSearch(compSeq, kwd, useYn, mainLangCode);
	} else {
		$("input[data-check='true']").attr("data-check", "false");
	}
};

let messageBox = function(title, message){
	$("#dialog-message").attr({
		title: title
	});
	$("#dialog-message p").text(message);
	$("#dialog-message").dialog({
		modal: true,
		buttons: {
			"확인": function(){
				$(this).dialog("close");
			}
		},
	});
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
	
	
	// 직급버튼
	$(".positionButtons").click( event => {
		console.log("position 버튼 클릭");
		
		let $dutyButton = $(".dutyButton");
		let $positionButton = $(".positionButton");
		
		$positionButton.css("background-color", "#ffffff");
		$dutyButton.css("z-index", -1);    // 직책버튼을 클릭 못하게하고
		$dutyButton.css("background-color", '#f8f8f8');
		$positionButton.css("z-index", 0); // 직급 버튼을 클릭할수있도록한다
		
		position = "POSITION";  // 직급 버튼을 눌렀으므로 position 세팅
		
		search(position);
	});
	
	// 직책버튼
	$(".dutyButtons").click( event => {
		console.log("duty 버튼 클릭");
		
		let $dutyButton = $(".dutyButton");
		let $positionButton = $(".positionButton");
		
		$dutyButton.css('background-color', '#ffffff');
		$positionButton.css("background-color", '#f8f8f8');
		
		$dutyButton.css("z-index", 0);
		$positionButton.css("z-index", -1);
		
		position = "DUTY";	// 직책 버튼을 눌렀으므로 duty 세팅
		search(position);
	});
	
	// 신규버튼
	$(".new").click( () => {
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
	});
	
	// 저장버튼
	$('.save').click( () => {
		console.log("저장");
		
		let positionField = $(".positionField").val();
		let koreaField = $(".koreaField").val();
		let englishField = $(".englishField").val();
		let order = $(".order").val();
		let comment = $(".comment").val();
		let compSeq;
		
		 if( positionField == ''){
			messageBox("코드", "코드입력은 필수입니다");
			return;
		}
		 
		if( koreaField == '') {
			messageBox("한국어", "한국어 명칭 입력은 필수입니다");
			return;
		}
		
		for(let i = 0; i < koreaField.length; i++){
			if( koreaField[i].charCodeAt(0) < 10000){ // 한글이 아니면
				messageBox("한국어", "한국어 명칭은 한국어 입력만 가능합니다");
				return;
			}
		}
				
		for(let i = 0; i < order.length; i++){
			if( order[i].charCodeAt(0) > 57) { // 숫자가 아니면
				messageBox("정렬순서", "정렬순서는 숫자만 입력 가능합니다");
				return;
			}
		}
				
		// select된 회사 시퀀스 가져옴 
		$(".tg-0lax select option").each( (index, item) => {
			if( item.selected) {
				compSeq = item.value;
			}
		});
		
		// 입력한 직책 코드
		console.log( $(".englishField").val() );
		console.log( $("input[name='group']:checked").val() );
		console.log( $(".order").val() );
		console.log( $(".comment").val() );
		
		if( englishField == ''){
			englishField = ' ';
		}
		
		if( order == ''){
			order = 0;
		}
		
		if( comment == ''){
			comment = ' ';
		}
		
		// 각 필드의 값을 가져와 ajax 통신
		 $.ajax({
				url : contextPath + "/savePositionValue/" +
						compSeq + "/" +
						positionField + "/" + 
						koreaField + "/" + 
						englishField + "/" + 
						$("input[name='group']:checked").val() + "/" +
						order + "/" + 
						comment + "/" +
						position,
						
				type : "get",
				dataType : "json",
				data : "",
				success : function(response) {
					search(position);
		
				},
				error : function(xhr, status, e) {
					console.error(status + ":" + e);
				}

			}); 
	});
	
	// 직책 검색하는 input 속성을 변경
	$("input[name='position']").focus( event => {
		event.currentTarget.setAttribute('data-focus', true);
	})
	
	$("input[name='position']").blur( event => {
		event.currentTarget.setAttribute('data-focus', false);
	})
	
	// 삭제버튼
	$(".remove").click( () => {
		console.log('삭제');
		
		 $.ajax({
				url : contextPath + "/removePositionValue/" +
						$(".positionField").val() + "/" +
						position,
						
				type : "get",
				dataType : "json",
				data : "",
				success : function(response) {
					search(position);
		
				},
				error : function(xhr, status, e) {
					console.error(status + ":" + e);
				}

			}); 
		
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
						<input class="inputText" name="position" data-focus=false type="text">
						
						<span>사용여부</span>
						<select class='useYN'>
						  <option value="Y">사용</option>
						  <option value="N">사용안함</option>
						 
						</select>
						
						<input class="submit" data-check="false" type="button" value="검색">
						
					
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
					<input type="button" value="일괄등록">
					<input class="new" type="button" value="신규">
					<input type="button" class="save" value="저장">
					<input type="button"class="remove" value="삭제">
				</div>
				
				<div id="dialog-message" style="display= none;">
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