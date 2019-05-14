<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QS 조직도</title>
<style>
body {
	font: 14px/1.0 Arial, Helvetica, sans-serif;
}

.frame {
	width: 100%; height: 830px;
/* 	margin: 0 auto;
 */	border: 1px solid #1f87d8;
}
.header {
	width:100%; height: 30px;
	background-color: #1f87d8;
	text-align: left;
	color: #ffffff;
	font-weight: bold;
/*  	padding: 1px;
 */ }
.header2 {
	width: 71%;
	height: 30px;
 	margin : 5px 20px 0 0;
 	float: right;
	text-align: left;
}
.container {
/* 	background-color: green;
 */	height: 820px;
	width: 100%;
}
.footer {
	width: 100%; height: 10px;
	background-color: white;
}
.exelbtn {
	float: right;
}
.exel-submit {
/* 	margin: 5px 0 0 0;
 */	border: 1px solid #ececec;
}
.tree {
	float: left;
	width: 25%; height: 800px;
	border: 1px solid #ececec;
 	margin: 20px 0 15px 15px;
}


/*
	검색창
*/
.select-box {
	position: relative;
	width: 50px;
	border: 1px solid #c6c6c6;
	border-radius: 5px;
/* 	margin: -2px 0 0 5px;
 */	z-index: 1;
	/*focus 효과 */
	
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
.search-box {
	
}

.search {
	width: 71%;
	height: 60px;
	border: 1px solid #c6c6c6;
 	display: inline-block;
 	margin: 5px 20px 5px 0;
 	float: right;
	background: #eef4fb;
	margin
}
.input-text {
	width : 300px; height: 25px;
 	margin: 15px;
 	border: 1px solid #c6c6c6;
	line-height: 20px;
	font-weight: bold;
	font-size: 15px;
}
.sch-submit {
	width: 54px; height: 30px;
 	margin: 15px 15px 15px 0; 
 	border: 1px solid #aaa;
	vertical-align: top;
	background: #1f87e2;
	color: #ffffff;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}
.pic {
	display: table;
	border: 1px solid #ececec;
	width: 20%; height: 350px;
 	margin: 10px 10px 20px 0;
  	float: right;
  	text-align: center;
}
.photo {
	display: table-cell;	
	vertical-align: middle;
	margin: 0 auto;
	width: 15px; height: 30px;
	border: 1px solid #ececec;
}

table.member {
	width: 71%;
	border: 1px solid #ececec;
	border-collapse: seprate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
 	margin: 5px 20px 5px 0;
 	float: right;
}
table.member th {
	width: 100px;
	height: 20px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	background: #f9f9f9;
	border: 1px solid #ececec;
}

table.member td {
	border: 1px solid #ececec;
	border-bottom: 1px solid #ececec;
	height: 20px;
	width: 100px;
	padding: 10px;
	vertical-align: top;
}
tr.row:hover {
	background-color: #e6f4fe;
}

table.detail {
	width: 50%; 
	border: 1px solid #d6d4d4;
	border-collapse: seprate;
	border-spacing: 1px;
	line-height: 1.5;
 	margin: 10px 20px 20px 0;
	float: right;
}
table.detail th {
	height: 20px;
	padding: 10px;
	text-align: right;
	vertical-align: top;
	background: #f9f9f9;
	border: 1px solid #ececec;
	
}
table.detail td {
	border: 1px solid #ececec;
	padding: 10px;
	vertical-align: top;
}

.title {
	padding: 10px;
	font-weight: bold;
}

/* navi */
*            { margin:0; padding:0 }
body         { font:0.75em "맑은 고딕", 돋움, 굴림; color:#111; min-width: 1000px;}
ul, ol, li         { list-style-type: none }
fieldset      { border:none }

a:link          { color:#696969; text-decoration:none; font-weight:bold; }
a:visited       { color:#696969F; text-decoration:none; font-weight:bold; }
a:active       { color:#696969; text-decoration:none; font-weight:bold; }
a:hover       { color:#dc143c; text-decoration:none; font-weight:bold; } 

div.header {margin: auto 0;}
div.header select {float: right; margin: 3px 10px;}
div.header span {margin: 5px;}

div.content{ width: 100%; height: 100%;}

div.tree { height: 86.5%; overflow-y:auto;
		width: 20%; min-height: 500px; min-width: 180px; display: inline-block; padding: 0.5%;
		
}
div.tree li {font: 2em; display: block; height: 20px; position: relative;}
div.tree li.comp:not(:first-child) { padding-top: 4px;}
div.tree li.dept { font: 1.5em; }
div.tree li.biz { font: 1.5em; }
div.tree span {cursor: pointer; height: 100%; font-size: 12px; padding-left: 4px;}
div.tree img.navi-icon {height: 16px; width: 16px; vertical-align: middle; float: left;}
div.tree img.tree-icon {height: 20px; width: 20px; vertical-align: top; display: inline-block; float: left;}
div.tree img.open-btn {height: 9px; width: 5px; position: relative; left: -12px; top: -1px; cursor: pointer;}
div.tree img.close-btn {height: 6px; width: 6px; position: relative; left: -13px; top: -3px; cursor: pointer;}
div.tree img.open {display: none;}
div.result-wrapper { background-color: #ffffff; min-height: 500px; min-width: 800px; height:100%; width: 78%; padding: 0.5%; float: right;}

div.tree div.li-div {padding: 2px 0;  display: inline-block;}
div.space { width: 20px; height: 20px; display: inline-block; float: left;}
div.wrap {height: 20px; display: inline-block; float: left}
.active-span{
	background-color: #BEEBFF;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/admin/admin.js"></script>
<script type="text/javascript">
var contextPath = "${pageContext.servletContext.contextPath }";
// var deptRender = function(vo, index, length, last, str){
// 	var btn = "";
// 	var space = "";
	
// 	var depth = "<img class='tree-icon depth' src='${pageContext.servletContext.contextPath }/assets/images/depth.png'>";
// 	var child = "<img class='tree-icon' src='${pageContext.servletContext.contextPath }/assets/images/child.png'>";
// 	var lastChild = "<img class='tree-icon last' src='${pageContext.servletContext.contextPath }/assets/images/last_child.png'>"
// 	var tree = "";
// 	if(vo.deptLevel > 1){
// 		if(last == "true"){
// 			console.log("1");
// 			depth="";
// 			space="<div class='space'></div>";
// 		}else{
			
// 		}
// 	}else{
// 		if(last == "true"){
// 			console.log("3");
// 			depth="";
// 			space="<div class='space'></div>";
// 		}else{
			
// 		}
// 	}
	
	
// 	if(index+1 == length){
// 		tree += lastChild;
// 	}else{
// 		tree = child;
// 	}
	
// 	if(vo.childCount > 0){
// 		btn = "<img class='open-btn close' src='${pageContext.servletContext.contextPath }/assets/images/openbtn.png'>"+
// 		"<img class='close-btn open' src='${pageContext.servletContext.contextPath }/assets/images/closebtn.png'>"
// 	}
	
//    var htmls = "<li class='dept' data-no='"+vo.deptSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parentDeptSeq+"'>"+
//   				"<div class='prev'>"+depth+space+"</div><div class='wrap'>"+tree+btn+
// 				"<div class='li-div'><img class='navi-icon open' src='${pageContext.servletContext.contextPath }/assets/images/open.png'>"+
//    				"<img class='navi-icon close' src='${pageContext.servletContext.contextPath }/assets/images/close.png'>"+
//    				"<span>"+vo.deptName+"<span></div></div></li><ul data-no='"+vo.deptSeq+"'></ul>";
//    if(parseInt(vo.parentDeptSeq) < 10000000){
// 	   $("ul[data-no='"+vo.parentDeptSeq+"']").append(htmls);
//    }else{
// 	   $("ul[b-no='"+vo.parentDeptSeq+"']").append(htmls);
//    }
//    if(str != null){
// 	   $("li[data-no='"+vo.deptSeq+"'] div.prev").prepend(str);
//    }
// }

// var bizRender = function(vo, index, length){
// 	var child = "<img class='tree-icon' src='${pageContext.servletContext.contextPath }/assets/images/child.png'>";
// 	var lastChild = "<img class='tree-icon last' src='${pageContext.servletContext.contextPath }/assets/images/last_child.png'>"
// 	var tree = "";
// 	if(index+1 == length){
// 		tree = lastChild;
// 	}else{
// 		tree = child;
// 	}
	
// 	var btn = "";
// 	if(vo.childCount > 0){
// 		btn = "<img class='open-btn close' src='${pageContext.servletContext.contextPath }/assets/images/openbtn.png'>"+
// 		"<img class='close-btn open' src='${pageContext.servletContext.contextPath }/assets/images/closebtn.png'>"
// 	}
// 	var htmls = "<li class='dept' data-no='"+vo.bizSeq+"' g-no='"+vo.groupSeq+"' p-no='"+vo.parents+"'>"+"<div class='wrap'>"+tree+btn+
// 				"<div class='li-div'><img class='navi-icon open' src='${pageContext.servletContext.contextPath }/assets/images/open.png'>"+
// 				"<img class='navi-icon close' alt='' src='${pageContext.servletContext.contextPath }/assets/images/close.png'>"+
// 				"<span>"+vo.bizName+"<span></div></div></li><ul b-no='"+vo.bizSeq+"'></ul>";
// 	$("ul[c-no='"+vo.compSeq+"']").append(htmls);
// }

// var tableRender = function(vo){
// 	var htmls = "<tr data-no='"+vo.empNum+"'><td>"+vo.empNum+"</td><td>"+vo.empName+"</td><td>"+vo.bDay+"</td><td>"+vo.genderCode+"</td><td>"+vo.positionCode+"</td>"+
// 				"<td>"+vo.dutyCode+"</td><td>"+vo.deptName+"</td></tr>";
// 	$("tbody").append(htmls);
// }

// var getDeptList = function(seq, last, str){
//    $.ajax({
//       url:"${pageContext.servletContext.contextPath }/getDept/"+seq,
//       type:"get",
//       dataType:"json",
//       data:"",
//       success: function(response){
//          $(response.data).each(function(index, vo){
//             deptRender(vo, index, response.data.length, last, str);
//          });
//       },
//       error: function(xhr, status, e){
//          console.error(status+":"+e);
//       }
      
//    });
// }

// var getBizList = function(seq){
// 	$.ajax({
// 		url:"${pageContext.servletContext.contextPath }/getBiz/"+seq,
// 	      type:"get",
// 	      dataType:"json",
// 	      data:"",
// 	      success: function(response){
// 	         $(response.data).each(function(index, vo){
// 	            bizRender(vo, index, response.data.length)
// 	         });
// 	      },
// 	      error: function(xhr, status, e){
// 	         console.error(status+":"+e);
// 	      }
// 	});
// }

// var getEmpInfo = function(seq){
// 	$.ajax({
// 		url:"${pageContext.servletContext.contextPath }/getEmpInfoByDept/"+seq,
// 		type:"get",
// 		dataType:"json",
// 		data:"",
// 		success: function(response){
// 			$(response.data).each(function(index, vo){
// 				tableRender(vo);
// 			});
// 		}
// 	});
// }
$(function(){
   
//    $(document).on("click", "li.comp span", function(event){
// 	   $parent = $(this).parent();
// 	   var seq = $parent.attr("data-no");
// 	   if($parent.next().children().length > 0){
// 		   $parent.next().children().remove();
// 	   }else{
// 		   getBizList(seq);
// 	   }
//    });
   
   
//    //부서별 사원 목록 테이블 출력
//    $(document).on("click", "li.dept span", function(event){
// 	  $parent = $(this).parent().parent();
//       var seq = $parent.attr("data-no");
// 			$("div.li-div").removeClass("active-span");
// 			$(this).parent().addClass("active-span");
// 		   $("tbody tr").remove();
// 		   getEmpInfo(seq);
//    });
   
//    // 하위 부서 목록 출력
//    $(document).on("click", "li.dept img.open-btn", function(event){
// 	   $parent = $(this).parent().parent();
// 	   var seq = $parent.attr("data-no");
// 	   if($parent.children().length >= 2 ){
// 		   var str = $parent.children(".prev").html();
// 		   if($parent.children('.wrap').children('img.last').length > 0){
// 			   getDeptList(seq, "true" , str);
// 		   }else{
// 			   getDeptList(seq, "false", str);
// 		   }
// 	   }else{
// 		   if($parent.children('.wrap').children('img.last').length > 0){
// 			   getDeptList(seq, "true" , null);
// 		   }else{
// 			   getDeptList(seq, "false", null);
// 		   }
// 	   }
// 	   $(this).hide();
// 	   $(this).next().show();
// 	   $(this).next().next().children('.open').show();
// 	   $(this).next().next().children('.close').hide();
//    });
   
// // 하위 부서 목록 제거
//    $(document).on("click", "li.dept img.close-btn", function(event){
// 	   $parent = $(this).parent().parent();
// 	   $parent.next().children().remove();
// 	   $(this).hide();
// 	   $(this).prev().show();
// 	   $(this).next().children('.close').show();
// 	   $(this).next().children('.open').hide();
//    });

});
</script>
</head>
<body>
	<div class="frame">
		<div class="header">
			<span>조직도</span>
		 	<select id="langcode">
		 		<option value="kr">한국어
		 		<option value="en">영어
		 	</select>
		</div>
		<div class="container">
			<div class="tree">
				<ul>
				<c:forEach items="${companyList }" var="vo">
				<li class='comp' data-no='${vo.compSeq }'>
					<img class="navi-icon" alt="" src="${pageContext.servletContext.contextPath }/assets/images/comp.png">
					<span>${vo.compName }</span>
				</li>
				<ul c-no='${vo.compSeq }'></ul>
				</c:forEach>
				</ul>
			</div>
			<br>
			<span class="search">
			<span class="select-box">
				<label for="select"></label>
				<select id="select">
					<option selected>전체</option>
					<option>사원</option>
					<option>부서명</option>
					<option>직급</option>
					<option>직책</option>
					<option>전화번호</option>
					<option>휴대전화</option>
				</select>
			</span>
				<input type="text" class="input-text" placeholder="검색어를 입력하세요"/>
				<button type="submit" class="sch-submit">검색</button>
			</span>
			<br>	
			<div class="header2">
				<span class="title"> 사원목록 </span>
				<span class="exelbtn">
					<button type= "submit" class="exel-submit">엑셀 저장</button>
				</span>
			</div>
			<table class="member">
				<thead>
					<tr>
						<th>부서</th>
						<th>직급</th>
						<th>직책</th>
						<th>사원명(ID)</th>
						<th>전화번호</th>
						<th>휴대전화</th>
					</tr>
				</thead>
				<tbody>
<%
	for(int i =0; i<=5; i++) {
%>		    			
					<tr class="row">
						<td>관리</td>
						<td>사원</td>
						<td>직책2</td>
						<td>ㅇㅇㅇ(ddd1234)</td>
						<td>010-0120-0123</td>
						<td>010-0120-0123</td>
					</tr>
<% 
	}
%>
				</tbody>
			</table>
			<br>
			<table class="detail">
				<tr>
					<th>사원명(ID)</th>
					<td>김 아무개</td>
					<th>생년월일</th>
					<td>1992-03-02</td>
				<tr>
				<tr>
					<th>직급</th>
					<td>사원</td>
					<th>직책</th>
					<td>직책2</td>
				</tr>
				<tr>
					<th>전체부서</th>
					<td colspan="3">quicksilver > 인사</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td colspan="3">010-0101-0101</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>02-123-1234</td>
					<th>팩스번호</th>
					<td>1111-1111-111111</td>
				</tr>
				<tr>
					<th>회사메일</th>
					<td colspan="3">kim@quicksilver.com</td>
				</tr>
				<tr>
					<th>개인메일</th>
					<td colspan="3">kim@gmail.com</td>
				</tr>
				<tr>
					<th>담당업</th>
					<td colspan="3">인적자원관리</td>
				</tr>
			</table>
			<div class="pic">
			<!-- 사원 사진 칸-->	
				<div class="photo">
					
					<img src="${pageContext.request.contextPath }/assets/images/pic.jpg"/>	
				 	
				</div>	
			</div>
			
		</div>
		<div class="footer">
			
		</div>	
	</div>
	
</body>
</html>