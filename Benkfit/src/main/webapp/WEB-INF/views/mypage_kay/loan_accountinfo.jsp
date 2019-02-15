<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출계좌조회</title>
</head>
<body>
	<h2>대출정보</h2>
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
			<th>금리</th>
			<td><input type="text" class="inputStyle"></td>
		</tr>
		<tr>
			<th>대출일</th>
			<td><input type="text" value="" class="inputStyle"></td>
			<th>만기일</th>
			<td><input type="text" class="inputStyle"></td>
		</tr>
		<tr>
			<th>대출금</th>
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
			<th>원금</th>
			<td><input type="text" class="inputStyle"></td>
			<th>이자</th>
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
			<td>이자</td>
			<td>60000</td>
			<td></td>
			<td>원금상환</td>
			<td>12314413</td>
			<td>원신한</td>
		</tr>
	</table>

</body>
</html>