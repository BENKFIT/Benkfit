<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../Template/setting.jsp"%>
<html>
<body>
	<c:if test="${limit >= 1 }">
		<script type="text/javascript">
				alert("수정성공");
				window.location="limit_sel";
		</script>
	</c:if>
	
	<c:if test="${limit == 0 }">
		<script type="text/javascript">
				alert("수정실패");
		</script>
	</c:if>
</body>
</html>