<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<body>
	<p><fmt:formatNumber value="${balance / 1000000000000000000}" pattern="##,###"/>Ether</p>
</body>
</html>