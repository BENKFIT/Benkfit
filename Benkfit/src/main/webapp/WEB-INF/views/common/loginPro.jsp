<!-- 2019/01/31 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
    window.location="index?${_csrf.parameterName}=${_csrf.token}";
</script>
</body>
</html>