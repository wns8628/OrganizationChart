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
<Style>
body {
	font: 14px/1.0 Arial, Helvetica, sans-serif;
}

.frame {
	width: 100%; height: 875px;
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
 */	height: 875px;
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
.navi {
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
</Style>

</head>
<body>
	<div class="frame">
		<div class="header">
		 	조직도
		</div>
		<div class="container">
			<div class="navi">
			
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