<!-- 2019/01/28 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %>

<html>
<body>
	<c:if test="${insertCnt == 0}"> 
	<script type="text/javascript">
		alert("회원가입에 실패했습니다. 잠시 후 다시 시도해주세요");
		window.location="index?${_csrf.parameterName}=${_csrf.token}";
	</script>
	</c:if>
	
	<!-- insert 성공 -->
	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			setTimeout(function() {
				alert("회원가입을 축하합니다. 로그인해주세요");
					window.location="index?${_csrf.parameterName}=${_csrf.token}";
				}, 1000);
		</script>
	</c:if>
</body>
</html>
   
