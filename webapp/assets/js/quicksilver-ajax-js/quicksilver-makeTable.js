//테이블에부서이름뿌리기-적용x
var renderTableDepartmentName = function(departmentName,departmentNo){
	   $(".dept").empty();
	   let htmls = "<h6 class='m-0 font-weight-bold text-primary'>" + 
	   					departmentName + 
	   				"</h6>";
	   
	   $(".dept").append(htmls);
  
}
//테이블에팀장이름뿌리기-적용x
var renderLeader = function(leader){		
	   let htmlLeader = "<div class='m-0 font-weight-bold text-danger'>┖ 팀장 : "+ 
	   					leader.empName + "(" + leader.empSeq + ")"
					"</div>";			
	   $(".dept").append(htmlLeader);
}
//테이블렌더링-------------------------------------------------------------------------------
let tableRender = function(vo){
	let htmls = 			"	<tr class=\"row\">\r\n" + 
	"								<td>"+vo.empSeq+"</td>\r\n"+
	"								<td>"+vo.deptSeq+"</td>\r\n"+
	"								<td class='lang dept' data-lang='"+vo.deptSeq+"'></td>\r\n" + 
	"								<td class='lang dp' data-val='"+vo.compSeq+"' data-lang='"+vo.positionCode+"'></td>\r\n" + 
	"								<td class='lang dp' data-val='"+vo.compSeq+"' data-lang='"+vo.dutyCode+"'></td>\r\n" + 
//	"								<td>"+vo.empName+"("+ vo.loginId+")</td>\r\n" + 
	"								<td><span class='lang emp' data-lang='"+vo.empSeq+"'>"+vo.empName+"</span><span>("+ vo.loginId+")</span></td>\r\n" + 
	"								<td>"+vo.homeTelNum+"</td>\r\n" + 
	"								<td>"+vo.mobileTelNum+"</td>\r\n" + 
	"							</tr>"
	$(".member > tbody").append(htmls);
}

//테이블그리기
var paging; 
var makeTable = function(url) {
	$(".member > tbody").empty();
	$.ajax({
		url: contextPath + url,
	      type:"get",
	      dataType:"json",
	      data:"",
	      async: false,
	      success: function(response){
	    	 $.lang.kr.emp = {};
	    	 $.lang.en.emp = {};
	         $(response.data.list).each(function(index, vo){
	        	 tableRender(vo);
	        	 $.lang.kr.emp[vo.empSeq] = vo.empName;
	        	 $.lang.en.emp[vo.empSeq] = vo.empNameEn;
	         });
	         $("#dataTable .lang").each(function(){
	        	 if($(this).attr("class") == "lang dept"){
	        		 var name = $.lang[mainLangCode]["dept"][$(this).data("lang")];
	        	 }
	        		 
	        	 if($(this).attr("class") == "lang dp"){
	        		 var seq = $(this).data("lang");
	        		 var name = $.lang[mainLangCode]["dp"][seq];
	        	 }
	        	 
	        	 if($(this).attr("class") == "lang emp"){
	        		 var seq = $(this).data("lang");
	        		 var name = $.lang[mainLangCode]["emp"][seq];
	        	 }
	        	 
	        	 
	        	 $(this).text(name);
	         });
	         paging = response.data.page; 
	         pageRender(paging);
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
	console.log($.lang);
	//데이터테이블 버림
};
//팀장가져오기  - 적용x
var getLeader = function(url){
	$.ajax({
		url: contextPath + url + "/getLeader",
		type:"get",
		dataType:"json",
		data:"",
		success: function(response){						
			renderLeader(response.data)
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}
/*
 * 테이블 컬럼 정렬
 */
var tableColumnSort = () => {
	
	Array.from(document.getElementsByTagName("a")).forEach( tag => {
		tag.addEventListener("click", () => {
			
			let tagParent = tag.parentNode;
			
			tagParent.classList.toggle("sort");
			
			let searchButton = document.getElementsByClassName('search sch-submit lang')[0];
			let option = $("#search-opt option:selected").val();
			let searchInput = document.getElementsByClassName('input-text')[0];
			
			// 검색으로 테이블이 그려질때
			if( searchInput.value != '' && searchButton.getAttribute('data-check') == 'true'){ // 검색으로 테이블이 그려짐
				
				if( tagParent.classList.contains('sort')){
					console.log( tagParent.getAttribute('data-column') + ' asc 정렬');
					search(option, searchInput.value, "asc", tagParent.getAttribute('data-column'));
				} else {
					console.log( tagParent.getAttribute('data-column') + ' desc 정렬');
					search(option, searchInput.value, "desc", tagParent.getAttribute('data-column'));
				}
			} else {
				
				// 부서를 클릭해서 테이블이 그려질때
				Array.from(document.getElementsByClassName('li-div')).forEach( li => {
					
					if( li.getAttribute('style') != 'background-color: transparent;'){ // 부서 클릭하여 테이블 그림		   
						
						if( tagParent.classList.contains('sort')){ // 정렬 asc
							console.log( tagParent.getAttribute('data-column') + ' asc 정렬');
							makeTable("/getEmpInfo/" + li.parentElement.parentElement.getAttribute('data-no') + "/d?pageNo=1&sorting=asc&column=" + tagParent.getAttribute('data-column'));
							
						} else { // 정렬 desc
							console.log( tagParent.getAttribute('data-column') + ' desc 정렬');
							makeTable("/getEmpInfo/" + li.parentElement.parentElement.getAttribute('data-no') + "/d?pageNo=1&sorting=desc&column=" + tagParent.getAttribute('data-column'));					   }
					}
				});
			}
			
		})
	});
	
}

//--------------------------------------------------------------------------

//페이징관련-------------------------------------------------------------------------
//페이지렌더링
let pageRender = function(paging){
	console.log(paging);
	
	$(".pagination").empty();																				 //페이징에 필요한 객체내부를 비워줌.
	$(".pagination-info").empty();
     //paging.pageNo != 1 
	if(paging.block != 0 && paging.totalBlock != 1){   													 	 //페이지가 1페이지 가아니면
        	$(".pagination").append("<li class=\"goFirstPage page-view\"><a>처음</a></li>");       			 //첫페이지로가는버튼 활성화
        }else{
        	$(".pagination").append("<li class=\"disabled page-view\"><a>처음</a></li>");       				 //첫페이지로가는버튼 비활성화
        }
	
    if(paging.block != 0){          																		 //첫번째 블럭이 아니면
        	$(".pagination").append("<li class=\"goBackPage page-view\"><a>이전</a></li>");      				 //뒤로가기버튼 활성화
    }else{
        	$(".pagination").append("<li class=\"disabled page-view\"><a>이전</a></li>");       				 //뒤로가기버튼 비활성화
    }

    //  if((paging.block+1) >= paging.totalBlock){															 //맨끝페이지에서 1페이지...보이게 근데없는게더나은듯..
    //	$(".pagination").append("<li class=\"goLastPage page-view\"><a>1</a></li>");
    //	$(".pagination").append("<li class=\"page-view\"><a>...</a></li>"); 
    //}
    
    for(var i = paging.startPage ; i <= paging.endPage ; i++){        										 //시작페이지부터 종료페이지까지 반복문
    	if(paging.pageNo == i){                            													 //현재페이지가 반복중인 페이지와 같다면
            $(".pagination").append("<li class=\"active page-view\"><a>"+i+"</a></li>");    				 //버튼 비활성화
    	}else{
    		$(".pagination").append("<li class=\"goPage page-view\" data-page=\""+i+"\"><a>"+i+"</a></li>"); //버튼 활성화
    	}
    }
    
    if((paging.block+1) < paging.totalBlock){ 
		$(".pagination").append("<li class=\"page-view\"><a>...</a></li>"); 
		$(".pagination").append("<li class=\"goLastPage page-view\"><a>"+paging.totalPage+"</a></li>");
    }
    
    if(paging.block+1 < paging.totalBlock){           														 //전체페이지블럭수가 현재블럭수보다 작을때
    	$(".pagination").append("<li class=\"goNextPage page-view\"><a>다음</a></li>");        				 //다음페이지버튼 활성화
    }else{
    	$(".pagination").append("<li class=\"disabled page-view\"><a>다음</a></li>");     					 //다음페이지버튼 비활성화
    }

    if((paging.block+1) < paging.totalBlock && paging.totalBlock != 1){             						 //현재페이지가 전체페이지보다 작을때
		$(".pagination").append("<li class=\"goLastPage page-view\"><a>맨끝</a></li>");    					 //마지막페이지로 가기 버튼 활성화
	}else{
		$(".pagination").append("<li class=\"disabled page-view\"><a>맨끝</a></li>");        					 //마지막페이지로 가기 버튼 비활성화
	}
    
    $(".pagination-info").append("결과 : 총 " + paging.totalboardcount + "명 ");
    if(paging.totalBlock != 1){  
    	$(".page-point").css("display","inline");															 //페이지가많으면 페이지검색가능하게함 
    }else{
    	$(".page-point").css("display","none");																 
    }
    if(paging.totalboardcount < 5){
    	$(".table-body").css("min-height", "0");															 //검색결과가 5개미만이면 결과와 페이지네이션이 테이블 바로밑에 붙어있도록한다.
    }else{
    	$(".table-body").css("min-height", "240px");														 //아니면테이블이동시 그 자리고정(UX개선)
    }
}

//page-point에 오직 숫자값만 입력받을수있도록한다.
let onlyNumber = function(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
let removeChar = function(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
//-----------------------------------

//검색과 부서클릭 구분 Flag
let pageFlageMakeTable = function(pageNo){
    if(pageFlag == 1){
    	makeTable("/boot/pagination?pageNo="+pageNo);		    	
    }else{
    	var seq = $("tbody > tr.row > td").get(1).innerHTML;		    	
    	makeTable("/getEmpInfo/" + seq + "/d?pageNo="+pageNo);	
    }
}

$(function(){
	  //페이지클릭 분기	
	  $(document).on("click", ".goFirstPage", function(event){
		    var pageNo = 1;
		    pageFlageMakeTable(pageNo);
	   });
	   $(document).on("click", ".goBackPage", function(event){
		    var pageNo = Number(paging.startPage) - 1;
		    pageFlageMakeTable(pageNo);
	   });
	   $(document).on("click", ".goPage", function(event){
			var pageNo = Number($(this).attr("data-page"));
			pageFlageMakeTable(pageNo);
	   });
	   $(document).on("click", ".goNextPage", function(event){	   
			var pageNo = Number(paging.endPage) + 1;
			pageFlageMakeTable(pageNo);
	   });
	   $(document).on("click", ".goLastPage", function(event){	
		   	var pageNo = paging.totalPage;
		   	pageFlageMakeTable(pageNo);
	   });
	   
	   //페이지검색
	   $(document).on("focus", ".page-point", function (event) {
			$('.page-point').keydown( function(event) {			
				var keyID = (event.which) ? event.which : event.keyCode;
				 // page-point에서 숫자를 눌렀을때
				if( ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )){ 
					
					var pageNo = $(".page-point").val();
					console.log($(".page-point").val());
					pageFlageMakeTable(pageNo);
				}
			});
			$('.page-point').keyup( function(event) {			
				var keyID = (event.which) ? event.which : event.keyCode;
				if( ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )){ 
					// page-point에서 숫자를 눌렀을때
					var pageNo = $(".page-point").val();
					console.log($(".page-point").val());
					pageFlageMakeTable(pageNo);
				}
			});
	   });
	   
	   /*
	    * 테이블 컬럼 정렬
	    */
	   tableColumnSort();
});