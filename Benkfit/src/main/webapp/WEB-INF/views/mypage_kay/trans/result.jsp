<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<body>
	<c:choose>
		<c:when test="${chkNum == 1}">
			<script type="text/javascript">
				alert('송금완료');
				window.location="trans?${_csrf.parameterName}=${_csrf.token}";
			</script>
		</c:when>
		<c:when test="${chkNum != 1}">
			<script type="text/javascript">
				alert('송금실패');
				window.location="trans?${_csrf.parameterName}=${_csrf.token}";
			</script>
		</c:when>
	</c:choose>
</body>
</html>