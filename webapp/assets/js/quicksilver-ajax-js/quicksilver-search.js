let check = true;	
var pageFlag; 

//검색시 세션에 결과저장 ajax
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
//매핑된 url을 전달
let search = function(selectSearch, kwd, sorting, column){
	console.log(selectSearch);
	$(".card-header").empty();
	getSearchData("/boot/search/" + selectSearch + "/" + kwd +"/?sorting=" + sorting + "&column=" + column);
	makeTable("/boot/pagination?pageNo=1" );								 //quicksilver-makeTable.js에있다 테이블관련이라.
}

let searchClick = function() {												 // 검색창에서 어떤키를 눌렀을때
														 // keydown시 꾹 누르면 이벤트가 계속발생하는걸 방지하기위해 제약
		
	document.getElementsByClassName('search sch-submit lang')[0].setAttribute( // 테이블이 검색으로 나왔으므로 검색 check 변환
			   'data-check', true
	   );
		let kwd = $("input[aria-label='kwd']").val();
		if( kwd == ""){
			alert("검색어를 입력하세요");
			return;
		}
		let option = $("#search-opt option:selected").val();
		search(option, kwd);
		//searchScroll();
	
};


$(function(){  
	 // 검색창 focus
	 $(document).on("focus", ".input-text", function (event) { 				 // 검색창 눌렀을때 인식		 
		console.log("focus");		
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