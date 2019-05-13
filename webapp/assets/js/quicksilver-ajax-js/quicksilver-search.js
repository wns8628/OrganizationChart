let check = true;	
let searchClick = function() { // 검색창에서 어떤키를 눌렀을때
	if( check == true){ // keydown시 꾹 누르면 이벤트가 계속발생하는걸 방지하기위해 제약
		check = false;
		let kwd = $("input[aria-label='kwd']").val();
		if( kwd == ""){
			alert("검색어를 입력하세요");
			return;
		}
		let option = $("#search-opt option:selected").val();
		search(option, kwd);
		searchScroll();
	}
};

//매핑된 url을 전달
let search = function(selectSearch, kwd){
	$('.pagePre').show();
	$('.pageNext').show();
	pageNo = $(".pageNext").attr("data-no");
	$(".pageNext").attr("data-kwd",kwd);
	$(".pageNext").attr("data-selectSearch",selectSearch);
	
	console.log(selectSearch)
	$(".card-header").empty();
//	renderTableDepartmentName("Search");
	makeTable("/boot/search/" + selectSearch + "/" + kwd +"/?pageNo="+pageNo );
}

$(function(){  
	 // 검색창 focus
	 $(document).on("focus", ".form-control", function (event) { // 검색창 눌렀을때 인식		 
		console.log("focus");		
		$('.form-control').keydown( function(event) {			
			console.log(event.keyCode);	 	
			if( event.keyCode == 13){ // 검색창에서 엔터 눌렀을때
				//console.log("엔터");
				searchClick();
			}
		});
		$('.form-control').keyup( function(event) { // 키를 뗄때 다시 누를수있도록 설정
			check = true;
		});
	});
	 
	 
	$(document).on("click", "#search-button", function(key) { // 마우스로 검색버튼을 눌렀을때
		if( key.keyCode == undefined){
			searchClick();
			check = true;
		}
	});  
});