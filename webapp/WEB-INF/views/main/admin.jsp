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
ul, ol, li         { list-style-type: none }
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

div.navi { background-color: #E7ECF2; height:100%; width: 16%; min-height: 500px; min-width: 180px; display: inline-block;}
div.navi div.menu-title {width:90%; height: 30px; border-bottom: 1px solid #AEAEAE; padding-left: 10%; padding-top: 10px; padding-bottom: 10px; font-size:20px; font-weight:bold; color: white; background-color: #3A86D2; }
div.navi div.menu-title img {width: 20px; height: 20px; float: right; margin-top: 5px; margin-right: 10px;}
div.navi div.parent-menu {width:90%; height: 30px; border-bottom: 1px solid #AEAEAE; padding-left: 10%; padding-top: 10px; cursor: pointer;}
div.navi div.parent-menu:hover {background-color: #89ADD1; color: white;}
div.navi div span {height:200px; font-weight: bold; font-size: 15px;}
div.navi div.parent-menu img {height: 5px; width: 4px; float: right; margin-top: 9px; margin-right: 10px;}
div.navi div.parent-menu div {height: 20px; width: 20px; float: right; background: url('../../../assets/images/triangle.png') no-repeat;}
div.navi div.menu {background-color:white ; width: 100%; height: 100%; border-bottom: 1px solid #AEAEAE; display: none;}
div.navi div.menu ul{margin-left: 30px; padding-top: 10px; padding-bottom: 10px;}
div.navi div.menu li:not(:first-child){margin-top: 5px;}
div.navi div.menu li:hover{font-weight:bold ; color: #328CF5; cursor: pointer;}
div.navi img.navi-icon {height: 100%; width: 16px;}
div.result-wrapper { background-color: #ffffff; min-height: 484.65px; min-width: 800px; height:100%; width: 83%; padding: 0.5%; float: right;}

div.tbl-wrapper { width : 96%; padding: 2%;}
div.result-wrapper .tbl-result{ width: 100%; border: 1px solid #777; border-collapse:collapse; margin: 0 auto;}
div.result-wrapper .tbl-result td{ border: 1px solid #777; text-align: center;}
div.result-wrapper .tbl-result th{ border: 1px solid #777; }

.icon2 {display: none;}

.active{
	color:white; 
	background-color: #89ADD1;
}
</style>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<%-- 
<link href="${pageContext.servletContext.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css">
 --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(function(){
	$("div.parent-menu").click(function(){
		$this = $(this);
		$icon1 = $this.children().next();
		$icon2 = $this.children().next().next();
		if($this.next().css("display") == "none"){
			$this.addClass("active");
			$this.next().show();
			$icon1.hide();
			$icon2.show();
		}else{
			$this.removeClass("active");
			$this.next().hide();
			$icon1.show();
			$icon2.hide();
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
			<div class="menu-title">시스템 설정<img alt="" src="${pageContext.servletContext.contextPath }/assets/images/setting.png"></div>
			<div class="parent-menu">
				<span>회사/조직관리</span>
				<img class="icon1" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle.png">
				<img class="icon2" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle2.png">
			</div>
			<div class="menu">
				<ul>
					<li>그룹정보관리</li>
					<li>회사정보관리</li>
					<li>조직도정보관리</li>
					<li>직급직책관리</li>
					<li>회사그룹핑관리</li>
				</ul>
			</div>
			<div class="parent-menu">
				<span>사원관리</span>
				<img class="icon1" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle.png">
				<img class="icon2" alt="" src="${pageContext.servletContext.contextPath }/assets/images/triangle2.png">
			</div>
			<div class="menu">
				<ul>
					<li>사원정보관리</li>
					<li>사원부서연결</li>
					<li>인사이동</li>
					<li>인사이동 현황</li>
				</ul>
			</div>
		</div>
		<div class="result-wrapper">
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