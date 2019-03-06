<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서류등록처리</title>
</head>
		<c:if test="${result == 1}">
			<script type="text/javascript">
				alert("파일업로드 성공");
				window.location='mypage';
			</script>
		</c:if>
			<c:if test="${result != 1}">
			<script type="text/javascript">
				alert("파일업로드 실패");
				window.location='upload';
			</script>
		</c:if>
</body>
</html>