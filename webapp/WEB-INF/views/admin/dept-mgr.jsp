<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.servletContext.contextPath }/assets/css/admin.css?ver=1"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/admin.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
/* div.content-wrapper div#tree { width: 39.8%; border: 1px solid #B2B2B2; min-height: 350px; float: left;} */
/* div.content-wrapper div#tbl-content { width: 59.8%; border: 1px solid #B2B2B2; min-height: 350px; float: right;} */

/* table#content-wrapper {width: 100%; border: 1px solid #B2B2B2; min-height: 350px; border-collapse:collapse; margin: 0 auto;} */
/* table#content-wrapper td:first-child{ border: 1px solid #B2B2B2; text-align: center; width: 40%; padding: 0px;} */
/* table#content-wrapper td:last-child{ border: 1px solid #B2B2B2; text-align: center; width: 58%;} */
/* table#content-wrapper div#tree {  min-height: 350px; } */
/* table#content-wrapper div#tbl-content {  min-height: 350px; } */

/* table#content-wrapper div#tbl-header {width: 100%; padding-top: 20px; background-color: #F9F9F9; height: 30px; } */
/* table#content-wrapper div#tbl-header span { width: 80px; border: 1px solid #B2B2B2; font-size: 13px; height: 28px; float: left; display: inline-block; line-height: 30px;} */
/* table#content-wrapper div#tbl-header span:first-child {margin-left: 20px;} */

/* table#content-wrapper div#tbl-wrapper {width: 96%; padding: 2%; border: 1px solid #B2B2B2;} */


div.tree li {font: 2em; display: block; height: 20px; position: relative;}
div.tree li.comp:not(:first-child) { padding-top: 4px;}
div.tree li.dept { font: 1.5em; }
div.tree li.biz { font: 1.5em; }
div.tree span {cursor: pointer; height: 100%; font-size: 12px; padding-left: 4px;}
div.tree img.navi-icon {height: 16px; width: 16px; vertical-align: middle; float: left;}
div.tree img.tree-icon {height: 20px; width: 20px; vertical-align: top; display: inline-block; float: left;}
div.tree img.open-btn {height: 9px; width: 5px; position: relative; left: -12px; top: -1px; cursor: pointer;}
div.tree img.close-btn {height: 6px; width: 6px; position: relative; left: -13px; top: -3px; cursor: pointer;}
div.tree img.open {display: none;}
div.result-wrapper { background-color: #ffffff; min-height: 500px; min-width: 800px; height:100%; width: 78%; padding: 0.5%; float: right;}

div.tree div.li-div {padding: 2px 0;  display: inline-block;}
div.space { width: 20px; height: 20px; display: inline-block; float: left;}
div.wrap {height: 20px; display: inline-block; float: left}
.active-span{
	background-color: #BEEBFF;
}


/*  */

*            { margin:0; padding:0 }
body         { font:0.75em "맑은 고딕", 돋움, 굴림; color:#111; min-width: 1000px;}
ul, ol, li         { list-style-type: none }
fieldset      { border:none }

div#contents div#select-bar{width: 100%; height: 20px; background: #EFF6FE; border: 1px solid #B2B2B2; padding: 15px 0; vertical-align: middle; margin-bottom: 10px;}
div#contents div#select-bar span{ font-size: 13.5px; font-weight: bold; margin-left: 20px; height: 20px; float: left;}
div#contents div#select-bar select { margin-left: 8px; height: 20px; float: left;}
div#contents div#select-bar input { margin-left: 8px; height: 16px; float: left;}

div.content-head-wrapper input { margin: 5px 0 0 20px; }

div#content-wrapper {width: 100%; min-height: 350px; margin: 0 auto;}
div#content-wrapper div#tree {  min-height: 350px; }
div#content-wrapper div#tbl-content { width: 60%; min-height: 420px; float: right; }

div#content-wrapper div#tbl-header {width: 100%; padding-top: 20px; background-color: #F9F9F9; height: 30px; border-top: 1px solid #B2B2B2; border-right: 1px solid #B2B2B2; border-left: 1px solid #B2B2B2;}
div#content-wrapper div#tbl-header span:last-child { width: 80px; font-size: 13px; height: 28px; float: left; display: inline-block; line-height: 30px;
													border-left: 1px solid #B2B2B2; border-top: 1px solid #B2B2B2; border-right: 1px solid #B2B2B2;}
div#content-wrapper div#tbl-header span:first-child {width: 80px; font-size: 13px; height: 28px; float: left; display: inline-block; line-height: 30px;
													margin-left: 20px; background-color: white; border-left: 1px solid #B2B2B2; border-top: 1px solid #B2B2B2;}

div#content-wrapper div#tbl-wrapper {width: 96%; padding: 2%; border: 1px solid #B2B2B2; height: 100%}

div#tbl-wrapper table#tbl-info  {border-collapse:collapse; border: 1px solid #B2B2B2; border-spacing:0; width: 100%; height: 300px;}
div#tbl-wrapper table#tbl-info td{font-size:13px; border: 1px solid #B2B2B2; overflow:hidden;word-break:normal; height: 22px; padding: 4px;}
div#tbl-wrapper table#tbl-info th{font-size:13px;font-weight:normal;padding:0 20px; border: 1px solid #B2B2B2; overflow:hidden;word-break:normal; height: 30px;}
div#tbl-wrapper table#tbl-info .tg-lqy6{text-align:right;vertical-align:middle; background-color: #F9F9F9;}
div#tbl-wrapper table#tbl-info .tg-0lax{text-align:left;vertical-align:middle;}
div#tbl-wrapper table#tbl-info input[type='text']{display: none; width: 99%;  height: 16px}
div#tbl-wrapper table#tbl-info input[name='zipCode']{display: none; width: 20%;  height: 16px; float: left;}
div#tbl-wrapper table#tbl-info div#zip-btn {width: 53px; height:18px; border: 1px black solid; margin: 0 5px; padding: 0 10px; cursor: pointer; float: left;}

div#tree-mini {width: 37.8%; background-color: white; border: 0px; height: 400px;
vertical-align: top; float: left; padding: 1%; min-height: 400px; overflow-y:auto;
border-top: 1px solid #B2B2B2; border-bottom: 1px solid #B2B2B2; border-left: 1px solid #B2B2B2;}
div.tree li>span {float: left;}

.update-unit{ display: none;}

.over-span{
	background-color: #92B5DF;
}


</style>
<script type="text/javascript">
var contextPath = "${pageContext.servletContext.contextPath }";

var child = "<img class='tree-icon' src='"+contextPath+"/assets/images/child.png'>";
var lastChild = "<img class='tree-icon last' src='"+contextPath+"/assets/images/last_child.png'>";
var noChildIcon = "<img class='navi-icon' style='padding-left: 4px;' src='"+contextPath+"/assets/images/dept_end.png'>";
var toggleBtn = "<img class='open-btn close' src='"+contextPath+"/assets/images/openbtn.png'>"
				+ "<img class='close-btn open' src='"+contextPath+"/assets/images/closebtn.png'>";
var icon = "<img class='navi-icon open' src='"+contextPath+"/assets/images/open.png'>"+
			"<img class='navi-icon close' src='"+contextPath+"/assets/images/close.png'>";
var depth = "<img class='tree-icon depth' src='"+contextPath+"/assets/images/depth.png'>";

var defaultComp = function() {
	var compSeq = $("#compSelect option:selected").val();
	var compName = $("#compSelect option:selected").text();
	var htmls = "<li class='comp' c-no='"+compSeq+"'><img class='navi-icon' src='${pageContext.servletContext.contextPath }/assets/images/comp.png'>"
			+ "<span>"+ compName + "</span><img class='add-icon' style='display:inline;' data-no='"+compSeq+"' src='"+contextPath+"/assets/images/add2.png'>"
			+ "</li><ul c-no='"+compSeq+"'></ul>";
	$("div#tree-mini ul").children().remove();
	$("div#tree-mini ul").append(htmls);
	$("input[name='compSeq']").val(compSeq);
}

var getBizInfo = function(seq) {
	$.ajax({
		url : contextPath + "/admin/getBizInfo/" + seq,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			$("#tbl-info input[type='text']:not(.dept)").each(function(index, item){
				for(var key in response.data){
					if($(item).attr('name') == key){
						if(response.data[key] == null) {
							response.data[key] = "";
						}
						$(item).val(response.data[key]);
						if(key == 'useYn'){
							$("input[data-id='"+response.data[key]+"']").prop("checked",true);
						}
					}
				}
			});
			$("input[name='type']").val("사업장");
			
			$("#tbl-info span#parentSeq").text(response.data.compSeq);
			$("#tbl-info span#seq").text(response.data.bizSeq);
			$("#tbl-info span#type").text("사업장"); 
			$("#tbl-info span#name").text(response.data.bizName);
			$("#tbl-info span#nameEn").text(response.data.bizNameEn);
			$("#tbl-info span#nickname").text(response.data.bizNickname);
			$("#tbl-info span#useYn").text(response.data.useYn);
			$("#tbl-info span#orderNum").text(response.data.orderNum);
			$("#tbl-info span#zipCode").text(response.data.zipCode);
			$("#tbl-info span#addr").text(response.data.addr);
			$("#tbl-info span#detailAddr").text(response.data.detailAddr);
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}

var getDeptInfo = function(seq) {
	$.ajax({
		url : contextPath + "/admin/getDeptInfo/" + seq,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			$("#tbl-info input[type='text']:not(.biz)").each(function(index, item){
				for(var key in response.data){
					if($(item).attr('name') == key){
						if(response.data[key] == null) {
							response.data[key] = "";
						}
						$(item).val(response.data[key]);
						if(key == 'useYn'){
							$("input[data-id='"+response.data[key]+"']").prop("checked",true);
						}
					}
				}
			});
			$("input[name='type']").val("부서");
			
			$("#tbl-info span#parentSeq").text(response.data.parentDeptSeq);
			$("#tbl-info span#seq").text(response.data.deptSeq);
			$("#tbl-info span#type").text("부서"); 
			$("#tbl-info span#name").text(response.data.deptName);
			$("#tbl-info span#nameEn").text(response.data.deptNameEn);
			$("#tbl-info span#nickname").text(response.data.deptNickname);
			$("#tbl-info span#useYn").text(response.data.useYn);
			$("#tbl-info span#orderNum").text(response.data.orderNum);
			$("#tbl-info span#zipCode").text(response.data.zipCode);
			$("#tbl-info span#addr").text(response.data.addr);
			$("#tbl-info span#detailAddr").text(response.data.detailAddr);
			
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}

var insertBiz = function() {
	var formData = $("#dept-form").serialize();
	$.ajax({
		url : contextPath + "/admin/insertBiz/",
		type : "post",
		dataType : "json",
		data : formData,
		async : false,
		success : function(response) {
			var index = sortChild(response.data.bizName, response.data.compSeq, "comp");
			bizAddRender(response.data, index, false);
			$("#tree-mini li[data-no='"+response.data.bizSeq+"'] span").trigger("click");
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}

var insertDept = function() {
	var formData = $("#dept-form").serialize();
	$.ajax({
		url : contextPath + "/admin/insertDept/",
		type : "post",
		dataType : "json",
		data : formData,
		async : false,
		success : function(response) {
			var index = sortChild(response.data.deptName, response.data.parentDeptSeq, null);
			var str = "";
			if(parseInt(response.data.parentDeptSeq) < 10000000 ){
				str = $("#tree-mini li[data-no='"+response.data.parentDeptSeq+"'] div.prev").html();
			}
			var last = true;
			if ($("#tree-mini li[data-no='"+response.data.parentDeptSeq+"']").next().next().length > 0) {
				last = false;
			}else{
				last = true;
			}
			deptAddRender(response.data, index, last, str);
			if(index != "last"){
				$("#tree-mini li[data-no='" + index + "']").
				children('.wrap').prepend(lastChild).children('img.tree-icon:not(.last)').remove();
			}
			$("#tree-mini li[data-no='"+response.data.deptSeq+"'] span").trigger("click");
			
			if($("#tree-mini li[data-no='"+response.data.parentDeptSeq+"'] img.open-btn").length == 0){
				$("#tree-mini li[data-no='"+response.data.parentDeptSeq+"'] div.wrap>img:first-child").after(toggleBtn);
// 				.children().append(icon).children().first().remove();
				$("#tree-mini li[data-no='"+response.data.parentDeptSeq+"'] div.li-div>img:first-child").after(icon).remove();
				$("#tree-mini li[data-no='"+response.data.parentDeptSeq+"'] div.wrap img.open").show();
				$("#tree-mini li[data-no='"+response.data.parentDeptSeq+"'] div.wrap img.close").hide();
				
			}
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}
///////////////////////////////////////

var deptAddRender = function(vo, index, last, str) {
	var btn = "";
	var space = "";
	var imgIcon = "";
	var depth = "<img class='tree-icon depth' src='"+contextPath+"/assets/images/depth.png'>";
	var tree = "";

	if (mainLangCode == 'kr') {
		var deptName = vo.deptName;
	} else {
		var deptName = vo.deptNameEn;
	}

	if (last) {
		depth = "";
		space = "<div class='space'></div>";
	}

	if (index == "last") {
		tree += lastChild;
	} else {
		tree = child;
	}

	if (vo.childCount > 0) {
		btn = "<img class='open-btn close' src='"+contextPath+"/assets/images/openbtn.png'>"
				+ "<img class='close-btn open' src='"+contextPath+"/assets/images/closebtn.png'>";
		imgIcon = icon;
	}else{
		imgIcon = noChildIcon;
	}

	var htmls = "<li class='child dept' data-no='"+vo.deptSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parentDeptSeq+"'>"
			+ "<div class='prev'>"+ depth + space + "</div><div class='wrap'>"+tree+btn
			+ "<div class='li-div' draggable='true'>" + imgIcon + "<span class='dept' data-lang='"+vo.deptSeq+"'>"
			+ deptName + "</span></div></div>"
			+ "<img class='add-icon' data-no='"+vo.deptSeq+"' src='"+contextPath+"/assets/images/add2.png'>"
			+"</li><ul d-no='"+vo.deptSeq+"'></ul>";

	if (index == "last") {
		if (parseInt(vo.parentDeptSeq) < 10000000) {
			console.log("1");
			$("#tree-mini ul[d-no='" + vo.parentDeptSeq + "']").append(htmls);
			$("#tree-mini li[data-no='" + vo.deptSeq + "'] div.prev").prepend(str);
		} else {
			console.log("2");
			$("#tree-mini ul[b-no='" + vo.parentDeptSeq + "']").append(htmls);
		}
	} else {
		console.log("3");
		$("#tree-mini li.child[data-no='" + index + "']").before(htmls);
		$("#tree-mini li[data-no='" + vo.deptSeq + "'] div.prev").prepend(str);
	}

	if ($("#tree-mini li[data-no='" + vo.deptSeq + "'] img.last").length != 0) {
		$("#tree-mini li[data-no='" + vo.deptSeq + "']").prev().prev().
		children('.wrap').prepend(child).children('img.last').remove();
	}
}

var bizAddRender = function(vo, index, str) {
	var btn = "";
	var space = "";
	var imgIcon = "";
	var depth = "<img class='tree-icon depth' src='"+contextPath+"/assets/images/depth.png'>";
	var tree = "";

	if (mainLangCode == 'kr') {
		var bizName = vo.bizName;
	} else {
		var bizName = vo.bizNameEn;
	}

	if (index == "last") {
		tree += lastChild;
	} else {
		tree = child;
	}

	if (vo.childCount > 0) {
		btn = "<img class='open-btn close' src='"+contextPath+"/assets/images/openbtn.png'>"
				+ "<img class='close-btn open' src='"+contextPath+"/assets/images/closebtn.png'>";
		imgIcon = icon;
	}else{
		imgIcon = noChildIcon;
	}

	var htmls = "<li class='child biz' data-no='"+vo.bizSeq+"'>"
			+ "<div class='prev'>"+ space + "</div><div class='wrap'>"+tree+btn
			+ "<div class='li-div' draggable='true'>" + imgIcon + "<span class='biz' data-lang='"+vo.bizSeq+"'>"
			+ bizName + "</span></div></div>"
			+ "<img class='add-icon' data-no='"+vo.bizSeq+"' src='"+contextPath+"/assets/images/add2.png'>"
			+ "</li><ul b-no='"+vo.bizSeq+"'></ul>";

	if (index == "last"){
		$("#tree-mini ul[c-no='" + vo.compSeq + "']").append(htmls);
	}else{
		$("#tree-mini li.child[data-no='" + index + "']").before(htmls);
		$("#tree-mini ul[c-no='" + vo.compSeq + "']>li.child:last").
		children('.wrap').prepend(lastChild).children('img.tree-icon:not(.last)').remove();
	}
	
// 	if ($("#tree-mini li[data-no='" + vo.bizSeq + "'] img.last").length != 0) {
// 		$("#tree-mini li[data-no='" + vo.bizSeq + "']").prev().prev().
// 		children('.wrap').prepend(child).children('img.last').remove();
// 	}
}

var updateParentDept = function(deptSeq, parentDeptSeq, prevParent) {
	$.ajax({
		url : contextPath + "/admin/updateParentDept?deptSeq=" + deptSeq
				+ "&parentDeptSeq=" + parentDeptSeq,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			var parent = $("#tree-mini li.child[data-no='" + parentDeptSeq
					+ "']");
			var index = sortChild($("#tree-mini span[data-lang='"+deptSeq+"']").text(), parentDeptSeq);
			var str = $(parent).children(".prev").html();
			var activeSpan = false;
			if($("#tree-mini li.child[data-no='"+deptSeq+"'] div.active-span").length > 0){
				activeSpan = true;
			};
			
			if($("#tree-mini li[data-no='" + parentDeptSeq + "']").next().children().length == 0 && 
					$("#tree-mini li[data-no='" + parentDeptSeq + "'] img.close-btn").css("display") != "none"){
				$("#tree-mini li[data-no='" + parentDeptSeq + "'] div.wrap div.li-div img.navi-icon").remove();
				$("#tree-mini li[data-no='" + parentDeptSeq + "'] div.li-div").prepend(icon);
				$("#tree-mini li[data-no='" + parentDeptSeq + "'] div.wrap").prepend(toggleBtn);
				$("#tree-mini li[data-no='" + parentDeptSeq + "'] img.open-btn").css("display","none");
				$("#tree-mini li[data-no='" + parentDeptSeq + "'] img.close-btn").css("display","inline");
			}
			
			if ($("#tree-mini li[data-no='" + deptSeq + "'] img.last").length != 0) {
				$("#tree-mini li[data-no='" + deptSeq + "']").prev().prev()
				.children('.wrap').prepend(lastChild).children('img.tree-icon').not('img.last').remove();
			}

			$("#tree-mini li[data-no='" + deptSeq + "']").remove();
			$("#tree-mini ul[d-no='" + deptSeq + "']").remove();
			
			if($(parent).children('.wrap').children('.close-btn').css("display") == "none"){
				$("li[data-no='"+parentDeptSeq+"'] img.open-btn").trigger("click");
			}else{
				if ($(parent).next().next().length > 0) {
					deptAddRender(response.data, index, false, str);
				} else {
					deptAddRender(response.data, index, true, str);
				}
			}
			
			if(activeSpan){
				$("#tree-mini li.child[data-no='"+deptSeq+"'] div.wrap").addClass("active-span");
			}
			
			// 부서 이동 후 이동 전 부모의 자식이 없으면 오픈 버튼 없애고 폴더 색상 변경
			if($("#tree-mini li[data-no='" + prevParent + "']").next().children().length == 0){
				$("#tree-mini li[data-no='" + prevParent + "'] img.open").remove();
				$("#tree-mini li[data-no='" + prevParent + "'] img.close").remove();
				$("#tree-mini li[data-no='" + prevParent + "'] div.li-div").prepend(noChildIcon);
			}
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}

function sortChild(dept, parent, comp) {
	var nextSeq = "last";
	var attr = "";
	if (parent > 10000000) {
		attr = "b-no";
	}else if(comp != null){
		attr = "c-no";
	}else {
		attr = "d-no";
	}
	var childs = $("#tree-mini ul[" + attr + "='" + parent + "']")
			.children('li.child').children("div.wrap").children(
					"div.li-div").children("span");
	$(childs).each(function(index) {
		if(dept < $(this).text()){
			nextSeq = $(this).data('lang');
			return false;
		}
		
		//부서명이 테스트이기때문에 부서뒤 숫자만 잘라서 비교
// 		var deptNum = $("#tree-mini span[data-lang='" + dept + "']").text();
// 		var indexNum = $(this).text();
// 		if ((deptNum.substring(2, 4) * 1) < (indexNum.substring(2, 4) * 1)) {
// 			nextSeq = $(this).data('lang');
// 			return false;
// 		} else if (deptNum.substring(2, 4) == indexNum.substring(2, 4)) {
// 			if ((deptNum.substring(5,7) * 1) < (indexNum.substring(5,7) * 1)) {
// 				nextSeq = $(this).data('lang');
// 				return false;
// 			}
// 		}
	});

	return nextSeq;
}

function treeDropDown() {
	var dept = "";
	var parent = "";
	
	$(document).on("dragstart", "div#tree-mini li.dept div.li-div", function(e) {
// 		e.stopPropagation();
// 		e.preventDefault();
		dept = "";
		dept = $(this).parent().parent().data("no");
	});

	$(document).on("dragover", "div#tree-mini li[data-no!='"+dept+"'] div.wrap", function(e) {
		if($(this).parent().data("no")==dept){
			return;
		}
		var seq = $(this).parent().data("no");
		if($("div#tree-mini ul[d-no='"+dept+"'] li[data-no='"+seq+"']").length > 0){
			return;
		}
		e.stopPropagation();
		e.preventDefault();
		$(this).addClass("over-span");
	});

	$(document).on("dragleave", "div#tree-mini li[data-no!='"+dept+"'] div.wrap", function(e) {
		if($(this).parent().data("no")==dept){
			return false;
		}
		e.stopPropagation();
		e.preventDefault();

		$(this).removeClass("over-span");
	});

	$(document).on("drop", "div#tree-mini li[data-no!='"+dept+"'] div.li-div", function(e) {
		parent = "";
		parent = $(this).parent().parent().data("no");
	
		var prevParent = $("li[data-no='"+dept+"']").parent().prev().data("no");
		
		e.stopPropagation();
		e.preventDefault();
		
		var seq = $(this).parent().data("no");
		if($("div#tree-mini ul[d-no='"+dept+"'] li[data-no='"+seq+"']").length > 0){
			return;
		}
		
		if(parent != dept && parent != prevParent){
			updateParentDept(dept, parent, prevParent);
		}
	});

	$(document).on("dragend", "div#tree-mini div.li-div", function(e) {
		if($(this).parent().data("no")==dept){
			return;
		}
		e.stopPropagation();
		e.preventDefault();

		$("div#tree-mini div.wrap").removeClass("over-span");
		;
	});

	// 	dropZone.on('dragenter',function(e){
	// 		e.stopPropagation();
	// 		e.preventDefault();

	// 		dropZone.css('background-color', '#E3F3FC');
	// 	});
}

$(function() {

	treeDropDown();

	defaultComp();

	$("#compSelect").change(function() {
		defaultComp();
	});

	$(document).on("click", "#tree-mini li.child span", function(event) {
		$(".update-unit").hide();
		$(".default-unit").show();
		$("#tree-mini div.wrap").removeClass("active-span");
		$(this).parent().parent().addClass("active-span");
		$parent = $(this).parent().parent().parent();
		var seq = $parent.attr("data-no");
		$("#tbl-info span").text("");
		
		if (seq > 10000000) {
			getBizInfo(seq);
		} else {
			getDeptInfo(seq);
		}
		
		if($("div.update").css("display") == "none"){
			if($("#tree-mini li div.active-span").parent().data("no") > 10000000){
				console.log('사업장');
				$("#tbl-info input:not(.dept)").show();
				$("#tbl-info input.dept").hide();
			}else{
				console.log("부서");
				$("#tbl-info input:not(.biz)").show();
				$("#tbl-info input.biz").hide();
			}
		}
		
		if($("li:not(.comp) img.add-icon").is(":visible") == false){
			$("#tbl-info span").show();
			$("#tbl-info input").hide();
			$("#tbl-info .update-unit").hide();
		}
		
		$("li:not(.comp) img.add-icon").css("display","none");
		$("img.add-icon[data-no='"+seq+"']").css("display","inline");
		$("li.comp img.add-icon").css("display","inline");
	});
	
	$(document).on("click", "img.add-icon", function(event) {
		var seq = $(this).data("no");
		$("#tbl-info span").hide();
		$(".default-unit").hide();
// 		$("#tbl-info input").val("").show();
		$(".update-unit").show();
		$("img.add-icon").hide();
		$("#tree-mini div.wrap").removeClass("active-span");
		
		$("#tbl-info input[type='radio']").show();
		$("#tbl-info input[type='radio']:first").prop("checked", true);
		if($(this).parent('.comp').length == 1){
			$("#tbl-info input[type='text']:not(.dept)").val("").show();
			$("#tbl-info input[name='compSeq']").val(seq);
			$("#tbl-info input[name='type']").val("사업장");
			
			if($("ul[c-no='"+seq+"']>li").length == 0){
				$("li[c-no='"+seq+"'] span").trigger("click");
			}

			if($("ul[c-no='"+seq+"']>li").length > 0){
				$("ul[c-no='"+seq+"']>li:last img.last").remove();
				$("ul[c-no='"+seq+"']>li:last div.wrap").prepend(child);
			}
			var str = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			var html = "<li class='child biz incompl'><div class='wrap'>"+lastChild+"<div class='li-div'>"+noChildIcon
						+ "<span class='biz'>"+str+"</span></div></div></li>";
			$("ul[c-no='"+seq+"']").append(html);
			$("li.incompl div.wrap").addClass("active-span");
		}else{
			var no = "";
			var prev = "";
			if(seq > 10000000){
				no = "b-no";
			}else{
				no = "d-no";
			}
			$("#tbl-info input[type='text']:not(.biz)").val("").show();
			$("#tbl-info input[name='parentDeptSeq']").val(seq);
			$("#tbl-info input[name='type']").val("부서");
			
			if($("#tree-mini ul["+no+"='"+seq+"']>li").length == 0 && $("#tree-mini li[data-no='"+seq+"'] img.open-btn").length > 0){
				$("li[data-no='"+seq+"'] img.open-btn").trigger("click");
			}
			if($("ul["+no+"='"+seq+"']>li").length > 0){
				prev = $("ul["+no+"='"+seq+"']>li:last div.prev").html();
				$("ul["+no+"='"+seq+"']>li:last img.last").remove();
				$("ul["+no+"='"+seq+"']>li:last div.wrap").prepend(child);
			}else{
				if($("li[data-no='"+seq+"'] div.prev").length == 0){
					if($("li[data-no='"+seq+"'] img.last").length == 1){
						prev = "<div class='space'></div>";
					}else{
						prev = depth;
					}
				}else{
					prev = $("li[data-no='"+seq+"'] div.prev").html();
					if($("li[data-no='"+seq+"'] img.last").length == 1){
						prev += "<div class='space'></div>";
					}else{
						prev += depth;
					}
				}
			}
			var str = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			var html = "<li class='child dept incompl'><div class='prev'>"+prev+"</div><div class='wrap'>"
						+lastChild+"<div class='li-div'>"+noChildIcon+"<span class='dept'>"+str+"</span></div></div></li>";
			$("ul["+no+"='"+seq+"']").append(html);
			$("li.incompl div.wrap").addClass("active-span");
		}
		
	});
	
	$("div.update").click(function(){
		if($("#tree-mini li div.active-span").length == 0){
			alert("부서를 선택해주세요.");
			return;
		}
		
		if($("#tree-mini li div.active-span").parent().data("no") > 10000000){
			$("#tbl-info input:not(.dept)").show();
		}else{
			$("#tbl-info input:not(.biz)").show();
		}
		
		$("#tbl-info span").hide();
		$(".head-btn").hide();
		$(".update-unit").show();
	});
	
	$("div.cancel").click(function(){
		$("#tbl-info input").hide();
		$("#tbl-info span").show();
		$(".update-unit").hide();
		$(".default-unit").show();
	});
	
	$("div.save").click(function(){
		if($("li.incompl").length > 0){
			if($("li.incompl").hasClass("biz") === true){
				insertBiz();
			}else{
				insertDept();
			}
			$("li.incompl").remove();
		}
		
		$(".update-unit").hide();
		$(".default-unit").show();
	});
});
</script>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
		<div id="wrapper">
			<div id="contents">
				<div id="contents-header" draggable='true'>
					<img class="home" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/home.png">
					<img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>시스템설정</span> <img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>회사/조직관리</span> <img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>조직도정보관리</span>
				</div>
				<div id="select-bar">
					<span>회사선택</span>
					<select id="compSelect">
						<c:forEach items="${compList }" var="vo">
							<option value="${vo.compSeq }">${vo.compName }
						</c:forEach>
					</select>
					
					<span>부서명</span>
					<input type="text" value="검색">
					<span>사용여부</span>
					<select>
						<option>전체
						<option>사용함
						<option>사용안함
					</select>
				</div>
				<div class="content-head-wrapper">
					<span>* 부서정보</span>
<!-- 					<input type="checkbox">사업장 숨김 -->
					<div class="head-btn cancel update-unit">취소</div>
					<div class="head-btn save update-unit">저장</div>
					<div class="head-btn delete default-unit">삭제</div>
					<div class="head-btn update default-unit">수정</div>
					<div class="head-btn create default-unit">신규</div>
				</div>
				<div id="content-wrapper">
					<div id="tree-mini" class="tree">
						<ul>
						
						</ul>
					</div>
					<div id="tbl-content">
						<div id="tbl-header">
							<span>기본정보</span><span>부서원정보</span>
						</div>
						<div id="tbl-wrapper">
							<form id="dept-form">
							<table id="tbl-info" class="tg" style="table-layout: fixed; ">
								<colgroup>
									<col style="width: 90px">
									<col style="width: 74px">
									<col style="width: 195px">
								</colgroup>
								<tr>
									<td class="tg-lqy6">
										<img class="mini-icon" alt="" src="${pageContext.servletContext.contextPath }/assets/images/check2.png">
										상위부서
									</td>
									<td class="tg-0lax" colspan="2">
										<span id="parentSeq"></span>
										<input class='dept' type="text" name='parentDeptSeq'>
										<input class='biz' type="text" name='compSeq' >
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">유형</td>
									<td class="tg-0lax" colspan="2">
										<span id="type"></span>
										<input type="text" name='type' disabled="disabled">
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">
										<img class="mini-icon" alt="" src="${pageContext.servletContext.contextPath }/assets/images/check2.png">
										부서코드
									</td>
									<td class="tg-0lax" colspan="2">
										<span id="seq"></span>
										<input class='dept' type="text" name='deptSeq'>
										<input class='biz' type="text" name='bizSeq'>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6" rowspan="4">
										<img class="mini-icon" alt="" src="${pageContext.servletContext.contextPath }/assets/images/check2.png">
										부서명
									</td>
									<td class="tg-lqy6">
										<img class="mini-icon" alt="" src="${pageContext.servletContext.contextPath }/assets/images/check2.png">
										한국어
									</td>
									<td class="tg-0lax">
										<span id="name"></span>
										<input class='dept' type="text" name='deptName'>
										<input class='biz' type="text" name='bizName'>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">영어</td>
									<td class="tg-0lax">
										<span id="nameEn"></span>
										<input class='dept' type="text" name='deptNameEn'>
										<input class='biz' type="text" name='bizNameEn'>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">일본어</td>
									<td class="tg-0lax">
										<span id="nameJp"></span>
										<input class='dept' type="text" name='deptNameJp'>
										<input class='biz' type="text" name='bizNameJp'>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">중국어</td>
									<td class="tg-0lax">
										<span id="nameCn"></span>
										<input class='dept' type="text" name='deptNameCn'>
										<input class='biz' type="text" name='bizNameCn'>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">부서약칭</td>
									<td class="tg-0lax" colspan="2">
										<span id="nickname"></span>
										<input class='dept' type="text" name='deptNickname'>
										<input class='biz' type="text" name='bizNickname'>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">사용여부</td>
									<td class="tg-0lax" colspan="2">
										<span id="useYn"></span>
										<div class="update-unit">
											<input type="radio" data-id="사용" name="useYn"  value="Y">사용
											<input type="radio" data-id="미사용" name="useYn"  value="N">미사용
										</div>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">정렬</td>
									<td class="tg-0lax" colspan="2">
										<span id="orderNum"></span>
										<input type="text" name='orderNum'>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6" rowspan="3">주소</td>
									<td class="tg-0lax" colspan="2">
										<span id="zipCode"></span>
										<input type="text" name='zipCode'>
										<div id="zip-btn" onclick="postcode()" class="head-btn update-unit">우편번호</div>
									</td>
								</tr>
								<tr>
									<td class="tg-0lax" colspan="2">
										<span id="addr"></span>
										<input type="text" name='addr'>
									</td>
								</tr>
								<tr>
									<td class="tg-0lax" colspan="2">
										<span id="detailAddr"></span>
										<input type="text" name='detailAddr' placeholder="상세주소입력">
									</td>
								</tr>
							</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
		</div>
		<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
	</div>
</body>
</html>