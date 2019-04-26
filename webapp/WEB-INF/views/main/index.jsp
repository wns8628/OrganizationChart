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
body         { font:0.75em "맑은 고딕", 돋움, 굴림; color:#111; min-width: 1000px;}
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

div.content{ width: 100%; height: 100%;}

div.navi { background-color: #2080D0; height:100%; width: 20%; min-height: 500px; min-width: 180px; display: inline-block; padding: 0.5%;}
div.navi li.dept { font: 1.5em; color: white;}
div.navi li.biz { font: 1.5em; color: white;}
div.navi span {cursor: pointer;}
div.result-wrapper { background-color: #ffffff; min-height: 500px; min-width: 800px; height:100%; width: 78%; padding: 0.5%; float: right;}

div.tbl-wrapper { width : 96%; padding: 2%;}
div.result-wrapper .tbl-result{ width: 100%; border: 1px solid #777; border-collapse:collapse; margin: 0 auto;}
div.result-wrapper .tbl-result td{ border: 1px solid #777; text-align: center;}
div.result-wrapper .tbl-result th{ border: 1px solid #777; }

</style>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<%-- 
<link href="${pageContext.servletContext.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css">
 --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">

var deptRender = function(vo){
   var htmls = "<li class='dept' data-no='"+vo.deptSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parentDeptSeq+"' depth='"+vo.depth+"' style='padding-left:"+(vo.deptLevel+1)*20+"px'><span>"+vo.deptName+"<span></li><ul data-no='"+vo.deptSeq+"'></ul>";
   if(parseInt(vo.parentDeptSeq) < 10000000){
	   $("ul[data-no='"+vo.parentDeptSeq+"']").append(htmls);
   }else{
	   $("ul[b-no='"+vo.parentDeptSeq+"']").append(htmls);
   }
}

var bizRender = function(vo){
	var htmls = "<li class='biz' data-no='"+vo.bizSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parents+"' style='padding-left:20px'><span>"+vo.bizName+"<span></li><ul b-no='"+vo.bizSeq+"'></ul>";
	$("ul[c-no='"+vo.compSeq+"']").append(htmls);
}

var tableRender = function(vo){
	var htmls = "<tr data-no='"+vo.empSeq+"'><td>"+vo.empSeq+"</td><td>"+vo.empName+"</td><td>"+vo.bDay+"</td><td>"+vo.genderCode+"</td><td>"+vo.positionCode+"</td>"+
				"<td>"+vo.dutyCode+"</td><td>"+vo.deptName+"</td></tr>";
	$("tbody").append(htmls);
}

var getList = function(seq){
   $.ajax({
      url:"${pageContext.servletContext.contextPath }/getDept/"+seq,
      type:"get",
      dataType:"json",
      data:"",
      success: function(response){
         $(response.data).each(function(index, vo){
            deptRender(vo)
         });
      },
      error: function(xhr, status, e){
         console.error(status+":"+e);
      }
      
   });
}

var getBizList = function(seq){
	$.ajax({
		url:"${pageContext.servletContext.contextPath }/getBiz/"+seq,
	      type:"get",
	      dataType:"json",
	      data:"",
	      success: function(response){
	         $(response.data).each(function(index, vo){
	            bizRender(vo)
	         });
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
}

var getEmpInfo = function(seq){
	$.ajax({
		url:"${pageContext.servletContext.contextPath }/getEmpInfo/"+seq,
		type:"get",
		dataType:"json",
		data:"",
		success: function(response){
			$(response.data).each(function(index, vo){
				tableRender(vo);
			});
		}
	});
}
$(function(){
   
   //자회사 목록
//    $(document).on("click", "h3", function(event){
// 	   var no = $(this).attr("data-no") * -1;
// 	   if($(this).next().children().length > 0){
// 		   $(this).next().children().remove();
// 	   }else{
// 		   getList(no);
// 	   }
//    });
   
   $(document).on("click", "h3 span", function(event){
	   $parent = $(this).parent();
	   var seq = $parent.attr("data-no");
	   if($parent.next().children().length > 0){
		   $parent.next().children().remove();
	   }else{
		   getBizList(seq);
	   }
   });
   
   //부서 목록
   $(document).on("click", "li span", function(event){
	  $parent = $(this).parent();
      var seq = $parent.attr("data-no");
      if($parent.next().children().length > 0){
    	  $parent.next().children().remove();
	  }else{
		   getList(seq);
		   $("tbody tr").remove();
		   getEmpInfo(seq);
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
				<a href="${pageContext.servletContext.contextPath }/main3/kr"><span>kr</span></a>
				<a href="${pageContext.servletContext.contextPath }/main3/en"><span>en</span></a>
				<button>login</button>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="navi">
			<c:forEach items="${companyList }" var="vo">
				<h3 data-no='${vo.compSeq }'><span>${vo.compName }</span></h3><ul c-no='${vo.compSeq }'></ul>
			</c:forEach>
		</div>
		<div class="result-wrapper">
			<!-- 더미데이터 버튼 -->
			<%-- <a href="${pageContext.request.contextPath }/addDept">add</a> --%>
			<div class="tbl-header"></div>
			<div class="tbl-wrapper">
				<table class="tbl-result">
					<thead>
						<tr>
							<th>사원번호</th>
							<th>이름</th>
							<th>나이</th>
							<th>성별</th>
							<th>직급</th>
							<th>직책</th>
							<th>부서</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="footer">
		<p>copyright 2019</p>
	</div>
</body>
</html>