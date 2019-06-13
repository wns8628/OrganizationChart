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

#select-bar{
	padding:10px;
	padding-left:15px;
}
.select-dept{
    display: inline;
    padding-left: 12px;
    margin-left: 372px;
    padding-right: 12px;
    padding-top: 2px;
    padding-bottom: 2px;
    margin-top: 5px;
    background-color:white;
	border:1px solid lightgrey;
}

*            { margin:0; padding:0 }
body         { font:0.75em "맑은 고딕", 돋움, 굴림; color:#111; min-width: 400px;}
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

div#tree-mini {
width: 400px; background-color: white; border: 0px; height: 400px;
vertical-align: top; float: left; padding: 1%; min-height: 400px; overflow-y:auto;
border: 1px solid #B2B2B2;
margin-left:15px;
}
div.tree li>span {float: left;}

.update-unit{ display: none;}

.over-span{
	background-color: #92B5DF;
}

.select-dept{
	display:none;
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
			+ "<span>"+ compName + "</span>"
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
					if(response.data[key] == null) {
						response.data[key] = "";
					}
					if($(item).attr('name') == key){
						$(item).val(response.data[key]);
					}
				}
			});
			$("input[data-id='"+response.data['useYn']+"']").prop("checked",true);
			
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
					if(response.data[key] == null) {
						response.data[key] = "";
					}
					if($(item).attr('name') == key){
						$(item).val(response.data[key]);
					}
				}
			});
			
			$("input[data-id='"+response.data['useYn']+"']").prop("checked",true);
			
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

var updateBiz = function(){
	var formData = $("#dept-form").serialize();
	$.ajax({
		url : contextPath + "/admin/updateBiz",
		type : "post",
		dataType : "json",
		data : formData,
		async : false,
		success : function(response) {
			$("#tbl-info input[type='text']:not(.dept)").each(function(index, item){
				for(var key in response.data){
					if(response.data[key] == null) {
						response.data[key] = "";
					}
					if($(item).attr('name') == key){
						$(item).val(response.data[key]);
					}
				}
			});
			$("input[data-id='"+response.data['useYn']+"']").prop("checked",true);
			
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
			
			$("#tbl-info span").show();
			$("#tbl-info input").hide();
			
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}

var updateDept = function(){
	var formData = $("#dept-form").serialize();
	$.ajax({
		url : contextPath + "/admin/updateDept",
		type : "post",
		dataType : "json",
		data : formData,
		async : false,
		success : function(response) {
			$("#tbl-info input[type='text']:not(.biz)").each(function(index, item){
				for(var key in response.data){
					if(response.data[key] == null) {
						response.data[key] = "";
					}
					if($(item).attr('name') == key){
						$(item).val(response.data[key]);
					}
				}
			});
			$("input[data-id='"+response.data['useYn']+"']").prop("checked",true);
			
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
			
			$("#tbl-info span").show();
			$("#tbl-info input").hide();
			
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
			+"</li><ul d-no='"+vo.deptSeq+"'></ul>";

	if (index == "last") {
		if (parseInt(vo.parentDeptSeq) < 10000000) {
			$("#tree-mini ul[d-no='" + vo.parentDeptSeq + "']").append(htmls);
			$("#tree-mini li[data-no='" + vo.deptSeq + "'] div.prev").prepend(str);
		} else {
			$("#tree-mini ul[b-no='" + vo.parentDeptSeq + "']").append(htmls);
		}
	} else {
		$("#tree-mini li.child[data-no='" + index + "']").before(htmls);
		$("#tree-mini li[data-no='" + vo.deptSeq + "'] div.prev").prepend(str);
	}

// 	if ($("#tree-mini li[data-no='" + vo.deptSeq + "'] img.last").length != 0) {
// 		$("#tree-mini li[data-no='" + vo.deptSeq + "']").prev().prev().
// 		children('.wrap').prepend(child).children('img.last').remove();
// 	}
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
			/* 
			$("#tree-mini li.child[data-no='"+deptSeq+"'] img.add-icon").show(); 
			*/
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

var incomplRemove = function(trigger){
	if($("li.incompl").length > 0){
		if($("li.incompl").prev().prev().length > 0){
			$("li.incompl").prev().prev().find("div.wrap").children("img.tree-icon").remove();
			$("li.incompl").prev().prev().find("div.wrap").prepend(lastChild);
		}
		
		if(trigger){
			$("li.incompl").parent().prev().find("span").trigger("click");
		}
		
		$("li.incompl").remove();
	}
}

function seqCheck(seq){
	var seqList;
	$.ajax({
		url : contextPath + "/admin/seqCheck/"+seq,
		type : "get",
		dataType : "json",
		data : "",
		async : false,
		success : function(response) {
			seqList = response.data;
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
	return seqList;
}


var selectDeptSeq;
var selectDeptName;
$(function() {

	treeDropDown();

	defaultComp();

	$("#compSelect").change(function() {
		defaultComp();
	});
	
	$("input.seq").focusout(function(){
		var seqList = seqCheck($(this).val());
		if(seqList[0] != null || seqList[1] != null){
			console.log(seqList[0]);
			console.log(seqList[1]);
			alert("부서코드는 중복될 수 없습니다.");
			$(this).val("").focus();
		}
	});
	
	
	
	//부서선택시
	$(document).on("click", ".select-dept", function(event) {

		//bizseq 가져오기
		$.ajax({
			url : contextPath + "/adminConnectDeptEmp/getBizSeq?deptSeq="+selectDeptSeq,
			type : "get",
			dataType : "json",
			data : "",
			async : false,
			success : function(response) {
				console.log(response.data)
				$(opener.document).find('.detail-dept-text').attr("data-lang-biz",response.data);
			},
			error : function(xhr, status, e) {
				console.error(status + ":" + e);
			}
		});
	
		$(opener.document).find('.detail-dept-text').val(selectDeptName);
		$(opener.document).find('.detail-dept-text').attr("data-lang",selectDeptSeq);
		
		$(opener.document).find('.modal').css("display","none");
		
		self.close();
		
	})
	
	$(window).bind("beforeunload", function (e){
		$(opener.document).find('.modal').css("display","none");		
	});

	
	//클릭시
	$(document).on("click", "#tree-mini li.child span", function(event) {
		
		console.log($(this).attr("data-lang"));
		//클릭시
		if(!($(this).attr("data-lang")>= 10000000)){
			$('.select-dept').css("display","inline");
			console.log($(this).html());
			
			selectDeptSeq = $(this).attr("data-lang");
			selectDeptName = $(this).html();			
		}else{
			$('.select-dept').css("display","none");
		}
		
		//
		
		incomplRemove(false);
		
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
				$("#tbl-info input:not(.dept)").show();
				$("#tbl-info input.dept").hide();
			}else{
				$("#tbl-info input:not(.biz)").show();
				$("#tbl-info input.biz").hide();
			}
		}else{
			$(".update-unit:not(input)").hide();
			$(".default-unit").show();
		}
		
		if($("li:not(.comp) img.add-icon").is(":visible") == false){
			$("#tbl-info span").show();
			$("#tbl-info input").hide();
			$("#tbl-info .update-unit").hide();
		}
	});
	
 	$(document).on("click", ".dept", function(key) {
	});

 
	
});
</script>
</head>
<body>
		<div id="select-bar">
			<span>회사 : </span>
			<select id="compSelect">
					<option value="${compSeq}">${compName}
			</select>
			
			부서를 선택하세요
		</div>
		
		<div id="tree-mini" class="tree">
			<ul>
			
			</ul>
		</div>
		<button class="select-dept">확인</button>
</body>
</html>