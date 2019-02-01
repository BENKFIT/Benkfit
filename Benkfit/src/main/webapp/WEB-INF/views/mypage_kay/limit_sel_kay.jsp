<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이체한도 조회</title>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
		<h2>이체한도조회</h2>
		<hr>
		<table class="table_kay">
			<tr>
				<th></th>
				<th>현재이체한도</th>
				<th>감액이체한도</th>
			</tr>
			<tr>
				<th>1일 통합이체한도</th>
				<td>1000000</td>
				<td><input type="text" class="inputStyle" autofocus></td>
			</tr>
			<tr>
				<th>1회 통합이체한도</th>
				<td>1000000</td>
				<td><input type="text" class="inputStyle"></td>
			</tr>
			<tr>
				<th colspan="3"><button class="btn2 btn2-info">변경신청</button></th>
			</tr>
		</table>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>