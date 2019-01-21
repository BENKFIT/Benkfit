<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
 
<html>
<body>
	<%-- <sec:authentication> : 현재 접속한 사용자의 인증정보를 보여준다 --%>
	home(연결계정: <sec:authentication property="name" />) 메인화면 <br><br>
	
	<a href="<c:url value='/index.jsp' />">[/index로 가기]</a>
</body>
</html>