<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<body>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("이벤트 수정에 실패하였습니다.")
			window.location='event_list_sws?pageNum=${pageNum}&${_csrf.parameterName}=${_csrf.token}';
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("이벤트가 수정되었습니다.");
			window.location='event_list_sws?pageNum=${pageNum}&${_csrf.parameterName}=${_csrf.token}';
		</script>
	</c:if>
</body>
</html>