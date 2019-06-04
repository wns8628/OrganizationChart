let table;																					//테이블초기화위해 사용변수
let tableClick;																				//테이블초기화위해 사용변수
let loginId;
let empName;
let compSeq;

let empDetailRender = (form) =>{
	
	$.ajax({
		url: contextPath + "/adminConnectDeptEmp/empDetailRender",
		type:"get",
		dataType:"json",
		data: form,
		success: function(response){						
			console.log(response.data);
			$('.tg .detail-comp').html(response.data.compName);
			$('.tg .detail-dept').html(response.data.deptName);
			$('.tg .detail-empSeq').html(response.data.empSeq);
			$('.tg .detail-mainDeptYn').html(response.data.mainDeptYn);
			$('.tg .detail-positionCode').html(response.data.positionCode);
			$('.tg .detail-dutyCode').html(response.data.dutyCode);
			$('.tg .detail-telNum').html(response.data.telNum);
			$('.tg .detail-faxNum').html(response.data.faxNum);
			$('.tg .detail-workStatus').html(response.data.workStatus);
			$('.tg .detail-checkWorkYn').html(response.data.checkWorkYn);

		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
	
	$.ajax({
		url: contextPath + "/adminConnectDeptEmp/empDetailPositionDutyRender",
		type:"get",
		dataType:"json",
		data: form,
		success: function(response){	
			console.log(response.data);
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}

let searchEmpMakeTable = function(form){					    							//검색결과테이블렌더 AJAX
	
	let ajax = {																			//공통부분
		'type': 'POST',
        'url': contextPath + "/adminConnectDeptEmp/searchEmpAjax", 
        'data':form
	}
	let language = {																		//공통부분
			 "emptyTable": "데이터가 없어요.",
		        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
		        "info": "현재 _START_ - _END_ / _TOTAL_건",
		        "infoEmpty": "데이터 없음",
		        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
		        "search": "에서 검색: ",
		        "zeroRecords": "일치하는 데이터가 없어요.",
		        "loadingRecords": "로딩중...",
		        "processing":     "잠시만 기다려 주세요...",
		        "paginate": {
		            "next": "다음",
		            "previous": "이전"
		        }
	}

	if(form.loginId){
		 tableClick.destroy();																//테이블 초기화	 
		 tableClick = $('.loginIdAndEmpNameClick-Table').DataTable({						//데이터테이블
			 pageLength: 10,
			 bPaginate: true,
			 bLengthChange: true,
			 lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
			 bAutoWidth: false,
			 processing: true,
			 ordering: true,
			 serverSide: false,
			 searching: true,
			 scrollY: "200px",
			 scrollCollapse: true,
			
		     ajax: ajax,
		     columns: [{"data": "compName"},
	        		   {"data": "deptName"},
	        	   	   {"data": "mainDeptYn"},
	        	 	   {"data": "positionCode"}],
	        	 	   
		     "language": language
		});
		 
	} else { 																
		 //검색 시
		 table.destroy();																   //테이블 초기화
		 table = $('.loginIdAndEmpName-Table').DataTable({								   //데이터테이블
			 pageLength: 10,
			 bPaginate: true,
			 bLengthChange: true,
			 lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
			 bAutoWidth: false,
			 processing: true,
			 ordering: true,
			 serverSide: false,
			 searching: true,
			 scrollY: "200px",
			 scrollCollapse: true,
			
		     ajax: ajax,
		     columns: [{"data": "loginId"},
		        	   {"data": "empName"}],
		     "language": language
		});
	}
	
}

let searchEmp = function() {													        //검색
        compSeq = $("#compSelect option:selected").val();
	let workingStatus = $(".workingStatus option:selected").val();
	let kwd = $(".search-empID").val();
	
	var form = {																     	//post 보낼 json데이터	
			compSeq : compSeq,
			workingStatus : workingStatus,
			kwd : kwd
	}
	
	searchEmpMakeTable(form, 'searchClick');                          					//검색결과렌더 AJAX
}


$(function(){	
	
	table      = $('.loginIdAndEmpName-Table').DataTable();						 	    //빈테이블 출력
	tableClick = $('.loginIdAndEmpNameClick-Table').DataTable();					    //빈테이블 출력
	
	
	$(document).on("click", ".search-empID-button", function(key) {					    // 마우스로 검색버튼을 눌렀을때
		searchEmp();
	}); 
	
	$(document).on("click", ".loginIdAndEmpName-Table > tbody tr", function(key) {	    // 마우스로 검색결과사원 눌렀을때		
		
		//데이터 수집
        loginId = this.children[0].innerHTML;
        empName = this.children[1].innerHTML;
		
        console.log(loginId);
        console.log(empName);

    	var form = {																	//post 보낼 json데이터	
    			loginId : loginId,
    			empName : empName,
    	}
        
    	searchEmpMakeTable(form,"empClick");                                  		    //검색결과렌더 AJAX
	}); 
	
	
	$(document).on("click", ".loginIdAndEmpNameClick-Table > tbody tr", function(key) {	    //부서정보목록클릭
		
		   let compName = this.children[0].innerHTML;
	       let deptName = this.children[1].innerHTML;
	       
	       console.log(loginId);
	       console.log(empName);
	       console.log(compName);
	       console.log(deptName);
	       
	    	var form = {																	//post 보낼 json데이터	
	    			loginId : loginId,
	    			empName : empName,
	    			compName : compName,
	    			deptName : deptName,
	    			compSeq: compSeq
	    	}
	    	
	    	empDetailRender(form);
	}); 
})











