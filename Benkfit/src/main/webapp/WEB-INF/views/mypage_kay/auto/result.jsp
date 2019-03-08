<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>    
<!DOCTYPE html>
<html>
<body>
	<c:choose>
		<c:when test="${autoAdd == 0}">
			<c:redirect url="auto_trans?${_csrf.parameterName}=${_csrf.token}"/>
		</c:when>
		<c:when test="${autoAdd == 1}">
			<c:redirect url="auto_trans?${_csrf.parameterName}=${_csrf.token}"/>
		</c:when>
	</c:choose>
</body>
</html>