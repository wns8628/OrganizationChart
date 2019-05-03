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
<style type="text/css">
td, th{ padding: 0;}
textarea{resize: none;}
div#contents div#content-table-wrapper {float: right; width:80%;}

div.content-head-wrapper {margin: 5px 5px; width: 100%; height: 20px;}
div.content-head-wrapper span {font-weight: bold;}
div.content-head-wrapper div.head-btn{ float: right; display: inline; border: 1px black solid; margin: 0 5px; padding: 0 10px;}
div.content-head-wrapper div.head-btn:hover{ cursor: pointer;}

div#contents table#company-content-table  {border-collapse:collapse; border-spacing:0;   background-color: white; width: 100%;}
div#contents table#company-content-table td{font-family:Arial, sans-serif;font-size:12px;border-style:solid;border-width:1px;overflow:hidden; word-break:normal;border-color:black; height: 24px;}
div#contents table#company-content-table th{font-family:Arial, sans-serif;font-size:12px;font-weight:normal;border-style:solid;border-width:1px; overflow:hidden; border-color:black; }
div#contents table#company-content-table .tg-9anz{border-color:#333333;text-align:right;}
div#contents table#company-content-table .tg-dvpl{border-color:inherit;text-align:right; background-color: #f9f9f9; padding-right: 10px;}
div#contents table#company-content-table .tg-de2y{border-color:#333333;text-align:left;}
div#contents table#company-content-table .tg-0pky{border-color:inherit;text-align:left;}
div#contents table#company-content-table .tg-cont{border-color:inherit;text-align:center; padding: 5px 5px; background-color: white;}
div#contents table#company-content-table textarea{height: 18px; width: 100%; display: none;}
div#contents table#company-content-table th div{float: right;}
</style>
<script type="text/javascript">
var contextPath = "${pageContext.servletContext.contextPath }";
var getCompInfo = function(compSeq){
// 	$("#company-content-table").DataTable({
// 		ajax: {
// 			"type" : "get",
// 			"url" : contextPath+"/admin/getCompInfo/"+compSeq,
// 			"dataType" : "JSON"
// 		},
// 		columns : [
// 			{data : "compSeq"},
// 			{data : ""},
// 			{data : "ownerName"},
// 		]
// 	});
	$.ajax({
		url : contextPath + "/admin/getCompInfo/" + compSeq,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			$("#company-content-table td span").each(function(index, item){
				for(var key in response.data){
					if($(item).attr('id') == key){
						if(response.data[key] == null) {
							response.data[key] = "";
						}
						if($("#company-update-btn").css("display") == "none"){
							$(item).next().val(response.data[key]);
						}else{
							$(item).text(response.data[key]);
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

$(function(){
	$("#company-table tbody tr:first").addClass("company-table-active");
	
	$("#company-table tbody tr").click(function(){
		$("#company-table tbody tr.company-table-active").removeClass("company-table-active");
		var compSeq = $(this).children(":first").text();
		$(this).addClass("company-table-active");
		getCompInfo(compSeq);
	});
	
// 	$("#comp-add-btn").click(function(){
// 		$("#company-table tbody tr.company-table-active").removeClass("company-table-active");
// 		$("#company-table tbody").append("<tr><td></td><td></td></tr>");
// 		$("#company-table tbody tr:last").addClass("company-table-active");
// 		$("#company-content-table textarea").val("");
// 	});
	
	$(".update-toggle").click(function(){
		if($("#company-update-btn").css("display") != "none"){
			$("#update-cancel-btn").show();
			$("#update-save-btn").show();
			$("#company-update-btn").hide();
			
			$("#company-content-table span").each(function(index, item){
				$(item).next().val($(item).text());
				$(item).hide();
			});
			$("#company-content-table textarea").show();
		} else if($("#company-table tbody tr.company-table-active").length === 0){
			$("#company-table tbody tr:first").addClass("company-table-active");
			$("#company-content-table textarea").hide();
			$("#company-content-table span").show();
			getCompInfo($("#company-table thead th:first").text());
			$("#update-cancel-btn").hide();
			$("#update-save-btn").hide();
			$("#company-update-btn").show();
		} else{
			$("#update-cancel-btn").hide();
			$("#update-save-btn").hide();
			$("#company-update-btn").show();
			
			$("#company-content-table textarea").each(function(index, item){
				$(item).prev().text($(item).val());
			});
			$("#company-content-table textarea").prev().show();
			$("#company-content-table textarea").hide();
			
		}
	});
	
	$("#comp-add-btn").click(function(){
		$("#company-table tbody tr.company-table-active").removeClass("company-table-active");
		
		$("#update-cancel-btn").show();
		$("#update-save-btn").show();
		$("#company-update-btn").hide();
		
		$("#company-content-table span").each(function(index, item){
			$(item).next().val("");
			$(item).hide();
		});
		$("#company-content-table textarea").show();
	});
	
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
					<span style="color:#279EF5">회사정보관리</span>
				</div>
				<div id="company-table-wrapper">
					<div class="content-head-wrapper">
						<span>* 회사목록</span>
						<div class="head-btn">삭제</div>
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
				<div id="content-table-wrapper">
					<div class="content-head-wrapper">
						<span>* 회사기본정보</span>
						<div id="update-cancel-btn" class="head-btn update-toggle" style="display:none;">취소</div>
						<div id="update-save-btn" class="head-btn" style="display:none;">저장</div>
						<div id="company-update-btn" class="head-btn update-toggle">수정</div>
					</div>
					<form id="company-add-form">
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
								<td id="compSeq" class="tg-cont"><span id="compSeq">${firstCompInfo.compSeq}</span><textarea id="compSeq"></textarea> </td>
								<td class="tg-dvpl">사용여부</td>
								<td class="tg-de2y"></td>
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
									<textarea id="compName"></textarea>
								</td>
								<td class="tg-dvpl">대표자명</td>
								<td id="ownerName" class="tg-cont">
									<span id="ownerName">${firstCompInfo.ownerName}</span>
									<textarea id="ownerName"></textarea>
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl">영어</td>
								<td id="compNameEn" class="tg-cont">
									<span id="compNameEn">${firstCompInfo.compNameEn}</span>
									<textarea id="compNameEn"></textarea>
								</td>
								<td class="tg-dvpl">사업자번호</td>
								<td id="compRegistNum" class="tg-cont">
									<span id="compRegistNum">${firstCompInfo.compRegistNum}</span>
									<textarea id="compRegistNum"></textarea>
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl">일본어</td>
								<td id="compNameJp" class="tg-cont">
									<span id="compNameJp"></span>
									<textarea id="compNameJp"></textarea>
								</td>
								<td class="tg-dvpl">법인번호</td>
								<td id="compNum" class="tg-cont">
									<span id="compNum">${firstCompInfo.compNum}</span>
									<textarea id="compNum"></textarea>
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl">중국어</td>
								<td id="compNameCn" class="tg-cont">
									<span id="compNameCn"></span>
									<textarea id="compNameCn"></textarea>
								</td>
								<td class="tg-dvpl">정부기준코드</td>
								<td id="standardCode" class="tg-cont">
									<span id="standardCode">${firstCompInfo.standardCode}</span>
									<textarea id="standardCode"></textarea>
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2">회사약칭</td>
								<td id="compCd" class="tg-cont">
									<span id="compCd">${firstCompInfo.compCd}</span>
									<textarea id="compCd"></textarea>
								</td>
								<td class="tg-dvpl">정렬순서</td>
								<td id="orderNum" class="tg-cont">
									<span id="orderNum">${firstCompInfo.orderNum}</span>
									<textarea id="orderNum"></textarea>
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2">업태</td>
								<td id="bizCondition" class="tg-cont">
									<span id="bizCondition">${firstCompInfo.bizCondition}</span>
									<textarea id="bizCondition"></textarea>
								</td>
								<td class="tg-dvpl">종목</td>
								<td id="item" class="tg-cont">
									<span id="item">${firstCompInfo.item}</span>
									<textarea id="item"></textarea>
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2">대표전화</td>
								<td id="telNum" class="tg-cont">
									<span id="telNum">${firstCompInfo.telNum}</span>
									<textarea id="telNum"></textarea>
								</td>
								<td class="tg-dvpl">대표팩스</td>
								<td id="faxNum" class="tg-cont">
									<span id="faxNum">${firstCompInfo.faxNum}</span>
									<textarea id="faxNum"></textarea>
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2" rowspan="3">회사주소</td>
								<td id="zipCode" class="tg-cont" colspan="3">
									<span id="zipCode">${firstCompInfo.zipCode}</span>
									<textarea id="zipCode"></textarea>
								</td>
							</tr>
							<tr>
								<td id="addr" class="tg-cont" colspan="3">
									<span id="addr">${firstCompInfo.addr}</span>
									<textarea id="addr"></textarea>
								</td>
							</tr>
							<tr>
								<td id="detailAddr" class="tg-cont" colspan="3">
									<span id="detailAddr">${firstCompInfo.detailAddr}</span>
									<textarea id="detailAddr"></textarea>
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2">홈페이지주소</td>
								<td id="homepgAddr" class="tg-cont">
									<span id="homepgAddr">${firstCompInfo.homepgAddr}</span>
									<textarea id="homepgAddr"></textarea>
								</td>
								<td class="tg-dvpl">기본언어</td>
								<td id="nativeLangCode" class="tg-cont">
									<span id="nativeLangCode">${firstCompInfo.nativeLangCode}</span>
									<textarea id="nativeLangCode"></textarea>
								</td>
							</tr>
							<tr>
								<td class="tg-dvpl" colspan="2">기본도메인</td>
								<td id="compDomain" class="tg-cont" colspan="3">
									<span id="compDomain">${firstCompInfo.compDomain}</span>
									<textarea id="compDomain"></textarea>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
		</div>
		<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
	</div>
</body>
</html>