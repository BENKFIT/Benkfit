<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<body>
	<c:choose>
		<c:when test="${cnt == 1}">
			<script type="text/javascript">
				window.location="cheqSavList";
			</script>
		</c:when>
		<c:when test="${Accountcnt == 1}">
			<c:redirect url="cheqSavList"/>
		</c:when>
		<c:when test="${Accountcnt <= 0 }">
			<script type="text/javascript">
				window.location="cheqSavList";
			</script>
		</c:when>
	</c:choose>
</body>
</html>