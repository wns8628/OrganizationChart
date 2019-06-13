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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/admin.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
td, th{ padding: 0;}
textarea{resize: none;}
div#contents div#content-table-wrapper {float: right; width:75%;}

div.content-head-wrapper { width: 100%; height: 20px;}
div.content-head-wrapper span {font-weight: bold;}
div.content-head-wrapper div.head-btn{ 
	float: right; 
	display: inline;
 	border:1px solid lightgrey;
 	margin: 0 5px;
 	margin-right: 0px;
  	padding-top:2px;
	padding-bottom:2px;
	padding-right:12px;
	padding-left:12px;
	}
div.content-head-wrapper div.head-btn:hover{ cursor: pointer;}

div#contents table#company-content-table  {border-collapse:collapse; border-spacing:0;   background-color: white; width: 97%;
    margin-left: 16px;
    margin-top: 15px;
    
    }
div#contents table#company-content-table td{font-family:Arial, sans-serif;font-size:12px;border-style:solid;border-width:1px;overflow:hidden; word-break:normal;border-color:lightgrey; height: 24px;}
div#contents table#company-content-table th{font-family:Arial, sans-serif;font-size:12px;font-weight:normal;border-style:solid;border-width:1px; overflow:hidden; border-color:lightgrey; }
div#contents table#company-content-table .tg-9anz{border-color:lightgrey;text-align:right;}
div#contents table#company-content-table .tg-dvpl{border-color:lightgrey;text-align:right; background-color: #f9f9f9; padding: 10px;}
div#contents table#company-content-table .tg-de2y{border-color:lightgrey;text-align:left; padding: 5px 5px; background-color: white;}
div#contents table#company-content-table .tg-0pky{border-color:lightgrey;text-align:left;}
div#contents table#company-content-table .tg-cont{border-color:lightgrey;text-align:center; padding: 5px 5px; background-color: white;}
div#contents table#company-content-table input[type='text']{height: 18px; width: 99%; display: none;}
div#contents table#company-content-table th div{float: right;}
div#contents table#company-content-table input[name='zipCode'] { width: 100px; float: left;}
div#contents table#company-content-table div#zip-btn {float:left; width: 50px; height:18px; border: 1px lightgrey solid; margin: 0 5px; padding: 0 10px; cursor: pointer;}
div#contents table#company-content-table .update-unit {display: none;}
div#contents table#company-content-table select {width: 80%;}

div#wrapper { height: 100%; width: 1519.2;}

.comMgr-display{
	display:flex;
}
.comMgr-nav-border{
    width: 326px;
    height: 691px;
    float: left;
    border-right: 1px solid lightgrey;
}
.comMgr-body-border{
    margin-left: 15px;
    width: 1033px;
    height: 733px;
    border: 1px solid #f9f9f9;
}
.content-head-wrapper2{
	margin-left:15px;
}
</style>
<script type="text/javascript">
var contextPath = "${pageContext.servletContext.contextPath }";

var activeCompRender = function(vo){
	var htmls = "<tr><td>"+vo.compSeq+"</td><td>"+vo.compName+"</td></tr>";
	$("#company-table tbody").append(htmls);
	$("#company-table tbody tr:last").addClass("company-table-active");
	
	removeForm();
}

var getCompInfo = function(compSeq){
	$.ajax({
		url : contextPath + "/admin/getCompInfo/" + compSeq,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			$("input,option").prop("checked",false);
			$("#company-content-table td span").each(function(index, item){
				for(var key in response.data){
					if($(item).attr('id') == key){
						if(response.data[key] == null) {
							response.data[key] = "";
						}
						if(($("#company-update-btn").css("display") == "none") &&
								($("#company-table tbody tr.company-table-active").length != 0)){
							$(item).next().val(response.data[key]);
							if(key == 'useYn'){
								$("input[data-id='"+response.data[key]+"']").prop("checked",true);
							}
							if(key == 'nativeLangCode'){
								$("option[data-id='"+response.data[key]+"']").prop("selected",true);
							}
						}else{
							$(item).text(response.data[key]);
							$(".update-unit").hide();
						}
					}
				}
			});
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}

var deleteComp = function(){
	var formData = $("#company-form").serialize();
	$.ajax({
		url : contextPath + "/admin/deleteComp",
		type : "post",
		dataType : "json",
		data : formData,
		success : function(response) {
			console.log("삭제성공");
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}

var addComp = function(){
	var formData = $("#company-form").serialize();
	console.log(formData);
	$.ajax({
		url : contextPath + "/admin/addComp",
		type : "post",
		dataType : "json",
		data : formData,
		success : function(response) {
			activeCompRender(response.data);
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}

var updateComp = function(){
	var formData = $("#company-form").serialize();
	$.ajax({
		url : contextPath + "/admin/updateComp",
		type : "post",
		dataType : "json",
		data : formData,
		success : function(response) {
			console.log(response.data);
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}
	});
}

var updateForm = function(){
	$("#update-cancel-btn").show();
	$("#update-save-btn").show();
	$("#company-update-btn").hide();
	$(".update-unit").show();
	$("#company-content-table span").each(function(index, item){
		$(item).next().val($(item).text());
		if($(this).attr("id") == "useYn"){
			$("input[data-id='"+$(this).text()+"']").prop("checked",true);
		}
		if($(this).attr("id") == "nativeLangCode"){
			console.log($(this).text());
			$("option[data-id='"+$(this).text()+"']").prop("selected",true);
		}
		$(item).hide();
	});
	$("#company-content-table input[type='text']").show();
}

var removeForm = function(){
	$("#update-cancel-btn").hide();
	$("#update-save-btn").hide();
	$("#company-update-btn").show();
	$(".update-unit").hide();
	
	$("#company-content-table input[type='text']").each(function(index, item){
		$(item).prev().text($(item).val());
	});
	$("input:checked").parent().prev().text($("input:checked").attr("data-id"));
	$("option:checked").parent().prev().text($("option:checked").attr("data-id"));

	$("#company-content-table span").show();
	$("#company-content-table input[type='text']").hide();
}

$(function(){
	
	ArrowChange();
	
	$("#company-table tbody tr:first").addClass("company-table-active");
	
	// live event (미래에 동적으로 생성될 엘리먼트의 이벤트)
	$(document).on("click", "#company-table tbody tr", function(event){
		event.preventDefault();
		if($("#company-table tbody tr.company-table-active").length == 0){
			$("#update-cancel-btn").hide();
			$("#update-save-btn").hide();
			$("#company-update-btn").show();
			var compSeq = $(this).children(":first").text();
			console.log(compSeq);
			$("#company-content-table input[type='text']").val("").hide();
			$("#company-content-table span").show();
			getCompInfo(compSeq);
			$(this).addClass("company-table-active");
		}else{
			$("#company-table tbody tr.company-table-active").removeClass("company-table-active");
			var compSeq = $(this).children(":first").text();
			$(this).addClass("company-table-active");
			getCompInfo(compSeq);
		}
	});
	
	$(".update-toggle").click(function(){
		if($("#company-update-btn").css("display") != "none"){
			updateForm();
		} else if($("#company-table tbody tr.company-table-active").length === 0){
			$("#company-table tbody tr:first").addClass("company-table-active");
			removeForm();
			getCompInfo($("#company-table tbody tr:first td:first").text());
		} else{
			removeForm();
			
		}
	});
	
	//회사추가폼생성
	$("#comp-add-btn").click(function(){
		$("#company-table tbody tr.company-table-active").removeClass("company-table-active");
		updateForm();
		$("#company-content-table span").text("");
		$("#company-content-table input[type='text']").val("");
		$("input[type='radio']:first").prop("checked", true);
		$("option:first").prop("checked",true);
	});
	
	//회사추가
	$("#update-save-btn").click(function(){
		if($("#company-table tbody tr.company-table-active").length === 0){
			addComp();
		}
	});
	
	//회사삭제
	$("#comp-delete-btn").click(function(){
		var activeComp = $("#company-table tbody tr.company-table-active");
		if($(activeComp).length != 0){
			$("#company-content-table span").each(function(index, item){
				if($(this).attr("id") == "useYn"){
					$("input[data-id='"+$(this).text()+"']").prop("checked",true);
				}
				if($(this).attr("id") == "nativeLangCode"){
					$("option[data-id='"+$(this).text()+"']").prop("checked",true);
				}
				$(item).next().val($(item).text());
			});
			
			deleteComp();
			$(activeComp).remove();
			$("#company-table tbody tr:first").addClass("company-table-active");
			getCompInfo($("#company-table tbody tr:first td:first").text());
			
			console.log("3");
		}
	})
	
	//회사수정
	$("#update-save-btn").click(function(){
		if($("#company-table tbody tr.company-table-active").length != 0){
			updateComp();
			removeForm();
		}
	});
	
	var menuList = $("div.menu li");
	for(var i=0; i<menuList.length; i++){
		if($(menuList[i]).text() === $("#contents-header span:last").text()){
			$(menuList[i]).parent().parent().show().prev().addClass("active");
			$(menuList[i]).children().css("color","#328CF5").css("font-weight","bold");
		}
	}
	
});
</script>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
		<div id="wrapper">
			<div id="contents">
				<div id="contents-header">
					<img class="home" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/home.png">
					<img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>시스템설정</span> <img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>회사/조직관리</span> <img class="next" alt=""
						src="${pageContext.servletContext.contextPath }/assets/images/next.png">
					<span>회사정보관리</span>
				</div>
			
			<!--  -->	
			<div id="select-bar">
				<span class="Info-label">Quick Silver 그룹</span>
			</div>
			<!--  -->	
			<div class="comMgr-display">	
				<div class="comMgr-nav-border">
					<div id="company-table-wrapper">
						<div class="content-head-wrapper">
							<span>● 회사목록</span>
							<div id="comp-delete-btn" class="head-btn">삭제</div>
							<div id="comp-add-btn" class="head-btn">추가</div>
						</div>
						<table id="company-table">
							<thead>
								<tr>
									<th>회사코드</th>
									<th>회사명</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${compList }" var="vo">
									<tr>
										<td>${vo.compSeq }</td>
										<td>${vo.compName }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div id="content-table-wrapper">
					<div class="content-head-wrapper content-head-wrapper2">
						<span>● 회사기본정보</span>
						<div id="update-cancel-btn" class="head-btn update-toggle" style="display:none;">취소</div>
						<div id="update-save-btn" class="head-btn" style="display:none;">저장</div>
						<div id="company-update-btn" class="head-btn update-toggle">수정</div>
					</div>
					<div class="comMgr-body-border">
					<form id="company-form">
						<table id="company-content-table" style="table-layout: fixed;">
							<colgroup>
								<col style="width: 61px">
								<col style="width: 61px">
								<col style="width: 181px">
								<col style="width: 90px">
								<col style="width: 210px">
							</colgroup>
							<tr>
								<td class="tg-dvpl" colspan="2">
									<img class="mini-icon" alt="" src="${pageContext.servletContext.contextPath }/assets/images/check2.png">
									회사코드
								</td>
								<td id="compSeq" class="tg-cont"><span id="compSeq">${firstCompInfo.compSeq}</span><input type="text" name="compSeq"></td>
								<td class="tg-dvpl">사용여부</td>
								<td class="tg-de2y">
									<span id="useYn">${firstCompInfo.useYn}</span>
									<div class="update-unit">
										<input type="radio" data-id="사용" name="useYn" value="Y">사용
										<input type="radio" data-id="미사용" name="useYn" value="N">미사용
									</div>
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" rowspan="4">
									<img class="mini-icon" alt="" src="${pageContext.servletContext.contextPath }/assets/images/check2.png">
									회사명
								</td>
								<td class="tg-dvpl">
									<img class="mini-icon" alt="" src="${pageContext.servletContext.contextPath }/assets/images/check2.png">
									한국어
								</td>
								<td id="compName" class="tg-cont">
									<span id="compName">${firstCompInfo.compName}</span>
									<input type="text" name="compName">
								</td>
								<td class="tg-dvpl">대표자명</td>
								<td id="ownerName" class="tg-cont">
									<span id="ownerName">${firstCompInfo.ownerName}</span>
									<input type="text" name="ownerName">
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl">영어</td>
								<td id="compNameEn" class="tg-cont">
									<span id="compNameEn">${firstCompInfo.compNameEn}</span>
									<input type="text" name="compNameEn">
								</td>
								<td class="tg-dvpl">사업자번호</td>
								<td id="compRegistNum" class="tg-cont">
									<span id="compRegistNum">${firstCompInfo.compRegistNum}</span>
									<input type="text" name="compRegistNum">
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl">일본어</td>
								<td id="compNameJp" class="tg-cont">
									<span id="compNameJp"></span>
									<input type="text" name="compNameJp">
								</td>
								<td class="tg-dvpl">법인번호</td>
								<td id="compNum" class="tg-cont">
									<span id="compNum">${firstCompInfo.compNum}</span>
									<input type="text" name="compNum">
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl">중국어</td>
								<td id="compNameCn" class="tg-cont">
									<span id="compNameCn"></span>
									<input type="text" name="compNameCn">
								</td>
								<td class="tg-dvpl">정부기준코드</td>
								<td id="standardCode" class="tg-cont">
									<span id="standardCode">${firstCompInfo.standardCode}</span>
									<input type="text" name="standardCode">
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2">회사약칭</td>
								<td id="compCd" class="tg-cont">
									<span id="compCd">${firstCompInfo.compCd}</span>
									<input type="text" name="compCd">
								</td>
								<td class="tg-dvpl">정렬순서</td>
								<td id="orderNum" class="tg-cont">
									<span id="orderNum">${firstCompInfo.orderNum}</span>
									<input type="text" name="orderNum">
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2">업태</td>
								<td id="bizCondition" class="tg-cont">
									<span id="bizCondition">${firstCompInfo.bizCondition}</span>
									<input type="text" name="bizCondition">
								</td>
								<td class="tg-dvpl">종목</td>
								<td id="item" class="tg-cont">
									<span id="item">${firstCompInfo.item}</span>
									<input type="text" name="item">
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2">대표전화</td>
								<td id="telNum" class="tg-cont">
									<span id="telNum">${firstCompInfo.telNum}</span>
									<input type="text" name="telNum">
								</td>
								<td class="tg-dvpl">대표팩스</td>
								<td id="faxNum" class="tg-cont">
									<span id="faxNum">${firstCompInfo.faxNum}</span>
									<input type="text" name="faxNum">
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2" rowspan="3">회사주소</td>
								<td id="zipCode" class="tg-de2y" colspan="3">
									<span id="zipCode">${firstCompInfo.zipCode}</span>
									<input type="text" name="zipCode">
									<div id="zip-btn" onclick="postcode()" class="head-btn update-unit">우편번호</div>
								</td>
							</tr>
							<tr>
								<td id="addr" class="tg-cont" colspan="3">
									<span id="addr">${firstCompInfo.addr}</span>
									<input type="text" name="addr">
								</td>
							</tr>
							<tr>
								<td id="detailAddr" class="tg-cont" colspan="3">
									<span id="detailAddr">${firstCompInfo.detailAddr}</span>
									<input type="text" name="detailAddr" placeholder="상세주소입력">
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2">홈페이지주소</td>
								<td id="homepgAddr" class="tg-cont">
									<span id="homepgAddr">${firstCompInfo.homepgAddr}</span>
									<input type="text" name="homepgAddr">
								</td>
								<td class="tg-dvpl">기본언어</td>
								<td id="nativeLangCode" class="tg-cont">
									<span id="nativeLangCode">${firstCompInfo.nativeLangCode}</span>
									<select class="update-unit" name="nativeLangCode">
										<option data-id="한국어" value="kr">한국어</option>
										<option data-id="영어" value="en" selected="selected">영어</option>
										<option data-id="일본어" value="jp">일본어</option>
										<option data-id="중국어" value="cn">중국어</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2">기본도메인</td>
								<td id="compDomain" class="tg-cont" colspan="3">
									<span id="compDomain">${firstCompInfo.compDomain}</span>
									<input type="text" name="compDomain">
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