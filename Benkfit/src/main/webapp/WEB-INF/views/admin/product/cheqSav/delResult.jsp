<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
</head>
<body>
	<c:if test="${result != 1}">
		<script type="text/javascript">
			alert("상품 삭제에 실패하였습니다.")
		</script>
	</c:if>
	
	<c:if test="${result == 1}">
		<script type="text/javascript">
			alert("상품이 삭제되었습니다.");
			window.location='cheqSavRegi';
		</script>
	</c:if>
</body>
</html>