$.lang = {
	kr : {
		comp:{},
		biz:{},
		dept:{},
		dp:{},
		emp:{},
		etc:{
			"title" : "조직도",
			"kr" : "한국어",
			"en" : "영어",
			"total" : "전체",
			"emp" : "사원",
			"dept" : "부서",
			"deptName" : "부서명",
			"position" : "직급",
			"duty" : "직책",
			"call" : "전화번호",
			"phone" : "휴대전화",
			"search" : "검색",
			"empList" : "사원목록",
			"exel" : "엑셀 저장",
			"empName" : "사원명",
			"birth" : "생년월일",
			"totalDept" : "전체부서",
			"fax" : "팩스번호",
			"compMail" : "회사메일",
			"email" : "개인메일",
			"work" : "담당업무",
			"adminLogin" : "관리자 로그인",
			"admin" : "관리자",
			"empNo" : "사번",
			"deptNo" : "부서번호",
			"compDomain" : "회사 홈페이지"
		}
	},
	en : {
		comp:{},
		biz:{},
		dept:{},
		dp:{},
		emp:{},
		etc:{
			"title" : "Organization Chart",
			"kr" : "Korean",
			"en" : "English",
			"total" : "All",
			"emp" : "Employee",
			"dept" : "Department",
			"deptName" : "Department Name",
			"position" : "Position",
			"duty" : "Duty",
			"call" : "Telephone Number",
			"phone" : "Mobile",
			"search" : "Search",
			"empList" : "Employee List",
			"exel" : "Save Exel",
			"empName" : "Name",
			"birth" : "Dirth Date",
			"totalDept" : "Total Department",
			"fax" : "Fax",
			"compMail" : "compmail",
			"email" : "Email",
			"work" : "Work",
			"adminLogin" : "Admin Login",
			"admin" : "admin",
			"empNo" : "Employee No",
			"deptNo" : "Department No",
			"compDomain" : "Company Domain"
		}
	}
};

var mainLangCode = 'kr';

var langChange = function(){
	var langCode = $("#langcode option:selected").val();
	$("span.comp").each(function(){
		var name = $.lang[langCode]["comp"][$(this).data("lang")];
		if (name == null){
			name = $.lang['kr']["comp"][$(this).data("lang")];
		}
		$(this).text(name);
	});
	$("span.biz").each(function(){
		var name = $.lang[langCode]["biz"][$(this).data("lang")];
		if (name == null){
			name = $.lang['kr']["biz"][$(this).data("lang")];
		}
		$(this).text(name);
	});
	$("span.dept").each(function(){
		var name = $.lang[langCode]["dept"][$(this).data("lang")];
		if (name == null){
			name = $.lang['kr']["dept"][$(this).data("lang")];
		}
		$(this).text(name);
	});
	
	$(".lang").each(function(){
		var text = $.lang[langCode]["etc"][$(this).data('lang')];
		if (text == null){
			text = $.lang['kr']["etc"][$(this).data('lang')]
		}
		$(this).text(text);
	})
	
	$("#dataTable .lang").each(function(){
		 if($(this).attr("class") == "lang dept"){
			 var name = $.lang[langCode]["dept"][$(this).data("lang")];
		 }
			 
		 if($(this).attr("class") == "lang dp"){
			 var seq = $(this).data("lang");
			 var name = $.lang[langCode]["dp"][seq];
		 }
		 
		 if($(this).attr("class") == "lang emp"){
			 var seq = $(this).data("lang");
			 var name = $.lang[langCode]["emp"][seq];
		 }
		 
		 
		 $(this).text(name);
	 });
	
	$("table.detail .lang").each(function(){
     	 if($(this).attr("class") == "lang dept"){
     		 var name = $.lang[langCode]["dept"][$(this).data("lang")];
     	 }
     		 
     	 if($(this).attr("class") == "lang dp"){
     		 var seq = $(this).data("lang");
     		 var name = $.lang[langCode]["dp"][seq];
     	 }
     	 
     	 if($(this).attr("class") == "lang emp"){
     		 var seq = $(this).data("lang");
     		 var name = $.lang[langCode]["emp"][seq];
     	 }
     	 
     	 
     	 $(this).text(name);
    });
	
	mainLangCode = langCode;
}

var compRender = function(vo){
	if(mainLangCode == 'kr'){
		var compName = vo.compName;
	}else{
		var compName = vo.compNameEn;
	}
	
	var htmls = "<li class='comp' data-no='"+vo.compSeq+"'><img class='navi-icon' src='"+contextPath+"/assets/images/comp.png'>"+
				"<span class='comp' data-lang='"+vo.compSeq+"'>"+vo.compName+"</span></li><ul c-no='"+vo.compSeq+"'></ul>";
	$("div#main-tree>ul").append(htmls);
}

//부서렌더링 
var deptRender = function(vo, index, length, last, str){
	var btn = "";
	var space = "";
	
	var depth = "<img class='tree-icon depth' src='"+contextPath+"/assets/images/depth.png'>";
	var child = "<img class='tree-icon' src='"+contextPath+"/assets/images/child.png'>";
	var lastChild = "<img class='tree-icon last' src='"+contextPath+"/assets/images/last_child.png'>"
	var tree = "";
	
	if(mainLangCode == 'kr'){
		var deptName = vo.deptName;
	}else{
		var deptName = vo.deptNameEn;
	}
	
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
	
   var htmls = "<li class='child dept department' data-no='"+vo.deptSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parentDeptSeq+"'>"+
  				"<div class='prev'>"+depth+space+"</div><div class='wrap'>"+tree+btn+
				"<div class='li-div'><img class='navi-icon open' src='"+contextPath+"/assets/images/open.png'>"+
   				"<img class='navi-icon close' src='"+contextPath+"/assets/images/close.png'>"+
   				"<span class='dept' data-lang='"+vo.deptSeq+"'>"+deptName+"</span><span>("+vo.deptEmpCount+")</span></div></div></li><ul data-no='"+vo.deptSeq+"'></ul>";
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
	
	if(mainLangCode == 'kr'){
		var bizName = vo.bizName;
	}else{
		var bizName = vo.bizNameEn;
	}
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
	var htmls = "<li class='child biz' data-no='"+vo.bizSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parents+"'>"+"<div class='wrap'>"+tree+btn+
				"<div class='li-div'><img class='navi-icon open' src='"+contextPath+"/assets/images/open.png'>"+
				"<img class='navi-icon close' alt='' src='"+contextPath+"/assets/images/close.png'>"+
				"<span class='biz' c-no='"+vo.compSeq+"' data-lang='"+vo.bizSeq+"'>"+bizName+"<span></div></div></li><ul b-no='"+vo.bizSeq+"'></ul>";
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
    		  $.lang.kr.dept[vo.deptSeq] = vo.deptName;
              $.lang.en.dept[vo.deptSeq] = vo.deptNameEn;
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

var getCompList = function(){
	 $.ajax({
	      url: contextPath+"/admin/getComp",
	      type:"get",
	      dataType:"json",
	      data:"",
	      success: function(response){
	         $(response.data).each(function(index, vo){
	            compRender(vo);
	            $.lang.kr.comp[vo.compSeq] = vo.compName;
	            $.lang.en.comp[vo.compSeq] = vo.compNameEn;
	            
	            // 직책 직급 디비 바뀌면 적용해야함
//	            $.lang.kr.dp[vo.compSeq] = {};
//	            $.lang.en.dp[vo.compSeq] = {};
	         });
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
	         $(response.data.bizList).each(function(index, vo){
	            bizRender(vo, index, response.data.bizList.length);
	            $.lang.kr.biz[vo.bizSeq] = vo.bizName;
	            $.lang.en.biz[vo.bizSeq] = vo.bizNameEn;
	         });
//	         $(response.data.dpList).each(function(index, vo){
//	        	$.lang.kr.dp[vo.compSeq][vo.dpSeq] = vo.dpName;
//	        	$.lang.en.dp[vo.compSeq][vo.dpSeq] = vo.dpNameEn;
//	         });
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
	console.log($.lang);
}

var getDpAll = function(){
	$.ajax({
		url: contextPath + "/getDpAll",
	      type:"get",
	      dataType:"json",
	      data:"",
	      success: function(response){
	    	  $(response.data).each(function(index, vo){
	    		  $.lang.kr.dp[vo.dpSeq] = vo.dpName;
		          $.lang.en.dp[vo.dpSeq] = vo.dpNameEn;
	    	  });
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
	console.log($.lang);
}

$(function(){
	getCompList();
	getDpAll();
	$("#langcode").change(function(){
		langChange();
		console.log($.lang);
	});
	
	//회사클릭
	$(document).on("click", "li.comp span", function(event){
	   $parent = $(this).parent();
	   var seq = $parent.attr("data-no");	  
	   if($parent.next().children().length > 0){	
		   $("ul[c-no='"+seq+"'] li.biz").each(function(){
				delete $.lang.kr.biz[$(this).data("no")];
				delete $.lang.en.biz[$(this).data("no")];
			});
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
      $('.page-point').val('');													//검색시 page-point 초기화 
   	  $parent = $(this).parent().parent().parent();
      var seq = $parent.attr("data-no");
	  $parent.children(".wrap").children(".li-div").css("background-color","#B3E5FC"); 
	  $("li[data-no!='"+seq+"']").children(".wrap").children(".li-div").css("background-color","transparent");
	  makeTable("/getEmpInfo/" + seq + "/d?pageNo=1");		  
   });
   
   //여닫이
   $(document).on("click", "li.child img.open-btn", function(event){		
	   $parent = $(this).parent().parent();
	   var seq = $parent.attr("data-no");
	   if($parent.children().length >= 2 ){
		   var str = $parent.children(".prev").html();
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
   $(document).on("click", "li.child img.close-btn", function(event){
	   $parent = $(this).parent().parent();
	   var seq = $parent.attr("data-no");
	   var str = "";
		
		if(seq > 10000000){
			str = "b-no='"+seq+"'";
		}else{
			str = "d-no='"+seq+"'";
		}
		
		$("ul["+str+"]>li.dept").each(function(){
			delete $.lang.kr.dept[$(this).data("no")];
			delete $.lang.en.dept[$(this).data("no")];
		});
	   
	   $parent.next().children().remove();
	   $(this).hide();
	   $(this).prev().show();
	   $(this).next().children('.close').show();
	   $(this).next().children('.open').hide();
   });
});
