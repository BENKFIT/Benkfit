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
	<form action="lim_pro" method="post">
		<h2>이체한도조회</h2>
		<hr>
		<table class="table_kay">
			<tr>
				<th>&nbsp;&nbsp;</th>
				<th>현재이체한도</th>
				<th>변경이체한도</th>
			</tr>
			<tr>
				<th>1일 이체한도</th>
				<td><fmt:formatNumber value="${limit.myCheq_limit}" pattern="#,###.##"/></td>
				<td><input type="text" name="lim" class="inputStyle" autofocus></td>
			</tr>
			<tr >
				<th colspan="3" class="trBtn">
					<input type="submit" class="btn2 btn2-info" value="변경신청">
					<input type="button" class="btn2 btn2-success"  value="마이페이지로 이동" 
					onclick="location='mypage'">
				</th>
			</tr>
		</table>
		</form>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>