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
div#content-wrapper div#tbl-header span { width: 80px; border: 1px solid #B2B2B2; font-size: 13px; height: 28px; float: left; display: inline-block; line-height: 30px;}
div#content-wrapper div#tbl-header span:first-child {margin-left: 20px;}

div#content-wrapper div#tbl-wrapper {width: 96%; padding: 2%; border: 1px solid #B2B2B2; height: 100%}

div#tbl-wrapper .tg  {border-collapse:collapse; border: 1px solid #B2B2B2; border-spacing:0; width: 100%; height: 350px;}
div#tbl-wrapper .tg td{font-size:13px;padding:4px 20px; border: 1px solid #B2B2B2; overflow:hidden;word-break:normal;}
div#tbl-wrapper .tg th{font-size:13px;font-weight:normal;padding:4px 20px; border: 1px solid #B2B2B2; overflow:hidden;word-break:normal;}
div#tbl-wrapper .tg .tg-lqy6{text-align:right;vertical-align:top; background-color: #F9F9F9;}
div#tbl-wrapper .tg .tg-0lax{text-align:left;vertical-align:top}

div#tree-mini {width: 37.8%; background-color: white; border: 0px; height: 400%;
vertical-align: top; float: left; padding: 1%; min-height: 400px; overflow-y:auto;
border-top: 1px solid #B2B2B2; border-bottom: 1px solid #B2B2B2; border-left: 1px solid #B2B2B2;}
div.tree li>span {float: left;}

</style>
<script type="text/javascript">
var contextPath = "${pageContext.servletContext.contextPath }";

var compRender = function(compSeq, compName){
	var htmls = "<li class='comp' data-no='"+compSeq+"'><img class='navi-icon' src='${pageContext.servletContext.contextPath }/assets/images/comp.png'>"+
				"<span>"+compName+"</span></li><ul c-no='"+compSeq+"'></ul>";
	$("div#tree-mini ul").append(htmls);
}

$(function(){
	var menuList = $("div.menu li");
	for(var i=0; i<menuList.length; i++){
		if($(menuList[i]).text() === $("#contents-header span:last").text()){
			$(menuList[i]).parent().parent().show().prev().addClass("active");
			$(menuList[i]).children().css("color","#328CF5").css("font-weight","bold");
		}
	}
	
	var compSeq = $("#compSelect option:selected").val();
	var compName = $("#compSelect option:selected").text();
	compRender(compSeq, compName);
	$("#compSelect").change(function(){
		console.log($(this).val());
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
							<table class="tg" style="table-layout: fixed; ">
								<colgroup>
									<col style="width: 90px">
									<col style="width: 74px">
									<col style="width: 195px">
								</colgroup>
								<tr>
									<th class="tg-lqy6">상위부서</th>
									<th class="tg-0lax" colspan="2">
										<span id="parentDeptSeq"></span>
									</th>
								</tr>
								<tr>
									<td class="tg-lqy6">유형</td>
									<td class="tg-0lax" colspan="2">
										<select>
											<option value="biz">사업장
											<option value="dept">부서
										</select>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">부서코드</td>
									<td class="tg-0lax" colspan="2">
										<span id="deptSeq"></span>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6" rowspan="4">부서명</td>
									<td class="tg-lqy6">한국어</td>
									<td class="tg-0lax">
										<span id="deptName"></span>
									</td>
								</tr>
								<tr>
									<td class="tg-lqy6">영어</td>
									<td class="tg-0lax">
										<span id="deptNameEn"></span>
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
										<span id="deptNickname"></span>
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