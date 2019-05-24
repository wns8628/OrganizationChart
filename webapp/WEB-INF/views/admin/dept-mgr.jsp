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
	href="${pageContext.servletContext.contextPath }/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/admin.js"></script>

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

div#tbl-wrapper table#tbl-info  {border-collapse:collapse; border: 1px solid #B2B2B2; border-spacing:0; width: 100%; height: 350px;}
div#tbl-wrapper table#tbl-info td{font-size:13px;padding:0 20px; border: 1px solid #B2B2B2; overflow:hidden;word-break:normal; height: 30px;}
div#tbl-wrapper table#tbl-info th{font-size:13px;font-weight:normal;padding:0 20px; border: 1px solid #B2B2B2; overflow:hidden;word-break:normal; height: 30px;}
div#tbl-wrapper table#tbl-info .tg-lqy6{text-align:right;vertical-align:top; background-color: #F9F9F9;}
div#tbl-wrapper table#tbl-info .tg-0lax{text-align:left;vertical-align:top}

div#tree-mini {width: 37.8%; background-color: white; border: 0px; height: 400px;
vertical-align: top; float: left; padding: 1%; min-height: 400px; overflow-y:auto;
border-top: 1px solid #B2B2B2; border-bottom: 1px solid #B2B2B2; border-left: 1px solid #B2B2B2;}
div.tree li>span {float: left;}

.over-span{
	background-color: #92B5DF;
}

</style>
<script type="text/javascript">
var contextPath = "${pageContext.servletContext.contextPath }";

var compRender = function() {
	var compSeq = $("#compSelect option:selected").val();
	var compName = $("#compSelect option:selected").text();
	var htmls = "<li class='comp' data-no='"+compSeq+"'><img class='navi-icon' src='${pageContext.servletContext.contextPath }/assets/images/comp.png'>"
			+ "<span>"
			+ compName
			+ "</span></li><ul c-no='"+compSeq+"'></ul>";
	$("div#tree-mini ul").children().remove();
	$("div#tree-mini ul").append(htmls);
}

var getBizInfo = function(seq) {
	$.ajax({
		url : contextPath + "/admin/getBizInfo/" + seq,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			for ( var key in response.data) {
				if (response.data[key] == null) {
					response.data[key] = "";
				}
			}
			$("#parentSeq").text(response.data.compSeq);
			$("#seq").text(response.data.bizSeq);
			$("#type").text("사업장");
			$("#name").text(response.data.bizName);
			$("#nameEn").text(response.data.bizNameEn);
			$("#nickname").text(response.data.bizNickname);
			$("#useYn").text(response.data.useYn);
			$("#orderNum").text(response.data.orderNum);
			$("#zipCode").text(response.data.zipCode);
			$("#addr").text(response.data.addr);
			$("#detailAddr").text(response.data.detailAddr);
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
			for ( var key in response.data) {
				if (response.data[key] == null) {
					response.data[key] = "";
				}
			}
			$("#parentSeq").text(response.data.parentDeptSeq);
			$("#seq").text(response.data.deptSeq);
			$("#type").text("부서");
			$("#name").text(response.data.deptName);
			$("#nameEn").text(response.data.deptNameEn);
			$("#nickname").text(response.data.deptNickname);
			$("#useYn").text(response.data.useYn);
			$("#orderNum").text(response.data.orderNum);
			$("#zipCode").text(response.data.zipCode);
			$("#addr").text(response.data.addr);
			$("#detailAddr").text(response.data.detailAddr);
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}

///////////////////////////////////////
var child = "<img class='tree-icon' src='"+contextPath+"/assets/images/child.png'>";
var lastChild = "<img class='tree-icon last' src='"+contextPath+"/assets/images/last_child.png'>";

var deptAddRender = function(vo, index, last, str) {
	var btn = "";
	var space = "";

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
				+ "<img class='close-btn open' src='"+contextPath+"/assets/images/closebtn.png'>"
	}

	var htmls = "<li class='child dept' data-no='"+vo.deptSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parentDeptSeq+"'>"
			+ "<div class='prev'>"
			+ depth
			+ space
			+ "</div><div class='wrap'>"
			+ tree
			+ btn
			+ "<div class='li-div' draggable='true'><img class='navi-icon open' src='"+contextPath+"/assets/images/open.png'>"
			+ "<img class='navi-icon close' src='"+contextPath+"/assets/images/close.png'>"
			+ "<span class='dept' data-lang='"+vo.deptSeq+"'>"
			+ deptName
			+ "</span></div></div></li><ul d-no='"+vo.deptSeq+"'></ul>";

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

	if ($("#tree-mini li[data-no='" + vo.deptSeq + "'] img.last").length != 0) {
		$("#tree-mini li[data-no='" + vo.deptSeq + "']").prev().prev().
		children('.wrap').prepend(child).children('img.last').remove();
	}
}

var updateParentDept = function(deptSeq, parentDeptSeq) {
	$.ajax({
		url : contextPath + "/admin/updateParentDept?deptSeq=" + deptSeq
				+ "&parentDeptSeq=" + parentDeptSeq,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			var parent = $("#tree-mini li.child[data-no='" + parentDeptSeq
					+ "']");
			var index = sortChild(deptSeq, parentDeptSeq);
			var str = $(parent).children(".prev").html();

			if ($("#tree-mini li[data-no='" + deptSeq + "'] img.last").length != 0) {
				$("#tree-mini li[data-no='" + deptSeq + "']").prev().prev()
				.children('.wrap').prepend(lastChild).children('img').not('img.last').remove();
			}

			$("#tree-mini li[data-no='" + deptSeq + "']").remove();
			$("#tree-mini ul[d-no='" + deptSeq + "']").remove();
			
			if($(parent).find('.close-btn').attr('display')=="none"){
				console.log("ddd");
			}
			
			if ($(parent).next().next().length > 0) {
				deptAddRender(response.data, index, false, str);
			} else {
				deptAddRender(response.data, index, true, str);
			}

		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}

function sortChild(dept, parent) {
	var nextSeq = "last";
	if (parent > 10000000) {
		var attr = "b-no"
	} else {
		var attr = "d-no"
	}
	var childs = $("#tree-mini ul[" + attr + "='" + parent + "']")
			.children('li.child').children("div.wrap").children(
					"div.li-div").children("span");
	$(childs)
			.each(
					function(index) {
						// 		if($("#tree-mini span[data-lang='"+dept+"']").text() < $(this).text()){
						// 		}
						//부서명이 테스트이기때문에 부서뒤 숫자만 잘라서 비교
						var deptNum = $(
								"#tree-mini span[data-lang='" + dept + "']")
								.text();
						var indexNum = $(this).text();
						if ((deptNum.substring(2, 3) * 1) < (indexNum
								.substring(2, 3) * 1)) {
							nextSeq = $(this).data('lang');
							return false;
						} else if (deptNum.substring(2, 3) == indexNum
								.substring(2, 3)) {
							if ((deptNum.substring(4) * 1) < (indexNum
									.substring(4) * 1)) {
								nextSeq = $(this).data('lang');
								return false;
							}
						}
					});

	return nextSeq;
}

function treeDropDown() {
	var dept = "";
	var parent = "";

	$(document).on("dragstart", "div#tree-mini div.li-div", function(e) {
// 		e.stopPropagation();
// 		e.preventDefault();
		dept = "";
		dept = $(this).parent().parent().data("no");
	});

	$(document).on("dragover", "div#tree-mini li[data-no!='"+dept+"'] div.wrap", function(e) {
		if($(this).parent().data("no")==dept){
			return false;
		}
		e.stopPropagation();
		e.preventDefault();
		console.log(dept);
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

		e.stopPropagation();
		e.preventDefault();
		
		if(parent!=dept){
			updateParentDept(dept, parent);
		}
	});

	$(document).on("dragend", "div#tree-mini div.li-div", function(e) {
		if($(this).parent().data("no")==dept){
			return false;
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

	compRender();

	$("#compSelect").change(function() {
		compRender();
	});

	$(document).on("click", "#tree-mini li.child span", function(event) {
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
					<input type="checkbox">사업장 숨김
					<div class="head-btn">일괄등록</div>
					<div class="head-btn">신규</div>
					<div class="head-btn">저장</div>
					<div class="head-btn">삭제</div>
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
							<table id="tbl-info" class="tg" style="table-layout: fixed; ">
								<colgroup>
									<col style="width: 90px">
									<col style="width: 74px">
									<col style="width: 195px">
								</colgroup>
								<tr>
									<th class="tg-lqy6">상위부서</th>
									<th class="tg-0lax" colspan="2">
										<span id="parentSeq"></span>
									</th>
								</tr>
								<tr>
									<td class="tg-lqy6">유형</td>
									<td class="tg-0lax" colspan="2">
										<span id="type"></span>
<!-- 										<select> -->
<!-- 											<option value="biz">사업장 -->
<!-- 											<option value="dept">부서 -->
<!-- 										</select> -->
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">부서코드</td>
									<td class="tg-0lax" colspan="2">
										<span id="seq"></span>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6" rowspan="4">부서명</td>
									<td class="tg-lqy6">한국어</td>
									<td class="tg-0lax">
										<span id="name"></span>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">영어</td>
									<td class="tg-0lax">
										<span id="nameEn"></span>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">일본어</td>
									<td class="tg-0lax"></td>
								</tr>
								<tr>
									<td class="tg-lqy6">중국어</td>
									<td class="tg-0lax"></td>
								</tr>
								<tr>
									<td class="tg-lqy6">부서약칭</td>
									<td class="tg-0lax" colspan="2">
										<span id="nickname"></span>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">사용여부</td>
									<td class="tg-0lax" colspan="2">
										<span id="useYn"></span>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">정렬</td>
									<td class="tg-0lax" colspan="2">
										<span id="orderNum"></span>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6" rowspan="3">주소</td>
									<td class="tg-0lax" colspan="2">
										<span id="zipCode"></span>
									</td>
								</tr>
								<tr>
									<td class="tg-0lax" colspan="2">
										<span id="addr"></span>
									</td>
								</tr>
								<tr>
									<td class="tg-0lax" colspan="2">
										<span id="detailAddr"></span>
									</td>
								</tr>
							</table>
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