<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>
	<c:if test="${qrCnt == 0}">
		<script>
			alert("발급실패");
			window.location="mypage?${_csrf.parameterName}=${_csrf.token}";
		</script>
	</c:if>
	<c:if test="${qrCnt != 0}">
		<script>
			swal("발급완료"," mypage로돌아갑니다.","success");
			window.location="mypage?${_csrf.parameterName}=${_csrf.token}";
		</script>
	</c:if>
</body>
</html>