<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="sidebar navbar-nav">
	<c:forEach items="${companyList }" var="vo">
		<div id="company" class="btn-success" data-no='${vo.no }'>${vo.name }</div>
		<ul data-no='${vo.no }'></ul>
	</c:forEach>
</div>

