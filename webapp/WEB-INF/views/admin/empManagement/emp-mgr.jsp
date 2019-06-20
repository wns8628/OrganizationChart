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
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/css/movePersonnelStatus.css" />
	
<script type="text/javascript"
   src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript"
   src="${pageContext.request.contextPath }/assets/js/admin/admin-nav.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
div#contents div#select-bar{width: 98%; height: 30px; background: #EFF6FE; border: 1px solid #B2B2B2; padding: 1%;}
div#contents div#select-bar span{ font: 12px}
.button-css{
	padding-top: 2px;
    padding-bottom: 2px;
    padding-right: 12px;
    padding-left: 12px;
    background-color: white;
    border: 1px solid lightgrey;
}
</style>

  <!-- dataTable -->
  	  <script src="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/vendor/jquery/jquery.min.js"></script>
 	  <script src="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	  <!-- Core plugin JavaScript-->
	  <script src="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
	
	  <!-- Custom scripts for all pages-->
	  <script src="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/js/sb-admin-2.min.js"></script>
	
	  <!-- Page level plugins -->
	  <script src="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
	  <script src="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	
	  <!-- Page level custom scripts -->
	  <script src="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/js/demo/datatables-demo.js"></script>
	  
	  <script type="text/javascript"
			src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/jquery.dataTables.js"></script>
	  <script type="text/javascript"
			src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- dataTable -->
  
  <script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/sb-admin-2.min.js"></script>
  <script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/movePersonnelStatus.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
  
  <!-- 엑셀저장 lib  -->
  <!--  <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/exel-lib/excelexportjs.js"></script> -->



<script type="text/javascript">
var contextPath = "${pageContext.servletContext.contextPath }";

$(function(){
	window.onbeforeunload = function () {
		
		if( document.readyState == "complete"){ // self.screenTop > 9000 브라우저 닫힘
			try {
				if(changeLoginIdWindow){
					changeLoginIdWindow.close();
				}
				
				if(changePasswordWindow){
					changePasswordWindow.close();	
				}
				
				if(addEmp){
					addEmp.close();
				}
			}
			catch (e) {
				console.log(e);
			}
		}
	};
	/* window.addEventListener("beforeunload", () => {
		console.log("FDSFDSFFSD");
		if( self.screenTop > 9000){
			try {
				if(windowObj){
					windowObj.close();
				}
				
			}
			catch (e) {
				console.log(e);
			}
		}
	}); */
	/* $(window).on("beforeunload", () => {
		
	}) */
 /*   var menuList = $("div.menu li");
   for(var i=0; i<menuList.length; i++){
      if($(menuList[i]).text() === $("#contents-header span:last").text()){
         $(menuList[i]).parent().parent().show().prev().addClass("active");
         $(menuList[i]).children().css("color","#328CF5").css("font-weight","bold");
      }
   } */
 let compName = '';
 let workStatus = '';
 let kwd = '';
 let changeLoginIdWindow;
 let changePasswordWindow;
 let addEmp;
 let removeEmpInfoWindow;
 
 if (performance.navigation.type == 1) {
	  console.info( "This page is reloaded" );
	} else {
	  console.info( "This page is not reloaded");
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
	                search(compName, workStatus, kwd, 'true');
	       			
	            }
	        } catch (e) { }
	    }, 500);
 };
 
 let changeButtonCheck = (url, title, option, width, height) => {
	 
	 let popWidth  = width; // 파업사이즈 너비
     let popHeight = height; // 팝업사이즈 높이
     
     let winWidth  = document.body.clientWidth;  // 현재창의 너비
     let winHeight = document.body.clientHeight; // 현재창의 높이
     
     let winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
     let winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표
     let left = winX + (winWidth - popWidth) / 2;
     let top = winY + (winHeight - popHeight) / 2;

	 if( $("#hiddenEmailAddr").val() != '' && $("#hiddenLoginId").val() != '' || title == '입사처리'){
		 
		 if( title == 'ID변경'){
			 changeLoginIdWindow = window.open('${pageContext.servletContext.contextPath }/admin/' + url, title, option + ", left=" + left + ", top=" + top + ", width=" + popWidth + ', height=' + popHeight);
			 closeWindowCheck(changeLoginIdWindow);
		 } else if( title == '비밀번호초기화'){
			 changePasswordWindow = window.open('${pageContext.servletContext.contextPath }/admin/' + url, title, option + ", left=" + left+ ", top=" + top + ", width=" + popWidth + ', height=' + popHeight);
			 closeWindowCheck(changePasswordWindow);
		 } else if( title == '사원정보삭제'){
			removeEmpInfoWindow = window.open('${pageContext.servletContext.contextPath }/admin/' + url, title, option + ", left=" + left+ ", top=" + top + ", width=" + popWidth + ', height=' + popHeight);
			closeWindowCheck(removeEmpInfoWindow);
		 } else {
			 $("#hiddenCheck").val('false');
			 addEmp = window.open('${pageContext.servletContext.contextPath }/admin/' + url, title, option + ", left=" + left+ ", top=" + top + ", width=" + popWidth + ', height=' + popHeight);
			 closeWindowCheck(addEmp);
		 }
		 		 
		 
	 } else {
		 messageBox("알림", "사원을 클릭하십시오.");
	 }
 }

 $(".changeID").click( event => changeButtonCheck("resetIdEmp", "ID변경", 'location=no, scrollbars=yes, alwaysReised=yes', 1000, 238));
 $(".changePassword").click( event => changeButtonCheck("resetPassword", "비밀번호초기화", 'location=no, scrollbars=yes, alwaysReised=yes', 1000, 427));
 $(".addEmp").click( event => changeButtonCheck("addEmp", "입사처리", 'status=no, toolbars=no, location=no, scrollbars=no, alwaysReised=yes', 1170, 726));
 $(".remove").click( event => changeButtonCheck("deleteEmp", "사원정보삭제", 'status=no, toolbars=no, location=no, scrollbars=yes, alwaysReised=yes', 800, 857));

 let search = (compNames, workStatuss, kwds, check) => {
	   
	   console.log(compNames);
	   
	   compName = compNames;
	   workStatus = workStatuss;
	   kwd = kwds;
	   
	   // 매 검색시마다 사원 클릭했던 정보 초기화
	   $("#hiddenEmailAddr").val(''); 
	   $("#hiddenLoginId").val('');
	   
	   if( $('#empName').val() == '' && check != 'true'){
		   messageBox("사원명dsad", "사원명 입력은 필수입니다");
			return;
		}
	   
	   $('#statusTable').DataTable().destroy();
		
	   let table =	$('#statusTable').dataTable({
	            pageLength: 10,
	            bPaginate: true,
	            info:false,
	            pagingType:"numbers",
	            bLengthChange: true,
	            lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
	            bAutoWidth: false,
	            processing: true,
	            ordering: true,
	            serverSide: false,
	            searching: false,
	            scrollY: false,
	            ajax : {
	                "url": contextPath + "/empInfoManage/search",
	                "type":"POST",
	                data: {
		               	compName: compNames,
		               	workStatus: workStatuss,
		               	kwd: kwds
	                },
	                
	            },
	            columns : [
	                {data: "compName"},
	                {data: "deptName"},
	                {data: "position"},
	                {data: "duty"},
	                {data: "empName"},
	                {data: "workStatus"},
	                {data: "useYn"},
	                {data: "license"},
	                {data: "emailAddr"},
	                {data: "mainDeptYn"}
	            ],
	            columnDefs: [{
	            	targets: [8],
	            	searchable: false,
	      			visible: false
	            }, {
	            	targets: [9],
	            	searchable: false,
	            	visible: false
	            }]

	        });  
   };
   
	// 엔터 클릭 인식
	document.getElementsByTagName('body')[0].addEventListener("keydown", event => {
		console.log(event.keyCode);
		
		if( event.keyCode == 13){ // 엔터를 눌렀을때 검색
			search($('.selectBoxStyle option:selected').html(),
					  document.getElementById('compselt').value,
					  document.getElementById('empName').value);
		}
	})
	
	// 검색 버튼 클릭 인식
	document.getElementsByClassName('submit')[0].addEventListener("click", event => search($('.selectBoxStyle option:selected').html(),
																				  document.getElementById('compselt').value,
																				  document.getElementById('empName').value) );
   
   let table = $('#statusTable').dataTable({
       pageLength: 10,
       pagingType:"numbers",
       info:false,
       bPaginate: true,
       bLengthChange: true,
       lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
       bAutoWidth: false,
       processing: true,
       ordering: true,
       serverSide: false,
       searching: false,
   });
   
   table.on( 'draw.dt', () => {
	   /* table.columns([8]).visible(false); */
	   let $tr = $(".table tbody tr");
	   
		 $tr.each( (index, item) => {
		    item.addEventListener('click', event => {
		    	
		    	$tr.each( (index, item) => {
		    		if( item.style.backgroundColor != '' ) {
						item.removeAttribute("style");
		    		}
		    	});
	   			
		    	// 클릭한 사원에 대한 정보
		    	let info = table.api().row($(event.currentTarget)).data();
		    	
		    	$("#hiddenEmailAddr").val( info.emailAddr);
				$("#hiddenCompName").val( info.compName);
				$("#hiddenDeptName").val( info.deptName);
				$("#hiddenPosition").val( info.position);
				$("#hiddenDuty").val( info.duty);
				$("#hiddenMainDeptYn").val (info.mainDeptYn);

		    	$(event.currentTarget).css('background-color', '#E9F2FB');
		    	let splitEmpName = $(event.currentTarget).children()[4].innerHTML.split('(');
		    	let name = splitEmpName[0];
		    	let id = splitEmpName[1];
		    	$("#hiddenLoginId").val( id.slice(0, id.length - 1) );
		    	$("#hiddenEmpName").val( name );
		    });
		   	
		    item.addEventListener('dblclick', event => {
		    	console.log("더블클릭");
		    	let splitEmpName = $(event.currentTarget).children()[4].innerHTML.split('(');
		    	let info = table.api().row($(event.currentTarget)).data();
		    	console.log(info.mainDeptYn);
		    	let name = splitEmpName[0];
		    	let id = splitEmpName[1];
		    	$("#hiddenLoginId").val( id.slice(0, id.length - 1) );
		    	$("#hiddenEmpName").val( name );
		    	changeButtonCheck("addEmp", "사원정보수정", 'status=no, toolbars=no, location=no, scrollbars=yes, alwaysReised=yes', 1300, 857);
		    	$("#hiddenCheck").val('true');
				$("#hiddenMainDeptYn").val (info.mainDeptYn);

		    });
		 });
	})
   
  
   
});


</script>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
	</header>
	<div class="section">
		<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
			<div class="mainSection" >
				<input type="hidden" id="hiddenLoginId" value = "">
				<input type="hidden" id="hiddenEmailAddr" value = "">
				<input type="hidden" id="hiddenCompName" value = "">
				<input type="hidden" id="hiddenDeptName" value = "">
				<input type="hidden" id="hiddenPosition" value = "">
				<input type="hidden" id="hiddenDuty" value = "">
				<input type="hidden" id="hiddenEmpName" value = "">
				<input type="hidden" id="hiddenCheck" value="">
				<input type="hidden" id="hiddenMainDeptYn" value="">
					<div id="contents-header">
						<img class="home" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/home.png">
						<img class="next" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/next.png">
						<span>시스템설정</span> <img class="next" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/next.png">
						<span>사원관리</span> <img class="next" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/next.png">
						<span>사원정보 관리</span>
					</div>
			
				<div class="topSearchDiv">
				
						<span>회사선택</span>
						<select class="selectBoxStyle">
							<option value="all" data-compSeq="all">전체</option>
							<c:forEach items="${compList}" var="vo">
								<option value="${vo.compName }">${vo.compName }</option>
							</c:forEach>
						</select>
						
						<label for="compselt" class="screenout">재직여부</label>
						<select id="compselt">
							<option selected>전체</option>
							<option>재직</option>
							<option>휴직</option>
							<option>퇴직</option>
						</select>
						
						<span>사원명(ID)</span>
						<input class="inputText" id="empName" type="text">
						
						<input class="submit" data-check="false" type="button" value="검색">
						
					
				</div>
				<div id="dialog-message" style="display= none;">
					<p></p>
				</div>
				
				<div class="usr-status">
					<div class="count">
					<span class="buttons">
						<button type= "button" class="changeID button-css">ID변경</button>
						<button type= "button" class="changePassword button-css">비밀번호 초기화</button>
						<button type= "button" class="addEmp button-css">입사처리</button>
						<button type= "button" class="remove button-css">삭제</button>
					</span>
				</div>	
			</div>
				
					 <div class="container-fluid">

			          <!-- DataTales Example -->
			          <div class="card shadow mb-4">
			            <div class="card-header py-3">
			              <h6 class="m-0 font-weight-bold text-primary"></h6>
			            </div>
			            <div class="card-body">
			              <div class="table-responsive">
			                <table class="table table-bordered" id="statusTable" width="100%" cellspacing="0">
			                  <thead>
			                     <tr>
								    <th>회사</th>
								    <th>부서</th>
								    <th>직급</th>
								    <th>직책</th>
								    <th>사원명</th>
								    <th>재직여부</th>
								    <th>사용여부</th>
								    <th>라이선스</th>
								  </tr>
			                  </thead>
			               
			                   
			                </table>
			              </div>
			            </div>
			          </div>
			
			        </div>
				
			</div>
		</div>
   
			
      <c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
   
</body>
</html>