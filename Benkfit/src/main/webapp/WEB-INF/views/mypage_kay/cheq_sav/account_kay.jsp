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
		<c:when test="${cheqPw == 0}">
			<script type="text/javascript">
				alert("pw오류");
			</script>
		</c:when>
		<c:when test="${cheq != 0}">
			<script type="text/javascript">
				alert("해지실패 : [예금잔액이 남아있습니다]");
				window.location="mypage";
			</script>
		</c:when>
		<c:when test="${del_cheq == 0}">
			<script type="text/javascript">
				alert("해지실패");
				window.location="mypage";
			</script>
		</c:when>
		<c:when test="${del_cheq == 0}">
			<script type="text/javascript">
				alert("해지성공");
				window.location="mypage";
			</script>
		</c:when>
	</c:choose>
</body>
</html>