<!-- 서류삭제 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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