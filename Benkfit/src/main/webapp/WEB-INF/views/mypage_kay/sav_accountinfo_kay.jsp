<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
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
			<th>적금상품명</th>
			<td><input type="text" value="${savinfo.mySav_name}"
				class="inputStyle" disabled></td>
			<th>계좌번호</th>
			<td><input type="text" value="${savinfo.mySav_account}"
				class="inputStyle" disabled></td>
		</tr>
		<tr>
			<th>세율</th>
			<td><input type="text" value="${savinfo.mySav_taxRate}"
				class="inputStyle" disabled></td>
			<th>이율</th>
			<td><input type="text" value="${savinfo.mySav_rate}"
				class="inputStyle" disabled></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><input type="text" value="${savinfo.mySav_date}"
				class="inputStyle"disabled></td>
			<th>만기일</th>
			<td><input type="text" value="${savinfo.mySav_due}"
				class="inputStyle" disabled> </td>
		</tr>
		<tr>
			<th>이체금액</th>
			<td><input type="text" value="${savinfo.mySav_monSaving}"
				class="inputStyle" disabled></td>
			<th>잔액</th>
			<td><input type="text" value="${savinfo.mySav_amount}"
				class="inputStyle" disabled></td>
		</tr>
	</table>
	<hr>
	<br>
	<table class="table table-hover">
		<thead>
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
			<c:if test="${empty sav}">
				<tr>
					<td colspan="7" style="text-align: center;">거래내역이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="list" items="${sav}">
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