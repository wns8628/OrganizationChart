//부서렌더링 
var deptRender = function(vo, index, length, last, str){
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
   				"<span>"+vo.deptName+"("+vo.deptEmpCount+")"+"<span></div></div></li><ul data-no='"+vo.deptSeq+"'></ul>";
   if(parseInt(vo.parentDeptSeq) < 10000000){
	   $("ul[data-no='"+vo.parentDeptSeq+"']").append(htmls);
   }else{
	   $("ul[b-no='"+vo.parentDeptSeq+"']").append(htmls);
   }
   if(str != null){	   
	   $("li[data-no='"+vo.deptSeq+"'] div.prev").prepend(str);
   }
}
//사업장렌더링
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

//부서클릭or사업장 클릭 렌더ajax 
var getList = function(seq, last, str){
	$.ajax({
      url: contextPath + "/getDept/"+seq,
      type:"get",
      dataType:"json",
      data:"",
      success: function(response){   
    	  console.log(response.data);
    	 $(response.data).each(function(index, vo){
    		  deptRender(vo, index, response.data.length, last, str);    
         });
    },
      error: function(xhr, status, e){
         console.error(status+"::"+e);
      }      
   });
}
//사원클릭시 조직도쳘치기 렌더 ajax
var getListNavPoint = function(seq, last, str, pointSeq){
	$.ajax({
      url: contextPath + "/getDept/"+seq,
      type:"get",
      dataType:"json",
      data:"",
      async: false,
      success: function(response){   	
    	 $(response.data).each(function(index, vo){
   		  	  deptRender(vo, index, response.data.length, last, str);  
         });
    	 $("li[data-no='"+pointSeq+"']").children(".wrap").children(".li-div").css("background-color","#B3E5FC");  
    	 $("li[data-no!='"+pointSeq+"']").children(".wrap").children(".li-div").css("background-color","transparent");
      },
      error: function(xhr, status, e){
         console.error(status+":"+e);
      }
   });
}
//사업장렌더 ajax
var getBizList = function(seq){
	$.ajax({
		url: contextPath + "/getBiz/"+seq,
	      type:"get",
	      dataType:"json",
	      data:"",
	      async: false,
	      success: function(response){
	         $(response.data).each(function(index, vo){
	            bizRender(vo, index, response.data.length);
	         }); 
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
}

$(function(){
	//회사클릭
	$(document).on("click", "li.comp span", function(event){
	   $parent = $(this).parent();
	   var seq = $parent.attr("data-no");	  
	   if($parent.next().children().length > 0){		   
		   $parent.next().children().remove();
	   }else{
		   getBizList(seq);
    	   //차트관련
    	   //getCompInfo(seq);
    	   //InfoBar(seq, "biz");  
		   //회사클릭시 다가져와서 렌더링 
    	   //makeTable("/getEmpInfo/" + seq + "/a");
		}
   });
   //사업장 클릭 
   $(document).on("click", "li.biz span", function(event){		
	   //makeTable("/getEmpInfo/" + seq + "/b?pageNo="+pageNo); 
   });
   //부서 클릭
   $(document).on("click", "li.department span", function(event){
      pageFlag = 0; 															//pageFlag=0 : 부서를 클릭
   	  $parent = $(this).parent().parent().parent();
      var seq = $parent.attr("data-no");
	  $parent.children(".wrap").children(".li-div").css("background-color","#B3E5FC"); 
	  $("li[data-no!='"+seq+"']").children(".wrap").children(".li-div").css("background-color","transparent");
	  makeTable("/getEmpInfo/" + seq + "/d?pageNo=1");		  
   });
   
   //여닫이
   $(document).on("click", "li.dept img.open-btn", function(event){		
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
});
