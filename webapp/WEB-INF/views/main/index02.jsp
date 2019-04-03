<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<style type="text/css">
li{display: none;}
</style>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<%-- 
<link href="${pageContext.servletContext.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css">
 --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">

var render = function(vo){
	var htmls = "<h2 data-no='"+vo.no+"'>"+vo.name+"</h2><ul data-no='"+vo.no+"'></ul>";
	$("body").append(htmls);
}

var render2 = function(vo){
	var htmls = "<li data-no='"+vo.no+"' g-no='"+vo.gNo+"' p-no='"+vo.parents+"' depth='"+vo.depth+"' style='padding-left:"+vo.depth*10+"px'>"+vo.name+"</li>";
	$("ul[data-no='"+vo.companyNo+"']").append(htmls);
}

var getList = function(){
	$.ajax({
		url:"${pageContext.servletContext.contextPath }/getlist",
		type:"get",
		dataType:"json",
		data:"",
		success: function(response){
			console.log(response.data);
			$(response.data.companyVoList).each(function(index, vo){
				render(vo);
			});
			$(response.data.departmentsVoList).each(function(index, vo){
				render2(vo)
			});
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
		
	});
}

$(function(){
	getList();
	
	//자회사 목록
	$(document).on("click", "h2", function(event){
		var cno = $(this).attr("data-no");
		console.log($("ul[data-no='"+cno+"'] li[depth='1']").css("display"));
		$list = $("ul[data-no='"+cno+"'] li[depth='1']");
		if($list.css("display")==="none"){
			$list.show();
		}else{
			$list.hide();
		}
		
	});
	
	//부서 목록
	$(document).on("click", "li", function(event){
		var no = $(this).attr("data-no");
		console.log(no);
		var gno = $(this).attr("g-no");
		var depth = ($(this).attr("depth")*1)+1;
		$list = $("li[p-no='"+no+"']");
		if($list.css("display")==="none"){
			$list.show();
		}else{
			$list.hide();
		}
	});
});
</script>
</head>
<body>
	<%-- <c:forEach items="${mainMap.companyVoList}" var="companyList">
		<h2>${companyList}</h2>
		
		<c:forEach items="${mainMap.departmentsVoList}" var="departmentsList">
			<c:if test="${companyList.no eq departmentsList.companyNo }">
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
		   </c:if>
	   </c:forEach>
	</c:forEach> --%>
</body>
</html>