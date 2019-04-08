<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>jQuery treemenu.js Plugin Demo</title>
<link href="${pageContext.request.contextPath }/assets/css/treejs/jquery.treemenu.css" rel="stylesheet" type="text/css">
</head>
<body>

	<ul class="tree">
	  <li><a href="">Home</a></li>
	  <li><span>더 세준</span>
	    <ul>
	      <li>
	       <a href="#">부서1</a>
	        <ul>
	          <li><a href="#">부서1-1</a>
	        	<ul>
	        	  <li><a href="#">부서1-1-1</a></li>
	        	</ul>
	          </li>
	          <li><a href="#">부서1-2</a>
	        	<ul>
	        	  <li><a href="#">부서1-2-1</a></li>
	        	</ul>
	          </li>
	        </ul>
	      </li>
	      <li><a href="#">부서2</a>
	        <ul>
	          <li><a class="active" href="#">AngularJS</a></li>
	          <li><a href="#">React</a></li>
	          <li><a href="#">Backbone</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#suits">Golang</a>
	      </li>
	    </ul>
	  </li>
	  <li><a href="#about">About</a>
	    <ul>
	      <li><a href="#">Contact</a></li>
	      <li><a href="#">Blog</a></li>
	      <li><a href="#">Jobs</a>
	        <ul>
	          <li><a href="#jobs1">Job 1</a></li>
	          <li><a href="#jobs2">Job 2</a></li>
	          <li><a href="#jobs3">Job 3</a></li>
	        </ul>
	      </li>
	    </ul>
	  </li>
	</ul>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/treejs/jquery.treemenu.js"></script>
<script>
$(function(){
        $(".tree").treemenu({delay:300}).openActive();
    });
</script>
</body>
</html>
    