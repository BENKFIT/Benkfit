<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌조회</title>
</head>
<body>
	<h2>적금정보</h2>
	<hr>
	<table class="table_kay">
		<tr>
			<th>계좌명</th>
			<td><input type="text" class="inputStyle"></td>
			<th>계좌번호</th>
			<td><input type="text" value="" class="inputStyle"></td>
		</tr>
		<tr>
			<th>고객명</th>
			<td><input type="text" class="inputStyle"></td>
			<th>이율</th>
			<td><input type="text" class="inputStyle"></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><input type="text" value="" class="inputStyle"></td>
			<th>만기일</th>
			<td><input type="text" class="inputStyle"></td>
		</tr>
		<tr>
			<th>자동이체계좌</th>
			<td><input type="text" value="" class="inputStyle"></td>
			<th>이체일</th>
			<td><input type="text" class="inputStyle"></td>
		</tr>
		<tr>
			<th>이체금액</th>
			<td><input type="text" value="" class="inputStyle"></td>
			<th>잔액</th>
			<td><input type="text" class="inputStyle"></td>
		</tr>
	</table>
	<hr>
	<br>
	<h2>거래내역</h2>
	<table class="table_kay">
		<tr>
			<th>입금합계&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<td><input type="text" class="inputStyle"></td>
			<th>출금합계&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<td><input type="text" class="inputStyle"></td>
		</tr>
	</table>
	<hr>
	<br>
	<table class="table_kay">
		<tr>
			<th>거래일자</th>
			<th>거래시간</th>
			<th>적요</th>
			<th>출금(원)</th>
			<th>입금(원)</th>
			<th>내용</th>
			<th>잔액(원)</th>
			<th>거래점</th>
		</tr>
		<tr>
			<td>2019-01-25</td>
			<td>14:04:23</td>
			<td>체크</td>
			<td>6000</td>
			<td></td>
			<td>N_김치찌개</td>
			<td>123,455</td>
			<td>원신한</td>
		</tr>
	</table>
</body>
</html>