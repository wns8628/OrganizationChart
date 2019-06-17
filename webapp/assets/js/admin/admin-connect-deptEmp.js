let table;																					//테이블초기화위해 사용변수
let tableClick;																				//테이블초기화위해 사용변수
let loginId;
let empName;
let compSeq;
let compName;
let deptName;
let status; //신규, 수정 상태 값 저장 

let positionCode;																		    //콤보박스에 중복으로 나오는거 제거
let dutyCode;																				//콤보박스에 중복으로 나오는거 제거
let mainDeptYn;																			    //이건 수정시 데이터 변경확인위해 
let empSeq;


let empDetailRender = (form) =>{
	
	$.ajax({
		url: contextPath + "/adminConnectDeptEmp/empDetailRender",
		type:"post",
		dataType:"json",
		data: form,
        async: false, 
		success: function(response){						
			console.log(response.data);
			console.log(response.data.positionCode)
			
//			bizSeq = response.data.bizSeq;													//업데이트문위해
			$(".detail-dept-text").attr("data-lang-biz",response.data.bizSeq);
			
			positionCode = response.data.positionCode;
			dutyCode = response.data.dutyCode;
			mainDeptYn = response.data.mainDeptYn;
			
			$('#detail-positionCode-select').empty();
			$('#detail-dutyCode-select').empty();
			
			//직급직책
			$('#detail-positionCode-select').append("<option value="+ positionCode +">" + response.data.positionName);
			$('#detail-dutyCode-select').append("<option value="+ dutyCode +">" + response.data.dutyName);
			
			//회사
			$('.tg .detail-comp').html(response.data.compName);
			$('.tg .detail-comp').attr("data-lang",compSeq);
			
			//부서
			$('.tg .detail-dept .detail-dept-text').val(response.data.deptName);
			$('.tg .detail-dept .detail-dept-text').attr("data-lang",response.data.deptSeq);
			
			//사원
			$('.tg .detail-empSeq').html(response.data.empSeq);
			
			//구분(주부서여부)
			$('.tg #detail-mainDeptYn-select').val(response.data.mainDeptYn).prop("selected",true);
			
			//부서전화
			$('.tg .detail-telNum').html(response.data.telNum);
			//부서팩스
			$('.tg .detail-faxNum').html(response.data.faxNum);
			//재직여부
			$('.tg #detail-workStatus-select').val(response.data.workStatus).prop("selected",true);
			//근태여부
			$('.tg #detail-checkWorkYn-select').val(response.data.checkWorkYn).prop("selected",true);
			
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
	
	empDetailPositionDutyRender(form);
}

let empDetailPositionDutyRender  = (form) => {
	$.ajax({
		url: contextPath + "/adminConnectDeptEmp/empDetailPositionDutyRender",
		type:"post",
		dataType:"json",
		data: form,
		success: function(response){	
					
			//그회사에맞는 직급직책뿌려주기
			for(let i=0; i<response.data.position.length; i++){
				console.log(positionCode);
				console.log("비교 ↓");
				console.log(response.data.position[i].positionCode);
				console.log("----");
				
				if((response.data.position[i].positionCode) != positionCode){
					$('#detail-positionCode-select')
					.append("<option value="+ response.data.position[i].positionCode +">" + response.data.position[i].positionName);					
				}
				
			}
			for(let i=0; i<response.data.duty.length; i++){
				if(response.data.duty[i].dutyCode != dutyCode){
					$('#detail-dutyCode-select')
					.append("<option value="+ response.data.duty[i].dutyCode +">" + response.data.duty[i].dutyName);					
				}
			}
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}


let searchEmpMakeTable = function(form){
	
	let ajax = {																			//공통부분
		'type': 'POST',
        'url': contextPath + "/adminConnectDeptEmp/searchEmpAjax", 
        'data':form
	}

	if(form.loginId){
		 tableClick.destroy();																//테이블 초기화	 
		 tableClick = $('.loginIdAndEmpNameClick-Table').DataTable({						//데이터테이블
			 pageLength: 10,
			 pagingType:"numbers",
			 info:false,
			 filter:false, 
			 bPaginate: true,
			 bLengthChange: true,
			 lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
			 bAutoWidth: false,
			 processing: true,
			 ordering: true,
			 serverSide: false,
			 searching: true,
//			 scrollY: "200px",
//			 scrollCollapse: true,
			
		     ajax: ajax,
		     columns: [{"data": "compName"},
	        		   {"data": "bizName"},
	        		   {"data": "deptSeq"},
	        		   {"data": "deptName"},
	        	   	   {"data": "mainDeptYn", render:getLabel},
	        	 	   {"data": "positionCode"}],
	        	 	   
	        	 	   
	 	     columnDefs: [
	 	    	 		{ targets: "deptSeq", className: "hide"}							//부서번호숨기기
 	    	 			],

		});
		 
		 //Y , N 결과를 주부서,서브부서로 표현위해서 쓴다.
		 function getLabel(data, type, full, meta) {
			 var dataResult = data;
			 if (dataResult === 'Y') {
				 return '주부서';
			 } else {
				 return '서브부서';
			 }
		 }   
		 
		 
		//회사  사번 직급 표시되도록 ㄱㄱ
		$.ajax({
			url: contextPath + "/adminConnectDeptEmp/getEmpSeq",
			type:"post",
			dataType:"json",
			data: form,
			success: function(response){	
				console.log(response.data);
				empSeq = response.data;
			},
			error: function(xhr, status, e){
				console.error(status+":"+e);
			}
		});
		//
		
		//초기화 작업
		deptName = null;
		status = null;
		positionCode = null;																		    //콤보박스에 중복으로 나오는거 제거
		dutyCode = null;																				//콤보박스에 중복으로 나오는거 제거
		mainDeptYn = null;																					//업데이트문위해
		$(".detail-dept-text").attr("data-lang-biz",'null');
		
		$('#detail-positionCode-select').empty();
		$('#detail-dutyCode-select').empty();
		//직급직책
		$('#detail-positionCode-select').append("<option value=null>비고");
		$('#detail-dutyCode-select').append("<option value=null>비고");
		//회사
		$('.tg .detail-comp').html('');
		$('.tg .detail-comp').attr("data-lang",'null');
		//부서
		$('.tg .detail-dept .detail-dept-text').val('');
		$('.tg .detail-dept .detail-dept-text').attr("data-lang",'null');
		//사원
		$('.tg .detail-empSeq').html('');
		//구분(주부서여부)
		$('.tg #detail-mainDeptYn-select').val('Y').prop("selected",true);
		//부서전화
		$('.tg .detail-telNum').html('');
		//부서팩스
		$('.tg .detail-faxNum').html('');
		//재직여부
//			$('.tg #detail-workStatus-select').val(response.data.workStatus).prop("selected",true);
		//근태여부
//			$('.tg #detail-checkWorkYn-select').val(response.data.checkWorkYn).prop("selected",true);
		$(".connect-deptEmp-new").css("display","none");
		$(".dept-search").css("display","none");
		//
		
	} else { 	
		//초기화작업 --------------------------------------------------------------------------------------------
		tableClick.destroy();	
		tableClick = $('.loginIdAndEmpNameClick-Table').DataTable({pagingType:"numbers", info:false,filter:false});
		tableClick.clear().draw();
		
		loginId = null;
		empName = null;
		deptName = null;
		status = null;
		positionCode = null;																		    //콤보박스에 중복으로 나오는거 제거
		dutyCode = null;																				//콤보박스에 중복으로 나오는거 제거
		mainDeptYn = null;																			    //이건 수정시 데이터 변경확인위해 
//		bizSeq = null;																					//업데이트문위해
		$(".detail-dept-text").attr("data-lang-biz",'null');
		empSeq = null;
		
		$('#detail-positionCode-select').empty();
		$('#detail-dutyCode-select').empty();
		//직급직책
		$('#detail-positionCode-select').append("<option value=null>비고");
		$('#detail-dutyCode-select').append("<option value=null>비고");
		//회사
		$('.tg .detail-comp').html('');
		$('.tg .detail-comp').attr("data-lang",'null');
		//부서
		$('.tg .detail-dept .detail-dept-text').val('');
		$('.tg .detail-dept .detail-dept-text').attr("data-lang",'null');
		//사원
		$('.tg .detail-empSeq').html('');
		//구분(주부서여부)
		$('.tg #detail-mainDeptYn-select').val('Y').prop("selected",true);
		//부서전화
		$('.tg .detail-telNum').html('');
		//부서팩스
		$('.tg .detail-faxNum').html('');
		//재직여부
//		$('.tg #detail-workStatus-select').val(response.data.workStatus).prop("selected",true);
		//근태여부
//		$('.tg #detail-checkWorkYn-select').val(response.data.checkWorkYn).prop("selected",true);
		$(".connect-deptEmp-new").css("display","none");
		$(".dept-search").css("display","none");
		//---------------------------------------------------------------------------------------------------
		
		 //검색 시
		 table.destroy();																   //테이블 초기화
		 table = $('.loginIdAndEmpName-Table').DataTable({								   //데이터테이블
			 pageLength: 10,
			 pagingType:"numbers",
			 info:false,
			 bPaginate: true,
			 bLengthChange: true,
			 lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
			 bAutoWidth: false,
			 processing: true,
			 ordering: true,
			 serverSide: false,
			 searching: true,
			 scrollY: false,
//			 scrollCollapse: true,
			
		     ajax: ajax,
		     columns: [{"data": "loginId"},
		        	   {"data": "empName"}],
		});
		$(".dataTables_scrollBody").css('height', '606px');			 
	}
	
}

let searchEmp = function() {													        //검색
        compSeq = $("#compSelect option:selected").val();
        compName = $("#compSelect option:selected").html();
	let workingStatus = $(".workingStatus option:selected").val();
	let kwd = $(".search-empID").val();
	
	var form = {																     	//post 보낼 json데이터	
			compSeq : compSeq,
			workingStatus : workingStatus,
			kwd : kwd
	}
	
	searchEmpMakeTable(form, 'searchClick');                          					//검색결과렌더 AJAX
}

//신규 저장 form 데이터 체크만들기
let formMake = () => {
	
	 //일단 디비상 데이터 일단없으니 null처리해줌
	 var telNum = $(".detail-telNum").html;
	 var faxNum = $(".detail-faxNum").html;
	 if(telNum.length == 1 ){
		 telNum = null;
	 }; 
	 if(faxNum.length == 1 ){
		 faxNum = null;
	 }; 
	 
    //로직 
	 let form = {
		 compSeq    	: $(".detail-comp").attr("data-lang"),
		 deptSeq    	: $(".detail-dept-text").attr("data-lang"),
		 bizSeq 		: $(".detail-dept-text").attr("data-lang-biz"),
		 empSeq     	: $(".detail-empSeq").html(),
		 mainDeptYn 	: $("#detail-mainDeptYn-select option:selected").val(),
		 positionCode   : $("#detail-positionCode-select option:selected").val(),
		 dutyCode       : $("#detail-dutyCode-select option:selected").val(),
		 telNum    	    : telNum,
		 faxNum    		: faxNum
//		 workStatus     : $("#detail-workStatus-select option:selected").val(),
//		 checkWorkYn    : $("#detail-checkWorkYn-select option:selected").val()
	 }
	 
	 return form;
}
//
//저장버튼 함수--
let save_confirm = () => {
	
	questionBox("알림","부서를 새로 추가하시겠습니까?").then( val => {
		if( val == "No"){
			return false;
		}else{
			//추가
	    	 plusDept(formMake());

	    	 //정리 
	    	 messageBox("추가", "추가되었습니다.");
	         status="update";
	 		 $(".connect-deptEmp-new").css("display","none");	
		}
	});
	
}
//업데이트 
let save_update = () => {
	
	questionBox("알림","수정하시겠습니까?").then( val => {
		if( val == "No"){
			return false;
		}else{
			 //업데이트
			 plusUpdate(formMake());
			 
			 //정리 
	    	 messageBox("알림", "수정되었습니다.");
		}
	});

}
//삭제버튼 함수 
let delete_confirm = () => {
	
	questionBox("알림","정말로 삭제하시겠습니까?").then( val => {
		if( val == "No"){
			return false;
		}else{
			 //추가
	    	 deleteDept(formMake());

	    	 //정리 
	    	 messageBox("알림", "삭제되었습니다.");
				
	         status=null;
		}
	});
	
}
//삭제 ajax
let deleteDept = (form) =>{
	$.ajax({
		url: contextPath + "/adminConnectDeptEmp/deleteDept",
		type:"post",
		dataType:"json",
		data: form,
		success: function(response){	
			console.log(response.data)
			
			//실시간 테이블다시렌더
	    	var form = {																	
	    			loginId : loginId,
	    			empName : empName,
	    			empSeq : empSeq,
	    			compSeq : compSeq
	    	}
			searchEmpMakeTable(form,"empClick");                                  		   
			
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}
//겸직추가 ajax
let plusDept = (form) => {
	$.ajax({
		url: contextPath + "/adminConnectDeptEmp/plusDept",
		type:"post",
		dataType:"json",
		data: form,
		success: function(response){	
			console.log(response.data)
			
			//실시간 테이블다시렌더
	    	var form = {																	
	    			loginId : loginId,
	    			empName : empName,
	    			empSeq : empSeq,
	    			compSeq : compSeq
	    	}
			searchEmpMakeTable(form,"empClick");                                  		   
			
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}
//

//업데이트
let plusUpdate = (form) => {
	$.ajax({
		url: contextPath + "/adminConnectDeptEmp/plusUpdate",
		type:"post",
		dataType:"json",
		data: form,
		success: function(response){	
			console.log(response.data)
			
			//변경됐으니 다시 세팅
			positionCode = $("#detail-mainDeptYn-select option:selected").val();																		   
			dutyCode =  $("#detail-positionCode-select option:selected").val();																		
			mainDeptYn = $("#detail-dutyCode-select option:selected").val();		
			
			//실시간 테이블다시렌더
	    	var form = {																	
	    			loginId : loginId,
	    			empName : empName,
	    			compSeq : compSeq
	    	}
			searchEmpMakeTable(form,"empClick");                                  		   
	    	var form = {																		
	    			loginId : loginId,
	    			empName : empName,
	    			compName : compName,
	    			deptName : deptName,
	    			compSeq: compSeq
	    	}
	    	empDetailRender(form);
			
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}

let windowPopup;
$(function(){	
	
	//새로고침시 팝업창지우기
	window.onbeforeunload = function () { 
        if( document.readyState == "complete"){ // self.screenTop > 9000 브라우저 닫힘
            try {
            	windowPopup.close();
            }
            catch (e) {
                console.log(e);
            }
        }
    };
	
	
	table      = $('.loginIdAndEmpName-Table').DataTable({pagingType:"numbers", info:false});						 	    //빈테이블 출력
	tableClick = $('.loginIdAndEmpNameClick-Table').DataTable({pagingType:"numbers",  info:false, filter:false});					    //빈테이블 출력
		
	$(document).on("click", ".search-empID-button", function() {					    // 마우스로 검색버튼을 눌렀을때
		searchEmp();
	}); 
	$(document).on("keydown", ".search-empID", function(event) {					    // 엔터
		if( event.keyCode == 13){ 
			searchEmp();
		}
	});
		
	$(document).on("click", ".loginIdAndEmpName-Table > tbody tr", function(key) {	    // 마우스로 검색결과사원 눌렀을때		
		
		//데이터 수집
        loginId = this.children[0].innerHTML;
        empName = this.children[1].innerHTML;
        //클릭된거 css 고정
        $(".loginIdAndEmpName-Table > tbody tr").css("background-color","");
        $(this).css("background-color","#e6f4fe");
        
        console.log(loginId);
        console.log(empName);

    	var form = {																	//post 보낼 json데이터	
    			loginId : loginId,
    			empName : empName,
    			compSeq : compSeq
    	}
        
    	searchEmpMakeTable(form);                                  		   				 //검색결과렌더 AJAX
    	
	}); 
	
	
	$(document).on("click", ".loginIdAndEmpNameClick-Table > tbody tr", function(key) {	    //부서정보목록클릭
		   status = "update";
		
	       deptName = this.children[3].innerHTML;
	       let deptSeq = this.children[2].innerHTML;
	       
	        //클릭된거 css 고정
	        $(".loginIdAndEmpNameClick-Table > tbody tr").css("background-color","");
	        $(this).css("background-color","#e6f4fe");
	        $(".connect-deptEmp-new").css("display","none");
	        $(".dept-search").css("display","none");
		
	    	var form = {																	//post 보낼 json데이터	
	    			loginId : loginId,
	    			empName : empName,
	    			compName : compName,
	    			deptName : deptName,
	    			deptSeq : deptSeq,
	    			compSeq: compSeq
	    	}
	    	
	    	empDetailRender(form);
	}); 
	
	$(document).on("click", ".dept-search", function(key) {	    						    //부서검색클릭

		$(".modal").css("display","inline");
		
		//듀얼모니터 까지 처리
		var popWidth  = '440'; // 파업사이즈 너비
		var popHeight = '485'; // 팝업사이즈 높이
		var winWidth  = document.body.clientWidth;  // 현재창의 너비
		var winHeight = document.body.clientHeight; // 현재창의 높이
		var winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
		var winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표
		w = winX + (winWidth - popWidth) / 2;
		h = winY + (winHeight - popHeight) / 2;
		
		windowPopup = window.open( contextPath+'/adminConnectDeptEmp/deptSearch?compSeq=' +
				compSeq +"&compName="+compName, '부서검색', 'width=440, height=485, top='+ h +' , left='+w);
		
		
	}); 
	
	
	
	//신규버튼 
	$(document).on("click", ".connect-deptEmp-create", function(key) {
		
		if(!empSeq){
			messageBox("알림", "선택된 사원이 없습니다.");
			return false;
		}
		if($(".connect-deptEmp-new").css("display") == "inline"){
			messageBox("알림", "이미 신규모드 입니다.");
			return false;	
		}
		
		status = "new";
		messageBox("알림", "새로운 부서에 직원을 추가합니다.");
		let form = {																	
    			compSeq: compSeq
    	}
		
		//그회사의 직급직책뿌려주기위해
		$('#detail-positionCode-select').empty();
		$('#detail-dutyCode-select').empty();
		empDetailPositionDutyRender(form);
		$('.tg .detail-comp').html(compName); 			  //회사
		$('.tg .detail-comp').attr("data-lang",compSeq);  //회사
		$('.tg .detail-empSeq').html(empSeq); //사원
		
		//신규초기화할것듯
		$(".connect-deptEmp-new").css("display","inline");
		$(".dept-search").css("display","inline");
		$(".detail-dept-text").val("").attr("placeholder","부서가 지정되지 않았습니다.");				
		$(".detail-dept-text").attr("data-lang","null");
		$(".detail-dept-text").attr("data-lang-biz","null");
		$(".loginIdAndEmpNameClick-Table > tbody tr").css("background-color","");
		 
	});
	//저장버튼
	$(document).on("click", ".connect-deptEmp-save", function(key) {
		console.log(status);
		if(status == null){ 			
			messageBox("알림", "저장할 데이터가 없습니다.");
			return;
		}
		
		if(status == "new"){ 																	//신규상태면
			
			console.log($(".detail-dept-text").attr("data-lang"));
			
			if(!$(".detail-dept-text").attr("data-lang") || $(".detail-dept-text").attr("data-lang") == 'null' ){
				messageBox("알림", "부서를 지정해주세요");
			}else{
				save_confirm();   																//새로 저장 				
			}
			return;
		} else if(status == "update"){															//수정이면 
			
			if(positionCode == $("#detail-positionCode-select option:selected").val()  			//데이터 변경여부 
					&&  dutyCode ==  $("#detail-dutyCode-select option:selected").val() 
					  && mainDeptYn == $("#detail-mainDeptYn-select option:selected").val() ){
				messageBox("알림", "수정된 데이터가 없습니다.");											//변경할게없다.
			}else{
				save_update();																	//업데이트 
			}
		}
	});
	//삭제버튼 
	$(document).on("click", ".connect-deptEmp-delete", function(key) {
		
		if(status == null || status== 'new'){ 																	
			messageBox("알림", "삭제할 부서를 지정하세요.");	
			return false;
		}
		if($("#DataTables_Table_1_wrapper table tbody tr").length == 1 ){							
			messageBox("알림", "사원은 하나이상의 부서를 가져야합니다.");	
			return false;
		}
		
		//삭제로직
		delete_confirm();
		
	});
})











