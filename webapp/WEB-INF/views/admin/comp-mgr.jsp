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
div#contents table#company-content-table  {border-collapse:collapse; border-spacing:0; float: right; width:80%; height: 450px;}
div#contents table#company-content-table td{font-family:Arial, sans-serif;font-size:12px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
div#contents table#company-content-table th{font-family:Arial, sans-serif;font-size:12px;font-weight:normal;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
div#contents table#company-content-table .tg-9anz{border-color:#333333;text-align:right;}
div#contents table#company-content-table .tg-dvpl{border-color:inherit;text-align:right;}
div#contents table#company-content-table .tg-de2y{border-color:#333333;text-align:left;}
div#contents table#company-content-table .tg-0pky{border-color:inherit;text-align:left;}

div#contents table#company-content-table th div{float: right;}
</style>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/admin/includes/header.jsp" />
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
				<span>회사정보관리</span>
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
			<table id="company-content-table" style="table-layout: fixed; ">
				<colgroup>
					<col style="width: 61px">
					<col style="width: 61px">
					<col style="width: 181px">
					<col style="width: 90px">
					<col style="width: 210px">
				</colgroup>
				<tr>
					<th class="tg-dvpl" colspan="5"><div>신규</div><div>저장</div><div>삭제</div></th>
				</tr>
				<tr>
					<td class="tg-9anz" colspan="5">회사기본정보</td>
				</tr>
				<tr>
					<td class="tg-9anz" colspan="2"></td>
					<td class="tg-9anz"></td>
					<td class="tg-9anz"></td>
					<td class="tg-de2y"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" rowspan="4"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-0pky"></td>
				</tr>
				<tr>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-0pky"></td>
				</tr>
				<tr>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-0pky"></td>
				</tr>
				<tr>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-0pky"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="2"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-0pky"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="2"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-0pky"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="2"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-0pky"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="2" rowspan="3"></td>
					<td class="tg-dvpl" colspan="3"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="3"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="3"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="2"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-dvpl"></td>
					<td class="tg-0pky"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="2"></td>
					<td class="tg-dvpl" colspan="3"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="5"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="2"></td>
					<td class="tg-dvpl" colspan="3"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="5"></td>
				</tr>
				<tr>
					<td class="tg-dvpl" colspan="2"></td>
					<td class="tg-dvpl" colspan="3"></td>
				</tr>
			</table>
		</div>
		<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
		<c:import url="/WEB-INF/views/admin/includes/footer.jsp" />
	</div>
</body>
</html>