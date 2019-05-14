<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-login.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/quicksilver-ajax-js/quicksilver-search.js"></script>

	 <nav class="">
	 		<c:if test="${langCode eq 'kr' }">
		    <a class="main-logo" href="${pageContext.request.contextPath }/boot">Quick Silver (조직도)</a>
		    </c:if>
	 		<c:if test="${langCode eq 'en' }">
		    <a class="main-logo" href="${pageContext.request.contextPath }/boot">Quick Silver (Organization Chart)</a>
		    </c:if>
			<!-- 다국어 -->
			 <c:choose>
				<c:when test="${ langCode eq 'kr' or empty langCode }" >
					<div class="btn-group btn-group-toggle multi" data-toggle="">
					  <a href="${pageContext.servletContext.contextPath }/boot/kr"
					     class="btn btn-secondary btn-sm active">
					    <input type="radio" name="options" id="option1" autocomplete="off" checked>한국어
					  </a>
					  <a href="${pageContext.servletContext.contextPath }/boot/en"
					     class="btn btn-secondary btn-sm">
					    <input type="radio" name="options" id="option2" autocomplete="off">영어 
					  </a>
					</div>			
				</c:when>		
				<c:when test="${ langCode eq 'en' }" >
					<div class="btn-group btn-group-toggle multi" data-toggle="">
					  <a href="${pageContext.servletContext.contextPath }/boot/kr"
					     class="btn btn-secondary btn-sm">
					    <input type="radio" name="options" id="option1" autocomplete="off">Korean
					  </a>
					  <a href="${pageContext.servletContext.contextPath }/boot/en"
					     class="btn btn-secondary btn-sm active">
					    <input type="radio" name="options" id="option2" autocomplete="off" checked>English 
					  </a>
					</div>			
				</c:when>	
			 </c:choose>
			 <!--  -->
	
	    
	
	    <!-- Navbar -->
	    <ul class="navbar-nav ml-auto ml-md-0">
	      <li class="nav-item">   
	        <div id="admin-login" class="form-control btn btn-outline-primary btn-sm">
	        <c:if test="${langCode eq 'kr' }">
	       		 관리자 로그인
	       	</c:if>
	        <c:if test="${langCode eq 'en' }">
	       		 Admin Login
	       	</c:if>
		     	<!--  -->
		     	<div class="wrapper fadeInDown" id="admin-dialog" style="display:none">				  
					  <div id="formContent" >
					    <img class="underlineHover" id="login-cancel" src="${pageContext.request.contextPath }/assets/images/delete.png"></img>
					    <!-- Tabs Titles -->
						<!-- Icon -->	
						<c:if test="${langCode eq 'kr' }">
				        <h2>관리자</h2>
				        </c:if>
						<c:if test="${langCode eq 'en' }">
				        <h2>Admin</h2>
				        </c:if>
					     <div class="fadeIn first">
					  <%--
					       <img src="${pageContext.request.contextPath }/assets/images/quicksilver.jpg" id="icon" alt="User Icon" />
					   --%>
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
		     	<!--  -->
	        </div> 
	
	   	  <!-- href="${pageContext.request.contextPath }/testboot/login -->
	      </li>	     
	    </ul>
	  </nav>
 
