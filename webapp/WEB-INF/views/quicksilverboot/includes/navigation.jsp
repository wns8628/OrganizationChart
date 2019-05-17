<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 조직도 nav -->
<ul>
	<c:forEach items="${companyList }" var="vo">
	<li class='comp' data-no='${vo.compSeq }'>
		<img class="navi-icon" alt="" src="${pageContext.servletContext.contextPath }/assets/images/comp.png">
		<span>${vo.compName }</span>
	</li>
	<ul c-no='${vo.compSeq }'></ul>
	</c:forEach>
</ul>