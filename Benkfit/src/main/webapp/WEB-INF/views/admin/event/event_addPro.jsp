<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<body>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("이벤트 등록에 실패하였습니다.")
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			alert("이벤트가 등록되었습니다.");
			window.location='event_list_sws?${_csrf.parameterName}=${_csrf.token}';
		</script>
	</c:if>
</body>
</html>