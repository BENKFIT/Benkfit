<!-- 송운선 2019-01-22 17:43 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<head>
<style>
	td>a {
		color : black;
	}
</style>
</head>
<body>
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
			alert("이벤트 삭제에 실패하였습니다.")
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 0}">
		<script type="text/javascript">
			alert("이벤트가 삭제되었습니다.");
			window.location='event_list_sws?pageNum=${pageNum}&${_csrf.parameterName}=${_csrf.token}';
		</script>
	</c:if>
</body>
</html>