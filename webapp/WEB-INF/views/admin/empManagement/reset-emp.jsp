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
.category1 { font-weight: bold; }
.category2 { font-size: 0.8em ; margin-bottom: 5px;}
/* 테이블 */
.empDetail { margin: -5px 100px 20px 100px; border: 1px solid #ececec; width: 800px;; height: 100px; border-collapse: collapse; }
.empDetail th,td {padding: 10px;}
.empDetail th {  padding: 10px; border: 1px solid #ececec; text-align: right; width: 120px; height: 10px; background-color: #f9f9f9; font-weight: normal;}
.empDetail td { border: 1px solid #ececec; text-align: left;  height: 15px;}

.empDetail2 { margin: 10px 100px 0 100px ; border: 1px solid #ececec; width: 800px;; height: 20px; border-collapse: collapse; }
.empDetail2 th,td {padding: 10px;}
.empDetail2 th {  width: 130px ; padding: 10px; border: 1px solid #ececec; text-align: right; width: 120px; height: 10px; background-color: #f9f9f9; font-weight: normal;}
.empDetail2 td { border: 1px solid #ececec; text-align: left;  height: 15px;}

div#footer { width: 100%; height: 50px; background-color: #ececec; margin: 30px 0 0 0; text-align: center;}
.save { width: 100px; height: 30px; margin: 10px 5px 0 0 ; background-color: #2e8bd2; color: #ffffff ;font-size: 1em;  font-weight: bold;}
.cancle { width: 100px; height: 30px; mragin: 10px 5px 0 0; background-color: #adadad; color: #ffffff ; font-size: 1em;  font-weight: bold;	}

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
	let compName =  window.opener.document.getElementById('hiddenCompName').value;
	let deptName = window.opener.document.getElementById('hiddenDeptName').value;
	let position = window.opener.document.getElementById('hiddenPosition').value;
	let duty = window.opener.document.getElementById('hiddenDuty').value;
	let empName = window.opener.document.getElementById('hiddenEmpName').value;
	let loginId = window.opener.document.getElementById('hiddenLoginId').value;

	$("table tr td").each( (index, item) => {
		switch( index) {
			case 0:
				item.innerHTML = compName;
				break;
			case 1:
				item.innerHTML = deptName;
				break;
			case 2:
				item.innerHTML = position;
				break;
			case 3:
				item.innerHTML = duty;
				break;
			case 4:
				item.innerHTML = empName;
				break;
			case 5:
				item.innerHTML = loginId;
				break;
		}
	});
	
	$(".save").click( () => {
		let newPassword = $("#password").val(); 
		
		console.log("newPassword : " + newPassword);
		
		questionBox("알림", "저장하시겠습니까?").then( val => {
			console.log(val);
			
			if( val == 'Yes'){
				console.log("예");
				$.ajax({
					url : contextPath + "/empInfoManage/changePassword",
					type : "post",
					dataType : "json",
					data : {
						empName: empName,
						loginId: loginId,
						newPassword: newPassword
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
	<div id="container"></div>
		<div id="header">
			<div class="header-wrapper">
				<span>비밀번호 초기화</span>
			</div>
		</div>
		<div id="dialog-message" style="display= none;">
					<p></p>
				</div>
		<div id="header2">
			<span class="category1">*사용자 정보</span>
		</div>
			<div id="contents">
				<table class="empDetail">
					<tr>
						<th>회사</th>
						<td>더존비즈온</td>
						<th>부서</th>
						<td>관리부문</td>
					</tr>
					<tr>
						<th>ID</th>
						<td>DouZone</td>
						<th>이름</th>
						<td>김더존</td>
					</tr>
					<tr>
						<th>직급</th>
						<td>그룹 직급</td>
						<th>직책</th>
						<td>직책 그룹</td>
					</tr>
				</table>
			<div id="header2">
				<span class="category1">
					*로그인/ 결재/ 급여비밀번호 초기화 <br>
				</span>
			</div>
				<table class="empDetail2">
					<tr>
						<th>
							<img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">
							<span>초기화 비밀번호</span>
						</th>
						<td>
							<input type="password" id="password" name="password" value="" class="input">
							
						</td>
					</tr>
				</table>
			</div>
			<div id="footer">
				<button class="save">저장</button>
				<button class="cancle" onClick='window.close()'>취소</button>
			</div>	
			

</body>
</html>