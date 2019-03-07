<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>    
<!DOCTYPE html>
<html>
<body>
	<c:choose>
		<c:when test="${cnt == 1}">
			<c:redirect url="loanRegi"/>
		</c:when>

		<c:when test="${result == 1}">
			<c:redirect url="loanApproval"/>
		</c:when>
		
		<c:when test="${result == 2}">
			<c:redirect url="loanApproval"/>
		</c:when>
	</c:choose>
</body>
</html>