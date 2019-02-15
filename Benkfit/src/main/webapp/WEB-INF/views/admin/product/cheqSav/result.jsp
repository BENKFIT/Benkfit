<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>    
<!DOCTYPE html>
<html>
<body>
	<c:choose>
		<c:when test="${cnt == 1}">
			<c:redirect url="cheqSavRegi"/>
		</c:when>
	</c:choose>
</body>
</html>