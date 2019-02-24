<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${del == 1}">
		<script>
			alert("성공");
			window.location="document";
		</script>
	</c:if>
	<c:if test="${del != 1}">
		<script>
			alert("실패");
		</script>
	</c:if>
</body>
</html>