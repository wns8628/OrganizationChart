<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-nav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-ajax.js"></script>
<div class="sidebar navbar-nav">
	<c:forEach items="${companyList }" var="vo">
		<div id="company" class="btn-success" data-no='${vo.no }'>${vo.name }</div>
		<ul data-no='${vo.no }'></ul>
	</c:forEach>
</div>

