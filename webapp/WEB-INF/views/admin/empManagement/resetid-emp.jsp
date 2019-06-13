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
	src="${pageContext.request.contextPath }/assets/js/admin/admin-nav.js"></script>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/rankPositionManagement.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

var contextPath = "${pageContext.servletContext.contextPath }";

$(function(){
	let previousLoginId =  window.opener.document.getElementById('hiddenLoginId').value;
	let previousEmailAddr = window.opener.document.getElementById('hiddenEmailAddr').value;
	
	$("#loginId").val( previousLoginId );
	$("#emailAddr").val( previousEmailAddr );
	
	$(".save").click( () => {
		
		let nextLoginId = $("#loginId").val();
		let nextEmailAddr = $("#emailAddr").val();
		// 이메일 주소형식 체크
		let exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		let duplicateCheck = '';

		// 로그인아이디 중복 체크
		$.ajax({
			url : contextPath + "/empInfoManage/checkDuplicateLoginId",
			type : "post",
			dataType : "json",
			data : {
				nextLoginId: nextLoginId,
			},
			success : function(response) {

				if( response.data.length == 0){ // 중복된 아이디가 없으면
					cosnole.log("중복아님");
					duplicateCheck = 'true';
				} else {
					console.log("중복");
					duplicateCheck = 'false';
				}
				
				return 0;
				//search(position, 'true');
	
			},
			error : function(xhr, status, e) {
				console.error(status + ":" + e);
			}

		}).then( val => {
			if( duplicateCheck == 'false'){
				console.log("여어기다");
				messageBox('알림', '중복된 로그인아이디 입니다.');
				return;
			}
		}); 
		
		
		if( nextLoginId == ''){
			messageBox("알림", "로그인아이디를 입력하십시오.");
			return;
		}
		
		if( nextEmailAddr == ''){
			messageBox("알림", "이메일주소를 입력하십시오.");
			return;
		}
		
		if( exptext.test(nextEmailAddr) == false){
			messageBox("알림", "이메일 주소가 형식에 맞지않습니다.");
			return;
		}
		
		console.log("previousLoginId : " + previousLoginId);
		console.log("previousEmailAddr : " + previousEmailAddr);
		console.log("nextLoginId : " + nextLoginId);
		console.log("nextEmailAddr : " + nextEmailAddr);
		
		questionBox("알림", "저장하시겠습니까?").then( val => {
			console.log(val);
			
			if( val == 'Yes'){
				console.log("예");
				$.ajax({
					url : contextPath + "/empInfoManage/resetId",
					type : "post",
					dataType : "json",
					data : {
						previousLoginId: previousLoginId,
						previousEmailAddr: previousEmailAddr,
						nextLoginId: nextLoginId,
						nextEmailAddr: nextEmailAddr
					},
					success : function(response) {
						console.log(response);
						
						//search(position, 'true');
			
					},
					error : function(xhr, status, e) {
						console.error(status + ":" + e);
					}

				}); 
				
				window.close();
			}
		});
	})
})

</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<div class="header-wrapper">
				<span>ID 변경</span>
			</div>
		</div>
		<div id="header2">
			<span class="category1">*사용자 정보</span>
		</div>
			<div id="dialog-message" style="display= none;">
					<p></p>
				</div>
		<div id="contents">
			<table class="empDetail2">
				<tr>
					<th>아이디</th>
					<td>							
						<input type="text" id="loginId" name="id"  class="input">
					</td>
					<th>이메일 아이디</th>
					<td>							
						<input type="text" id="emailAddr" name="id"class="input">
					</td>
				</tr>
			</table>
		</div>
		<div id="footer">
			<button class="save">저장</button>
			<button class="cancle" onClick='window.close()'>취소</button>
		</div>	
	</div>	
</body>
</html>