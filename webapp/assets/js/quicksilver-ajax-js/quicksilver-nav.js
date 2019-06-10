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
			"emp" : "사원명(ID)",
			"dept" : "부서",
			"deptName" : "부서명",
			"position" : "직급",
			"duty" : "직책",
			"call" : "전화번호",
			"phone" : "휴대전화",
			"search" : "검색",
			"empList" : "사원목록",
			"exel" : "엑셀저장",
			"empName" : "사원명(ID)",
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
			"compDomain" : "회사 홈페이지",
			"result" : "결과 : 총",
			"next" : "다음",
			"last" : "맨끝",
			"first": "처음",
			"prev": "이전",
			"Sub-department":"하위부서표시"
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
			"emp" : "Employee(ID)",
			"dept" : "Department",
			"deptName" : "Department Name",
			"position" : "Position",
			"duty" : "Duty",
			"call" : "Telephone Number",
			"phone" : "Mobile",
			"search" : "Search",
			"empList" : "Employee List",
			"exel" : "Exel Download",
			"empName" : "Name(ID)",
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
			"compDomain" : "Company Domain",
			"result" : "Result : Total",
			"next" : "next",
			"last" : "last",
			"first": "first",
			"prev": "prev",
			"Sub-department":"Sub-department"
		}
	}
};

var mainLangCode = 'kr';

var langChange = function(){
	var langCode = $("#langcode option:selected").val();
	let sortSpecialCharacter = "<a class='sort-btn'>↕</a>";
	
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
		
		if( $(this).attr('data-column')){
			$(this).text(text).append(sortSpecialCharacter);
		}
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
	$("div.pagination-info>span.lang").text($.lang[langCode]["etc"]["result"]);
	$("div.pagination span.lang").each(function(){
		$(this).text($.lang[langCode]["etc"][$(this).data("lang")]);
	});
	
	mainLangCode = langCode;
	tableColumnSort();
	
	//엑셀실시간다국어변경저장위해필요함
	$.ajax({
	      url: contextPath + "/langCodeToggle/"+mainLangCode,
	      type:"get",
	      dataType:"json",
	      data:"",
	      success: function(response){   	    	  
	      },
	      error: function(xhr, status, e){
	         console.error(status+"::"+e);
	      }      
	 });
	//--
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
	var icon = "<img class='navi-icon open' src='"+contextPath+"/assets/images/open.png'>"+
				"<img class='navi-icon close' src='"+contextPath+"/assets/images/close.png'>";
	
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
	}else{
		icon = "<img class='navi-icon' style='margin-left: 4.5px;' src='"+contextPath+"/assets/images/dept_end.png'>";
	}
	
   var htmls = "<li class='child dept department' data-no='"+vo.deptSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parentDeptSeq+"'>"+
  				"<div class='prev'>"+depth+space+"</div><div class='wrap'>"+tree+btn+
				"<div class='li-div'>"+icon+
   				"<span class='dept' data-lang='"+vo.deptSeq+"'>"+deptName+"</span><span>("+vo.deptEmpCount+")</span></div></div></li><ul d-no='"+vo.deptSeq+"'></ul>";
   if(parseInt(vo.parentDeptSeq) < 10000000){
	   $("ul[d-no='"+vo.parentDeptSeq+"']").append(htmls);
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
	var icon = "<img class='navi-icon open' src='"+contextPath+"/assets/images/open.png'>"+
				"<img class='navi-icon close' src='"+contextPath+"/assets/images/close.png'>";
	
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
	}else{
		icon = "<img class='navi-icon' style='margin-left: 4.5px;' src='"+contextPath+"/assets/images/dept_end.png'>";
	}
	
	var htmls = "<li class='child biz' data-no='"+vo.bizSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parents+"'>"+"<div class='wrap'>"+tree+btn+
				"<div class='li-div'>"+icon+
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
   		  	  $.lang.kr.dept[vo.deptSeq] = vo.deptName;
   		  	  $.lang.en.dept[vo.deptSeq] = vo.deptNameEn;
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
	   //
   });
   //부서 클릭
   $(document).on("click", "li.department span", function(event){
	   document.getElementsByClassName('search sch-submit lang')[0].setAttribute( // 테이블이 검색으로 나왔으므로 검색 check 변환
			   'data-check', false
	   );
 
	   $(".checks").css("visibility","visible");
	  //부서클릭시 초기화해야할것듯----------------------------------------------------------------------------------
	  $parent = $(this).parent().parent().parent();
	  pageFlag = 0; 															//pageFlag=0 : 부서를 클릭
      seq = $parent.attr("data-no");											//부서번호체크
      sorting = null;															//널처리안해주면 다른부서클릭->페이지이동시 의도치않은 정렬발생
      column =null;      														//널처리안해주면 다른부서클릭->페이지이동시 의도치않은 정렬발생
      checkHierarchy = $('input:checkbox[id="dept-hierarchy"]').is(":checked"); //하위부서 체크여부
      $('.page-point').val('');													//검색시 page-point 초기화 
      
	  $parent.children(".wrap").children(".li-div").css("background-color","#B3E5FC"); 
	  $("li[data-no!='"+seq+"']").children(".wrap").children(".li-div").css("background-color","transparent");

	  makeTable("/getEmpInfo/" + seq + "/d?pageNo=1&langCode="+mainLangCode + "&checkHierarchy=" + checkHierarchy);	
	  
	  
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
