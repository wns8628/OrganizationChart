<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	 <nav class="">
	 
	 	<!-- 메인로고 -->
	    <a class='main-logo' href="${pageContext.request.contextPath }/">Quick Silver ( <span class="lang" data-lang='title'>조직도</span> )</a>
	    
		<!-- 다국어 -->
				<div class="btn-group btn-group-toggle multi" data-toggle="">
				  <select id="langcode">
		 			<option class='lang' value="kr" data-lang='kr'>한국어
		 			<option class='lang' value="en" data-lang='en'>영어
		 		  </select>
				</div>			
		<!--  -->

	    <!-- 관리자로그인 -->
	    <ul class="navbar-nav ml-auto ml-md-0">
	      <li class="nav-item">   
	        <div id="admin-login" class="form-control btn btn-outline-primary btn-sm lang" data-lang='admin'>
		       		<a class ="admin-go"href="${pageContext.request.contextPath }/admin/chart"> 관리자</a>
	        </div> 
	     	
	      </li>	     
	    </ul>
	  </nav>
 
