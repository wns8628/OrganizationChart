<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header">
	<div class="header-wrapper">
		<div class="admin-top-header">
			<a href='${pageContext.request.contextPath }'>
				<span class="logo-label">Quick Silver </span>
					<span class="logo-label-sub">( 관리자 페이지 )</span>
			</a>
		</div>
		<div class="header-menubar">
			<button><a
					  class="logo-shift"
					  href='${pageContext.request.contextPath }/boot' 
					  onclick="window.open(this.href,'조직도',width=1100,height=800); return false;"
					  >조직도</a></button>
		</div>
	</div>
</div>