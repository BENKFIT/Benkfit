<!-- 예금 해지  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해지처리</title>
</head>
<body>
	<c:choose>
		<c:when test="${savPw == 0}">
			<script type="text/javascript">
				alert("패스워드오류");
			</script>
		</c:when>
		<c:when test="${sav != 0}">
			<script type="text/javascript">
				alert("해지실패 : [적금잔액이 남아있습니다]");
				window.location="mypage?${_csrf.parameterName}=${_csrf.token}";
			</script>
		</c:when>
		<c:when test="${del_sav != 0}">
			<script type="text/javascript">
				alert("해지실패");
				window.location="mypage?${_csrf.parameterName}=${_csrf.token}";
			</script>
		</c:when>
		<c:when test="${del_sav == 0}">
			<script type="text/javascript">
				alert("해지성공");
				window.location="mypage?${_csrf.parameterName}=${_csrf.token}";
			</script>
		</c:when>
	</c:choose>
</body>
</html>