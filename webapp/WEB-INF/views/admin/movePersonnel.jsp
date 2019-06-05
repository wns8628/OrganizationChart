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
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/admin.js"></script>
<style type="text/css">
div.content-head-wrapper div{ float: right;} 

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
div.tree div.li-div {padding: 2px 0;  display: inline-block;}
div.tree li>span {float: left;}
div#tree-move {width: 37.8%; background-color: white; border: 0px; height: 480px;
vertical-align: top; float: left; padding: 1%; min-height: 480px; overflow-y:auto;
border-top: 1px solid #B2B2B2; border-bottom: 1px solid #B2B2B2; border-left: 1px solid #B2B2B2;}
div.tree div.wrap {display: inline-block;}
div#wrapper { height: 662px; width: 1519.2;}

div#content-wrapper div#tbl-content { width: 57.9%; min-height: 480px; float: right; border: 1px solid #B2B2B2; padding: 1%;}

.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{padding:5px 5px; border:1px solid #B2B2B2; overflow:hidden;word-break:normal;}
.tg th{color:white; padding:5px 5px; border:1px solid #B2B2B2; ;overflow:hidden;word-break:normal; background-color: #A0C8F0;}
.tg .tg-0pky{border-color:inherit;text-align:center;vertical-align:middle;}
.tg .tg-0lax{text-align:center;vertical-align:middle;}

table#tbl-emplist { width: 100%; height: 100%; border-collapse:collapse; border: 1px solid #B2B2B2; border-spacing:0; }


.active-span{
	background-color: #BEEBFF;
}
</style>
<script type="text/javascript">
var contextPath = "${pageContext.servletContext.contextPath }";
var openWin;
function move_pop(list){
	openWin = window.open( contextPath+'/admin/movePopup/'+list, '조직도', 'width=550, height=350');
}

var empRender = function(vo){
	var htmls = "<tr><td class='tg-0lax'><input type='checkbox' value='"+vo.empSeq+"'></td><td class='tg-0lax'>"+vo.deptName+"</td>"
				+"<td class='tg-0lax'>"+vo.empName+"("+vo.loginId+")"+"</td><td class='tg-0lax'>"+vo.dutyCodeName+"</td>"
				+"<td class='tg-0lax'>"+vo.positionCodeName+"</td><td class='tg-0lax'>"+vo.workStatus+"</td></tr>";
	
	$("#tbl-emplist").append(htmls);
}

var defaultComp = function() {
	var compSeq = $("#compSelect option:selected").val();
	var compName = $("#compSelect option:selected").text();
	var htmls = "<li class='comp' c-no='"+compSeq+"'><img class='navi-icon' src='${pageContext.servletContext.contextPath }/assets/images/comp.png'>"
			+ "<span>"+ compName + "</li><ul c-no='"+compSeq+"'></ul>";
	$("div.tree ul").children().remove();
	$("div.tree ul").append(htmls);
	$("input[name='compSeq']").val(compSeq);
	$("li.comp span").trigger("click");
}

var getEmpListByDeptSeq = function(deptSeq, sortType){
	$.ajax({
		url : contextPath + "/admin/getEmpListByDeptSeq/" + deptSeq +"?sortType="+sortType,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			$("#tbl-emplist tr:not(:first-child)").remove();
			
			if((response.data).length == 0 ){
				$("#tbl-emplist").append("<tr><td class='tg-0lax' colspan='6'>데이터가 존재하지 않습니다.</td></tr>");
			}else{
				$(response.data).each(function(index, vo){
					empRender(vo);
				});
			}
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}

$(function(){
	menuActive();
	defaultComp();
	
	$("#compSelect").change(function() {
		defaultComp();
		$("#tbl-emplist tr:not(:first-child)").remove();
		$("#tbl-emplist").append("<tr><td class='tg-0lax' colspan='6'>데이터가 존재하지 않습니다.</td></tr>");
	});
	
	$("#move-btn").click(function(){
		var seqList = [];
		if($("#tbl-emplist input[type='checkbox']").is(":checked")){
			$("#tbl-emplist input[type='checkbox']:checked").each(function(){
				seqList.push($(this).val());
			});
			var compSeq = $("li.comp").attr("c-no");
			move_pop(compSeq);
		}else{
			alert("사원을 선택해주세요.");
		}
	});
	
	$(document).on("click", "#tree-move li.dept span", function(event) {
		$("#tree-move div.wrap").removeClass("active-span");
		$(this).parent().parent().addClass("active-span");
		$parent = $(this).parent().parent().parent();
		var seq = $parent.attr("data-no");
		getEmpListByDeptSeq(seq);
	});
	
	$("#tbl-emplist th input[type='checkbox']").change(function(){
		if($(this).is(":checked")){
			$("#tbl-emplist input[type='checkbox']").prop("checked", true);
		}else{
			$("#tbl-emplist input[type='checkbox']").prop("checked", false);
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
						<span>사원관리</span> <img class="next" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/next.png">
						<span>인사이동</span>
					</div>
					<div id="select-bar" class="move-select">
						<span>회사선택</span>
						<select id="compSelect">
							<c:forEach items="${compList }" var="vo">
								<option value="${vo.compSeq }">${vo.compName }
							</c:forEach>
						</select>
						
						<span>재직여부</span>
						<select>
							<option>재직
							<option>미재직
						</select>
						
						<span>사원(ID)</span>
						<input type="text" value="검색">
						<button>검색</button>
					</div>
					<div class="content-head-wrapper">
						<span>* 부서정보</span>
						<div id="move-btn" class="head-btn move">인사이동</div>
						<div>변경 할 사용자를 선택 후 [인사이동] 버튼을 눌러 부서, 직급, 직책을 변경하여 주세요.</div>
					</div>
					<div id="content-wrapper">
						<div id="tree-move" class="tree">
							<ul>
							</ul>
						</div>
						<div id="tbl-content">
							<table id='tbl-emplist' class="tg" >
								<colgroup>
									<col style="width: 34px">
									<col style="width: 130px">
									<col style="width: 191px">
									<col style="width: 101px">
									<col style="width: 101px">
									<col style="width: 101px">
								</colgroup>
								<tr>
									<th class="tg-0pky">
										<input type="checkbox">
									</th>
									<th class="tg-0pky">부서</th>
									<th class="tg-0pky">사원명(ID)</th>
									<th class="tg-0pky">직급</th>
									<th class="tg-0pky">직책</th>
									<th class="tg-0pky">재직여부</th>
								</tr>
								<tr>
									<td class="tg-0lax" colspan="6">데이터가 존재하지 않습니다.</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
			</div>
			<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
		</div>
</body>
</html>