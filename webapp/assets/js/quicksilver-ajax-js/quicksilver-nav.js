//let tableRender = function(vo){
//	let htmls = 			"	<tr class=\"row\">\r\n" + 
//	"								<td>"+vo.empSeq+"</td>\r\n"+
//	"								<td>"+vo.deptSeq+"</td>\r\n"+
//	"								<td>"+vo.deptName+"</td>\r\n" + 
//	"								<td>"+vo.positionCode+"</td>\r\n" + 
//	"								<td>"+vo.dutyCode+"</td>\r\n" + 
//	"								<td>"+vo.empName+"("+ vo.loginId+")</td>\r\n" + 
//	"								<td>"+vo.homeTelNum+"</td>\r\n" + 
//	"								<td>"+vo.mobileTelNum+"</td>\r\n" + 
//	"							</tr>"
//	$(".member > tbody").append(htmls);	
//}
//
//let pageRender = function(page){
//	
//	let htmls=""
//		
//		$(".page").append(htmls);
//}

var deptRender = function(vo, index, length, last, str){
	console.log(vo+index+length+last+str)
	var btn = "";
	var space = "";
	
	var depth = "<img class='tree-icon depth' src='"+contextPath+"/assets/images/depth.png'>";
	var child = "<img class='tree-icon' src='"+contextPath+"/assets/images/child.png'>";
	var lastChild = "<img class='tree-icon last' src='"+contextPath+"/assets/images/last_child.png'>"
	var tree = "";
	if(vo.deptLevel > 1){
		if(last == "true"){
			console.log("1");
			depth="";
			space="<div class='space'></div>";
		}else{
			
		}
	}else{
		if(last == "true"){
			console.log("3");
			depth="";
			space="<div class='space'></div>";
		}else{
			
		}
	}
	
	
	if(index+1 == length){
		tree += lastChild;
	}else{
		tree = child;
	}
	
	if(vo.childCount > 0){
		btn = "<img class='open-btn close' src='"+contextPath+"/assets/images/openbtn.png'>"+
		"<img class='close-btn open' src='"+contextPath+"/assets/images/closebtn.png'>"
	}
	
   var htmls = "<li class='dept department' data-no='"+vo.deptSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parentDeptSeq+"'>"+
  				"<div class='prev'>"+depth+space+"</div><div class='wrap'>"+tree+btn+
				"<div class='li-div'><img class='navi-icon open' src='"+contextPath+"/assets/images/open.png'>"+
   				"<img class='navi-icon close' src='"+contextPath+"/assets/images/close.png'>"+
   				"<span>"+vo.deptName+"<span></div></div></li><ul data-no='"+vo.deptSeq+"'></ul>";
   if(parseInt(vo.parentDeptSeq) < 10000000){
	   $("ul[data-no='"+vo.parentDeptSeq+"']").append(htmls);
   }else{
	   $("ul[b-no='"+vo.parentDeptSeq+"']").append(htmls);
   }
   if(str != null){	   
	   $("li[data-no='"+vo.deptSeq+"'] div.prev").prepend(str);
   }
}

var bizRender = function(vo,index, length){
	var child = "<img class='tree-icon' src='"+contextPath+"/assets/images/child.png'>";
	var lastChild = "<img class='tree-icon last' src='"+contextPath+"/assets/images/last_child.png'>"
	var tree = "";
	if(index+1 == length){
		tree = lastChild;
	}else{
		tree = child;
	}
	
	var btn = "";
	if(vo.childCount > 0){
		btn = "<img class='open-btn close' src='"+contextPath+"/assets/images/openbtn.png'>"+
		"<img class='close-btn open' src='"+contextPath+"/assets/images/closebtn.png'>"
	}
	var htmls = "<li class='dept biz' data-no='"+vo.bizSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parents+"'>"+"<div class='wrap'>"+tree+btn+
				"<div class='li-div'><img class='navi-icon open' src='"+contextPath+"/assets/images/open.png'>"+
				"<img class='navi-icon close' alt='' src='"+contextPath+"/assets/images/close.png'>"+
				"<span>"+vo.bizName+"<span></div></div></li><ul b-no='"+vo.bizSeq+"'></ul>";
	$("ul[c-no='"+vo.compSeq+"']").append(htmls);
}

//테이블에부서이름뿌리기
var renderTableDepartmentName = function(departmentName,departmentNo){
	   $(".dept").empty();
	   let htmls = "<h6 class='m-0 font-weight-bold text-primary'>" + 
	   					departmentName + 
	   				"</h6>";
	   
	   $(".dept").append(htmls);
  
}
//테이블에팀장이름뿌리기
var renderLeader = function(leader){
		console.log(leader);
		console.log(leader.name);
		
	   let htmlLeader = "<div class='m-0 font-weight-bold text-danger'>┖ 팀장 : "+ 
	   					leader.empName + "(" + leader.empSeq + ")"
					"</div>";	
		
	   $(".dept").append(htmlLeader);
}

var getList = function(seq, last, str){
	console.log("옵니다아~")
	$.ajax({
      url: contextPath + "/getDept/"+seq,
      type:"get",
      dataType:"json",
      data:"",
      success: function(response){   
    	  console.log(response.data);
    	 $(response.data).each(function(index, vo){
    		 console.log("안옴???????ㅁㄴㅇㅁㄴㅇ");
//            deptRender(vo)
    		  deptRender(vo, index, response.data.length, last, str);    
         });
    	 
    	 $("li[data-no!='"+seq+"']").css("color","black");
    	 $("li[data-no='"+seq+"']").css("color","red"); //고치자
    },
      error: function(xhr, status, e){
         console.error(status+"::"+e);
      }
      
   });
}

var getListSearch = function(seq, last, str, pseq){
	
	$.ajax({
      url: contextPath + "/getDept/"+seq,
      type:"get",
      dataType:"json",
      data:"",
      async: false,
      success: function(response){   	
    	 $(response.data).each(function(index, vo){
    		// console.log("부서렌더")
//            deptRender(vo)
   		  	  deptRender(vo, index, response.data.length, last, str);  
         });
    	 $("li[data-no!='"+pseq+"']").css("color","black");
    	 $("li[data-no='"+pseq+"']").css("color","red"); //고치자
      },
      error: function(xhr, status, e){
         console.error(status+":"+e);
      }
   });
}

var getBizList = function(seq){
	console.log(seq+"이건 seq입니다.")
	$.ajax({
		url: contextPath + "/getBiz/"+seq,
	      type:"get",
	      dataType:"json",
	      data:"",
	      async: false,
	      success: function(response){
	         $(response.data).each(function(index, vo){
	        	// console.log(response.data);
//	            bizRender(vo)
	            bizRender(vo, index, response.data.length);
	         });
	         
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
}

//부서클릭시 테이블그리기
var makeTable = function(url) {	
//	$(".member > tbody").empty();
//	$.ajax({
//		url: contextPath + url,
//	      type:"get",
//	      dataType:"json",
//	      data:"",
//	      async: false,
//	      success: function(response){
//	         $(response.data.list).each(function(index, vo){
//	        	 tableRender(vo);
//	        	// console.log(response.data);
//	         });
////	         pageRender(response.data.page);
//	      },
//	      error: function(xhr, status, e){
//	         console.error(status+":"+e);
//	      }
//	});
	
	
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
        	  {data: "empSeq"},
        	  {data: "deptSeq"},
              {data: "deptName"},
              {data: "positionCode"},
              {data: "dutyCode"},
              {data: "empName"},
              {data: "loginId"},
              {data: "homeTelNum"},              
              {data: "mobileTelNum"}
          ]
      });	
	
	$('.dataTables_info').hide()
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
			
			renderLeader(response.data)

		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}


$(function(){
	
	$('#dataTable').dataTable();
	$('#dataTable_filter').hide();
//	$('.dataTables_length').hide();
	$('.dataTables_info').hide();
//	$('.dataTables_paginate').hide();
//	$('.pagePre').hide();
//	$('.pageNext').hide();
	
	$(document).on("click", "li.comp span", function(event){
		console.log("회사클릭")
	   $parent = $(this).parent();
	   var seq = $parent.attr("data-no");
	   
	   console.log(seq+"회사클릭쓰");
//	   var seq = $(this).attr("data-no");
	   
	   if($parent.next().children().length > 0){
		   console.log("사업장 다지움");
		   console.log("이거되제?");
		   
//		   $(this).next().children().remove();
		   $parent.next().children().remove();
	   }else{
		   getBizList(seq);
    	   //차트관련
    	   //getCompInfo(seq);
    	   //InfoBar(seq, "biz");  
		   //let departmentName = $(this).html();
    	   //회사클릭시 다가져와서 렌더링 -
    	   //makeTable("/getEmpInfo/" + seq + "/a");
    	   //renderTableDepartmentName(departmentName, seq);
		}
   });
   
   //사업장 목록
   $(document).on("click", "li.biz span", function(event){		
//		  $('.pagePre').show();
//		  $('.pageNext').show();
//
//		  $(".pageNext").attr("data-no", 1);	  
//		  $(".pageNext").attr("data-kwd","");
//		  let seq = $(this).attr("data-no");
//		  $parent = $(this).parent().parent();
//	      var seq = $parent.attr("data-no");
//	      
//		  pageNo = $(".pageNext").attr("data-no");
//		  		   $(".pageNext").attr("data-seq", seq);
//		   getList(seq);
//		   let departmentName = $(this).html();
//		   makeTable("/getEmpInfo/" + seq + "/b?pageNo="+pageNo); 
//		   renderTableDepartmentName(departmentName, seq); 
   });
   
   //부서 목록
   $(document).on("click", "li.department span", function(event){

	   	  $parent = $(this).parent().parent().parent();
	      var seq = $parent.attr("data-no");
	      
	  	  $('.pagePre').show();
		  $('.pageNext').show();
		  $(".pageNext").attr("data-no", 1);
		  $(".pageNext").attr("data-kwd","");
			
//		  let seq = $(this).attr("data-no");
		  pageNo = $(".pageNext").attr("data-no");
		  		   $(".pageNext").attr("data-seq", seq);

		  
		  console.log(seq) 
//		  getList(seq);
	
//		  let departmentName = $(this).html();
		  makeTable("/getEmpInfo/" + seq + "/d?pageNo="+pageNo);
//		  renderTableDepartmentName(departmentName, seq);
//		  getLeader("/boot/getDepartmentEmployeeInfo/" + seq);
	  
   });
   

   //여닫이
   $(document).on("click", "li.dept img.open-btn", function(event){		
	   console.log("안됨??")
	   $parent = $(this).parent().parent();
	   var seq = $parent.attr("data-no");
	   console.log(seq);
	   if($parent.children().length >= 2 ){
		   var str = $parent.children(".prev").html();
		   
		   console.log($parent.children(".prev"));
		   if($parent.children('.wrap').children('img.last').length > 0){
			   getList(seq, "true" , str);
		   }else{
			   getList(seq, "false", str);
		   }
	   }else{
		   if($parent.children('.wrap').children('img.last').length > 0){
			   getList(seq, "true" , null);
		   }else{
			   getList(seq, "false", null);
		   }
	   }
	   $(this).hide();
	   $(this).next().show();
	   $(this).next().next().children('.open').show();
	   $(this).next().next().children('.close').hide();
   });
   $(document).on("click", "li.dept img.close-btn", function(event){
	   $parent = $(this).parent().parent();
	   $parent.next().children().remove();
	   $(this).hide();
	   $(this).prev().show();
	   $(this).next().children('.close').show();
	   $(this).next().children('.open').hide();
   });
         
   //페이징 에이젝 다음
   $(document).on("click", ".pageNext", function(event){
		  let seq = $(this).attr("data-seq");
		  let kwd = $(this).attr("data-kwd");
		  let selectSearch = $(this).attr("data-selectSearch");
		  
		  var pageNo = Number($(".pageNext").attr("data-no"))+1;
		  	  $(".pageNext").attr("data-no", pageNo);

		  	  if(seq >= 10000000 && kwd == ""){		  		  
		  		  makeTable("/getEmpInfo/" + seq + "/b?pageNo="+(pageNo)); 
		  	  }else if(seq < 10000000 && kwd == ""){
		  		  makeTable("/getEmpInfo/" + seq + "/d?pageNo="+(pageNo)); 
		  	  }else if(kwd){
		  		makeTable("/boot/search/" + selectSearch + "/" + kwd +"/?pageNo="+pageNo );
		  	  }
		  	  
	   });
   //페이징 에이젝이전
   $(document).on("click", ".pagePre", function(event){
		  var seq = $(".pageNext").attr("data-seq");
		  let kwd = $(".pageNext").attr("data-kwd");
		  let selectSearch = $(".pageNext").attr("data-selectSearch");
		  
		  var pageNo = Number($(".pageNext").attr("data-no"))-1;
		  	  $(".pageNext").attr("data-no", pageNo);
		  	  
		  	  if(seq >= 10000000 && kwd == ""){		  		  
		  		  makeTable("/getEmpInfo/" + seq + "/b?pageNo="+(pageNo)); 
		  	  }else if(seq < 10000000 && kwd == ""){
		  		  makeTable("/getEmpInfo/" + seq + "/d?pageNo="+(pageNo)); 
		  	  }else if(kwd){
		  		makeTable("/boot/search/" + selectSearch + "/" + kwd +"/?pageNo="+pageNo );
		  	  }
	   });
   
});
