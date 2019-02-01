<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출계좌조회</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.1/js/mdb.min.js"></script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
		<h2>대출계좌</h2>
		<hr>
		<form name="loan_account" method="post">
			<table class="table_kay">
			<c:forEach var="lo" items="${loan}">
				<tr>
					<th>대출상품번호</th>
					<td><input type="text" class="inputStyle" value="${lo.loan_num}" disabled></td>
					<th>대출 계좌번호</th>
					<td><input type="text" class="inputStyle" value="${lo.myLoan_account}" disabled></td>
				</tr>
				<tr>
					<th>대출 금액</th>
					<td><input type="text" class="inputStyle" value="${lo.myLoan_amount}" disabled></td>
					<th>대출 잔액</th>
					<td><input type="text" class="inputStyle" value="${lo.myLoan_amount}" disabled></td>
				</tr>
				<tr>
					<th>가입날짜</th>
					<td><input type="text" class="inputStyle" value="${lo.myLoan_date}" disabled></td>
					<th>만기</th>
					<td><input type="text" class="inputStyle" value="${lo.myLoan_late}" disabled></td>
				</tr>
				<tr>
					<th>연체 기간</th>
					<td><input type="text" class="inputStyle" value="${lo.myLoan_over}" disabled></td>
					<th>금리</th>
					<td><input type="text" class="inputStyle" value="${lo.c_id}" disabled></td>
				</tr>
				</c:forEach>
			</table>
		</form>
	</div>

	<%@ include file="../Template/footer.jsp"%>
</body>
</html>