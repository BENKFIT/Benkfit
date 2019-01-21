<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
 
<html>
<body>
	<sec:authorize access="isAuthenticated()"> <!-- 현재 사용자가 인증된 경우 -->
		<sec:authentication property="name"/>님 환영합니다. <!-- 현재 접속한 사용자의 인증정보를 보여준다 -->
	</sec:authorize>
	
	<ul>
		<li><a href="<c:url value='home/homeMain'/>">/home/main</a></li>
		<li><a href="<c:url value='user/memberMain'/>">/member/main</a></li>
		<li><a href="<c:url value='admin/adminMain'/>">/admin/main</a></li>
	</ul>
	
	<!-- 인증된 경우에만(로그인된 경우만) 로그아웃 링크 출력 -->
	<sec:authorize access="isAuthenticated()">
		<li><a href="<c:url value='/j_spring_security_logout'/>">j_spring_security_logout</a></li>
	</sec:authorize>
</body>
</html>