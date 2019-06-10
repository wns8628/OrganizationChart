
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
			
			let tr = $(".listDiv table tbody tr");
			
			tr.click( event => {
				console.log("tbody tr 클릭");
				
				tr.each( (index, item) => {
					if( item.style.backgroundColor != '' ){
						item.removeAttribute("style");
					}
				});
				
				$(event.currentTarget).css("background-color", "#f9f9f9");
				
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

let questionBox = function(title, message){
	
	let def = $.Deferred();
	
	$("#dialog-message").attr({
		title: title
	});
	$("#dialog-message p").text(message);
	$("#dialog-message").dialog({
		modal: true,
		buttons: {
			"예": function(){
				$(this).dialog("close");
				def.resolve("Yes");
			},
			"아니요": function(){
				$(this).dialog("close");
				def.resolve("No");
			}
		},
	});
	return def.promise();
};

let positionButtonClick = event => {
	console.log("position 버튼 클릭");
	
	let $dutyButton = $(".dutyButton");
	let $positionButton = $(".positionButton");
	
	$positionButton.css("background-color", "#ffffff");
	$dutyButton.css("z-index", -1);    // 직책버튼을 클릭 못하게하고
	$dutyButton.css("background-color", '#f8f8f8');
	$positionButton.css("z-index", 0); // 직급 버튼을 클릭할수있도록한다
	
	position = "POSITION";  // 직급 버튼을 눌렀으므로 position 세팅
	
	search(position);
};

let dutyButtonClick = event => {
	console.log("duty 버튼 클릭");
	
	let $dutyButton = $(".dutyButton");
	let $positionButton = $(".positionButton");
	
	$dutyButton.css('background-color', '#ffffff');
	$positionButton.css("background-color", '#f8f8f8');
	
	$dutyButton.css("z-index", 0);
	$positionButton.css("z-index", -1);
	
	position = "DUTY";	// 직책 버튼을 눌렀으므로 duty 세팅
	search(position);
};

let saveButtonClick = () => {
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
	
	questionBox("저장","저장하시겠습니까?").then( val => {
		if( val == "No"){
			return;
		} else{
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
		}
	})
	
};

let removeButtonClick = () => {
	console.log('삭제');
	
	if( $(".positionField").val() == '' || typeof $(".positionField:disabled").val() == "undefined"){
		messageBox('삭제', '삭제할 대상이 없습니다.');
		return;
	}
	
	questionBox("삭제", "삭제하시겠습니까?").then( val => {
		if( val == "No"){
			return;
		} else {
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
				}

			}); 
		}
	})


	
};