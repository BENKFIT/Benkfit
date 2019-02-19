<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>
	<h2>계좌정보</h2>
	<hr>
	<table class="table_kay">
		<tr>
			<th>계좌상품번호</th>
			<td><input type="text" value="${chch.cheq_num}" class="inputStyle" disabled></td>
			<th>가입날짜</th>
			<td><input type="text" value="${chch.myCheq_regDate }" class="inputStyle"disabled></td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td><input type="text" value="${chch.myCheq_account}" class="inputStyle" disabled></td>
			<th>계좌잔액</th>
			<td><input type="text" value="￦<fmt:formatNumber value="${chch.myCheq_amount}" pattern="#,###.##"/>" class="inputStyle"  onchange="getNumber(this);" value="${cheq_account}"disabled></td>
		</tr>
		<tr>
			<th>예금 세율</th>
			<td><input type="text" value="${chch.myCheq_taxRate}" class="inputStyle" disabled></td>
			<th>이체한도 </th>
			<td><input type="text" value="￦<fmt:formatNumber value="${chch.myCheq_limit}" pattern="#,###.##"/>" class="inputStyle" onchange=""  disabled></td>
		</tr>
	</table>
	<hr>
	<br>
	<h2>거래내역</h2>
	<table class="table_kay">
		<tr>
			<th>입금합계</th>
			<td><c:if test="${CheqIn == 0}">
					<input type="text" value="-" class="inputStyle" disabled>
				</c:if> <c:if test="${CheqIn != 0}">
					<input type="text"
						value="￦<fmt:formatNumber value="${CheqIn}" pattern="#,###.##"/>"
						class="inputStyle" disabled>
				</c:if></td>
			<th>출금합계</th>
			<td>
			<c:if test="${CheqOut == 0}">
					<input type="text" value="-" class="inputStyle" disabled>
				</c:if> 
				<c:if test="${CheqOut != 0}">
					<input type="text" value="￦<fmt:formatNumber value="${CheqOut}" pattern="#,###.##"/>"
						class="inputStyle" disabled>
				</c:if>
			</td>
		</tr>
	</table>
	<hr>
	<br>
	<table class="table_kay">
		<tr>
			<th>거래번호</th>
			<th>거래일자</th>
			<th>계좌번호</th>
			<th>금액</th>
			<th>보내는이</th>
			<th>받는이</th>
			<th>타입</th>
		</tr>
		<tr>
		<c:if test="${empty list_Ts}">
			<tr>
				<td colspan="7" style="text-align:center;">거래내역이 존재하지 않습니다.</td>
			</tr>
		</c:if>
			<c:forEach var="list" items="${list_Ts}">
				<tr>
					<td>${list.tran_num}</td>
					<td>${list.tran_date}</td>
					<td>${list.tran_account}</td>
					<td>￦<fmt:formatNumber value="${list.tran_amount}" pattern="#,###.##"/></td>
					<td>${list.tran_out}</td>
					<td>${list.tran_in}</td>
					<td>${list.tran_type}</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>