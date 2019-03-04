<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>
	<h4>계좌정보</h4>
	<hr>
	<table class="table eq-ui-data-table z-depth-1">
		<tr>
			<th>계좌상품번호</th>
			<td>${cheqinfo.cheq_num}</td>
			<th>가입날짜</th>
			<td>${cheqinfo.myCheq_regDate}</td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td>${cheqinfo.myCheq_account}</td>
			<th>계좌잔액</th>
			<td>￦<fmt:formatNumber value="${cheqinfo.myCheq_amount}" pattern="#,###.##"/></td>
		</tr>
		<tr>
			<th>예금 세율</th>
			<td>${cheqinfo.myCheq_taxRate}</td>
			<th>이체한도</th>
			<td>${cheqinfo.myCheq_limit}</td>
		</tr>
	</table>
	<br>
	<h2>거래내역</h2>
	<hr>
	<table class="table table-hover">
		<tr>
			<th>입금합계</th>
			<c:if test="${CheqIn == 0}">
				<td>-</td>
				</c:if> <c:if test="${CheqIn != 0}">
					<td>￦<fmt:formatNumber value="${CheqIn}" pattern="#,###.##"/></td>
				</c:if>
			<th>출금합계</th>
			<c:if test="${CheqOut == 0}">
					<td>-</td>
				</c:if> <c:if test="${CheqOut != 0}">
					<td>${CheqOut}</td>
				</c:if>
		</tr>
	</table>
	<br>
	<table class="table table-hover">
		<thead style="background-color:#2980b9; color:white;">
			<tr>
				<th>거래번호</th>
				<th>거래일자</th>
				<th>계좌번호</th>
				<th>금액</th>
				<th>보내는이</th>
				<th>받는이</th>
				<th>타입</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty cheq}">
				<tr>
					<td colspan="7" style="text-align: center;">거래내역이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="list" items="${cheq}">
				<tr>
					<td>${list.tran_num}</td>
					<td>${list.tran_date}</td>
					<td>${list.tran_account}</td>
					<td>￦<fmt:formatNumber value="${list.tran_amount}"
							pattern="#,###.##" /></td>
					<td>${list.tran_out}</td>
					<td>${list.tran_in}</td>
					<td>${list.tran_type}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>