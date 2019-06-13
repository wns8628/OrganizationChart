<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/admin.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
/* reset */
*            { margin:0; padding:0 }
body         { font: 1em "맑은 고딕", 돋움, 굴림; color:#111; min-width: 1000px;}
ul, ol, li         { list-style-type: none }
fieldset      { border:none }

a:link          { color:#111; text-decoration:none; }
a:visited       { color:#111; text-decoration:none; }
a:active    	{ color:#111; text-decoration:none; }
a:hover     	{ color:#111; text-decoration:none; }  

div#header{ width: 100%; height: 30px; background-color: #2e8bd2; font-size: 1em;}
div#header2 {width: 100%; height: 30px; }
div#header3 { width: 100%; height: 30px; }
div.header-wrapper span {color: white; font-weight: bold; font-size: 1em; padding: 5px 15px 0 5px; float:left;}

div#container { width: 100%; height: 100%;}
div#contents { }

div#sideBar { width: 150px; margin: 0 15px 0 15px ; }
.pic { border: 1px solid #ececec; width: 200px; height: 250px; float: left; margin: 0 15px 0 0 ;}
.reg1 { width: 80px; float: left; margin: 10px 0 10px 15px ;}
.reg {  width: 80px; height: 25px; margin: 10px 0 10px 0 ; background-color: #ffffff ; }

div#footer { width: 100%; height: 50px; background-color: #ececec; margin: 30px 0 0 0; text-align: center;}
.save { width: 100px; height: 30px; margin: 10px 5px 0 0 ; background-color: #2e8bd2; color: #ffffff ;font-size: 1em;  font-weight: bold;}
.cancle { width: 100px; height: 30px; mragin: 10px 5px 0 0; background-color: #adadad; color: #ffffff ; font-size: 1em;  font-weight: bold;	}


.empDetail {border: 1px solid #ececec; width: 900px; height: 500px; border-collapse: collapse; }
.empDetail th,td {1padding: 10px;}
.empDetail th {  padding: 10px; border: 1px solid #ececec; text-align: right; width: 110px; background-color: #f9f9f9; font-weight: normal;}
.empDetail td { border: 1px solid #ececec;}

.input { border: 1px solid #dcdcdc; width: 200px; height: 25px; margin: 0 10px 0 10px; }
.input2 { border: 1px solid #ececec; height: 25px; margin: 0 10px 0 10px; }
.addrinput { border: 1px solid #ececec; height: 25px; margin: 5px;  }
.addrinput2 { border: 1px solid #ececec; width: 300px; height: 25px; margin: 5px;  }
/*
.picUpload { width: 100px;}
*/
</style>
<script type="text/javascript">
var contextPath = "${pageContext.servletContext.contextPath }";

function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("input[name='zipCode']").val(data.zonecode);
            $("input[name='addr']").val(addr + extraAddr);
            // 커서를 상세주소 필드로 이동한다.
            $("input[name='detailAddr']").focus();
        }
    }).open();
}

function compPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("input[name='compZipCode']").val(data.zonecode);
            $("input[name='compAddr']").val(addr + extraAddr);
            // 커서를 상세주소 필드로 이동한다.
            $("input[name='compDetailAddr']").focus();
        }
    }).open();
}

let getCompPositionDuty = compSeq => {
	
	let positionList;
	let dutyList;
	
	$.ajax({
		url : contextPath + "/empInfoManage/getPositionDuty",
		type : "post",
		dataType : "json",
		data : {
			compSeq: compSeq
		},
		success : function(response) {
			$(response.data).each( (index, item) => {
				if( item.positionSeq.charAt(0) == 'G'){
					positionList = response.data.slice(0, index - 1);
					dutyList = response.data.slice(index);
					return false;
				}
			});
			
			return 0;
		},
		error : function(xhr, status, e) {
			console.error(status + ":" + e);
		}

	}).then( () => {
		positionList.forEach( val => {
			($(".position").append("<option value='" + val.positionSeq + "'>" + val.positionName + "</option>"));	
		});
		
		dutyList.forEach( val => {
			console.log(val);
			$(".duty").append("<option value='" + val.positionSeq + "'>" + val.positionName + "</option>");
		});
		
	}); 
}

$(function(){
	$("#deptFind").click( () => {
		
		let popWidth  = 500; // 파업사이즈 너비
	    let popHeight = 500; // 팝업사이즈 높이
	     
	    let winWidth  = document.body.clientWidth;  // 현재창의 너비
	    let winHeight = document.body.clientHeight; // 현재창의 높이
	     
	    let winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
	    let winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표
	    let left = winX + (winWidth - popWidth) / 2;
	    let top = winY + (winHeight - popHeight) / 2;
	     
		window.open('${pageContext.servletContext.contextPath }/admin/deptFind', '부서찾기', 'location=no, scrollbars=no' + ", left=" + left + ", top=" + top + ", width=" + popWidth + ', height=' + popHeight);
	});
	
	$(".addrInput").click( () => {
		window.open("${pageContext.servletContext.contextPath }/admin/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	})
	
	getCompPositionDuty($(".compSelect option:selected").val());
	
	$(".compSelect").change( () => {
		$(".position").empty();
		$(".duty").empty();
		getCompPositionDuty($(".compSelect option:selected").val());
	})
	
	$(".save").click( () => {
		if( d)
	});
});
</script>
</head>

<body>
	<div id="container">
		<div id="header">
			<div class="header-wrapper">
				<span>입사처리</span>
			</div>
		</div>
		<div id="header2">
			
		</div>
			<div id="empinfo">
				<div id="sideBar">	
					<div class="pic"> 
						사진
					</div>
 
					<form id="pic" action="uploadForm" method="post" enctype="multipart/form-data" target="repacatFrame">
						<input type="file" name="file" class="picUpload">
				   <!-- <input type="submit" class="picUpload"> -->
 					</form>
				
				</div>
				<div id="contents">
				*기본정보
				<table class="empDetail"> 
					<tr>
						<th colspan='2'><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">회사선택</th>
						<td>
							<select class="input compSelect">
								<c:forEach items="${compList}" var="vo">
									<option value="${vo.compSeq }">${vo.compName }</option>
								</c:forEach>
							</select>
						</td>
						<th>사용여부</th>
						<td><input type="radio" name="useYn" value="use" class="input2" checked="checked">사용
							<input type="radio" name="useYn" value="use" class="input2">미사용
						</td>
					</tr>
					<tr>
						<th colspan='2'><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">아이디</th>
						<td>
							<input type="text" name="id" value="" class="input">
						</td>
						<th><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">메일 아이디</th>
						<td>
							<input type="text" name="emailId" value="" class="input">
						</td>
					</tr>
					<tr>
						<th rowspan='4'><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">이름</th>
						<th><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">한국어</th>
						<td>
							<input type="text" name="name" value="" class="input">
						</td>
						<th>성별</th>
						<td>
							<input type="radio" name="gender" value="male" class="input2" checked="checked">남
							<input type="radio" name="gender" value="female" class="input2">여
						</td>
					<tr>	
						<th>영어</th>
						<td>
							<input type="text" name="name" value="" class="input">
						</td>
						<th><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">로그인 비밀번호</th>
						<td>
							<input type="password" name="pwd" value="" class="input">
						</td>
					</tr>
					<tr>	
						<th>일본어</th>
						<td>
							<input type="text" name="name" value="" class="input">
						</td>
						<th><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">결제 비밀번호</th>
						<td>
							<input type="password" name="pwd" value="" class="input">
						</td>
					</tr>
					<tr>	
						<th>중국어</th>
						<td>
							<input type="text" name="name" value="" class="input">
						</td>
						<th><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">급여 비밀번호</th>
						<td>
							<input type="password" name="pwd" value="" class="input">
						</td>
					</tr>
					<tr>
						<th colspan='2'><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">부서</th>
						<td colspan='4'>
							<input type="text" name="dept" id="dept" value="" class="input">
							<button class="reg" id="deptFind">찾기</button>
						</td>
					</tr>
					<tr>
						<th colspan='2'>담당업무</th>
						<td colspan='4'>
							<input type="text" name="duty" value="" class="input">
						</td>
					</tr>
					<tr>
						<th colspan='2'>개인 메일</th>
						<td colspan='4'>
							<input type="text" name="mail" value="" autocomplete="off" class="input">@
							<input list="domains" placeholder="직접입력/선택" name="mail" value="" class="input">
							<datalist id="domains">
								<option value="naver.com">
								<option value="daum.net">
								<option value="google.com">
								<option value="yahoo.co.kr">
							</datalist>
							<!-- 
							<select>
								<option selected>직접입력</option>
								<option>naver.com</option>
								<option>daum.net</option>
								<option>gmail.com</option>
								<option>douzone.com</option>
							</select>
							 -->
						</td>
					</tr>
					<tr>
						<th colspan='2'><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">직급</th>
						<td>
							<select class="input position">							
							</select>
						</td>
						<th><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">직책</th>
						<td>
							<select class="input duty" >	
							</select>
						</td>
					</tr>
					<tr>
						<th colspan='2'>전화번호(회사)</th>
						<td>
							<input type="text" name="phone" value="" class="input">
						</td>
						<th>전화번호(집)</th>
						<td>
							<input type="text" name="phone" value="" class="input">
						</td>
					</tr>
					<tr>
						<th colspan='2'>휴대전화</th>
						<td>
							<input type="text" name="phone" value="" class="input">
						</td>
						<th>팩스번호</th>
						<td>
							<input type="text" name="phone" value="" class="input">
						</td>
					</tr>
					<tr>
						<th colspan='2'>주소(집)</th>
						<td colspan='3'>
							<input type="text" name="zipCode" value="" class="addrinput"> <button class="reg" id="zip-btn" onclick="postcode()">주소 검색</button> <br>
							<input type="text" name="addr" value="" class="addrinput2">
							<input type="text" name="detailAddr" value="" placeholder="상세주소 입력" class="addrinput2">
						</td>
					</tr>
					<tr>
						<th colspan='2'>주소(회사)</th>
						<td colspan='3'>
							<input type="text" name="compZipCode" value="" class="addrinput"> <button class="reg" id="zip-btn" onclick="compPostcode()">주소 검색</button> <br>
							<input type="text" name="compAddr" value="" class="addrinput2">
							<input type="text" name="compDetailAddr" value="" placeholder="상세주소 입력" class="addrinput2">
						</td>
					</tr>
					<tr>
						<th colspan='2'>생년월일</th>
						<td>
							<input type="date" id="empbirth" name="empbirth" value="2019-06-04" class="input">
						</td>
						<th >결혼기념일</th>
						<td>
							<input type="date" id="empwedding" name="empwedding" value="2019-06-04" class="input">
						</td>
					</tr>
					<tr>
						<th colspan='2'>입사일</th>
						<td>
							<input type="date" id="userdate" name="userdate" value="2019-06-04" class="input">
						</td>
						<th>재직정보</th>
						<td>
							<input type="radio" name="status" value="on" class="input2" checked="checked">재직
							<input type="radio" name="status" value="rest" class="input2">휴직
							<input type="radio" name="status" value="quit" class="input2" >퇴직
						</td>
					</tr>
					
				</table>
			</div>
		</div>
	</div>
	<div id="footer">
		<button class="save">저장</button>
		<button class="cancle" onClick='window.close()'>취소</button>
	</div>	
</body>
</html>