<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-nav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-ajax.js"></script>
<script>
 $(function() {
    $( "#quick-navbar" ).resizable();
    
    
  });
$(document).on("click", "#departments", function(event){
/* 	console.log($(this).width());
	if($(this).width() < 70){
		console.log("하앙");
		console.log($("#quick-navbar").width());
		$("#quick-navbar").width(500);
		var widthNav = $("#quick-navbar").width();
		
	 	$("#quick-navbar").css("width", widthNav + 500);
	 	$("#quick-navbar").css("width");
	 	
	 }
*/

});
 
</script>

<ul id="quick-navbar" class="sidebar navbar-nav" style="overflow:auto; width:300px;">
	<c:forEach items="${companyList }" var="vo">
		<li class="nav-item dropdown">
			<div class="company nav-link dropdown-toggle"
			   id="pagesDropdown"
			   data-toggle="dropdown"
			   aria-haspopup="true"
			   aria-expanded="true"
			   data-no='${vo.no }'>${vo.name }
		    </div>	   
		    
			<ul c-no='${vo.no }' class="dropdown-menu"
			    aria-labelledby="pagesDropdown">
				
			</ul>
		</li>
	</c:forEach>
</ul>

