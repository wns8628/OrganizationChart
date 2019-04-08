var render = function(vo){
	var htmls = "<li id='departments' class='btn-success' class='dept' data-no='"+vo.no+"' g-no='"+vo.gNo+"' p-no='"+vo.parents+"' depth='"+vo.depth+"' style='padding-left:"+vo.depth*10+"px'>"+vo.name+"</li>" +
   			   "<ul data-no='"+vo.no+"'></ul>";

	if(vo.parents > 0){
		$("ul[data-no='"+vo.parents+"']").append(htmls);
	}else{
		$("ul[data-no='"+vo.companyNo+"']").append(htmls);
	}
}

var getList = function(parents){
	$.ajax({
		url: contextPath + "/getDept/" + parents,
		type:"get",
		dataType:"json",
		data:"",
		success: function(response){
			console.log(response);
			$(response.data).each(function(index, vo){
				render(vo)
			});
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}

$(function(){
	// 자회사 목록
	$(document).on("click", "#company", function(event){
		var no = $(this).attr("data-no") * -1;
		if($(this).next().children().length > 0){
			$(this).next().children().remove();
		}else{
			getList(no);
		}
	});

	// 부서 목록
	$(document).on("click", "#departments", function(event){
		var no = $(this).attr("data-no");
		if($(this).next().children().length > 0){
			$(this).next().children().remove();
		}else{
			getList(no);
		}
	});
});
