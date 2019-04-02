<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<%-- 
<link href="${pageContext.servletContext.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css">
 --%>
</head>
<body>

	<c:forEach items="${mainMap.companyVoList}" var="companyList">
		<h2>${companyList}</h2>
	</c:forEach>
	
	<c:forEach items="${mainMap.departmentsVoList}" var="departmentsList">
		<ul>
		   <li>
			 <table style="padding-left:${30*departmentsList.depth}px">
				<tr>
					<td>
						<h2>${departmentsList.name}</h2>
					</td>		
				</tr>
			 </table>
		   </li>
	   </ul>
	</c:forEach>



<!--  -->
	<%-- 
<table style="padding-left:${15*vo.depth}px">
	<tr >
		<td >
			<c:if test="${vo.depth > 0}" >
				<img src="${pageContext.servletContext.contextPath }/assets/images/reply.png">
			</c:if>
			[${ count = count+1 }] |
		 </td>
	<c:choose>
		<c:when test="${ vo.userNo > 0 }">			 
			<td style="color:red"><strong>${vo.name }</strong></td>
		</c:when>
		<c:otherwise>
			<td>${vo.name }</td>
		</c:otherwise>
	</c:choose>	 			
		<td> | ${vo.writeDate }</td>
		<td><a href="${pageContext.servletContext.contextPath }/board/commentdelete?pageNo=${param.pageNo}&no=${vo.no}&boardNo=${view.no}&kwd=${param.kwd}">삭제</a></td>
		<td><a href="${pageContext.servletContext.contextPath }/board/commentmodify?pageNo=${param.pageNo}&no=${vo.no}&boardNo=${view.no}&kwd=${param.kwd}">수정</a></td>
		<td><a href="${pageContext.servletContext.contextPath }/board/commentreply?pageNo=${param.pageNo}&no=${vo.no}&boardNo=${view.no}&kwd=${param.kwd}">대댓글</a></td>
	</tr>
	<tr>
		<td colspan=4>
		${fn:replace(vo.contents,  newline, "<br>") }
		</td>
	</tr>
</table>
	 --%>
<!--  -->	
	
</body>
</html>