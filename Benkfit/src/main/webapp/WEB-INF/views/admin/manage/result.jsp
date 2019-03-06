<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>    
<!DOCTYPE html>
<html>
<body>
	<c:choose>
		<c:when test="${deployPro == 0}">
			<script type="text/javascript">
				alert("배포에 실패하셨습니다.");
				window.location = "manage";
			</script>
		</c:when>
		<c:when test="${deployPro == 1}">
			<script type="text/javascript">
				alert("배포에 성공하셨습니다.");
				window.location = "manage";
			</script>
		</c:when>
	</c:choose>	
</body>
</html>