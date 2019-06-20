<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  dataTable -->
  <%-- <link href="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="${pageContext.servletContext.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
   --%>
   
   
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
  
 <!--  dataTable -->

 
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
 <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
 
<link
	href="${pageContext.servletContext.contextPath }/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/css/movePersonnelStatus.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/admin-nav.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/sb-admin-2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/quicksilverbootstrap/js/demo/datatables-demo.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/admin/movePersonnelStatus.js"></script>

<script type="text/javascript">

let contextPath = "${pageContext.servletContext.contextPath }";
let kwd = '';

$(function(){
	
	$(".active").each( (index, item) => {
		console.log(item);
		
	});
	ArrowChange();

	// 엔터 클릭 인식
	document.getElementsByTagName('body')[0].addEventListener("keydown", event => {
		console.log(event.keyCode);
		
		if( event.keyCode == 13){ // 엔터를 눌렀을때 검색
			search();
		}
	})
	
	// 검색 버튼 클릭 인식
	document.getElementsByClassName('submit')[0].addEventListener("click", search);
	
	 $('#statusTable').dataTable({
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
	 
	 $( "#startDate" ).datepicker({
		  showOn: "button", 
	      buttonImage: "${pageContext.request.contextPath }/assets/images/calender.png", 
	      buttonImageOnly: false,
	      changeMonth: true, 
	      changeYear: true,
	      nextText: '다음 달',
	      prevText: '이전 달',
	      dateFormat: "yy-mm-dd",
	      changeMonth: true, 
	      dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	      dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	      monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	      monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	      maxDate: "+0D"
	  
	  });
	 
	 $( "#endDate" ).datepicker({
		  showOn: "button", 
	      buttonImage: "${pageContext.request.contextPath }/assets/images/calender.png", 
	      buttonImageOnly: false,
	      changeMonth: true, 
	      changeYear: true,
	      nextText: '다음 달',
	      prevText: '이전 달',
	      dateFormat: "yy-mm-dd",
	      changeMonth: true, 
	      dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	      dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	      monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	      monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  maxDate: "+0D"
	  });
	 
	 $(".dataTables_scrollBody").css('height', '400px');
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
			
					<div id="contents-header">
						<img class="home" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/home.png">
						<img class="next" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/next.png">
						<span>시스템설정</span> <img class="next" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/next.png">
						<span>사원관리</span> <img class="next" alt=""
							src="${pageContext.servletContext.contextPath }/assets/images/next.png">
						<span>인사이동 현황</span>
					</div>
			
				<div class="topSearchDiv">
				
					<span>회사선택</span>
					<select class="selectBoxStyle">
						<option value="all" data-compSeq="all">전체</option>
						<c:forEach items="${compList}" var="vo">
							<option value="${vo.compName }">${vo.compName }</option>
						</c:forEach>
					</select>
						
					<span>기간</span>
					<input class="inputText" id="startDate" data-focus=false type="text">
					~
					<input class="inputText" id="endDate" data-focus=false type="text">
						
					<span>사원명(ID)</span>
					<input class="inputText" id="empName" type="text">
						
					<input class="submit movePersonnel-search" data-check="false" type="button" value="검색">

					
				</div>
				<div id="dialog-message" style="display= none;">
					<p></p>
				</div>
				
					 <div class="container-fluid">

			          <!-- DataTales Example -->
			          <div class="card shadow mb-4">
			            <div class="card-header py-3">
			              <h6 class="m-0 font-weight-bold text-primary">● 사용자 목록</h6>
			            </div>
			            <div class="card-body">
			              <div class="table-responsive">
			                <table class="table table-bordered" id="statusTable" width="100%" cellspacing="0">
			                  <thead>
			                     <tr>
								    <th rowspan="2">변경일</th>
								    <th rowspan="2">회사명</th>
								    <th rowspan="2">사원명(ID)</th>
								    <th rowspan="2">재직여부</th>
								    <th colspan="3">변경정보</th>
								    <th colspan="3">이전 정보</th>
								  </tr>
								  <tr>
								    <td>부서</td>
								    <td>직급</td>
								    <td>직책</td>
								    <td>부서</td>
								    <td>직급</td>
								    <td>직책</td>
								  </tr>
			                  </thead>
			               
			                   
			                </table>
			              </div>
			            </div>
			          </div>
			
			        </div>
				
			</div>
		</div>
			
			
			
		<footer>
			<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
		
		</footer>
</body>
</html>