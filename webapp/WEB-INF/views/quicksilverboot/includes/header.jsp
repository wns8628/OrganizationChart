<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	 <nav class="">
	 	<!-- 메인로고 -->
	    <a class="main-logo lang" data-lang='title' href="${pageContext.request.contextPath }/boot">Quick Silver (조직도)</a>
	    
		<!-- 다국어 -->
				<div class="btn-group btn-group-toggle multi" data-toggle="">
				  <%-- <a href="${pageContext.servletContext.contextPath }/boot/kr"
				     class="btn btn-secondary btn-sm active">
				    <input type="radio" name="options" id="option1" autocomplete="off" checked>한국어
				  </a>
				  <a href="${pageContext.servletContext.contextPath }/boot/en"
				     class="btn btn-secondary btn-sm">
				    <input type="radio" name="options" id="option2" autocomplete="off">영어 
				  </a> --%>
				  <select id="langcode">
		 			<option class='lang' value="kr" data-lang='kr'>한국어
		 			<option class='lang' value="en" data-lang='en'>영어
		 		  </select>
				</div>			
		<!--  -->

	    <!-- 관리자로그인 -->
	    <ul class="navbar-nav ml-auto ml-md-0">
	      <li class="nav-item">   
	        <div id="admin-login" class="form-control btn btn-outline-primary btn-sm lang" data-lang='adminLogin'>
		       		 관리자 로그인
		     	<div class="wrapper fadeInDown" id="admin-dialog" style="display:none">				  
					  <div id="formContent" >
						    <img class="underlineHover" id="login-cancel" src="${pageContext.request.contextPath }/assets/images/delete.png"></img>
					       	 	 <h2 class='lang' data-lang='admin'>관리자</h2>
						    <div class="fadeIn first">
						    </div>		
						    <!-- Login Form -->
						    <form>
						      <input type="text" id="login" class="fadeIn second" name="login" placeholder="login">
						      <input type="text" id="password" class="fadeIn third" name="login" placeholder="password">
						      <input type="submit" class="fadeIn fourth" value="Log In">
						    </form>
						    <!-- Remind Passowrd -->
						    <div id="formFooter">
						      <a class="underlineHover" href="#">Forgot Password?</a>
						    </div>
					  </div>
				</div>    	
	        </div> 
	     	<!--  -->
	     	
	      </li>	     
	    </ul>
	  </nav>
 
