<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./setting.jsp" %>    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>BenkFit</title>
</head>
<body>
	
	<!-- TOP&SIDE -->
	<%@ include file="./top.jsp"%>

	<!-- CONTENT -->
	<div>
		<%@ include file="./Table.jsp"%><!-- 세로 3개 -->
		<%@ include file="./Table2.jsp"%><!-- 가로3개 -->
	</div>

	<!-- FOOTER  -->
	<%@ include file="./footer.jsp"%>

</body>
</html>