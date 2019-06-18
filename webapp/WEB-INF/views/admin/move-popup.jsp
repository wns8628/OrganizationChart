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
/* reset */
*            { margin:0; padding:0 }
body         { font:0.9em "맑은 고딕", 돋움, 굴림; color:#111; width: 550px; height: 350px; overflow: hidden; min-width: 550px;}
ul, ol, li         { list-style-type: none }
fieldset      { border:none }

a:link          { color:#111; text-decoration:none; }
a:visited       { color:#111; text-decoration:none; }
a:active    	{ color:#111; text-decoration:none; }
a:hover     	{ color:#111; text-decoration:none; }  

div.header { background-color: #1385DB; height: 35px; line-height: 35px;}
div.header span { padding: 5px 15px;  font-weight: bold; color: white;}
div.move-wrapper { margin: 15px; height: 235px;}
div.move-wrapper div.content-head-wrapper{ padding: 10px; font-weight: bold;}

table{border-collapse:collapse; border-spacing:0; border: 1px solid #B2B2B2; width: 100%; height: 120px; font-size: 0.9em; margin-bottom: 10px;}
table tr td:first-child{ background-color: #F8F8F8; border: 1px solid #B2B2B2; width:20%; text-align: right; padding-right: 2%}
table tr td:last-child{ border: 1px solid #B2B2B2; width:80%; padding-left: 2%;}

table input,select{ height: 60%; width: 50%;}
table div.btn{border: 1px solid #B2B2B2; height: 22px; width: 50px; display: inline-block; text-align: center;}

div.move-wrapper p{font-size: 0.9em; padding-top: 5px;}

div.footer { background-color: #F8F8F8; height: 50px;}
div.footer div.btn{ display: inline-block; border: 1px solid #B2B2B2; width: 55px; text-align: center; cursor: pointer;
			height: 30px; line-height: 30px; margin-top: 10px; font-size: 0.9em; color: white; font-weight: bold;}
div.footer div.btn:first-child { background-color: #1385DB; margin-left: 210px;}		
div.footer div.btn:last-child { background-color: #ADADAD;}		

div#dept-btn{cursor: pointer;}

div#move-popup-tree{border: 1px solid #B2B2B2; width: 194px; height: 160px; overflow-y: auto; position: absolute; 
			left: 130px; top: 127px; padding: 5px; background-color: white; display: none;}

div#move-popup-tree img.open-btn{
	height: 9px;
    width: 5px;
    position: relative;
    left: -11.5px;
    top: -4px;
    cursor: pointer;
}

div#move-popup-tree img.close-btn{
	height: 6px;
    width: 5px;
    position: relative;
    left: -13px;
    top: -6px;
    cursor: pointer;
}

.move-tr{
	background-color: #FFE0E0;
}
</style>
<script type="text/javascript">
var contextPath = "${pageContext.servletContext.contextPath }";

var updateEmpDept = function(){
	var formData = $("#empDeptForm").serialize();
	$.ajax({
		url : contextPath + "/admin/updateEmpDept",
		type : "post",
		dataType : "json",
		data : formData,
		async : false,
		success : function(response) {
			console.log(response.data);
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}
var seqArray = [];
var getParentDeptSeq = function(seq){
	$.ajax({
		url : contextPath + "/admin/getParentDeptSeq/"+seq,
		type : "post",
		dataType : "json",
		data : "",
		async : false,
		success : function(response) {
			console.log(seq);
			seqArray.push(response.data.parentDeptSeq);
			if(response.data.parentDeptSeq < 10000000){
				getParentDeptSeq(response.data.parentDeptSeq);
			}else{
				$(opener.document).find("li.biz").next().children().remove();
				$(opener.document).find("img.close-btn").hide();
				$(opener.document).find("img.open-btn").show();
				for(var i=(seqArray.length)-1; i>=0; i--){
					$(opener.document).find("li.child[data-no='"+seqArray[i]+"'] img.open-btn").trigger("click");
				}
				seqArray = [];
			}
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	});
}
$(function(){
	var prevDeptSeq;
	prevDeptSeq = $(opener.document).find('.active-span').parent().data("no");
// 	$(document).on("mouseover","div#move-popup-tree li.dept span[data-lang='"+noSeq+"']", function(event){
// 		$(this).css("cursor", "not-allowed");
// 	});
	$("input[name='prevDeptSeq']").val(prevDeptSeq);
	
	$("div#dept-btn").click(function(){
// 		$("#move-popup-tree li.comp span").trigger("click");
		$("div#move-popup-tree").toggle();
		$("#move-popup-tree li.comp span").trigger("click");
	});
	
	$(document).on("click", "#move-popup-tree li.dept span", function(event) {
		$parent = $(this).parent().parent().parent();
		var seq = $parent.attr("data-no");
		$("input[name='deptSeq']").val(seq);
		$("input[name='deptName']").val($(this).text());
		$("div#move-popup-tree").hide();
	});
	
	$("div#submit").click(function(){
		if($("p").length > 2){
			$("p:last-child").remove();
		}
		
		if($("input[name='deptSeq']").val() == ""){
			$("p:last-child").after("<p style='color:red;'>* 부서를 선택해주세요.</p>");
		}else if($("select[name='dutyCode']").val() == null){
			$("p:last-child").after("<p style='color:red;'>* 직급을 선택해주세요.</p>");
		}else if($("select[name='positionCode']").val() == null){
			$("p:last-child").after("<p style='color:red;'>* 직책을 선택해주세요.</p>");
		}else{
			var seq = $("input[name='deptSeq']").val();
			var seqList = [];
			$(opener.document).find("input[type='checkbox']:checked").each(function(){
				$("input[name='empSeq']").val($(this).val());
				seqList.push($(this).val());
				updateEmpDept();
			});
			
			if(seq != prevDeptSeq){
				getParentDeptSeq(seq);
				$(opener.document).find("li.child[data-no='"+seq+"'] span").trigger("click");
				for(var i=0; i<seqList.length; i++){
					$(opener.document).find("tr[data-no='"+seqList[i]+"']").addClass("move-tr");
				}
			}
			
			window.close();
		}
	});
	
	$("div#cancel").click(function(){
		window.close();
		$(opener.document).find("span[data-lang='"+prevDeptSeq+"']").trigger("click");
	});
});
</script>
</head>
<body>
	<div class="container">
		<div class="header">
			<span>인사이동</span>
		</div>
		<div class="move-wrapper">
			<div class="content-head-wrapper">
				<span>* 변경항목</span>
			</div>
			<form id="empDeptForm">
				<table>
					<tr>
						<td>부서</td>
						<td>
							<input type="text" name='deptName' readonly="readonly">
							<input type="hidden" name='deptSeq'>
							<input type="hidden" name='prevDeptSeq'>
							<input type="hidden" name="empSeq">
							<div id="dept-btn" class="btn">선택</div>
						</td>
					</tr>
					<tr>
						<td>직급</td>
						<td>
							<select name="dutyCode">
								<option selected disabled>선택</option>
								<c:forEach items="${dutyList }" var="vo">
									<option value="${vo.dpSeq }">${vo.dpName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>직책</td>
						<td>
							<select name="positionCode">
								<option selected disabled>선택</option>
								<c:forEach items="${positionList }" var="vo">
									<option value="${vo.dpSeq }">${vo.dpName }</option>
								</c:forEach>
							</select>	
						</td>
					</tr>
				</table>
			</form>
			<p>- 선택 한 사용자의 부서, 직급, 직책 정보를 일괄로 변경 처리 합니다.</p>
			<p>- 기존 부서 권한은 삭제 됩니다.</p>
		</div>
		<div class="footer">
			<div id="submit" class="btn">확인</div>
			<div id="cancel" class="btn">취소</div>
		</div>
		<div id='move-popup-tree' class='tree'>
			<ul>
				<li class='comp' c-no='${compInfo.compSeq }'>
					<img class='navi-icon' src='${pageContext.servletContext.contextPath }/assets/images/comp.png'>
					<span>${compInfo.compName }</span>
				</li>
				<ul c-no='${compInfo.compSeq }'></ul>
			</ul>
		</div>
	</div>
</body>
</html>