var render = function(vo){
	   var htmls = "<li id='departments' class='btn-success' data-no='"+vo.no+"' g-no='"+vo.gNo+"' p-no='"+vo.parents+"' depth='"+vo.depth+"' style='padding-left:"+vo.depth*10+"px'>"+vo.name+"</li>";
	   $("ul[data-no='"+vo.companyNo+"']").append(htmls);
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

var search = function(kwd){
	$.ajax({
	
	});
}

$(function(){
	getList();
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
	});

/* 검색  */	
	$(document).on("click", "#search-button", function(event){
		var kwd = $("input[aria-label='kwd']").val();
		console.log(kwd);
		search(kwd);
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