//부서뿌리기
//var render = function(vo){
//	var htmls = "<li class='departments dropdown-item' class='dept' data-no='"+vo.no+"' g-no='"+vo.gNo+"' p-no='"+vo.parents+"' depth='"+vo.depth+"' style='padding-left:"+vo.depth*10+"px'>"+vo.name+"</li>" +
//   			    "<ul data-no='"+vo.no+"'></ul>";
//
//	if(vo.parents > 0){
//		$("ul[data-no='"+vo.parents+"']").append(htmls);
//	}else{
//		$("ul[c-no='"+vo.companyNo+"']").append(htmls);
//	}
//}

var deptRender = function(vo){
   var htmls = "<li class='departments dropdown-item' class='dept' data-no='"+vo.deptSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parentDeptSeq+"' depth='"+vo.depth+"' style='padding-left:"+(vo.deptLevel+1)*10+"px'><span>"+vo.deptName+"<span></li><ul data-no='"+vo.deptSeq+"'></ul>";
   if(parseInt(vo.parentDeptSeq) < 10000000){
	   $("ul[data-no='"+vo.parentDeptSeq+"']").append(htmls);
   }else{
	   $("ul[b-no='"+vo.parentDeptSeq+"']").append(htmls);
   }
}

var bizRender = function(vo){
	var htmls = "<li class='biz dropdown-item' class='biz' data-no='"+vo.bizSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parents+"' style='padding-left:10px'><span>"+vo.bizName+"<span></li><ul b-no='"+vo.bizSeq+"'></ul>";
	$("ul[c-no='"+vo.compSeq+"']").append(htmls);
}

//테이블에부서이름뿌리기
var renderTableDepartmentName = function(departmentName,departmentNo){
	   $(".card-header").empty();
	   let htmls = "<h6 class='m-0 font-weight-bold text-primary'>" + 
	   					departmentName + 
	   				"</h6>";
	   
	   $(".card-header").append(htmls);
  
}
//테이블에팀장이름뿌리기
var renderLeader = function(leader){
		console.log(leader);
		console.log(leader.name);
		
	   let htmlLeader = "<div class='m-0 font-weight-bold text-danger'>┖ 팀장 : "+ 
	   					leader.name + "(" + leader.empNo + ")"
					"</div>";	
		
	   $(".card-header").append(htmlLeader);
}

//부서리스트가져오기
//var getList = function(parents){
//	$.ajax({
//		url: contextPath + "/getDept/" + parents,
//		type:"get",
//		dataType:"json",
//		data:"",
//		success: function(response){
//			console.log(response);
//			$(response.data).each(function(index, vo){
//				render(vo)
//			});
//		},
//		error: function(xhr, status, e){
//			console.error(status+":"+e);
//		}
//	});
//}

var getList = function(seq){
   $.ajax({
      url: contextPath + "/getDept/"+seq,
      type:"get",
      dataType:"json",
      data:"",
      success: function(response){
         $(response.data).each(function(index, vo){
            deptRender(vo)
         });
      },
      error: function(xhr, status, e){
         console.error(status+":"+e);
      }
      
   });
}

var getBizList = function(seq){
	$.ajax({
		url: contextPath + "/getBiz/"+seq,
	      type:"get",
	      dataType:"json",
	      data:"",
	      success: function(response){
	         $(response.data).each(function(index, vo){
	            bizRender(vo)
	         });
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
}

//부서클릭시 테이블그리기
var makeTable = function(url) {	
	$("#dataTable").dataTable().fnDestroy();
	
	$('#dataTable').dataTable({
          pageLength: 5,
          bPaginate: true,
          bLengthChange: true,
          lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
          bAutoWidth: false,
          processing: false,
          ordering: true,
          serverSide: false,
          searching: false,
          scrollY: 250,
          scrollCollapse: false,
         
          ajax : {
              "url": contextPath + url,
              "type": "GET",
              "data": '',
          },
          
          columns : [
              {data: "empNum"},
              {data: "empName"},
              {data: "bDay"},
              {data: "genderCode"},
              {data: "positionCode"},
              {data: "dutyCode"},              
              {data: "deptName"}
          ]
      });	
	
};
//팀장가져오기 
var getLeader = function(url){
	$.ajax({
		url: contextPath + url + "/getLeader",
		type:"get",
		dataType:"json",
		data:"",
		success: function(response){			
			console.log(response);
			console.log("아니오라고요 ...");
			
			$(response.data).each(function(index, vo){
				renderLeader(vo)
			});
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}


$(function(){
	$('#dataTable').dataTable();
//	// 자회사 목록
//	$(document).on("click", ".company", function(event){
//		console.log("오나..")
//		var no = $(this).attr("data-no") * -1;
//		if($(this).next().children().length > 0){
//			$(this).next().children().remove();
//		}else{
//			getList(no);
//		}
//	});
//
//	// 부서 목록
//	$(document).on("click", ".departments", function(event){
//		//왼쪽에 부서뿌리기
//		var no = $(this).attr("data-no");
//		if($(this).next().children().length > 0){
//			$(this).next().children().remove();
//		}else{
//			getList(no);
//		}
//		//부서클릭시 뿌리고 직원테이블뿌리기
//		let departmentNo = $(this).attr('data-no');
//		let departmentName = $(this).html();
//		makeTable("/boot/getDepartmentEmployeeInfo/" + departmentNo);
//		renderTableDepartmentName(departmentName, departmentNo);
//		getLeader("/boot/getDepartmentEmployeeInfo/" + departmentNo);
//	});
	$(document).on("click", ".company", function(event){
	   var seq = $(this).attr("data-no");
	   if($(this).next().children().length > 0){
		   $(this).next().children().remove();
	   }else{
		   getBizList(seq);
	   }
   });
   
   //사업장 목록
   $(document).on("click", ".biz", function(event){
	  var seq = $(this).attr("data-no");
	  if($(this).next().children().length > 0){
		  $(this).next().children().remove();
	  }else{
		   getList(seq);
	  }
	  let departmentNo = $(this).attr('data-no');
	  let departmentName = $(this).html();
		makeTable("/getEmpInfo/" + seq + "/b");
		renderTableDepartmentName(departmentName, departmentNo);
//			getLeader("/boot/getDepartmentEmployeeInfo/" + departmentNo);
   });
	
   //부서 목록
   $(document).on("click", ".departments", function(event){
	  var seq = $(this).attr("data-no");
	  if($(this).next().children().length > 0){
		  $(this).next().children().remove();
	  }else{
		   getList(seq);
	  }
	  let departmentNo = $(this).attr('data-no');
	  let departmentName = $(this).html();
		makeTable("/getEmpInfo/" + seq + "/d");
		renderTableDepartmentName(departmentName, departmentNo);
//		getLeader("/boot/getDepartmentEmployeeInfo/" + departmentNo);
   });
});
