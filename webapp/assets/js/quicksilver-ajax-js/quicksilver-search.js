//전역 사용변수들 검색관련 필요 
let check = true;	
let pageFlag; 
let selectSearch;
let kwd;
let sorting;
let column;
//하위부서 체크여부에따라 결과분기
let checkHierarchy;
//부서구분
let seq;
//검색시 세션에 결과저장 ajax - 2019-05-23 부로 안쓰는중 X
var getSearchData = function(url) {	
	pageFlag = 1;															//pageFlag=1 : 검색을 한것임 
	$('.page-point').val('');												//검색시 page-point 초기화 
	$.ajax({
	url: contextPath + url,
      type:"get",
      dataType:"json",
      data:"",
      async: false,
      success: function(response){
      },
      error: function(xhr, status, e){
         console.error(status+":"+e);
      }
	});
}

//자동완성 프론트
let searchAutocomplete = function(){
	$( "input[aria-label='kwd']" ).autocomplete({
        source : function( request, response ) {
        	let part = $("input[aria-label='kwd']").val();
             $.ajax({
                    type: 'post',
                    url: contextPath +"/redis/read?kwd="+part,
                    dataType: "json",
                    success: function(res) {
                    	console.log(res.data)
                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
                        response(
                            $.map(res.data, function(item) {
                                return {
                                    value: item.value,
                                    score: item.score
                                }
                            })
                        );
                    }
               });
            },
        //조회를 위한 최소글자수
        minLength: 1,
        select: function( event, ui ) {
            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
        }
    });
}
//자동완성 엔터
let searchAutoEnter = function(enter){
	let part = $("input[aria-label='kwd']").val();
	$.ajax({
		url: contextPath +"/redis/read?kwd="+part+"&enter=" + enter,
	      type:"get",
	      dataType:"json",
	      data:"",
	      success: function(response){
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
}

//매핑된 url을 전달
let search = function(selectSearch_p, kwd_p, sorting_p, column_p){	
	
	pageFlag = 1;															//pageFlag=1 : 검색을 한것임 
	$(".checks").css("visibility","hidden");								//검색시는 하위부서표시 필요없음
	$('.page-point').val('');
	$(".card-header").empty();
	
	//검색시 변수세팅	
	selectSearch = selectSearch_p;
	kwd 	     = kwd_p;
	sorting		 = sorting_p;
	column		 = column_p;
	
	//searchAutoEnter 엔터
	searchAutoEnter(true);

	//세션X
    //getSearchData("/boot/search/" + selectSearch + "/" + kwd +"/?sorting=" + sorting + "&column=" + column + "&langCode=" + mainLangCode + "&pageNo=1");
    //makeTable("/boot/pagination?pageNo=1" );								 
	makeTable("/boot/search/" + selectSearch + "/" + kwd +"/?sorting=" + sorting + "&column=" + column + "&langCode=" + mainLangCode + "&pageNo=1");	
}

let searchClick = function() {													// 검색창에서 어떤키를 눌렀을때
														 						// keydown시 꾹 누르면 이벤트가 계속발생하는걸 방지하기위해 제약
	document.getElementsByClassName('search sch-submit lang')[0].setAttribute(  // 테이블이 검색으로 나왔으므로 검색 check 변환
			   'data-check', true
	   );
		let kwd = $("input[aria-label='kwd']").val();
		if( kwd == ""){
			alert("검색어를 입력하세요");
			return;
		}
		let option = $("#search-opt option:selected").val();
		search(option, kwd);
};


$(function(){  
	 // 검색창 focus
	 $(document).on("focus", ".input-text", function (event) { 				 // 검색창 눌렀을때 인식		 
		console.log("focus");		
		searchAutocomplete();												 // 자동완성 
		$('.input-text').keydown( function(event) {			
			if( event.keyCode == 13){ 										 // 검색창에서 엔터 눌렀을때
				searchClick();
			}
		});
		$('.sch-submit').keyup( function(event) {							 // 키를 뗄때 다시 누를수있도록 설정
			check = true;
		});
	});
	$(document).on("click", "#search-button", function(key) {				 // 마우스로 검색버튼을 눌렀을때
		if( key.keyCode == undefined){
			searchClick();
			check = true;
		}
	});  
	
});