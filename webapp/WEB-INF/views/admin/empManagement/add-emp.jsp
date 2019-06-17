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
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
.pic { border: 1px solid #ececec; width: 200px; height: 250px; float: left; margin: 21px 15px 0 0 ;}
.reg1 { width: 100px; float: left; margin: 10px 0 10px 102px ;}
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
#holder{     height: 160px; width: 120px; margin: 40px; border: 1px solid #dedede; background-color:#f0f0f0;}
.infoPic{ font-size: 11px;}
#defaultMan{ width: 80px; height: 80px; margin: 20px 20px 0px 20px;}
#picComment{ padding-left: 6px;}
#picCommentSize{ padding-left: 32px;}
/*
.picUpload { width: 100px;}
*/
</style>

<script type='text/javascript' src='https://bestvpn.org/wp-includes/js/jquery/jquery.js'></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/rankPositionManagement.js"></script>

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
        },
        onclose: function(state) {
            //state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
            if(state === 'FORCE_CLOSE'){
                //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.
                console.log("사라짐");
				$("input[name='addr']")[0].blur();
				$("input[name='zipCode']")[0].blur();

            } else if(state === 'COMPLETE_CLOSE'){
                //사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
                //oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
            }
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

let deptPopup = () => {
	
	let popWidth  = 500; // 파업사이즈 너비
    let popHeight = 500; // 팝업사이즈 높이
     
    let winWidth  = document.body.clientWidth;  // 현재창의 너비
    let winHeight = document.body.clientHeight; // 현재창의 높이
     
    let winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
    let winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표
    let left = winX + (winWidth - popWidth) / 2;
    let top = winY + (winHeight - popHeight) / 2;
     
    deptSearchWindow = window.open('${pageContext.servletContext.contextPath }/admin/deptFind', '부서찾기', 'location=no, scrollbars=no, alwaysReised=yes' + ", left=" + left + ", top=" + top + ", width=" + popWidth + ', height=' + popHeight);
    closeWindowCheck(deptSearchWindow);
}

let closeWindowCheck = windowObj => {
	 // 0.5초 마다 감지
	    g_oInterval = window.setInterval(function() {
	        try {
	            // 창이 꺼졌는지 판단
	            if( windowObj == null || windowObj.closed ) {
	                window.clearInterval(g_oInterval);
	                windowObj = null;
	                // Todo....
	                //.....
	                console.log("창꺼짐");
	                $("input[name='dept']")[0].blur();
	       			
	            }
	        } catch (e) { }
	    }, 500);
};

$(function(){
	
	let deptSearchWindow;
	
	window.onbeforeunload = function () {
		
		if( document.readyState == "complete"){ // self.screenTop > 9000 브라우저 닫힘
			try {
				
				if(deptSearchWindow){
					deptSearchWindow.close();	
				}
			}
			catch (e) {
				console.log(e);
			}
		}
	};
	
	$("input[name='dept']")[0].addEventListener('focus', deptPopup);
	
	$("#deptFind").click(deptPopup);
	
	$("#zip-btn").click(postcode);
	
	getCompPositionDuty($(".compSelect option:selected").val());
	
	$(".compSelect").change( () => {
		$(".position").empty();
		$(".duty").empty();
		getCompPositionDuty($(".compSelect option:selected").val());
	})
	
	$("input[name='addr']")[0].addEventListener("focus", postcode);
	
	$("input[name='zipCode']")[0].addEventListener("focus", postcode);
	
	$(".save").click( () => {
		let compSeq = $("select option:selected")[0].value;
		let loginId = $("input[name='id']")[0].value;
		let korea = $("input[name='korea']")[0].value;
		let english = $("input[name='english']")[0].value;
		let loginPwd = $("input[name='loginPwd']")[0].value;
		let dept = $("input[name='dept']")[0].value;
		let deptSeq = $("input[name='dept']")[0].getAttribute('data-lang');
		let bizSeq = $("input[name='dept']")[0].getAttribute('data-lang-biz');
		let task = $("input[name='task']")[0].value;
		let emailAddr = $("input[name='mail']")[0].value + "@" + $("input[name='backMail']")[0].value;
		let positionSeq = $(".position option:selected").val();
		let dutySeq = $(".duty option:selected").val();
		let homePhone = $("input[name='homePhone']")[0].value;
		let phone = $("input[name='phone']")[0].value;
		let postNumber = $("input[name='zipCode']")[0].value;
		let addr = $("input[name='addr']")[0].value;
		let detailAddr = $("input[name='detailAddr']")[0].value;
		let empBirth = $("input[name='empbirth']")[0].value;
		let userDate = $("input[name='userdate']")[0].value;
		let useYn = $("input[name='useYn']:checked").val();
		let gender = $("input[name='gender']:checked").val();
		let workStatus = $("input[name='status']:checked").val();
		let file = $("input[type='file']")[0].files[0];
		
		
		console.log(file);
		if( typeof file == 'undefined'){
			file = new File(["foo"], "default", {
				  type: "text/plain",
			});
		}
		
		// 이메일 주소형식 검사
		let emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		// 전화번호 형식 검사
		let phoneCheck = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	
		if( loginId == ''){
			messageBox("알림", "아이디 입력은 필수입니다.");
			return;
		}
		
		if( korea == ''){
			messageBox("알림", "한국어 이름 입력은 필수입니다.");
			return;
		}
		
		for(let i = 0; i < korea.length; i++){
			if( korea[i].charCodeAt(0) < 10000){ // 한글이 아니면
				messageBox("한국어", "한국어 명칭은 한국어 입력만 가능합니다");
				return;
			}
		}
		
		if( english == ''){
			messageBox("알림", "영어 이름 입력은 필수입니다.");
			return;
		}
		
		for(let i = 0; i < english.length; i++){
			if( english[i].charCodeAt(0) > 122){
				messageBox("알림", "영어 명칭은 영어 입력만 가능합니다.");
				return;
			}
		}
		
		if( loginPwd == ''){
			messageBox("알림", "로그인 비밀번호 입력은 필수입니다.");
			return;
		}
		
		if( dept == ''){
			messageBox("알림", "부서 입력은 필수입니다.");
			return;
		}
		
		if( emailAddr == '@'){
			messageBox("알림", "이메일 아이디 입력은 필수입니다.");
			return;
		}
		
		if( emailAddr != '@' && emailCheck.test(emailAddr) == false){
			messageBox("알림", "이메일 주소가 형식에 맞지않습니다.");
			return;
		}
		
		if( homePhone != '' && phoneCheck.test(homePhone) == false){
			messageBox("알림", "집 전화번호가 형식에 맞지않습니다.");
			return;
		}
		
		if( phone != '' && phoneCheck.test(phone) == false){
			messageBox("알림", "휴대전화가 형식에 맞지않습니다.");
			return;
		}
		
		let formData = new FormData();
		formData.append('compSeq', compSeq);
		formData.append('loginId', loginId);
		formData.append('korea', korea);
		formData.append('english', english);
		formData.append('loginPwd', loginPwd);
		formData.append('dept', dept);
		formData.append('deptSeq', deptSeq);
		formData.append('bizSeq', bizSeq);
		formData.append('task', task);
		formData.append('emailAddr', emailAddr);
		formData.append('positionSeq', positionSeq);
		formData.append('dutySeq', dutySeq);
		formData.append('homePhone', homePhone);
		formData.append('phone', phone);
		formData.append('postNumber', postNumber);
		formData.append('addr', addr);
		formData.append('detailAddr', detailAddr);
		formData.append('empBirth', empBirth);
		formData.append('userDate', userDate);
		formData.append('useYn', useYn);
		formData.append('gender', gender);
		formData.append('workStatus', workStatus);
		formData.append('file', file);
		
		$.ajax({ 
				 url: contextPath + '/empInfoManage/addEmp', 
				 data: formData, 
				 processData: false, 
				 contentType: false, 
				 type: 'POST', 
				 success: function(data){ 
					 alert("EE"); 
				 } 
		});


	});
	
	$(".reg1").click( () => {
		$("#file").click();
	})
	
	
	var upload = document.getElementById('file'),
    $holder = $('#holder'),
    state = document.getElementById('status');

	if (typeof window.FileReader === 'undefined') {
	  state.className = 'fail';
	} /*  else {
	  state.className = 'success';
	  state.innerHTML = 'File API & FileReader available';
	}  */
	 
	upload.onchange = function (e) {
	  e.preventDefault();
	
	  var file = upload.files[0],
	      reader = new FileReader();
	  reader.onload = function (event) {
	    var img = new Image();
	    img.src = event.target.result;
	    // note: no onload required since we've got the dataurl...I think! :)
	  /*   if (img.style.width > 400) { // holder width
	      img.style.width = 400;
	    }
	    
	    if( img.style.height > 400){
	    	img.style.height = '400px';
	    }
	     */
	
		img.style.height = '160px';
		img.style.width = '120px';
	    
	    $holder.html('');
	    $holder.empty();
	    $holder.append(img);
	  };
	  reader.readAsDataURL(file);
	
	  return false;
	};
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
						<div id="holder">
							<img id="defaultMan" src="${pageContext.servletContext.contextPath }/assets/images/defaultman.png">
							<p class="infoPic" id="picComment">사진을 등록해 주세요</p>
							<p class="infoPic" id="picCommentSize">(120 * 160)</p>
						</div>
					</div>
					<button class="reg1">사진등록/변경</button>
					
					<article>
					  <p id="status" style="display: none;"> </p>
					  <p><input type=file id="file" style="display:none;"></p>
					</article>
				</div>
				<div id="dialog-message" style="display= none;">
					<p></p>
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
						<td><input type="radio" name="useYn" value="Y" class="input2" checked="checked">사용
							<input type="radio" name="useYn" value="N" class="input2">미사용
						</td>
					</tr>
					<tr>
						<th colspan='2'><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">아이디</th>
						<td>
							<input type="text" name="id" value="" class="input">
						</td>
						<th>재직정보</th>
						<td>
							<input type="radio" name="status" value="999" class="input2" checked="checked">재직
							<input type="radio" name="status" value="004" class="input2">휴직
							<input type="radio" name="status" value="001" class="input2" >퇴직
						</td>
					</tr>
					<tr>
						<th rowspan='2'><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">이름</th>
						<th><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">한국어</th>
						<td>
							<input type="text" name="korea" value="" class="input">
						</td>
						<th>성별</th>
						<td>
							<input type="radio" name="gender" value="M" class="input2" checked="checked">남
							<input type="radio" name="gender" value="F" class="input2">여
						</td>
					<tr>	
						<th><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">영어</th>
						<td>
							<input type="text" name="english" value="" class="input">
						</td>
						<th><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">로그인 비밀번호</th>
						<td>
							<input type="password" name="loginPwd" value="" class="input">
						</td>
					</tr>

					<tr>
						<th colspan='2'><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">부서</th>
						<td colspan='4'>
							<input type="text" name="dept" id="dept" value="" class="input" readonly="readonly">
							<button class="reg" id="deptFind">찾기</button>
						</td>
					</tr>
					<tr>
						<th colspan='2'>담당업무</th>
						<td colspan='4'>
							<input type="text" name="task" value="" class="input">
						</td>
					</tr>
					<tr>
						<th colspan='2'><img alt="" src="${pageContext.servletContext.contextPath }/assets/images/smallc.png">이메일 아이디</th>
						<td colspan='4'>
							<input type="text" name="mail" value="" autocomplete="off" class="input">@
							<input list="domains" placeholder="직접입력/선택" name="backMail" value="" class="input">
							<datalist id="domains">
								<option value="naver.com">
								<option value="daum.net">
								<option value="gmail.com">
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
					
						<th colspan='2'>전화번호(집)</th>
						<td>
							<input type="text" name="homePhone" value="" class="input">
						</td>
						
						<th>휴대전화</th>
						<td>
							<input type="text" name="phone" value="" class="input">
						</td>
					</tr>
				
					<tr>
						<th colspan='2'>주소(집)</th>
						<td colspan='3'>
							<input type="text" name="zipCode" value="" class="addrinput" readonly="readonly"> <button class="reg" id="zip-btn">주소 검색</button> <br>
							<input type="text" name="addr" value="" class="addrinput2" readonly="readonly">
							<input type="text" name="detailAddr" value="" placeholder="상세주소 입력" class="addrinput2">
						</td>
					</tr>
					<tr>
						<th colspan='2'>생년월일</th>
						<td>
							<input type="date" id="empbirth" name="empbirth" value="2019-06-04" class="input">
						</td>
						<th>입사일</th>
						<td>
							<input type="date" id="userdate" name="userdate" value="2019-06-04" class="input">
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