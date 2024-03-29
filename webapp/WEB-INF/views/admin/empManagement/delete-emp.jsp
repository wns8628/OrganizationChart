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

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/admin.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/rankPositionManagement.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">

/* reset */
*            { margin:0; padding:0 }
body         { font: 1em "맑은 고딕", 돋움, 굴림; color:#111; min-width: 1000px;}
ul, ol, li         { list-style-type: none }
fieldset      { border:none }

a:link          { color:#111; text-decoration:none; }
a:visited       { color:#111; text-decoration:none; }
a:active    	{ color:#111; text-decoration:none; }
a:hover     	{ color:#111; text-decoration:none; }  

div#header{ width: 100%; height: 30px; background-color: #2e8bd2; font-size: 1em;}div#header2 {width: 100%; height: 30px; }
div#header2 {width: 100%; height: 30px; margin: 12px; }
div.header-wrapper span {color: white; font-weight: bold; font-size: 1em; padding: 5px 15px 0 5px; float:left;}
div#header2 span {}
div#container { width: 100%; height: 100%;}
div#contents {text-align: middle;}
div#footer { width: 100%; height: 50px; background-color: #ececec; margin: 30px 0 0 0; text-align: center;}

.save { width: 100px; height: 30px; margin: 10px 5px 0 0 ; background-color: #2e8bd2; color: #ffffff ;font-size: 1em;  font-weight: bold;}
.cancle { width: 100px; height: 30px; mragin: 10px 5px 0 0; background-color: #adadad; color: #ffffff ; font-size: 1em;  font-weight: bold;	}

.category1 { font-weight: bold; }
.category2 { font-size: 0.8em ; margin-bottom: 5px;}
/* 테이블 */
.empDetail2 { margin: 10px 100px 0 100px ; border: 1px solid #ececec; width: 800px;; height: 20px; border-collapse: collapse; }
.empDetail2 th,td {padding: 10px;}
.empDetail2 th {  width: 130px ; padding: 10px; border: 1px solid #ececec; text-align: right; width: 120px; height: 10px; background-color: #f9f9f9; font-weight: normal;}
.empDetail2 td { border: 1px solid #ececec; text-align: left;  height: 15px;}

.input { width: 200px ; height: 25px;}
.check { float: right ; }
/*		*/
</style>

<script type="text/javascript">

var contextPath = "${pageContext.servletContext.contextPath }";

$(function(){
	let loginId =  window.opener.document.getElementById('hiddenLoginId').value;
	let empName = window.opener.document.getElementById('hiddenEmpName').value;
	
	console.log(loginId);
	console.log(empName);
	
	$(".notice").append('<p>선택한 사용자 <span style="color: red">' + empName + '(' + loginId + ')</span>을 삭제하시겠습니까?' + '</p>');
	
	$(".remove").click( () => {
		
		questionBox("알림", "정말 삭제하시겠습니까?").then( val => {
			if( val == 'Yes'){
				$.ajax({
					url : contextPath + "/empInfoManage/removeEmpInfo",
					type : "post",
					dataType : "json",
					data : {
						empName: empName,
						loginId: loginId
					},
					success : function(response) {
						window.close();
					},
					error : function(xhr, status, e) {
						console.error(status + ":" + e);
					}

				});
			}
		});
	
	});
});
</script>
</head>
<body>

	<div id="dialog-message" style="display= none;">
		<p></p>
	</div>
	
	<div id="container">
		<div id="header">
			<div class="header-wrapper">
				<span>사원 삭제</span>
			</div>
		</div>
		<div id="contents">
			<div class="notice">
		
			</div>
		</div>
		<div id="footer">
			<button class="remove">삭제</button>
			<button class="cancle" onClick='window.close()'>취소</button>
		</div>	
	</div>	
</body>
</html>