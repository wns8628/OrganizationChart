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

/* reset */
*            { margin:0; padding:0 }
body         { font:0.75em "맑은 고딕", 돋움, 굴림; color:#111;}
ul, ol         { list-style-type: none }
fieldset      { border:none }

a:link          { color:#696969; text-decoration:none; font-weight:bold; }
a:visited       { color:#696969F; text-decoration:none; font-weight:bold; }
a:active       { color:#696969; text-decoration:none; font-weight:bold; }
a:hover       { color:#dc143c; text-decoration:none; font-weight:bold; } 

/* header */
div#header ul      { height:20px } 
div#header li      { float:right; margin-right:10px; }
div#header li a    { color:#fff; font-weight:bold; text-decoration:none; }

div.header-wrapper { width: 100%; height: 30px; background-color: #111111; vertical-align: middle; /* padding: 5px 10px;  */}
div.header-wrapper span {color : white; font-size: 20px;}
div.header-menubar { background: transparent; width: 40%; height: 30px; display: inline; float: right;}
div.header-menubar button {background: transparent; color:white; font-size: 20px; float: right;}

div#footer { width: 100%; height: 30px; background-color: #111111; vertical-align: middle; /* padding: 5px 10px;  */}
div#footer p { color: white; text-align: center;}

div.navi { background-color: #2080D0; height:100%; width: 20%; min-height: 500px; min-width: 180px; display: inline-block; padding: 0.5%;}
div.navi li.dept { font: 1.5em; color: white;}
div.result-wrapper { background-color: #ffffff; min-height: 500px; min-width: 800px; height:100%; width: 78%; padding: 0.5%; float: right;}

div.tbl-wrapper { width : 100%; }
div.result-wrapper .tbl-result{ width: 60%; border: 1px solid #777; border-collapse:collapse; margin: 0 auto;}
div.result-wrapper .tbl-result td{ border: 1px solid #777; text-align: center;}
div.result-wrapper .tbl-result th{ border: 1px solid #777; }

</style>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<%-- 
<link href="${pageContext.servletContext.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css">
 --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">

var render = function(vo){
   var htmls = "<li class='dept' data-no='"+vo.no+"' g-no='"+vo.gNo+"' p-no='"+vo.parents+"' depth='"+vo.depth+"' style='padding-left:"+vo.depth*10+"px'>"+vo.name+"</li><ul data-no='"+vo.no+"'></ul>";
   if(vo.parents > 0){
	   $("ul[data-no='"+vo.parents+"']").append(htmls);
   }else{
	   $("ul[data-no='"+vo.companyNo+"']").append(htmls);
   }
}

var getList = function(parents){
   $.ajax({
      url:"${pageContext.servletContext.contextPath }/getDept/"+parents,
      type:"get",
      dataType:"json",
      data:"",
      success: function(response){
         $(response.data).each(function(index, vo){
            render(vo)
         });
      },
      error: function(xhr, status, e){
         console.error(status+":"+e);
      }
      
   });
}

$(function(){
   
   //자회사 목록
   $(document).on("click", "h3", function(event){
	   var no = $(this).attr("data-no") * -1;
	   if($(this).next().children().length > 0){
		   $(this).next().children().remove();
	   }else{
		   getList(no);
	   }
   });
   
   //부서 목록
   $(document).on("click", "li", function(event){
      var no = $(this).attr("data-no");
      if($(this).next().children().length > 0){
		   $(this).next().children().remove();
	  }else{
		   getList(no);
	  }
   });
});
</script>
</head>
<body>
	<div id="header">
		<div class="header-wrapper">
			<span>quicksilver</span>
			<div class="header-menubar">
				<button>login</button>      
			</div>
		</div>
	</div>
	<div class="navi">
		<c:forEach items="${companyList }" var="vo">
			<h3 data-no='${vo.no }'>${vo.name }</h3><ul data-no='${vo.no }'></ul>
		</c:forEach>
	</div>
	<div class="result-wrapper">
		<!-- 더미데이터 버튼 -->
		<%-- <a href="${pageContext.request.contextPath }/addDept">add</a> --%>
		<div class="tbl-wrapper">
			<table class="tbl-result">
				<tr>
					<th>부서</th>
					<th>이름</th>
					<th>직급</th>
					<th>나이</th>
				</tr>
				<tr>
					<td>부서1</td>
					<td>둘리</td>
					<td>부장</td>
					<td>17</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="footer">
		<p>copyright 2019</p>
	</div>
</body>
</html>