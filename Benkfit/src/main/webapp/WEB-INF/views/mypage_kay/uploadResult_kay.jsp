<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보수정</title>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
	
		<c:if test="${result == 1}">
			<script type="text/javascript">
				alert("파일업로드 성공");
				window.location='docu_read?filenam=${imgfile}';
			</script>
		</c:if>
			<c:if test="${result != 1}">
			<script type="text/javascript">
				alert("파일업로드 실패");
			</script>
		</c:if>
		
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>