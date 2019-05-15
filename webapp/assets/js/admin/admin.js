//var contextPath = "${pageContext.servletContext.contextPath }";

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
	
   var htmls = "<li class='child dept' data-no='"+vo.deptSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parentDeptSeq+"'>"+
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

var bizRender = function(vo, index, length){
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
	var htmls = "<li class='child biz' data-no='"+vo.bizSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parents+"'>"+"<div class='wrap'>"+tree+btn+
				"<div class='li-div'><img class='navi-icon open' src='"+contextPath+"/assets/images/open.png'>"+
				"<img class='navi-icon close' alt='' src='"+contextPath+"/assets/images/close.png'>"+
				"<span>"+vo.bizName+"<span></div></div></li><ul b-no='"+vo.bizSeq+"'></ul>";
	$("ul[c-no='"+vo.compSeq+"']").append(htmls);
}

var tableRender = function(vo){
	var htmls = "<tr data-no='"+vo.empNum+"'><td>"+vo.empNum+"</td><td>"+vo.empName+"</td><td>"+vo.bDay+"</td><td>"+vo.genderCode+"</td><td>"+vo.positionCode+"</td>"+
				"<td>"+vo.dutyCode+"</td><td>"+vo.deptName+"</td></tr>";
	$("tbody").append(htmls);
}

var getDeptList = function(seq, last, str){
   $.ajax({
      url: contextPath+"/admin/getDept/"+seq,
      type:"get",
      dataType:"json",
      data:"",
      success: function(response){
         $(response.data).each(function(index, vo){
            deptRender(vo, index, response.data.length, last, str);
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
	      success: function(response){
	         $(response.data).each(function(index, vo){
	            bizRender(vo, index, response.data.length)
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

$(function() {
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
		var seq = $parent.attr("data-no");
		if ($parent.next().children().length > 0) {
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
		$parent.next().children().remove();
		$(this).hide();
		$(this).prev().show();
		$(this).next().children('.close').show();
		$(this).next().children('.open').hide();
	});
});