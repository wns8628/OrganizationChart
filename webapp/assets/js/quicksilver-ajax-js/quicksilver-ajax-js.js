var render = function(vo){
	   var htmls = "<li id='departments' class='btn-success' data-no='"+vo.no+"' g-no='"+vo.gNo+"' p-no='"+vo.parents+"' depth='"+vo.depth+"' style='padding-left:"+vo.depth*10+"px'>"+vo.name+"</li>";
	   $("ul[data-no='"+vo.companyNo+"']").append(htmls);
	}

var renderTableDepartmentName = function(departmentName){
	
	   $(".card-header").empty();
	   
	   let htmls = "<h6 class='m-0 font-weight-bold text-primary'>" + 
	   					departmentName + 
	   				"</h6>";
	   				
	   $(".card-header").append(htmls);
	}

var getList = function(){
	$.ajax({
		url:contextPath + "/getlist",
		type:"get",
		dataType:"json",
		data:"",
		success: function(response){
			console.log(response.data);
			$(response.data).each(function(index, vo){
				render(vo);
			});
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
		
	});
}

var makeTable = function(url) {
	
	$("#dataTable").dataTable().fnDestroy();
	
	 $('#dataTable').dataTable({
          pageLength: 5,
          bPaginate: true,
          bLengthChange: true,
          lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
          bAutoWidth: false,
          processing: true,
          ordering: true,
          serverSide: false,
          searching: true,
          scrollY: 250,
          scrollCollapse: false,
         
          ajax : {
              "url": contextPath + url,
              "type": "GET",
              "data": '',
          },
          columns : [
              {data: "no"},
              {data: "name"},
              {data: "age"},
              {data: "gender"},
              {data: "grade"},
              {data: "departments"},
              {data: "company"},
              {data: "masterGroup"},
              {data: "phone"}
          ]

      });	
};

// 매핑된 url을 전달
var search = function(kwd, selectSearch){
	
	$(".card-header").empty();
	renderTableDepartmentName("Search");
	makeTable("/testboot/search/" + kwd + "/" + selectSearch);
}

$(function(){
	getList();
	 $('#dataTable').dataTable();
	//자회사 목록
	$(document).on("click", "#company", function(event){
		
      var cno = $(this).attr("data-no");
      console.log(cno);
      $list = $("ul[data-no='"+cno+"'] li[depth='1']");
      if($list.css("display")==="none"){
         $list.show();
      }else{
         $("ul[data-no='"+cno+"'] li").hide();
      }
	});
	
	//부서 목록
	$(document).on("click", "#departments", function(event){
		
	      var no = $(this).attr("data-no");
	      var gno = $(this).attr("g-no");
	      var depth = ($(this).attr("depth")*1)+1;
	      $list = $("li[p-no='"+no+"']");
	      if($list.css("display")==="none"){
	         $list.show();
	      }else{
	         var f = function($li){
	            $li.hide();
	            for(var i=0; i<$li.length; i++){
	               if($li[i].getAttribute('data-no') != undefined){
	                   f($("li[p-no='"+$li[i].getAttribute('data-no')+"']"));
	                }
	            }
	         }
	         f($list);
	      }
	      
	      /*
	       * 부서 클릭시 테이블에 사원 출력
	       * 
	       */
	      
	      	console.log("부서 클릭");
			let departmentNo = $(this).attr('data-no');
			let departmentName = $(this).html();
			console.log('departmentNo : ' + departmentNo);
			console.log('departmentName : ' + departmentName);
			
			makeTable("/testboot/getDepartmentEmployeeInfo/" + departmentNo);
			renderTableDepartmentName(departmentName);
	});

/* 검색  */	
	 let check = true;
	 
	 let searchClick = function() { // 검색창에서 어떤키를 눌렀을때
			
		 	if( check == true){ // keydown시 꾹 누르면 이벤트가 계속발생하는걸 방지하기위해 제약
		 		
		 		check = false;
		 		let kwd = $("input[aria-label='kwd']").val();
				
				if( kwd == ""){
					alert("검색어를 입력하세요");
					return;
				}
				console.log(kwd);
				search(kwd, 1);
		 	}
			
		};
		
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
			//console.log("마우스 검색버튼 클릭");
			searchClick();
			check = true;
		}
	});  
/*  */	
	
	
	$(document).on("click", "#admin-login", function(event){	
		 $("#admin-dialog").dialog({
			 modal:true,
			 width:"500px",
			 open:function(){
				     $('#login-cancel').bind('click', function(){
					 $('#admin-dialog').dialog('close');
				 })
			 }
		 }).parent(".ui-dialog").removeClass("ui-widget ui-widget-content ui-corner-all ui-draggable ui-resizable")
		 .children(".wrapper").removeClass("ui-dialog-content ui-widget-content")
		 .parents(".ui-dialog")
		 .children(".ui-dialog-titlebar").remove();
	});
});