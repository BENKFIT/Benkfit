<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	<c:if test="${update == 0 }">
		<!-- 실패 -->
		<script type="text/javascript">
			alert("수정실패")
			window.location = "mypage?${_csrf.parameterName}=${_csrf.token}";
		</script>
	</c:if>

	<c:if test="${update != 0}">
		<!-- 성공 -->
		<script type="text/javascript">
			alert("수정완료/ 마이페이지로 돌아갑니다.");
			window.location = "mypage?${_csrf.parameterName}=${_csrf.token}";
		</script>
	</c:if>
</body>
</html>