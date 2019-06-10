//var contextPath = "${pageContext.servletContext.contextPath }";
$.lang = {
	kr : {
		comp:{},
		biz:{},
		dept:{},
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
			"compDomain" : "회사 홈페이지"
		}
	},
	en : {
		comp:{},
		biz:{},
		dept:{},
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
			"work" : "Work"
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
	mainLangCode = langCode;
}

function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("input[name='zipCode']").val(data.zonecode);
            $("input[name='addr']").val(addr + extraAddr);
            // 커서를 상세주소 필드로 이동한다.
            $("input[name='detailAddr']").focus();
        }
    }).open();
}

var compRender = function(vo){
	if(mainLangCode == 'kr'){
		var compName = vo.compName;
	}else{
		var compName = vo.compNameEn;
	}
	
	var htmls = "<li class='comp' c-no='"+vo.compSeq+"'><img class='navi-icon' src='"+contextPath+"/assets/images/comp.png'>"+
				"<span class='comp' data-lang='"+vo.compSeq+"'>"+vo.compName+"</span></li><ul c-no='"+vo.compSeq+"'></ul>";
	$("div#main-tree>ul").append(htmls);
}

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
	
	if(last == "true"){
		depth="";
		space="<div class='space'></div>";
	}
	
	if(index+1 == length){
		tree += lastChild;
	}else{
		tree = child;
	}
	
	if(vo.childCount > 0){
		btn = "<img class='open-btn close btn' src='"+contextPath+"/assets/images/openbtn.png'>"+
		"<img class='close-btn open btn' src='"+contextPath+"/assets/images/closebtn.png'>"
	}else{
		icon = "<img class='navi-icon' style='padding-left: 4px;' src='"+contextPath+"/assets/images/dept_end.png'>";
	}

	var htmls = "<li class='child dept' data-no='"+vo.deptSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parentDeptSeq+"'>"+
  				"<div class='prev'>"+depth+space+"</div><div class='wrap'>"+tree+btn+
				"<div class='li-div' draggable='true'>"+icon+
   				"<span class='dept' data-lang='"+vo.deptSeq+"'>"+deptName+"</span></div></div>"+
   				"<img class='add-icon' data-no='"+vo.deptSeq+"' src='"+contextPath+"/assets/images/add2.png'></li><ul d-no='"+vo.deptSeq+"'></ul>";
   if(parseInt(vo.parentDeptSeq) < 10000000){
	   $("ul[d-no='"+vo.parentDeptSeq+"']").append(htmls);
   }else{
	   $("ul[b-no='"+vo.parentDeptSeq+"']").append(htmls);
   }
   if(str != null){
	   $("li[data-no='"+vo.deptSeq+"'] div.prev").prepend(str);
   }
}

var bizRender = function(vo, index, length){
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
		btn = "<img class='open-btn close btn' src='"+contextPath+"/assets/images/openbtn.png'>"+
		"<img class='close-btn open btn' src='"+contextPath+"/assets/images/closebtn.png'>"
	}else{
		icon = "<img class='navi-icon' style='padding-left: 4px;' src='"+contextPath+"/assets/images/dept_end.png'>";
	}
	
	var htmls = "<li class='child biz' data-no='"+vo.bizSeq+"'>"+"<div class='wrap'>"+tree+btn+
				"<div class='li-div'>"+icon+
				"<span class='biz' c-no='"+vo.compSeq+"' data-lang='"+vo.bizSeq+"'>"+bizName+"<span></div></div>"+
				"<img class='add-icon' data-no='"+vo.bizSeq+"' src='"+contextPath+"/assets/images/add2.png'>"+
				"</li><ul b-no='"+vo.bizSeq+"'></ul>";
	$("ul[c-no='"+vo.compSeq+"']").append(htmls);
}

var tableRender = function(vo){
	var htmls = "<tr data-no='"+vo.empNum+"'><td>"+vo.empNum+"</td><td>"+vo.empName+"</td><td>"+vo.bDay+"</td><td>"+vo.genderCode+"</td><td>"+vo.positionCode+"</td>"+
				"<td>"+vo.dutyCode+"</td><td>"+vo.deptName+"</td></tr>";
	$("tbody").append(htmls);
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
	         });
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	      
	   });
}

var getBizList = function(seq){
	$.ajax({
		url: contextPath+"/admin/getBiz/"+seq,
	      type:"get",
	      dataType:"json",
	      data:"",
	      async : false,
	      success: function(response){
	         $(response.data.bizList).each(function(index, vo){
	            bizRender(vo, index, response.data.bizList.length)
	            $.lang.kr.biz[vo.bizSeq] = vo.bizName;
	            $.lang.en.biz[vo.bizSeq] = vo.bizNameEn;
	         });
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
}

var getDeptList = function(seq, last, str){
   $.ajax({
      url: contextPath+"/admin/getDept/"+seq,
      type:"get",
      dataType:"json",
      data:"",
      async : false,
      success: function(response){
         $(response.data).each(function(index, vo){
            deptRender(vo, index, response.data.length, last, str);
            $.lang.kr.dept[vo.deptSeq] = vo.deptName;
            $.lang.en.dept[vo.deptSeq] = vo.deptNameEn;
         });
      },
      error: function(xhr, status, e){
         console.error(status+":"+e);
      }
   });
}

var getEmpInfo = function(seq){
	$.ajax({
		url: contextPath+"/admin/getEmpInfoByDept/"+seq,
		type:"get",
		dataType:"json",
		data:"",
		success: function(response){
			$(response.data).each(function(index, vo){
				tableRender(vo);
			});
		}
	});
}

function menuActive(){
	var menuList = $("div.menu li");
	for (var i = 0; i < menuList.length; i++) {
		if ($(menuList[i]).text() === $("#contents-header span:last")
				.text()) {
			$(menuList[i]).parent().parent().show().prev().addClass(
					"active");
			$(menuList[i]).children().css("color", "#328CF5").css(
					"font-weight", "bold");
		}
	}

	$("div.parent-menu").click(function() {
		$this = $(this);
		$icon1 = $this.children().next();
		$icon2 = $this.children().next().next();
		if ($this.next().css("display") == "none") {
			$this.addClass("active");
			$this.next().show();
			$icon1.hide();
			$icon2.show();
		} else {
			$this.removeClass("active");
			$this.next().hide();
			$icon1.show();
			$icon2.hide();
		}
	});
}

let ArrowChange = () => {
	$(".active").each( (index, item) => {
		item.children[2].classList.toggle()
	});
};

$(function() {
	menuActive();
	getCompList();
	$("#langcode").change(function(){
		langChange();
	});
	
	$("div.parent-menu").click(function() {
		$this = $(this);
		$icon1 = $this.children().next();
		$icon2 = $this.children().next().next();
		if ($this.next().css("display") == "none") {
			$this.addClass("active");
			$this.next().show();
			$icon1.hide();
			$icon2.show();
		} else {
			$this.removeClass("active");
			$this.next().hide();
			$icon1.show();
			$icon2.hide();
		}
	});

	$(document).on("click", "li.comp span", function(event) {
		$parent = $(this).parent();
		var seq = $parent.attr("c-no");
		if ($parent.next().children().length > 0) {
			$("ul[c-no='"+seq+"'] li.biz").each(function(){
				delete $.lang.kr.biz[$(this).data("no")];
				delete $.lang.en.biz[$(this).data("no")];
			});
			$parent.next().children().remove();
		} else {
			getBizList(seq);
		}
	});

	//부서별 사원 목록 테이블 출력
	$(document).on("click", "#main-tree li.child span", function(event) {
		$parent = $(this).parent().parent();
		var seq = $parent.attr("data-no");
		$("div.li-div").removeClass("active-span");
		$(this).parent().addClass("active-span");
		$("tbody tr").remove();
		getEmpInfo(seq);
	});

	// 하위 부서 목록 출력
	$(document).on("click", "li.child img.open-btn", function(event) {
		$parent = $(this).parent().parent();
		var seq = $parent.attr("data-no");
		if ($parent.children().length >= 2) {
			var str = $parent.children(".prev").html();
			if ($parent.children('.wrap').children('img.last').length > 0) {
				getDeptList(seq, "true", str);
			} else {
				getDeptList(seq, "false", str);
			}
		} else {
			if ($parent.children('.wrap').children('img.last').length > 0) {
				getDeptList(seq, "true", null);
			} else {
				getDeptList(seq, "false", null);
			}
		}
		$(this).hide();
		$(this).next().show();
		$(this).next().next().children('.open').show();
		$(this).next().next().children('.close').hide();
	});

	// 하위 부서 목록 제거
	$(document).on("click", "li.child img.close-btn", function(event) {
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